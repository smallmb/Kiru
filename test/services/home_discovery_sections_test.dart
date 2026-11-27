import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/models/addon/addon.dart';
import 'package:zplay/models/movie/movie.dart';
import 'package:zplay/models/movie/movie_section.dart';
import 'package:zplay/services/home/home_discovery_sections.dart';
import 'package:zplay/pages/browse/browse_page.dart';
import 'package:zplay/pages/home/home_page.dart';

Movie film(
  String id, {
  String type = 'movie',
  String? score,
  DateTime? released,
  List<String> genres = const [],
}) => Movie(
  id: id,
  name: id,
  type: type,
  addonBaseUrl: 'https://v3-cinemeta.strem.io',
  imdbRating: score,
  releasedAt: released,
  genres: genres,
);
MovieSection section(String id, String type, List<Movie> movies) =>
    MovieSection(
      title: id,
      subtitle: '',
      contentType: type,
      addonBaseUrl: 'https://v3-cinemeta.strem.io',
      catalog: AddonCatalog(type: type, id: id),
      movies: movies,
    );

void main() {
  test('film destination uses migrated original feed', () {
    final page = BrowseVertical.moviesAndTv.page as HomePage;
    expect(page.filmHub, isTrue);
    expect(page.curated, isFalse);
  });
  test(
    'curated modules use real metadata, ordered categories, and preserve ranking',
    () {
      final now = DateTime(2026, 11, 27);
      final popular = List.generate(10, (i) => film('tt$i'));
      final rows = organizeHomeDiscovery(
        [
          section('top', 'movie', [...popular, popular.first]),
          section('top', 'series', [
            film('tt20', type: 'series'),
            film('tt21', type: 'series', genres: ['Reality-TV']),
          ]),
          section('year', 'movie', [
            film('tt30', released: DateTime(2026, 11, 1)),
            film('tt31', released: DateTime(2027)),
            film('tt32', score: '9.0'),
            film('tt33', score: '7.0'),
          ]),
          section('bestsimilar_watching', 'movie', [film('tt40')]),
        ],
        now: now,
        label: (k) => k.name,
      );
      expect(rows.map((r) => r.kind), HomeDiscoveryKind.values);
      final ranked = rows
          .singleWhere((r) => r.kind == HomeDiscoveryKind.topTen)
          .section
          .movies;
      expect(ranked.map((m) => m.id), popular.map((m) => m.id));
      expect(
        rows
            .singleWhere((r) => r.kind == HomeDiscoveryKind.recent)
            .section
            .movies
            .single
            .id,
        'tt30',
      );
      expect(
        rows
            .singleWhere((r) => r.kind == HomeDiscoveryKind.highRated)
            .section
            .movies
            .single
            .id,
        'tt32',
      );
      expect(
        rows
            .singleWhere((r) => r.kind == HomeDiscoveryKind.variety)
            .section
            .movies
            .single
            .id,
        'tt21',
      );
      expect(
        rows
            .singleWhere((r) => r.kind == HomeDiscoveryKind.personalized)
            .section
            .movies
            .single
            .id,
        'tt40',
      );
      expect(
        rows
            .singleWhere((r) => r.kind == HomeDiscoveryKind.popularMovies)
            .section
            .movies,
        hasLength(10),
      );
    },
  );
  test(
    'no invented rankings, releases or personalization without source data',
    () {
      expect(
        organizeHomeDiscovery(
          [
            section('unknown', 'movie', [film('tt1')]),
          ],
          now: DateTime(2026),
          label: (k) => k.name,
        ),
        isEmpty,
      );
    },
  );
}
