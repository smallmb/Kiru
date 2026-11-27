import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stable module IDs, independent of widgets and page implementations.
abstract final class NavigationSettings {
  static const key = 'kiru_visible_content_v1';
  static const modules = [
    'moviesAndTv',
    'collections',
    'liveTv',
    'anime',
    'manga',
    'books',
    'audiobooks',
    'music',
  ];
  static const defaults = {'moviesAndTv', 'anime', 'music'};
  static final enabled = ValueNotifier<Set<String>>(defaults);
  static bool isEnabled(String id) => enabled.value.contains(id);
  static Set<String> normalize(Iterable<String> ids) {
    final valid = ids.where(modules.contains).toSet();
    return Set.unmodifiable(valid.isEmpty ? defaults : valid);
  }

  static Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      enabled.value = normalize(prefs.getStringList(key) ?? defaults);
    } catch (e) {
      debugPrint('[NavigationSettings] $e');
      enabled.value = defaults;
    }
  }

  static Future<void> setEnabled(String id, bool value) async {
    if (!modules.contains(id)) throw ArgumentError.value(id);
    final next = {...enabled.value};
    if (value) {
      next.add(id);
    } else {
      next.remove(id);
    }
    if (next.isEmpty) {
      throw StateError('At least one content module is required');
    }
    await _save(next);
  }

  static Future<void> reset() => _save(defaults);
  static Future<void> _save(Set<String> next) async {
    final prefs = await SharedPreferences.getInstance();
    if (!await prefs.setStringList(
      key,
      modules.where(next.contains).toList(),
    )) {
      throw StateError('Could not save navigation settings');
    }
    enabled.value = Set.unmodifiable(next);
  }
}
