import 'package:http/http.dart' as http;
import '../../models/anime/anime_media.dart';
import 'anime_chinese_titles.dart';
import '../anime/bangumi_client.dart';

/// Optional detail-only metadata from Bangumi's public API. No title search or
/// credentials. Failure never blocks the original AniList synopsis.
class AnimeChineseSynopsis {
  AnimeChineseSynopsis({http.Client? client})
    : _client = BangumiClient(client: client);
  static final instance = AnimeChineseSynopsis();
  final BangumiClient _client;
  final _cache = <int, ({String? value, DateTime at})>{};
  final _pending = <int, Future<String?>>{};

  Future<String?> lookup(AnimeMedia anime) async {
    if (anime.isArabic || anime.isAdult) return null;
    final id = AnimeChineseTitles.bangumiId(
      anilistId: anime.id,
      malId: anime.idMal,
    );
    if (id == null || id <= 0) return null;
    final cached = _cache[id];
    if (cached != null &&
        DateTime.now().difference(cached.at) <
            Duration(minutes: cached.value == null ? 5 : 360)) {
      return cached.value;
    }
    final existing = _pending[id];
    if (existing != null) return existing;
    if (_pending.length >= 3) return null;
    final request = _fetch(id);
    _pending[id] = request;
    try {
      final result = await request;
      if (_cache.length >= 256) _cache.remove(_cache.keys.first);
      _cache[id] = (value: result, at: DateTime.now());
      return result;
    } finally {
      _pending.remove(id);
    }
  }

  Future<String?> _fetch(int id) async {
    try {
      final data = await _client.request(
        Uri.https('api.bgm.tv', '/v0/subjects/$id'),
      );
      if (data is! Map ||
          data['id'] != id ||
          data['type'] != 2 ||
          data['nsfw'] == true)
        return null;
      final summary = data['summary'];
      if (summary is! String) return null;
      final clean = summary.trim();
      // Avoid claiming a Japanese or English synopsis is Chinese.
      if (clean.isEmpty ||
          RegExp(r'[\u3040-\u30ff]').hasMatch(clean) ||
          !RegExp(r'[\u3400-\u9fff]').hasMatch(clean))
        return null;
      return clean;
    } catch (_) {
      return null;
    }
  }

  void dispose() => _client.close();
}
