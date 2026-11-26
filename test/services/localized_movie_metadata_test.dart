import 'dart:async';
import 'package:zplay/models/movie/movie.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/models/movie/movie_detail.dart';
import 'package:zplay/services/metadata/localized_movie_metadata.dart';
import 'package:zplay/services/metadata/tmdb_service.dart';

http.Response response(Map<String, dynamic> data) => http.Response.bytes(
  utf8.encode(jsonEncode(data)),
  200,
  headers: {'content-type': 'application/json'},
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final movie = MovieDetail(
    id: 'tt12345',
    type: 'movie',
    name: 'Original',
    description: 'Original description',
  );
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await TmdbService.initialize();
    await TmdbService.save('test-key');
    LocalizedMovieMetadata.clear();
  });
  tearDown(() async {
    await TmdbService.clear();
    LocalizedMovieMetadata.clear();
  });

  test(
    'uses zh-CN and exact IMDb namespace, preserves identity and caches',
    () async {
      int calls = 0;
      TmdbService.client = MockClient((request) async {
        calls++;
        expect(request.url.path, '/3/find/tt12345');
        expect(request.url.queryParameters['language'], 'zh-CN');
        expect(request.url.queryParameters['external_source'], 'imdb_id');
        return response({
          'movie_results': [
            {'title': '测试电影', 'overview': '电影简介'},
          ],
          'tv_results': [
            {'name': '错误剧集'},
          ],
        });
      });
      final results = await Future.wait([
        LocalizedMovieMetadata.lookup(movie, 'zh'),
        LocalizedMovieMetadata.lookup(movie, 'zh'),
      ]);
      expect(results.first?.title, '测试电影');
      expect(results.last?.overview, '电影简介');
      expect((await LocalizedMovieMetadata.lookup(movie, 'zh'))?.title, '测试电影');
      expect(calls, 1);
      expect(movie.name, 'Original');
      expect(movie.description, 'Original description');
      expect(movie.id, 'tt12345');
      expect(await LocalizedMovieMetadata.lookup(movie, 'en'), isNull);
      expect(calls, 1);
    },
  );

  test(
    'uses TMDB series identifier and preserves missing translations',
    () async {
      final series = MovieDetail(
        id: 'tt99999',
        type: 'series',
        name: 'Series',
        tmdbId: '123',
      );
      TmdbService.client = MockClient((request) async {
        expect(request.url.path, '/3/tv/123');
        return response({'name': '中文剧集', 'overview': 'English fallback'});
      });
      final result = await LocalizedMovieMetadata.lookup(series, 'zh');
      expect(result?.title, '中文剧集');
      expect(result?.overview, isNull);
    },
  );

  test('no configured key or unmatched identity makes no request', () async {
    await TmdbService.clear();
    TmdbService.client = MockClient((_) async {
      fail('No request expected');
    });
    expect(await LocalizedMovieMetadata.lookup(movie, 'zh'), isNull);
  });

  test('invalid response falls back and does not poison cache', () async {
    TmdbService.client = MockClient((_) async => http.Response('', 500));
    expect(await LocalizedMovieMetadata.lookup(movie, 'zh'), isNull);
    TmdbService.client = MockClient(
      (_) async => response({
        'movie_results': [
          {'title': '中文电影'},
        ],
      }),
    );
    expect((await LocalizedMovieMetadata.lookup(movie, 'zh'))?.title, '中文电影');
  });

  test('credential changes invalidate the translation cache', () async {
    int calls = 0;
    TmdbService.client = MockClient((_) async {
      calls++;
      return response({
        'movie_results': [
          {'title': '中文电影'},
        ],
      });
    });
    await LocalizedMovieMetadata.lookup(movie, 'zh');
    await TmdbService.save('other-test-key');
    await LocalizedMovieMetadata.lookup(movie, 'zh');
    expect(calls, 2);
  });
  test(
    'catalog requests are limited to four active and reuse detail cache',
    () async {
      var active = 0;
      var peak = 0;
      var calls = 0;
      final gate = Completer<void>();
      TmdbService.client = MockClient((_) async {
        calls++;
        active++;
        if (active > peak) peak = active;
        await gate.future;
        active--;
        return response({
          'movie_results': [
            {'title': '中文电影'},
          ],
        });
      });
      final movies = List.generate(
        9,
        (i) => Movie(
          id: 'tt${i + 100}',
          name: 'Movie $i',
          type: 'movie',
          addonBaseUrl: '',
        ),
      );
      final tasks = movies
          .map((m) => LocalizedMovieMetadata.lookupCatalog(m, 'zh'))
          .toList();
      await Future<void>.delayed(Duration.zero);
      expect(peak, 4);
      gate.complete();
      final results = await Future.wait(tasks);
      expect(results.every((r) => r?.title == '中文电影'), isTrue);
      expect(calls, 9);
      expect(peak, 4);
      final detail = MovieDetail(
        id: movies.first.id,
        type: 'movie',
        name: movies.first.name,
      );
      expect(
        (await LocalizedMovieMetadata.lookup(detail, 'zh'))?.title,
        '中文电影',
      );
      expect(calls, 9);
    },
  );
}
