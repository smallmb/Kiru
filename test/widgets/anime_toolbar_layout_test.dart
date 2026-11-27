import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/pages/anime/anime_page.dart';
import 'package:zplay/pages/anime/anime_search_page.dart';
import 'package:zplay/widgets/common/segmented_tabs.dart';
import 'package:zplay/services/layout/device_profile.dart';
import 'package:zplay/shell/shell_rail.dart';
import 'package:zplay/shell/app_shell.dart';

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
    testWidgets('anime toolbar reserves its own space at width $width', (
      tester,
    ) async {
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
              child: const AnimePage(),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 150));
      final toolbar = tester.getRect(find.byKey(toolbarKey));
      final content = tester.getRect(find.byKey(contentKey));
      final tabs = tester.getRect(find.byType(SegmentedTabs<bool>));
      final search = tester.getRect(find.byKey(searchKey));
      expect(toolbar.top, greaterThanOrEqualTo(inset));
      expect(content.top, greaterThanOrEqualTo(toolbar.bottom));
      expect(tabs.right, lessThan(search.left));
      expect(search.right, lessThanOrEqualTo(width));
      expect(find.byIcon(Icons.settings_rounded), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.tap(find.byKey(searchKey));
      await tester.pump(const Duration(milliseconds: 600));
      await tester.pump(const Duration(milliseconds: 150));
      expect(find.byType(AnimeSearchPage), findsOneWidget);
      expect(
        tester
            .widget<AnimeSearchPage>(find.byType(AnimeSearchPage))
            .initialArabicMode,
        isFalse,
      );
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(seconds: 1));
    });
  }

  testWidgets('real shell anime toolbar starts beneath the global header', (
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
    final toolbar = tester.getRect(find.byKey(toolbarKey));
    expect(toolbar.top, greaterThanOrEqualTo(header.bottom));
    expect(
      tester.getRect(find.byKey(contentKey)).top,
      greaterThanOrEqualTo(toolbar.bottom),
    );
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 1));
  });
}
