import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'font_cmap.dart';

enum FontRole { chinese, latin, number, timer }

class KiruFont {
  const KiruFont(this.id, this.name, {this.asset, this.filename, this.role});
  final String id, name;
  final String? asset, filename;
  final FontRole? role;
  bool availableFor(FontRole target) => imported
      ? role == target
      : target == FontRole.chinese
      ? id == 'noto'
      : id != 'noto';
  bool get imported => filename != null;
  Map<String, String> toJson() => {
    'id': id,
    'name': name,
    'filename': filename!,
    'role': role!.name,
  };
}

/// Data-only plugins: original font files in app-private storage,
/// per-role engine aliases, and a persisted profile.
abstract final class FontRegistry {
  static const _key = 'kiru_typography_v1';
  static const builtins = [
    KiruFont('noto', 'Noto Sans SC', asset: 'NotoSansSC.ttf'),
    KiruFont('manrope', 'Manrope', asset: 'Manrope.ttf'),
    KiruFont('space', 'Space Grotesk', asset: 'SpaceGrotesk.ttf'),
    KiruFont('geist', 'Geist Mono', asset: 'GeistMono.ttf'),
  ];
  static const defaults = {
    FontRole.chinese: 'noto',
    FontRole.latin: 'manrope',
    FontRole.number: 'space',
    FontRole.timer: 'geist',
  };
  static final revision = ValueNotifier<int>(0);
  static final _imports = <KiruFont>[];
  static final _selected = Map<FontRole, String>.of(defaults);
  static final _loaded = <String>{};
  static Directory? _folder;
  static bool _ready = false;
  static List<KiruFont> get fonts =>
      List.unmodifiable([...builtins, ..._imports]);
  static String selected(FontRole role) => _selected[role]!;
  static String alias(String id, FontRole role) => 'Kiru_${id}_${role.name}';
  static String get primary =>
      _ready ? alias(selected(FontRole.number), FontRole.number) : 'Poppins';
  static String get timerFamily =>
      _ready ? alias(selected(FontRole.timer), FontRole.timer) : 'Poppins';
  static List<String> get fallback => !_ready
      ? const []
      : [
          alias(defaults[FontRole.number]!, FontRole.number),
          alias(selected(FontRole.latin), FontRole.latin),
          alias(defaults[FontRole.latin]!, FontRole.latin),
          alias(selected(FontRole.chinese), FontRole.chinese),
          alias(defaults[FontRole.chinese]!, FontRole.chinese),
          'Poppins',
        ].where((s) => s != primary).toSet().toList();
  static List<String> get timerFallback => {primary, ...fallback}.toList();

  static Future<void> initialize() async {
    try {
      _folder = Directory(
        p.join((await getApplicationSupportDirectory()).path, 'font_plugins'),
      );
      await _folder!.create(recursive: true);
      final prefs = await SharedPreferences.getInstance();
      final saved = prefs.getString(_key);
      if (saved != null) {
        try {
          final json = jsonDecode(saved) as Map<String, dynamic>;
          for (final e in (json['fonts'] as List? ?? [])) {
            final m = Map<String, dynamic>.from(e as Map);
            final id = m['id'] as String, file = m['filename'] as String;
            if (!RegExp(r'^local_[0-9]+$').hasMatch(id) ||
                p.basename(file) != file) {
              continue;
            }
            if (await File(p.join(_folder!.path, file)).exists()) {
              _imports.add(
                KiruFont(
                  id,
                  m['name'] as String,
                  filename: file,
                  role: FontRole.values.firstWhere(
                    (r) => r.name == m['role'],
                    orElse: () => FontRole.chinese,
                  ),
                ),
              );
            }
          }
          final roles = json['roles'] as Map? ?? {};
          for (final role in FontRole.values) {
            final id = roles[role.name];
            if (fonts.any((f) => f.id == id && f.availableFor(role))) {
              _selected[role] = id as String;
            }
          }
        } catch (e) {
          debugPrint('Font profile ignored: $e');
        }
      }
      for (final role in FontRole.values) {
        await _load(defaults[role]!, role);
        try {
          await _load(selected(role), role);
        } catch (e) {
          _selected[role] = defaults[role]!;
          debugPrint('Font fallback: $e');
        }
      }
      _ready = true;
    } catch (e) {
      debugPrint('Font initialization failed: $e');
      _ready = false;
    }
    revision.value++;
  }

  static Future<Uint8List> _bytes(KiruFont f) async {
    if (f.asset != null) {
      final b = await rootBundle.load('assets/fonts/kiru/${f.asset!}');
      return b.buffer.asUint8List(b.offsetInBytes, b.lengthInBytes);
    }
    return File(p.join(_folder!.path, f.filename!)).readAsBytes();
  }

  static Future<void> _load(String id, FontRole role) async {
    final family = alias(id, role);
    if (_loaded.contains(family)) return;
    final f = fonts.firstWhere((f) => f.id == id);
    if (!f.availableFor(role)) {
      throw const FormatException('Font is not registered for this role');
    }
    final bytes = await _bytes(f);
    final cmap = FontCmap(bytes);
    if (!supports(cmap, role)) {
      throw FormatException('Font does not cover ${role.name}');
    }
    final result = switch (role) {
      FontRole.chinese => bytes,
      FontRole.latin => cmap.restrict(FontCmap.latin),
      FontRole.number => cmap.restrict(FontCmap.digit),
      FontRole.timer => cmap.restrict(FontCmap.timer),
    };
    final loader = FontLoader(family)
      ..addFont(Future.value(ByteData.sublistView(result)));
    await loader.load();
    _loaded.add(family);
  }

  static bool supports(FontCmap cmap, FontRole role) => switch (role) {
    FontRole.chinese => [
      0x4e2d,
      0x6587,
      0x5b57,
    ].every((c) => cmap.glyph(c) != 0),
    FontRole.latin => [65, 90, 97, 122].every((c) => cmap.glyph(c) != 0),
    FontRole.number => List.generate(
      10,
      (i) => 48 + i,
    ).every((c) => cmap.glyph(c) != 0),
    FontRole.timer =>
      List.generate(10, (i) => 48 + i).every((c) => cmap.glyph(c) != 0) &&
          cmap.glyph(58) != 0,
  };

  static Future<void> select(FontRole role, String id) async {
    await _load(id, role);
    final previous = _selected[role]!;
    _selected[role] = id;
    try {
      await _persist();
    } catch (_) {
      _selected[role] = previous;
      rethrow;
    }
    revision.value++;
  }

  static Future<void> import(String source, FontRole role) async {
    if (_folder == null) throw StateError('Font storage unavailable');
    if (_imports.length >= 24) throw StateError('Maximum 24 imported fonts');
    final ext = p.extension(source).toLowerCase();
    if (!['.ttf', '.otf'].contains(ext)) {
      throw const FormatException('TTF / OTF only');
    }
    final file = File(source);
    if (await file.length() > 64 * 1024 * 1024) {
      throw const FormatException('Font exceeds 64 MB');
    }
    final cmap = FontCmap(await file.readAsBytes());
    if (!supports(cmap, role)) {
      throw FormatException('Font does not cover ${role.name}');
    }
    final id = 'local_${DateTime.now().microsecondsSinceEpoch}';
    final entry = KiruFont(
      id,
      p.basenameWithoutExtension(source),
      filename: id + ext,
      role: role,
    );
    final dest = File(p.join(_folder!.path, entry.filename!));
    await file.copy(dest.path);
    _imports.add(entry);
    try {
      await select(role, id);
    } catch (_) {
      _imports.remove(entry);
      if (await dest.exists()) await dest.delete();
      rethrow;
    }
  }

  static Future<void> remove(String id) async {
    final entry = _imports.firstWhere((f) => f.id == id);
    for (final role in FontRole.values) {
      if (selected(role) == id) {
        await _load(defaults[role]!, role);
        _selected[role] = defaults[role]!;
      }
    }
    _imports.remove(entry);
    await _persist();
    revision.value++;
    final f = File(p.join(_folder!.path, entry.filename!));
    if (await f.exists()) await f.delete();
  }

  static Future<void> reset() async {
    for (final role in FontRole.values) {
      await _load(defaults[role]!, role);
    }
    _selected.addAll(defaults);
    await _persist();
    revision.value++;
  }

  static Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = await prefs.setString(
      _key,
      jsonEncode({
        'roles': {for (final r in FontRole.values) r.name: selected(r)},
        'fonts': _imports.map((f) => f.toJson()).toList(),
      }),
    );
    if (!saved) throw StateError('Could not save font profile');
  }
}
