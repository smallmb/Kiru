import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/models/anime/anime_media.dart';
import 'package:zplay/services/anime/anime_metadata_service.dart';
import 'package:zplay/services/anime/anime_source_settings.dart';
import 'package:zplay/services/anime/bangumi_client.dart';
import 'package:zplay/services/anime/bangumi_metadata_provider.dart';
import 'package:zplay/services/metadata/anime_chinese_titles.dart';

Map<String, Object> subject({int id = 400602}) => {
  'id': id,
  'type': 2,
  'nsfw': false,
  'name': '葬送のフリーレン',
  'name_cn': '葬送的芙莉莲',
  'summary': '中文剧情简介',
  'platform': 'TV',
  'eps': 28,
  'date': '2023-09-29',
  'rating': {'score': 8.8},
  'tags': [
    {'name': '奇幻'},
  ],
  'images': {'large': 'https://example.com/cover.jpg'},
};
http.Response jsonResponse(Object data) =>
    http.Response.bytes(utf8.encode(jsonEncode(data)), 200);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(AnimeChineseTitles.initialize);
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await AnimeSourceSettings.initialize();
  });
  test('source settings persist, invalid mirror and proxy rejected', () async {
    await AnimeSourceSettings.setSource(AnimeSource.bangumi);
    await AnimeSourceSettings.setFallback(false);
    await AnimeSourceSettings.setNetwork(
      'https://example.com/',
      'http://127.0.0.1:7890',
    );
    await AnimeSourceSettings.initialize();
    expect(AnimeSourceSettings.source.value, AnimeSource.bangumi);
    expect(AnimeSourceSettings.fallback.value, false);
    expect(AnimeSourceSettings.mirror.value, 'https://example.com');
    expect(AnimeSourceSettings.proxy.value, 'http://127.0.0.1:7890');
    expect(
      () => AnimeSourceSettings.normalizeMirror('http://example.com'),
      throwsFormatException,
    );
    expect(
      () => AnimeSourceSettings.normalizeMirror('https://a:b@example.com'),
      throwsFormatException,
    );
    expect(
      () => AnimeSourceSettings.normalizeProxy('https://example.com'),
      throwsFormatException,
    );
  });
  test(
    'Chinese query and genre go to Bangumi without replacing AniList identity',
    () async {
      var calls = 0;
      final client = BangumiClient(
        client: MockClient((req) async {
          calls++;
          expect(req.url.host, 'api.bgm.tv');
          expect(req.url.path, '/v0/search/subjects');
          final body = jsonDecode(req.body) as Map;
          expect(body['keyword'], '芙莉莲');
          expect(body['filter']['tag'], ['奇幻']);
          expect(body['filter']['nsfw'], false);
          return jsonResponse({
            'data': [subject(), subject(id: 999999999)],
          });
        }),
      );
      addTearDown(client.close);
      final provider = BangumiMetadataProvider(client);
      final result = await provider.searchAnime('芙莉莲', genre: 'Fantasy');
      expect(result.single.id, 154587);
      expect(result.single.bangumiId, 400602);
      expect(result.single.titleChinese, '葬送的芙莉莲');
      expect(result.single.displayTitle, '葬送のフリーレン');
      expect(result.single.descriptionChinese, '中文剧情简介');
      expect(result.single.averageScore, 88);
      expect(
        AnimeMedia.fromJson(result.single.toJson()).titleChinese,
        '葬送的芙莉莲',
      );
      await provider.searchAnime('芙莉莲', genre: 'Fantasy');
      expect(calls, 1);
    },
  );
  test(
    'mirror fallback is restricted to metadata, cache separates network settings',
    () async {
      await AnimeSourceSettings.setNetwork('https://example.com', '');
      final hosts = <String>[];
      final client = BangumiClient(
        client: MockClient((req) async {
          hosts.add(req.url.host);
          if (req.url.host == 'example.com') return http.Response('', 401);
          return jsonResponse(subject());
        }),
      );
      addTearDown(client.close);
      final provider = BangumiMetadataProvider(client);
      final media = await provider.fetchAnimeDetails(154587);
      expect(media?.titleChinese, '葬送的芙莉莲');
      expect(hosts, ['example.com', 'api.bgm.tv']);
      await AnimeSourceSettings.setNetwork('', '');
      await provider.fetchAnimeDetails(154587);
      expect(hosts.last, 'api.bgm.tv');
      expect(hosts.length, 3);
    },
  );
  test('source router selects provider, only falls back on failure', () async {
    final a = BangumiClient(
      client: MockClient(
        (req) async => jsonResponse({
          'data': [subject()],
        }),
      ),
    );
    final b = BangumiClient(
      client: MockClient((req) async => http.Response('', 503)),
    );
    addTearDown(a.close);
    addTearDown(b.close);
    final router = AnimeMetadataService(
      anilist: BangumiMetadataProvider(a),
      bangumi: BangumiMetadataProvider(b),
    );
    expect((await router.fetchTrendingAnime()).single.id, 154587);
    await AnimeSourceSettings.setSource(AnimeSource.bangumi);
    expect((await router.fetchTrendingAnime()).single.id, 154587);
    await AnimeSourceSettings.setFallback(false);
    await expectLater(router.fetchTrendingAnime(), throwsA(anything));
  });
  test(
    'merge preserves original titles and ID while preferring Chinese fields',
    () {
      final primary = BangumiMetadataProvider.mapSubject(subject())!;
      const extra = AnimeMedia(
        id: 154587,
        idMal: 52991,
        titleEnglish: 'Frieren',
        titleRomaji: 'Sousou no Frieren',
        description: 'Original',
      );
      final merged = AnimeMetadataService.merge(primary, extra);
      expect(merged.id, 154587);
      expect(merged.idMal, 52991);
      expect(merged.titleEnglish, 'Frieren');
      expect(merged.titleChinese, '葬送的芙莉莲');
      expect(merged.description, 'Original');
      expect(merged.descriptionChinese, '中文剧情简介');
      expect(merged.totalEpisodes, 28);
    },
  );
  test('episode titles keep exact main integer episode identity', () async {
    final client = BangumiClient(
      client: MockClient((req) async {
        expect(req.url.path, '/v0/episodes');
        expect(req.url.queryParameters['subject_id'], '400602');
        return jsonResponse({
          'data': [
            {'type': 0, 'sort': 1, 'name_cn': '冒险的终点', 'subject_id': 400602},
            {'type': 1, 'sort': 1, 'name_cn': '特别篇'},
            {'type': 0, 'sort': 1.5, 'name_cn': '半集'},
            {'type': 0, 'sort': 2, 'name_cn': '错误作品', 'subject_id': 123},
            {'type': 0, 'sort': 3, 'name_cn': '甲'},
            {'type': 0, 'sort': 3, 'name_cn': '乙'},
          ],
        });
      }),
    );
    addTearDown(client.close);
    expect(await BangumiMetadataProvider(client).fetchEpisodeTitles(154587), {
      1: '冒险的终点',
    });
  });
}
