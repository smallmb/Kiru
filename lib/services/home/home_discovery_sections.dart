import '../../models/addon/addon.dart';
import '../../models/movie/movie.dart';
import '../../models/movie/movie_section.dart';
import '../search/unified_search_result.dart';

enum HomeDiscoveryKind {
  popularMovies,
  popularSeries,
  topTen,
  recent,
  variety,
  highRated,
  personalized,
}

typedef HomeDiscoveryRail = ({HomeDiscoveryKind kind, MovieSection section});

/// Organize real catalogue candidates by editorial purpose, not provider.
List<HomeDiscoveryRail> organizeHomeDiscovery(
  List<MovieSection> sections, {
  required DateTime now,
  required String Function(HomeDiscoveryKind) label,
}) {
  final result = <HomeDiscoveryRail>[];
  final used = <String>{};
  String key(Movie m) => UnifiedSearchResult.movie(m).identity;
  bool film(Movie m) =>
      [
        SearchCategory.movie,
        SearchCategory.series,
        SearchCategory.variety,
      ].contains(UnifiedSearchResult.movie(m).category) &&
      !m.isCollection;
  List<Movie> unique(Iterable<Movie> movies) {
    final byId = <String, Movie>{};
    for (final m in movies.where(film)) {
      if (m.id.isEmpty) continue;
      final id = key(m);
      final old = byId[id];
      if (old == null || (old.genres.isEmpty && m.genres.isNotEmpty)) {
        byId[id] = m;
      }
    }
    return byId.values.toList();
  }

  bool personal(MovieSection s) => const {
    'bestsimilar_list',
    'bestsimilar_watching',
    'trakt_recommendations',
    'simkl_recommendations',
  }.contains(s.catalog.id);
  final all = unique(
    sections.where((s) => !personal(s)).expand((s) => s.movies),
  );
  final popular = unique(
    sections
        .where(
          (s) =>
              s.catalog.id == 'top' ||
              s.catalog.id == 'trakt_trending' ||
              s.catalog.id == 'trakt_popular',
        )
        .expand((s) => s.movies),
  );
  final series = popular.where(
    (m) => UnifiedSearchResult.movie(m).category == SearchCategory.series,
  );
  final movies = popular.where(
    (m) => UnifiedSearchResult.movie(m).category == SearchCategory.movie,
  );
  final top = sections
      .where(
        (s) =>
            s.catalog.id == 'top' &&
            s.catalog.type == 'movie' &&
            s.addonBaseUrl.contains('cinemeta.strem.io'),
      )
      .firstOrNull;
  void add(
    HomeDiscoveryKind kind,
    Iterable<Movie> candidates, {
    bool ranked = false,
  }) {
    final eligible = unique(candidates);
    final fresh = eligible.where((m) => !used.contains(key(m))).toList();
    // A valid themed module should not vanish just because all its titles
    // also appeared in a different theme. Prefer new titles whenever possible.
    final rows = (ranked || fresh.isEmpty ? eligible : fresh)
        .take(ranked ? 10 : 18)
        .toList();
    if (rows.isEmpty || (ranked && rows.length < 10)) return;
    if (!ranked) used.addAll(rows.map(key));
    result.add((
      kind: kind,
      section: MovieSection(
        title: label(kind),
        subtitle: '',
        contentType: 'mixed',
        addonBaseUrl: rows.first.addonBaseUrl,
        catalog: AddonCatalog(type: 'mixed', id: 'home_discovery_${kind.name}'),
        movies: rows,
      ),
    ));
  }

  add(HomeDiscoveryKind.popularMovies, movies);
  add(HomeDiscoveryKind.popularSeries, series);
  if (top != null) add(HomeDiscoveryKind.topTen, top.movies, ranked: true);
  final recent =
      all
          .where(
            (m) =>
                UnifiedSearchResult.movie(m).category == SearchCategory.movie &&
                m.releasedAt != null &&
                !m.releasedAt!.isAfter(now) &&
                m.releasedAt!.isAfter(now.subtract(const Duration(days: 90))),
          )
          .toList()
        ..sort((a, b) => b.releasedAt!.compareTo(a.releasedAt!));
  add(HomeDiscoveryKind.recent, recent);
  add(
    HomeDiscoveryKind.variety,
    all.where(
      (m) => UnifiedSearchResult.movie(m).category == SearchCategory.variety,
    ),
  );
  final rated =
      all.where((m) => UnifiedSearchResult.movie(m).rating >= 8).toList()..sort(
        (a, b) => UnifiedSearchResult.movie(
          b,
        ).rating.compareTo(UnifiedSearchResult.movie(a).rating),
      );
  add(HomeDiscoveryKind.highRated, rated);
  add(
    HomeDiscoveryKind.personalized,
    sections.where(personal).expand((s) => s.movies),
  );
  return result;
}
