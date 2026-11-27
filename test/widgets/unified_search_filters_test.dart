import 'package:zplay/widgets/search/film_search_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/models/anime/anime_media.dart';
import 'package:zplay/pages/search/search_page.dart';
import 'package:zplay/services/anime/anime_metadata_provider.dart';
import 'package:zplay/services/anime/anime_metadata_service.dart';
import 'package:zplay/services/search/anime_search_filters.dart';
import 'package:zplay/services/search/unified_search_result.dart';
import 'package:zplay/widgets/search/anime_search_filter_bar.dart';
import 'package:zplay/widgets/anime/anime_slider_section.dart';
import 'package:zplay/widgets/anime/anime_card.dart';
import 'package:zplay/widgets/common/segmented_tabs.dart';
import 'package:zplay/widgets/ui/kiru_controls.dart';

class FakeAnime implements AnimeMetadataProvider {
  String? genre, query, format, season, status;
  int? year;
  int requests = 0;
  @override
  Future<List<AnimeMedia>> fetchTrendingAnime({
    int page = 1,
    int perPage = 20,
  }) async => [const AnimeMedia(id: 1, titleEnglish: 'Trending sample')];
  @override
  Future<List<AnimeMedia>> fetchPopularThisSeason({
    int page = 1,
    int perPage = 20,
  }) async => [const AnimeMedia(id: 2, titleEnglish: 'Season sample')];
  @override
  Future<List<AnimeMedia>> fetchTopRated({
    int page = 1,
    int perPage = 20,
  }) async => [const AnimeMedia(id: 3, titleEnglish: 'Rated sample')];
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
  }) async {
    requests++;
    query = search;
    this.genre = genre;
    this.year = year;
    this.season = season;
    this.format = format;
    this.status = status;
    return [const AnimeMedia(id: 4, titleEnglish: 'Filtered sample')];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));
  test('filters pass their original provider values', () async {
    final fake = FakeAnime();
    final service = AnimeMetadataService(anilist: fake, bangumi: fake);
    final f = const AnimeSearchFilters()
        .change('genre', 'Action')
        .change('year', '2024')
        .change('season', 'SPRING')
        .change('format', 'TV')
        .change('status', 'FINISHED');
    await f.search('sample', service: service);
    expect(fake.query, 'sample');
    expect(fake.genre, 'Action');
    expect(fake.year, 2024);
    expect(fake.season, 'SPRING');
    expect(fake.format, 'TV');
    expect(fake.status, 'FINISHED');
    expect(f.change('genre', null).genre, isNull);
  });
  testWidgets('anime discovery and filters stay in the unified page', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final fake = FakeAnime();
    await tester.pumpWidget(
      MaterialApp(
        home: SearchPage(
          initialCategory: SearchCategory.anime,
          animeMetadata: AnimeMetadataService(anilist: fake, bangumi: fake),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    final filters = find.byType(AnimeSearchFilterBar);
    expect(filters, findsOneWidget);
    expect(find.text('Advanced filters'), findsNothing);
    expect(find.byType(AnimeSliderSection), findsWidgets);
    expect(
      tester.getRect(filters).top,
      greaterThanOrEqualTo(
        tester.getRect(find.byType(SegmentedTabs<SearchCategory>)).bottom,
      ),
    );
    final genre = find.byKey(const ValueKey('kiru-anime-filter-genre'));
    final menu = tester.widget<KiruPopupMenu<String>>(genre);
    menu.onSelected!('Action');
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(fake.genre, 'Action');
    expect(fake.query, '');
    expect(find.byType(AnimeCard), findsOneWidget);
    expect(find.byType(SearchPage), findsOneWidget);
    tester
        .widget<AnimeSearchFilterBar>(filters)
        .onChanged(const AnimeSearchFilters());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.byType(AnimeSliderSection), findsWidgets);
    tester
        .widget<SegmentedTabs<SearchCategory>>(
          find.byType(SegmentedTabs<SearchCategory>),
        )
        .onSelected(SearchCategory.movie);
    await tester.pump();
    expect(filters, findsNothing);
    expect(find.byType(AnimeSliderSection), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });
  testWidgets('movie series and variety use inline filters on the same page', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final fake = FakeAnime();
    await tester.pumpWidget(
      MaterialApp(
        home: SearchPage(
          initialCategory: SearchCategory.movie,
          animeMetadata: AnimeMetadataService(anilist: fake, bangumi: fake),
        ),
      ),
    );
    await tester.pump();
    final tabs = find.byType(SegmentedTabs<SearchCategory>);
    for (final category in [
      SearchCategory.movie,
      SearchCategory.series,
      SearchCategory.variety,
    ]) {
      tester.widget<SegmentedTabs<SearchCategory>>(tabs).onSelected(category);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      final bar = find.byType(FilmSearchFilterBar);
      expect(bar, findsOneWidget);
      expect(tester.widget<FilmSearchFilterBar>(bar).category, category);
      expect(
        tester.getRect(bar).top,
        greaterThanOrEqualTo(tester.getRect(tabs).bottom),
      );
      expect(
        find.byKey(const ValueKey('kiru-film-filter-genre')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey('kiru-film-filter-year')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey('kiru-film-filter-quarter')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey('kiru-film-filter-status')),
        findsOneWidget,
      );
    }
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.text('Advanced filters'), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });
}
