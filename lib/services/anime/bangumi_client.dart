import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:win32_registry/win32_registry.dart';
import 'anime_source_settings.dart';

/// Public Bangumi requests only. Optional user-specified mirror and HTTP proxy.
/// No login tokens or other provider credentials are forwarded.
class BangumiClient {
  BangumiClient({http.Client? client}) : _client = client ?? _newClient();
  final http.Client _client;
  final _cache = <String, ({Object data, DateTime at})>{};
  final _pending = <String, Future<Object>>{};
  static http.Client _newClient() {
    final client = HttpClient()
      ..connectionTimeout = const Duration(seconds: 6)
      ..idleTimeout = const Duration(seconds: 3);
    client.findProxy = (uri) {
      final configured = AnimeSourceSettings.proxy.value;
      if (configured.isNotEmpty) {
        final proxy = Uri.parse(configured);
        return 'PROXY ${proxy.host}:${proxy.port}';
      }
      final env = HttpClient.findProxyFromEnvironment(uri);
      if (env != 'DIRECT') return env;
      return Platform.isWindows ? (_windowsProxy(uri) ?? 'DIRECT') : 'DIRECT';
    };
    return IOClient(client);
  }

  static String? _windowsProxy(Uri uri) {
    try {
      final key = Registry.openPath(
        RegistryHive.currentUser,
        path: r'Software\Microsoft\Windows\CurrentVersion\Internet Settings',
      );
      try {
        if (key.getIntValue('ProxyEnable') != 1) return null;
        final value = key.getStringValue('ProxyServer')?.trim();
        if (value == null || value.isEmpty) return null;
        final bypass = key.getStringValue('ProxyOverride') ?? '';
        for (final item in bypass.split(';')) {
          final pattern = item.trim().toLowerCase();
          if (pattern == '<local>' && !uri.host.contains('.')) return 'DIRECT';
          if (pattern.isEmpty) continue;
          final regex = RegExp(
            '^' + RegExp.escape(pattern).replaceAll(r'\*', '.*') + r'$',
          );
          if (regex.hasMatch(uri.host.toLowerCase())) return 'DIRECT';
        }
        String? address;
        if (!value.contains('=')) {
          address = value;
        } else {
          for (final item in value.split(';')) {
            final i = item.indexOf('=');
            if (i > 0 &&
                item.substring(0, i).trim().toLowerCase() == uri.scheme) {
              address = item.substring(i + 1).trim();
              break;
            }
          }
        }
        if (address == null || address.isEmpty) return null;
        final normalized = address.contains('://')
            ? address
            : 'http://$address';
        final parsed = Uri.tryParse(normalized);
        if (parsed == null ||
            parsed.scheme != 'http' ||
            parsed.host.isEmpty ||
            !parsed.hasPort ||
            parsed.userInfo.isNotEmpty)
          return null;
        return 'PROXY ${parsed.host}:${parsed.port}';
      } finally {
        key.close();
      }
    } catch (_) {
      return null;
    }
  }

  Future<Object> request(Uri official, {Map<String, Object>? body}) async {
    final mirror = AnimeSourceSettings.mirror.value;
    final proxy = AnimeSourceSettings.proxy.value;
    final encoded = body == null ? null : jsonEncode(body);
    final key = '$mirror|$proxy|$official|$encoded';
    final hit = _cache[key];
    if (hit != null &&
        DateTime.now().difference(hit.at) < const Duration(minutes: 5))
      return hit.data;
    final pending = _pending[key];
    if (pending != null) return pending;
    final future = _load(official, mirror, encoded);
    _pending[key] = future;
    try {
      final result = await future;
      _cache.remove(key);
      if (_cache.length >= 100) _cache.remove(_cache.keys.first);
      _cache[key] = (data: result, at: DateTime.now());
      return result;
    } finally {
      _pending.remove(key);
    }
  }

  Future<Object> _load(Uri official, String mirror, String? body) async {
    if (mirror.isNotEmpty) {
      final origin = Uri.parse(mirror);
      try {
        return await _send(
          official.replace(
            host: origin.host,
            port: origin.hasPort ? origin.port : 443,
          ),
          body,
        );
      } catch (_) {
        // A mirror is optional; unsupported endpoints fall back to official.
      }
    }
    return _send(official, body);
  }

  Future<Object> _send(Uri uri, String? body) async {
    final req = http.Request(body == null ? 'GET' : 'POST', uri)
      ..followRedirects = false
      ..headers.addAll({
        'Accept': 'application/json',
        'User-Agent': 'Kiru/0.1 (anime metadata)',
      });
    if (body != null) {
      req.headers['Content-Type'] = 'application/json; charset=utf-8';
      req.body = body;
    }
    final response = await (() async {
      final stream = await _client.send(req);
      return http.Response.fromStream(stream);
    })().timeout(const Duration(seconds: 8));
    if (response.statusCode != 200)
      throw HttpException('Bangumi HTTP ${response.statusCode}');
    final data = jsonDecode(utf8.decode(response.bodyBytes));
    if (data is! Map && data is! List)
      throw const FormatException('Invalid Bangumi response');
    return data as Object;
  }

  void close() => _client.close();
}
