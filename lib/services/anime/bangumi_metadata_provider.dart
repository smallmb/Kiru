import '../../models/anime/anime_media.dart';
import '../metadata/anime_chinese_titles.dart';
import 'anime_metadata_provider.dart';
import 'bangumi_client.dart';

/// Maps only verified cross-provider identities. Unmapped Bangumi subjects
/// cannot yet enter the legacy AniList-keyed playback/library model.
class BangumiMetadataProvider implements AnimeMetadataProvider {
  BangumiMetadataProvider(this.client);
  final BangumiClient client;
  static const _tags = {
    'Action': '动作',
    'Adventure': '冒险',
    'Comedy': '搞笑',
    'Drama': '剧情',
    'Ecchi': '卖肉',
    'Fantasy': '奇幻',
    'Horror': '恐怖',
    'Mahou Shoujo': '魔法少女',
    'Mecha': '机战',
    'Music': '音乐',
    'Mystery': '悬疑',
    'Psychological': '心理',
    'Romance': '恋爱',
    'Sci-Fi': '科幻',
    'Slice of Life': '日常',
    'Sports': '运动',
    'Supernatural': '超自然',
    'Thriller': '惊悚',
  };
  static String _date(DateTime date) => date.toIso8601String().substring(0, 10);
  static DateTime _seasonStart(DateTime date) =>
      DateTime(date.year, ((date.month - 1) ~/ 3) * 3 + 1);

  @override
  Future<List<AnimeMedia>> fetchTrendingAnime({
    int page = 1,
    int perPage = 20,
  }) => searchAnime('', sort: 'TRENDING_DESC', page: page, perPage: perPage);
  @override
  Future<List<AnimeMedia>> fetchPopularThisSeason({
    int page = 1,
    int perPage = 20,
  }) {
    final start = _seasonStart(DateTime.now());
    return _search(
      '',
      page: page,
      perPage: perPage,
      start: start,
      end: DateTime(start.year, start.month + 3),
    );
  }

  @override
  Future<List<AnimeMedia>> fetchUpcomingNextSeason({
    int page = 1,
    int perPage = 20,
  }) {
    final now = _seasonStart(DateTime.now());
    final start = DateTime(now.year, now.month + 3);
    return _search(
      '',
      page: page,
      perPage: perPage,
      start: start,
      end: DateTime(start.year, start.month + 3),
    );
  }

  @override
  Future<List<AnimeMedia>> fetchTopRated({int page = 1, int perPage = 20}) =>
      searchAnime('', sort: 'SCORE_DESC', page: page, perPage: perPage);
  @override
  Future<List<AnimeMedia>> fetchByGenre(
    String genre, {
    int page = 1,
    int perPage = 20,
  }) => searchAnime(
    '',
    genre: genre,
    sort: 'POPULARITY_DESC',
    page: page,
    perPage: perPage,
  );
  @override
  Future<List<AnimeMedia>> searchAnime(
    String search, {
    String? genre,
    int? year,
    String? season,
    String? format,
    String? status,
    String sort = 'SEARCH_MATCH',
    bool isAdult = false,
    int page = 1,
    int perPage = 30,
  }) {
    // Do not fake unsupported filters or AniList-specific rankings.
    if (isAdult ||
        genre == 'Hentai' ||
        format != null ||
        status != null ||
        (season != null && year == null) ||
        !const {
          'SEARCH_MATCH',
          'TRENDING_DESC',
          'POPULARITY_DESC',
          'SCORE_DESC',
        }.contains(sort)) {
      throw UnsupportedError('Filter requires AniList');
    }
    final month = const {
      'WINTER': 1,
      'SPRING': 4,
      'SUMMER': 7,
      'FALL': 10,
    }[season];
    if (season != null && month == null)
      throw UnsupportedError('Unknown season');
    final start = year == null ? null : DateTime(year, month ?? 1);
    final end = year == null
        ? null
        : DateTime(year, month == null ? 13 : month + 3);
    return _search(
      search,
      page: page,
      perPage: perPage,
      genre: genre,
      start: start,
      end: end,
      sort: sort == 'SCORE_DESC'
          ? 'rank'
          : search.trim().isNotEmpty
          ? 'match'
          : 'heat',
    );
  }

  Future<List<AnimeMedia>> _search(
    String keyword, {
    int page = 1,
    int perPage = 20,
    String? genre,
    DateTime? start,
    DateTime? end,
    String sort = 'heat',
  }) async {
    await AnimeChineseTitles.initialize();
    final tag = genre == null ? null : _tags[genre];
    if (genre != null && tag == null) throw UnsupportedError('Unknown genre');
    final raw = await client.request(
      Uri.https('api.bgm.tv', '/v0/search/subjects', {
        'limit': perPage.clamp(1, 50).toString(),
        'offset': ((page - 1) * perPage).clamp(0, 100000).toString(),
      }),
      body: {
        'keyword': keyword.trim(),
        'sort': sort,
        'filter': <String, Object>{
          'type': [2],
          'nsfw': false,
          if (tag != null) 'tag': [tag],
          if (sort == 'rank') 'rank': ['>0', '<=99999'],
          if (start != null && end != null)
            'air_date': ['>=${_date(start)}', '<${_date(end)}'],
        },
      },
    );
    if (raw is! Map || raw['data'] is! List)
      throw const FormatException('Invalid Bangumi catalog');
    final list = <AnimeMedia>[];
    final seen = <int>{};
    for (final row in (raw['data'] as List).whereType<Map>()) {
      final media = mapSubject(row);
      if (media != null && seen.add(media.id)) list.add(media);
    }
    // A valid empty search is not a network failure. A nonempty but entirely
    // unmapped result requires the compatibility provider instead.
    if ((raw['data'] as List).isNotEmpty && list.isEmpty) {
      throw UnsupportedError('No verified AniList mappings in result');
    }
    return list;
  }

  static AnimeMedia? mapSubject(Map row, {int? expectedAnilistId}) {
    final bgm = (row['id'] as num?)?.toInt();
    if (bgm == null || row['type'] != 2 || row['nsfw'] == true) return null;
    final id = AnimeChineseTitles.anilistIdForBangumi(bgm);
    if (id == null || (expectedAnilistId != null && id != expectedAnilistId))
      return null;
    final images = row['images'] is Map ? row['images'] as Map : const {};
    final rating = row['rating'] is Map ? row['rating'] as Map : const {};
    final date = DateTime.tryParse((row['date'] ?? '').toString());
    final season = date == null
        ? ''
        : const ['WINTER', 'SPRING', 'SUMMER', 'FALL'][(date.month - 1) ~/ 3];
    final format = switch (row['platform']) {
      'TV' => 'TV',
      '剧场版' => 'MOVIE',
      'OVA' => 'OVA',
      'WEB' => 'ONA',
      _ => '',
    };
    final episodes = (row['eps'] as num?)?.toInt() ?? 0;
    final tags = (row['tags'] is List ? row['tags'] as List : const [])
        .whereType<Map>()
        .map((t) => (t['name'] ?? '').toString())
        .where((t) => t.isNotEmpty)
        .take(12)
        .toList();
    final score = ((rating['score'] as num? ?? 0) * 10)
        .round()
        .clamp(0, 100)
        .toInt();
    final original = (row['name'] ?? '').toString();
    final cn = (row['name_cn'] ?? row['nameCN'] ?? '').toString().trim();
    return AnimeMedia(
      id: id,
      bangumiId: bgm,
      titleNative: original,
      titleChinese: cn,
      descriptionChinese: (row['summary'] ?? '').toString(),
      coverImageLarge: (images['large'] ?? images['common'] ?? '').toString(),
      coverImageMedium: (images['medium'] ?? '').toString(),
      format: format,
      status: '',
      totalEpisodes: episodes,
      genres: tags,
      averageScore: score,
      season: season,
      seasonYear: date?.year ?? 0,
    );
  }

  /// Main episode titles only. Specials and fractional episode numbers cannot
  /// safely be assigned to the legacy integer playback episode key.
  Future<Map<int, String>> fetchEpisodeTitles(int anilistId) async {
    await AnimeChineseTitles.initialize();
    final bgm = AnimeChineseTitles.bangumiId(anilistId: anilistId);
    if (bgm == null) return {};
    final names = <int, String>{};
    final conflicts = <int>{};
    for (var offset = 0; offset < 1000; offset += 100) {
      final raw = await client.request(
        Uri.https('api.bgm.tv', '/v0/episodes', {
          'subject_id': bgm.toString(),
          'type': '0',
          'limit': '100',
          'offset': offset.toString(),
        }),
      );
      if (raw is! Map || raw['data'] is! List)
        throw const FormatException('Invalid episodes response');
      final rows = raw['data'] as List;
      for (final row in rows.whereType<Map>()) {
        if (row['type'] != 0 ||
            (row['subject_id'] != null && row['subject_id'] != bgm))
          continue;
        final sort = row['sort'];
        if (sort is! num || sort <= 0 || sort.toInt() != sort) continue;
        final name = (row['name_cn'] ?? row['nameCN'] ?? '').toString().trim();
        if (name.isEmpty) continue;
        final n = sort.toInt();
        if (names.containsKey(n) && names[n] != name) conflicts.add(n);
        names[n] = name;
      }
      if (rows.length < 100) break;
    }
    for (final n in conflicts) {
      names.remove(n);
    }
    return names;
  }

  @override
  Future<AnimeMedia?> fetchAnimeDetails(int anilistId) async {
    await AnimeChineseTitles.initialize();
    final bgm = AnimeChineseTitles.bangumiId(anilistId: anilistId);
    if (bgm == null) throw UnsupportedError('Unmapped AniList identity');
    final data = await client.request(
      Uri.https('api.bgm.tv', '/v0/subjects/$bgm'),
    );
    if (data is! Map || data['id'] != bgm)
      throw const FormatException('Subject identity mismatch');
    final media = mapSubject(data, expectedAnilistId: anilistId);
    if (media == null) throw UnsupportedError('Subject not available');
    return media;
  }
}
