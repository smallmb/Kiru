import '../../models/movie/movie.dart';
import '../../models/movie/movie_section.dart';
import '../../models/anime/anime_media.dart';
import '../anime_arabic/anime_arabic_service.dart';

enum SearchCategory { all, movie, series, anime, variety }

enum SearchSort { relevance, newest, rating }

class UnifiedSearchResult {
  UnifiedSearchResult.movie(Movie value)
    : movie = value,
      anime = null,
      arabic = null;
  UnifiedSearchResult.anime(AnimeMedia value, {this.arabic})
    : anime = value,
      movie = null;
  final Movie? movie;
  final AnimeMedia? anime;
  final ArabicAnimeCard? arabic;

  SearchCategory? get category {
    if (anime != null || movie?.type.toLowerCase() == 'anime') {
      return SearchCategory.anime;
    }
    final type = movie!.type.toLowerCase();
    if (type == 'series' || type == 'tv' || type == 'tvshow') {
      return isVariety(movie!.genres)
          ? SearchCategory.variety
          : SearchCategory.series;
    }
    if (type == 'variety' ||
        type == 'reality' ||
        type == 'talk-show' ||
        type == 'game-show')
      return SearchCategory.variety;
    if (type == 'movie' || type == 'film') return SearchCategory.movie;
    return null;
  }

  static const varietyGenres = ['Reality-TV', 'Talk-Show', 'Game-Show'];
  static bool isVariety(List<String> genres) => genres.any(
    (g) => const {
      'realitytv',
      'reality',
      'talkshow',
      'talk',
      'gameshow',
      'variety',
    }.contains(g.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '')),
  );

  String get title => movie?.name ?? anime!.displayTitle;
  int get year => movie != null
      ? int.tryParse(
              RegExp(r'\d{4}').firstMatch(movie!.year ?? '')?.group(0) ?? '',
            ) ??
            0
      : anime!.seasonYear;
  double get rating => movie != null
      ? double.tryParse(movie!.imdbRating ?? '') ?? 0
      : anime!.averageScore / 10;
  String get identity {
    if (arabic != null) return 'arabic:' + arabic!.slug;
    if (anime != null) return 'anime:' + anime!.id.toString();
    final m = movie!;
    if (RegExp(r'^tt\d+$').hasMatch(m.id)) return m.type + ':' + m.id;
    return m.type + ':' + m.addonBaseUrl + ':' + m.id;
  }

  int relevance(String query) {
    final q = query.trim().toLowerCase();
    final names = [
      title,
      if (anime != null) ...[
        anime!.titleChinese,
        anime!.titleRomaji,
        anime!.titleEnglish,
        anime!.titleNative,
      ],
    ].map((s) => s.trim().toLowerCase());
    if (names.any((s) => s == q)) return 3;
    if (names.any((s) => s.startsWith(q))) return 2;
    if (names.any((s) => s.contains(q))) return 1;
    return 0;
  }
}

List<UnifiedSearchResult> collectUnifiedResults(
  List<MovieSection> sections,
  List<AnimeMedia> anime,
  List<ArabicAnimeCard> arabic, {
  required String query,
  required SearchCategory category,
  required SearchSort sort,
}) {
  final unique = <String, UnifiedSearchResult>{};
  for (final result in [
    for (final section in sections)
      for (final m in section.movies) UnifiedSearchResult.movie(m),
    for (final a in anime) UnifiedSearchResult.anime(a),
    for (final a in arabic)
      UnifiedSearchResult.anime(a.toAnimeMedia(), arabic: a),
  ]) {
    if (result.movie != null && result.movie!.id.isEmpty) continue;
    final old = unique[result.identity];
    if (old == null ||
        (old.movie != null &&
            result.movie != null &&
            old.movie!.genres.isEmpty &&
            result.movie!.genres.isNotEmpty)) {
      unique[result.identity] = result;
    }
  }
  final list = unique.values
      .where((r) => category == SearchCategory.all || r.category == category)
      .toList();
  final positions = {for (var i = 0; i < list.length; i++) list[i].identity: i};
  list.sort((a, b) {
    final order = switch (sort) {
      SearchSort.relevance => b.relevance(query).compareTo(a.relevance(query)),
      SearchSort.newest => b.year.compareTo(a.year),
      SearchSort.rating => b.rating.compareTo(a.rating),
    };
    return order != 0
        ? order
        : positions[a.identity]!.compareTo(positions[b.identity]!);
  });
  return list;
}
