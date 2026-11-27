import '../../models/movie/movie.dart';
import '../../models/movie/movie_section.dart';
import '../addon/addon_manager.dart';
import '../metadata/metadata_service.dart';
import 'unified_search_result.dart';

class FilmSearchFilters {
  const FilmSearchFilters({this.genre, this.year, this.quarter, this.status});
  final String? genre, status;
  final int? year, quarter;
  bool get active =>
      genre != null || year != null || quarter != null || status != null;
  FilmSearchFilters change(String key, String? value) => FilmSearchFilters(
    genre: key == 'genre' ? value : genre,
    year: key == 'year' ? int.tryParse(value ?? '') : year,
    quarter: key == 'quarter' ? int.tryParse(value ?? '') : quarter,
    status: key == 'status' ? value : status,
  );
  static String normalize(String value) {
    final v = value.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '');
    return switch (v) {
      'sciencefiction' => 'scifi',
      'sports' => 'sport',
      'reality' => 'realitytv',
      'talk' => 'talkshow',
      _ => v,
    };
  }

  bool matches(Movie movie, {DateTime? now}) {
    final result = UnifiedSearchResult.movie(movie);
    if (genre != null &&
        !movie.genres.any((g) => normalize(g) == normalize(genre!)))
      return false;
    if (year != null &&
        (result.year == 0 ? movie.releasedAt?.year : result.year) != year)
      return false;
    if (quarter != null &&
        (movie.releasedAt == null ||
            (movie.releasedAt!.month - 1) ~/ 3 + 1 != quarter))
      return false;
    if (status != null) {
      final explicit = normalize(movie.status ?? '');
      final date = movie.releasedAt;
      final isFilm = result.category == SearchCategory.movie;
      final actual = switch (explicit) {
        'ended' || 'finished' || 'completed' => 'FINISHED',
        'continuing' ||
        'returningseries' ||
        'ongoing' ||
        'releasing' ||
        'airing' => 'RELEASING',
        'canceled' || 'cancelled' => 'CANCELLED',
        'released' => 'RELEASED',
        'planned' || 'notyetreleased' || 'upcoming' => 'NOT_YET_RELEASED',
        _ =>
          isFilm && date != null
              ? (date.isAfter(now ?? DateTime.now())
                    ? 'NOT_YET_RELEASED'
                    : 'RELEASED')
              : null,
      };
      if (actual != status) return false;
    }
    return true;
  }
}

/// Read only catalogue extras explicitly supported by the provider.
/// Cinemeta's year catalogue uses the genre extra for a year, not a genre.
class FilmSearchCatalogs {
  static Future<List<MovieSection>> browse(
    SearchCategory category,
    FilmSearchFilters filters,
  ) async {
    final type = category == SearchCategory.movie ? 'movie' : 'series';
    final requests = <Future<MovieSection?>>[];
    final requested = <String>{};
    for (final addon in AddonManager.instance.activeCatalogAddons) {
      for (final catalog in addon.manifest.catalogs) {
        if (catalog.type != type) continue;
        final supported = catalog.genres;
        final values = <String>[
          if (filters.year != null &&
              supported.contains(filters.year.toString()))
            filters.year.toString(),
          if (filters.genre != null && supported.contains(filters.genre))
            filters.genre!,
          if (category == SearchCategory.variety && filters.genre == null)
            ...UnifiedSearchResult.varietyGenres.where(supported.contains),
        ];
        for (final value in values) {
          if (catalog.requiredExtras.any((e) => e.name != 'genre')) continue;
          if (!requested.add(addon.baseUrl + '/' + catalog.id + '/' + value))
            continue;
          requests.add(() async {
            try {
              final movies = await MetadataService.fetchCatalog(
                baseUrl: addon.baseUrl,
                type: type,
                catalogId: catalog.id,
                genre: value,
              ).timeout(const Duration(seconds: 8));
              return MovieSection(
                title: catalog.name ?? catalog.id,
                subtitle: addon.manifest.name,
                contentType: type,
                addonBaseUrl: addon.baseUrl,
                catalog: catalog,
                movies: movies,
              );
            } catch (_) {
              return null;
            }
          }());
        }
      }
    }
    return (await Future.wait(requests)).whereType<MovieSection>().toList();
  }

  /// Missing title metadata is filled with bounded, cached detail requests.
  /// A failed lookup leaves unknown fields unknown; it does not invent labels.
  static Future<List<MovieSection>> enrich(
    List<MovieSection> sections, {
    int limit = 32,
  }) async {
    final candidates = <String, Movie>{};
    for (final section in sections) {
      for (final m in section.movies) {
        if (m.genres.isNotEmpty && m.releasedAt != null && m.status != null)
          continue;
        if (!m.addonBaseUrl.startsWith('https://') &&
            !m.addonBaseUrl.startsWith('http://'))
          continue;
        candidates.putIfAbsent(UnifiedSearchResult.movie(m).identity, () => m);
        if (candidates.length >= limit) break;
      }
      if (candidates.length >= limit) break;
    }
    final entries = candidates.entries.toList();
    final filled = <String, Movie>{};
    final deadline = DateTime.now().add(const Duration(seconds: 8));
    for (
      var i = 0;
      i < entries.length && DateTime.now().isBefore(deadline);
      i += 6
    ) {
      await Future.wait(
        entries.skip(i).take(6).map((entry) async {
          final m = entry.value;
          try {
            final detail = await MetadataService.fetchMeta(
              baseUrl: m.addonBaseUrl,
              type: m.type,
              imdbId: m.id,
            ).timeout(const Duration(seconds: 4));
            if (detail != null)
              filled[entry.key] = m.withSearchMetadata(
                genres: detail.genres,
                status: detail.status,
                releasedAt: detail.releasedAt,
                year: detail.year,
                imdbRating: detail.imdbRating,
              );
          } catch (_) {}
        }),
      );
    }
    return [
      for (final s in sections)
        MovieSection(
          title: s.title,
          subtitle: s.subtitle,
          contentType: s.contentType,
          addonBaseUrl: s.addonBaseUrl,
          catalog: s.catalog,
          movies: [
            for (final m in s.movies)
              filled[UnifiedSearchResult.movie(m).identity] == null
                  ? m
                  : m.withSearchMetadata(
                      genres:
                          filled[UnifiedSearchResult.movie(m).identity]!.genres,
                      status:
                          filled[UnifiedSearchResult.movie(m).identity]!.status,
                      releasedAt: filled[UnifiedSearchResult.movie(m).identity]!
                          .releasedAt,
                      year: filled[UnifiedSearchResult.movie(m).identity]!.year,
                      imdbRating: filled[UnifiedSearchResult.movie(m).identity]!
                          .imdbRating,
                    ),
          ],
        ),
    ];
  }
}
