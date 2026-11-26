import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/pages/browse/browse_page.dart';
import 'package:zplay/services/layout/device_profile.dart';
import 'package:zplay/shell/app_shell.dart';
import 'package:zplay/shell/shell_rail.dart';

void main() {
  setUp(() => DeviceProfile.debugSetTelevision(value: false));
  tearDown(() => DeviceProfile.debugSetTelevision(value: false));

  Future<void> pumpRail(
    WidgetTester tester,
    Size canvas, {
    ValueNotifier<BrowseVertical>? vertical,
    ValueChanged<BrowseVertical>? onBrowseVertical,
  }) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = canvas;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ShellRail(
            current: ShellSlot.browse,
            onSelect: (_) {},
            onLiveTv: () {},
            browseVertical: vertical,
            onBrowseVertical: onBrowseVertical,
          ),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('desktop exposes content destinations in the global header', (
    tester,
  ) async {
    await pumpRail(tester, const Size(1920, 1080));
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Browse'), findsNothing);
    expect(find.text('Library'), findsOneWidget);
    for (final vertical in BrowseVertical.values) {
      if (vertical == BrowseVertical.adult) continue;
      expect(find.text(vertical.label), findsOneWidget);
    }
    expect(find.byTooltip('Search'), findsOneWidget);
    expect(find.byTooltip('Settings'), findsOneWidget);
    expect(
      tester.getCenter(find.text('Home')).dy,
      tester.getCenter(find.text('Music')).dy,
    );
  });

  testWidgets('desktop content navigation forwards selection', (tester) async {
    final vertical = ValueNotifier(BrowseVertical.moviesAndTv);
    addTearDown(vertical.dispose);
    await pumpRail(
      tester,
      const Size(1920, 1080),
      vertical: vertical,
      onBrowseVertical: (value) => vertical.value = value,
    );
    await tester.tap(find.text('Anime'));
    await tester.pumpAndSettle();
    expect(vertical.value, BrowseVertical.anime);
    await tester.tap(find.text('Live TV'));
    await tester.pumpAndSettle();
    expect(vertical.value, BrowseVertical.liveTv);
  });

  testWidgets('narrow window retains utility actions without overflow', (
    tester,
  ) async {
    await pumpRail(tester, const Size(600, 900));
    expect(tester.takeException(), isNull);
    expect(find.byTooltip('Search'), findsOneWidget);
    expect(
      tester.getRect(find.byTooltip('Settings')).right,
      lessThanOrEqualTo(600),
    );
  });
}
