import 'package:zplay/widgets/common/hover_scroll_rail.dart';
import 'package:zplay/widgets/immersive/immersive_content_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/pages/anime/anime_page.dart';
import 'package:zplay/models/anime/anime_media.dart';
import 'package:zplay/services/anime/anime_metadata_provider.dart';
import 'package:zplay/services/anime/anime_metadata_service.dart';
import 'package:zplay/services/layout/device_profile.dart';
import 'package:zplay/shell/shell_rail.dart';
import 'package:zplay/shell/app_shell.dart';

class _FakeAnime implements AnimeMetadataProvider {
  static const items = [AnimeMedia(id: 1, titleEnglish: 'Hero sample')];
  @override
  Future<List<AnimeMedia>> fetchTrendingAnime({
    int page = 1,
    int perPage = 20,
  }) async => items;
  @override
  Future<List<AnimeMedia>> fetchPopularThisSeason({
    int page = 1,
    int perPage = 20,
  }) async => items;
  @override
  Future<List<AnimeMedia>> fetchTopRated({
    int page = 1,
    int perPage = 20,
  }) async => items;
  @override
  Future<List<AnimeMedia>> fetchUpcomingNextSeason({
    int page = 1,
    int perPage = 20,
  }) async => items;
  @override
  Future<List<AnimeMedia>> fetchByGenre(
    String genre, {
    int page = 1,
    int perPage = 20,
  }) async => items;
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({
      'zplay_p2p_warning_never_show': true,
    });
    DeviceProfile.debugSetTelevision(value: false);
  });
  tearDown(() => DeviceProfile.debugSetTelevision(value: false));
  const toolbarKey = ValueKey('kiru-anime-toolbar');
  const contentKey = ValueKey('kiru-anime-content');
  const searchKey = ValueKey('kiru-anime-search');

  for (final width in [360.0, 800.0, 1440.0]) {
    testWidgets(
      'anime hero extends under pointer chrome and respects mobile inset at width $width',
      (tester) async {
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = Size(width, 900);
        addTearDown(tester.view.resetDevicePixelRatio);
        addTearDown(tester.view.resetPhysicalSize);
        final inset = width >= 800 ? 64.0 : 24.0;
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(padding: EdgeInsets.only(top: inset)),
                child: AnimePage(
                  metadata: AnimeMetadataService(
                    anilist: _FakeAnime(),
                    bangumi: _FakeAnime(),
                  ),
                ),
              ),
            ),
          ),
        );
        await tester.pump(const Duration(milliseconds: 150));
        final content = tester.getRect(find.byKey(contentKey));
        final expectedTop = width >= 800 ? 0.0 : inset;
        expect(content.top, closeTo(expectedTop, 0.01));
        final hero = tester.getRect(
          find.byKey(const ValueKey('kiru-anime-hero')),
        );
        expect(hero.top, closeTo(expectedTop, 0.01));
        final title = tester.getRect(find.text('Hero sample').first);
        expect(title.top, greaterThan(inset));
        if (width >= 1100) {
          final gutter = ImmersiveContentLayout.gutterFor(width);
          final rails = tester.widgetList<HoverScrollRail>(
            find.byType(HoverScrollRail),
          );
          expect(rails, isNotEmpty);
          expect(rails.first.padding, EdgeInsets.symmetric(horizontal: gutter));
          expect(title.left, closeTo(gutter, 1));
        }

        expect(find.byKey(toolbarKey), findsNothing);
        expect(find.byKey(searchKey), findsNothing);
        expect(
          find.byKey(const ValueKey('kiru-anime-catalogue-title')),
          findsNothing,
        );
        expect(find.text('SA'), findsNothing);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump(const Duration(seconds: 1));
      },
    );
  }

  testWidgets('real shell anime content extends behind the global header', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1440, 900);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPhysicalSize);
    await tester.pumpWidget(const MaterialApp(home: AppShell()));
    await tester.pump(const Duration(seconds: 3));
    await tester.pump(const Duration(seconds: 3));
    await tester.tap(
      find.descendant(of: find.byType(ShellRail), matching: find.text('Anime')),
    );
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump();
    final header = tester.getRect(find.byType(ShellRail));
    expect(find.byKey(toolbarKey), findsNothing);
    expect(find.byKey(searchKey), findsNothing);
    expect(tester.getRect(find.byKey(contentKey)).top, closeTo(header.top, 1));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 1));
  });
}
