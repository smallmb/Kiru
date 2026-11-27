import 'package:flutter/foundation.dart';
import 'package:zplay/shell/app_shell_scope.dart';
import 'package:zplay/services/layout/form_factor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/models/addon/addon.dart';
import 'package:zplay/models/movie/movie.dart';
import 'package:zplay/models/movie/movie_section.dart';
import 'package:zplay/models/anime/anime_media.dart';
import 'package:zplay/services/anime_arabic/anime_arabic_service.dart';
import 'package:zplay/services/search/unified_search_result.dart';

Movie movie(
  String id,
  String title,
  String type,
  String year,
  String score, {
  String source = 'source',
}) => Movie(
  id: id,
  name: title,
  type: type,
  year: year,
  imdbRating: score,
  addonBaseUrl: source,
);
MovieSection section(List<Movie> movies) => MovieSection(
  title: 'Search',
  subtitle: 'Source',
  contentType: 'movie',
  addonBaseUrl: 'source',
  catalog: AddonCatalog(type: 'movie', id: 'search', name: 'Search'),
  movies: movies,
);

void main() {
  final films = [
    section([
      movie('tt1', 'One Piece', 'series', '2023', '8.4'),
      movie('tt1', 'One Piece', 'series', '2023', '8.4', source: 'other'),
      movie('tt2', 'One Piece Film', 'movie', '2022', '7.5'),
      movie('local', 'One Piece', 'movie', '2000', '6', source: 'a'),
      movie('local', 'One Piece', 'movie', '2001', '6', source: 'b'),
      movie('tt3', 'Collection', 'collections', '2020', '0'),
    ]),
  ];
  const anime = [
    AnimeMedia(
      id: 1,
      titleEnglish: 'One Piece',
      seasonYear: 1999,
      averageScore: 88,
      format: 'MOVIE',
    ),
  ];
  const arabic = [ArabicAnimeCard(slug: 'one-piece', title: 'One Piece')];
  List<UnifiedSearchResult> results(SearchCategory category, SearchSort sort) =>
      collectUnifiedResults(
        films,
        anime,
        arabic,
        query: 'One Piece',
        category: category,
        sort: sort,
      );
  test(
    'all results keep original provider payloads and canonical duplicates collapse',
    () {
      final all = results(SearchCategory.all, SearchSort.relevance);
      expect(all, hasLength(7));
      expect(all.where((r) => r.movie?.id == 'tt1'), hasLength(1));
      expect(all.where((r) => r.movie?.id == 'local'), hasLength(2));
      expect(
        all.singleWhere((r) => r.arabic != null).arabic,
        same(arabic.first),
      );
    },
  );
  test(
    'categories distinguish anime movies, film, series and unsupported types',
    () {
      expect(results(SearchCategory.anime, SearchSort.relevance), hasLength(2));
      expect(results(SearchCategory.movie, SearchSort.relevance), hasLength(3));
      expect(
        results(SearchCategory.series, SearchSort.relevance),
        hasLength(1),
      );
    },
  );
  test(
    'newest and rating operate across sources; missing metadata goes last',
    () {
      expect(
        results(SearchCategory.all, SearchSort.newest).first.movie!.year,
        '2023',
      );
      expect(
        results(SearchCategory.all, SearchSort.rating).first.anime,
        same(anime.first),
      );
      expect(results(SearchCategory.all, SearchSort.rating).last.rating, 0);
    },
  );
  test(
    'global query keeps a chosen category when already in unified search',
    () {
      final current = ValueNotifier(ShellSlot.home);
      final shell = AppShellController(
        current: current,
        onSelect: (slot) {
          current.value = slot;
          return true;
        },
        formFactor: () => FormFactor.expanded,
      );
      addTearDown(shell.dispose);
      addTearDown(current.dispose);
      shell.openSearch(category: SearchCategory.anime);
      expect(current.value, ShellSlot.search);
      expect(shell.searchCategoryRequest.value, SearchCategory.anime);
      shell.searchCategoryRequest.value = null;
      shell.searchFromHeader('One Piece');
      expect(shell.searchCategoryRequest.value, isNull);
      expect(shell.headerSearch.value, 'One Piece');
      expect(shell.searchText.value, 'One Piece');
      shell.searchFromHeader('');
      expect(shell.headerSearch.value, '');
      current.value = ShellSlot.home;
      shell.searchFromHeader('The Bear');
      expect(shell.searchCategoryRequest.value, SearchCategory.all);
    },
  );
}
