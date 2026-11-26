import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AnimeSource { anilist, bangumi }

abstract final class AnimeSourceSettings {
  static const _sourceKey = 'kiru_anime_metadata_source';
  static const _fallbackKey = 'kiru_anime_metadata_fallback';
  static const _mirrorKey = 'kiru_bangumi_mirror';
  static const _proxyKey = 'kiru_bangumi_proxy';
  static final source = ValueNotifier(AnimeSource.anilist);
  static final fallback = ValueNotifier(true);
  static final mirror = ValueNotifier('');
  static final proxy = ValueNotifier('');
  static final revision = ValueNotifier(0);

  static Future<void> initialize() async {
    final p = await SharedPreferences.getInstance();
    source.value = p.getString(_sourceKey) == 'bangumi'
        ? AnimeSource.bangumi
        : AnimeSource.anilist;
    fallback.value = p.getBool(_fallbackKey) ?? true;
    mirror.value = p.getString(_mirrorKey) ?? '';
    proxy.value = p.getString(_proxyKey) ?? '';
  }

  static Future<void> setSource(AnimeSource value) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_sourceKey, value.name);
    source.value = value;
    revision.value++;
  }

  static Future<void> setFallback(bool value) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(_fallbackKey, value);
    fallback.value = value;
    revision.value++;
  }

  static String normalizeMirror(String value) {
    final text = value.trim();
    if (text.isEmpty) return '';
    final uri = Uri.tryParse(text);
    if (uri == null ||
        uri.scheme != 'https' ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty ||
        (uri.path.isNotEmpty && uri.path != '/') ||
        uri.hasQuery ||
        uri.hasFragment)
      throw const FormatException('HTTPS origin required');
    return uri.origin;
  }

  static String normalizeProxy(String value) {
    final text = value.trim();
    if (text.isEmpty) return '';
    final uri = Uri.tryParse(text);
    if (uri == null ||
        uri.scheme != 'http' ||
        uri.host.isEmpty ||
        !uri.hasPort ||
        uri.port < 1 ||
        uri.port > 65535 ||
        uri.userInfo.isNotEmpty ||
        (uri.path.isNotEmpty && uri.path != '/') ||
        uri.hasQuery ||
        uri.hasFragment) {
      throw const FormatException('HTTP proxy with port required');
    }
    return uri.origin;
  }

  static Future<void> setNetwork(String mirrorUrl, String proxyUrl) async {
    final m = normalizeMirror(mirrorUrl);
    final x = normalizeProxy(proxyUrl);
    final p = await SharedPreferences.getInstance();
    await p.setString(_mirrorKey, m);
    await p.setString(_proxyKey, x);
    mirror.value = m;
    proxy.value = x;
    revision.value++;
  }
}
