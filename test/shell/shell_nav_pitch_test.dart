import 'package:zplay/widgets/ui/kiru_controls.dart';
import 'dart:io';
import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/services/content/navigation_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/pages/browse/browse_page.dart';
import 'package:zplay/services/layout/device_profile.dart';
import 'package:zplay/shell/app_shell.dart';
import 'package:zplay/shell/shell_rail.dart';
import 'package:zplay/shell/app_shell_scope.dart' show ShellPageAction;
import 'package:zplay/widgets/common/zplay_logo.dart';

void main() {
  setUp(() {
    DeviceProfile.debugSetTelevision(value: false);
    NavigationSettings.enabled.value = NavigationSettings.defaults;
    SharedPreferences.setMockInitialValues({});
  });
  tearDown(() {
    DeviceProfile.debugSetTelevision(value: false);
    NavigationSettings.enabled.value = NavigationSettings.defaults;
  });

  Future<void> pumpRail(
    WidgetTester tester,
    Size canvas, {
    ValueNotifier<BrowseVertical>? vertical,
    ValueChanged<BrowseVertical>? onBrowseVertical,
    ValueChanged<String>? onSearchSubmitted,
    ValueNotifier<List<ShellPageAction>>? pageActions,
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
            onSearchSubmitted: onSearchSubmitted,
            pageActions: pageActions,
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
    expect(find.byType(ZplayLogo), findsNothing);
    expect(tester.widget<Text>(find.text('Home')).style?.fontSize, 17);
    final menu = tester.getRect(
      find.byKey(const ValueKey('kiru-desktop-menu')),
    );
    final viewport = tester.getRect(
      find.byKey(const ValueKey('kiru-desktop-menu-viewport')),
    );
    final expectedLeft = (960 - menu.width / 2).clamp(
      viewport.left,
      viewport.right - menu.width,
    );
    expect(menu.left, closeTo(expectedLeft, 1));
    expect(menu.right, lessThanOrEqualTo(viewport.right + 1));

    expect(find.text('Browse'), findsNothing);
    expect(find.text('Library'), findsOneWidget);
    for (final vertical in BrowseVertical.values) {
      expect(
        find.text(vertical.label),
        NavigationSettings.defaults.contains(vertical.name)
            ? findsOneWidget
            : findsNothing,
      );
    }
    expect(
      find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == 'Search') ||
            (w is Tooltip && w.message == 'Search'),
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == 'Settings') ||
            (w is Tooltip && w.message == 'Settings'),
      ),
      findsOneWidget,
    );
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
    await NavigationSettings.setEnabled('liveTv', true);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Live TV'));
    await tester.pumpAndSettle();
    expect(vertical.value, BrowseVertical.liveTv);
  });

  testWidgets('text navigation has no tooltip or highlighted surface', (
    tester,
  ) async {
    final vertical = ValueNotifier(BrowseVertical.moviesAndTv);
    addTearDown(vertical.dispose);
    await pumpRail(
      tester,
      const Size(1920, 1080),
      vertical: vertical,
      onBrowseVertical: (value) => vertical.value = value,
    );
    final anime = find.text('Anime');
    final movie = find.text(BrowseVertical.moviesAndTv.label);
    expect(
      find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == 'Anime') ||
            (w is Tooltip && w.message == 'Anime'),
      ),
      findsNothing,
    );
    expect(
      find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == 'Home') ||
            (w is Tooltip && w.message == 'Home'),
      ),
      findsNothing,
    );
    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: tester.getCenter(anime));
    await tester.pump(const Duration(milliseconds: 800));
    expect(find.text('Anime'), findsOneWidget);
    final surface = find
        .ancestor(of: anime, matching: find.byType(AnimatedContainer))
        .first;
    BoxDecoration decoration() =>
        tester.widget<AnimatedContainer>(surface).decoration! as BoxDecoration;
    expect(decoration().color, Colors.transparent);
    expect(decoration().border, isNull);
    await tester.tap(anime);
    await tester.pumpAndSettle();
    expect(vertical.value, BrowseVertical.anime);
    expect(decoration().color, Colors.transparent);
    expect(decoration().border, isNull);
    expect(decoration().boxShadow, isNull);
    expect(tester.widget<Text>(anime).style?.fontWeight, FontWeight.w600);
    expect(tester.widget<Text>(movie).style?.fontWeight, FontWeight.w400);
    await mouse.removePointer();
  });

  testWidgets('enabled modules update the header without restart', (
    tester,
  ) async {
    await pumpRail(tester, const Size(1920, 1080));
    expect(find.text('Manga'), findsNothing);
    await NavigationSettings.setEnabled('manga', true);
    await tester.pumpAndSettle();
    expect(find.text('Manga'), findsOneWidget);
    await NavigationSettings.setEnabled('music', false);
    await tester.pumpAndSettle();
    expect(find.text('Music'), findsNothing);
    await NavigationSettings.reset();
    await tester.pumpAndSettle();
    expect(find.text('Music'), findsOneWidget);
    expect(find.text('Manga'), findsNothing);
  });

  testWidgets('empty caption space drags window without changing navigation', (
    tester,
  ) async {
    final calls = <String>[];
    const channel = MethodChannel('window_manager');
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(channel, (call) async {
      calls.add(call.method);
      return call.method == 'isFullScreen' ? false : null;
    });
    addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
    await pumpRail(tester, const Size(1920, 1080));
    expect(find.byKey(const ValueKey('kiru-caption-drag')), findsOneWidget);
    final menu = tester.getRect(
      find.byKey(const ValueKey('kiru-desktop-menu')),
    );
    // The left blank space is always reserved for dragging on this wide canvas.
    expect(menu.left, greaterThan(80));
    final point = Offset(menu.left / 2, menu.center.dy);
    await tester.dragFrom(point, const Offset(45, 15));
    await tester.pumpAndSettle();
    expect(calls.where((method) => method == 'startDragging'), hasLength(1));
    calls.clear();
    await tester.tap(find.text('Anime'));
    await tester.pumpAndSettle();
    expect(calls, isNot(contains('startDragging')));
    await tester.enterText(
      find.byKey(const ValueKey('kiru-header-search')),
      'Test',
    );
    await tester.pump();
    expect(calls, isNot(contains('startDragging')));
  }, skip: !Platform.isWindows);

  testWidgets('header search accepts and submits keywords', (tester) async {
    String? query;
    await pumpRail(
      tester,
      const Size(1920, 1080),
      onSearchSubmitted: (value) => query = value,
    );
    final field = find.byKey(const ValueKey('kiru-header-search'));
    expect(field, findsOneWidget);
    await tester.enterText(field, 'Frieren');
    await tester.testTextInput.receiveAction(TextInputAction.search);
    await tester.pump();
    expect(query, 'Frieren');
  });

  testWidgets('search and utility actions share borderless blur material', (
    tester,
  ) async {
    var taps = 0;
    String? query;
    final actions = ValueNotifier<List<ShellPageAction>>([
      ShellPageAction(
        icon: Icons.notifications_none,
        tooltip: 'Action one',
        onTap: () => taps++,
      ),
      ShellPageAction(
        icon: Icons.calendar_today,
        tooltip: 'Action two',
        onTap: () => taps++,
      ),
    ]);
    addTearDown(actions.dispose);
    await pumpRail(
      tester,
      const Size(1920, 1080),
      pageActions: actions,
      onSearchSubmitted: (value) => query = value,
    );
    final field = find.byKey(const ValueKey('kiru-header-search'));
    final searchButton = find.byWidgetPredicate(
      (w) =>
          (w is KiruTooltip && w.message == 'Search') ||
          (w is Tooltip && w.message == 'Search'),
    );
    expect(
      tester.getCenter(searchButton).dx,
      greaterThan(tester.getCenter(field).dx),
    );
    final surface = find
        .ancestor(of: field, matching: find.byType(BackdropFilter))
        .first;
    final colorBox = find
        .descendant(of: surface, matching: find.byType(ColoredBox))
        .first;
    final fill = tester.widget<ColoredBox>(colorBox).color;
    expect(fill.a, lessThan(0.5));
    await tester.enterText(field, 'Frieren');
    await tester.pumpAndSettle();
    expect(tester.widget<ColoredBox>(colorBox).color, fill);
    await tester.tap(searchButton);
    await tester.pumpAndSettle();
    expect(query, 'Frieren');
    for (final label in ['Action one', 'Action two', 'Settings']) {
      final action = find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == label) ||
            (w is Tooltip && w.message == label),
      );
      final blur = find.descendant(
        of: action,
        matching: find.byType(BackdropFilter),
      );
      expect(blur, findsOneWidget);
      final decoration =
          tester
                  .widget<AnimatedContainer>(
                    find
                        .descendant(
                          of: action,
                          matching: find.byType(AnimatedContainer),
                        )
                        .first,
                  )
                  .decoration!
              as BoxDecoration;
      expect(decoration.color, Colors.transparent);
      expect(decoration.border, isNull);
      expect(decoration.gradient, isNull);
      expect(decoration.boxShadow, isNull);
    }
    await tester.tap(
      find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == 'Action one') ||
            (w is Tooltip && w.message == 'Action one'),
      ),
    );
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('narrow window retains utility actions without overflow', (
    tester,
  ) async {
    await pumpRail(tester, const Size(600, 900));
    expect(tester.takeException(), isNull);
    expect(
      find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == 'Search') ||
            (w is Tooltip && w.message == 'Search'),
      ),
      findsOneWidget,
    );
    expect(
      tester
          .getRect(
            find.byWidgetPredicate(
              (w) =>
                  (w is KiruTooltip && w.message == 'Settings') ||
                  (w is Tooltip && w.message == 'Settings'),
            ),
          )
          .right,
      lessThanOrEqualTo(600),
    );
  });
}
