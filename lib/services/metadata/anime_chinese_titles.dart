import 'dart:convert';
import 'package:flutter/services.dart';

/// Local display metadata from bangumi-data (CC BY 4.0).
/// Only exact source identities are used; never use translated titles for
/// stream resolution, history, or cross-provider identity.
abstract final class AnimeChineseTitles {
  static const asset = 'assets/metadata/anime_titles_zh.json';
  static Map<String, String> _anilist = const {};
  static Map<String, String> _mal = const {};
  static Map<String, String> _bgmAnilist = const {};
  static Map<String, String> _bgmMal = const {};
  static Future<void>? _initializing;
  static Map<int,int> _reverse = const {};

  static Future<void> initialize() => _initializing ??= _load();

  static Future<void> _load() async {
    try {
      final data = jsonDecode(await rootBundle.loadString(asset)) as Map;
      _anilist = Map<String, String>.from(data['anilist'] as Map);
      _mal = Map<String, String>.from(data['mal'] as Map);
      _bgmAnilist = Map<String, String>.from(data['bgm_anilist'] as Map? ?? {});
      _bgmMal = Map<String, String>.from(data['bgm_mal'] as Map? ?? {});
      final reverse = <int,int>{};
      final conflicts = <int>{};
      for(final entry in _bgmAnilist.entries) {
        final a = int.tryParse(entry.key);
        final b = int.tryParse(entry.value);
        if(a == null || b == null || a <= 0 || b <= 0) continue;
        if(reverse.containsKey(b) && reverse[b] != a) conflicts.add(b);
        reverse[b] = a;
      }
      for(final id in conflicts) { reverse.remove(id); }
      _reverse = reverse;
    } catch (_) {
      _anilist = const {};
      _mal = const {};
      _bgmAnilist = const {};
      _bgmMal = const {};
    }
  }

  static int? anilistIdForBangumi(int id) => _reverse[id];

  static int? bangumiId({required int anilistId, int? malId}) {
    final a = _bgmAnilist[anilistId.toString()];
    final m = malId == null ? null : _bgmMal[malId.toString()];
    if (a != null && m != null && a != m) return null;
    return int.tryParse(a ?? m ?? '');
  }

  static String? lookup({required int anilistId, int? malId}) {
    final a = anilistId > 0 ? _anilist[anilistId.toString()] : null;
    final m = malId != null && malId > 0 ? _mal[malId.toString()] : null;
    if (a != null && m != null && a != m) return null;
    return a ?? m;
  }
}
