import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/models/movie/movie.dart';
import 'package:zplay/models/movie/movie_detail.dart';
import 'package:zplay/models/movie/movie_section.dart';
import 'package:zplay/models/addon/addon.dart';
import 'package:zplay/services/search/film_search_filters.dart';
import 'package:zplay/services/search/unified_search_result.dart';

Movie make(
  String id,
  String type, {
  List<String> genres = const [],
  String? year,
  DateTime? date,
  String? status,
}) => Movie(
  id: id,
  name: id,
  type: type,
  addonBaseUrl: 'test',
  genres: genres,
  year: year,
  releasedAt: date,
  status: status,
);
MovieSection section(List<Movie> items) => MovieSection(
  title: 'Test',
  subtitle: 'Source',
  contentType: 'series',
  addonBaseUrl: 'test',
  catalog: AddonCatalog(type: 'series', id: 'top'),
  movies: items,
);

void main() {
  test('catalog genres and explicit status survive parsing and copying', () {
    final m = Movie.fromJson({
      'id': 'tt1',
      'name': 'Title',
      'type': 'series',
      'genres': ['Reality-TV'],
      'released': '2024-03-01',
      'status': 'Ended',
    }, 'test');
    expect(m.genres, ['Reality-TV']);
    expect(m.withHeroMedia().status, 'Ended');
    expect(m.withSearchMetadata().releasedAt, DateTime(2024, 3, 1));
    final detail = MovieDetail.fromJson({
      'status': 'Returning Series',
      'released': '2025-07-01',
      'genres': ['Drama'],
    });
    expect(detail.copyWith().status, 'Returning Series');
    expect(detail.releasedAt, DateTime(2025, 7, 1));
  });
  test(
    'known variety tags take precedence over generic series including duplicate ids',
    () {
      final raw = make('tt1', 'series');
      final rich = make('tt1', 'series', genres: ['Talk-Show']);
      final drama = make('tt2', 'series', genres: ['Drama']);
      final films = [
        section([raw, rich, drama]),
      ];
      List<UnifiedSearchResult> results(SearchCategory c) =>
          collectUnifiedResults(
            films,
            [],
            [],
            query: '',
            category: c,
            sort: SearchSort.relevance,
          );
      expect(results(SearchCategory.variety).single.movie, same(rich));
      expect(results(SearchCategory.series).single.movie, same(drama));
      expect(results(SearchCategory.all), hasLength(2));
      expect(
        UnifiedSearchResult.movie(
          make('x', 'series', genres: ['Game-Show']),
        ).category,
        SearchCategory.variety,
      );
      expect(
        UnifiedSearchResult.movie(
          make('y', 'series', genres: ['Reality']),
        ).category,
        SearchCategory.variety,
      );
    },
  );
  test('combined filters require actual genre, date and status metadata', () {
    final movie = make(
      'tt3',
      'movie',
      genres: ['Science Fiction'],
      year: '2024',
      date: DateTime(2024, 5, 1),
    );
    final filters = const FilmSearchFilters()
        .change('genre', 'Sci-Fi')
        .change('year', '2024')
        .change('quarter', '2')
        .change('status', 'RELEASED');
    expect(filters.matches(movie, now: DateTime(2025)), isTrue);
    expect(filters.matches(make('tt4', 'movie', year: '2024')), isFalse);
    expect(
      const FilmSearchFilters(
        status: 'FINISHED',
      ).matches(make('tt5', 'series', year: '2020-')),
      isFalse,
    );
    expect(
      const FilmSearchFilters(
        status: 'FINISHED',
      ).matches(make('tt6', 'series', status: 'Ended')),
      isTrue,
    );
  });
  test('Cinemeta Continuing status maps to releasing', () {
    expect(
      const FilmSearchFilters(
        status: 'RELEASING',
      ).matches(make('tt7', 'series', status: 'Continuing')),
      isTrue,
    );
  });
}
