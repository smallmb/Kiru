import 'dart:ui' show PointerDeviceKind;
import 'package:forui/forui.dart' as f;
import 'package:zplay/widgets/settings/settings_row_surface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/pages/settings/settings_page.dart';
import 'package:zplay/pages/settings/language_settings_page.dart';
import 'package:zplay/services/layout/device_profile.dart';
import 'package:zplay/services/theme/forui_theme.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    DeviceProfile.debugSetTelevision(value: false);
  });

  Future<void> pump(WidgetTester tester, Size size) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => KiruForuiTheme.wrap(context, child!),
        home: const SettingsPage(),
      ),
    );
    await tester.pump();
  }

  Finder section(String id) => find.byKey(ValueKey('settings-section-$id'));

  testWidgets(
    'desktop settings switch independent sections and keep sidebar on subpages',
    (tester) async {
      await pump(tester, const Size(1440, 900));
      expect(section('PLAYBACK'), findsOneWidget);
      expect(find.text('Video & Upscaling'), findsOneWidget);
      expect(find.text('Clear cache'), findsNothing);
      await tester.tap(section('APP'));
      await tester.pump();
      expect(find.text('Video & Upscaling'), findsNothing);
      expect(find.text('Clear cache'), findsOneWidget);
      await tester.tap(find.text('Language'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      expect(find.byType(LanguageSettingsPage), findsOneWidget);
      expect(section('APP'), findsOneWidget);
      expect(find.text('Clear cache'), findsNothing);
      await tester.tap(section('PLAYBACK'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      expect(find.byType(LanguageSettingsPage), findsNothing);
      expect(find.text('Video & Upscaling'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('wide workspace is centered and sidebar has no surface', (
    tester,
  ) async {
    await pump(tester, const Size(1920, 1080));
    final workspace = find.byKey(const ValueKey('settings-centered-workspace'));
    final rect = tester.getRect(workspace);
    expect(rect.width, 1360);
    expect(rect.center.dx, closeTo(960, 1));
    final sidebar = tester.widget<Container>(
      find.byKey(const ValueKey('settings-sidebar-surface')),
    );
    expect(sidebar.decoration, isNull);
    await tester.tap(section('APP'));
    await tester.pump();
    expect(find.text('Clear cache'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('settings rows use rounded hover and Forui controls', (
    tester,
  ) async {
    await pump(tester, const Size(1440, 900));
    await tester.tap(section('CONTENT'));
    await tester.pump();
    final row = find.ancestor(
      of: find.text('TV Airing Calendar'),
      matching: find.byType(SettingsRowSurface),
    );
    final surface = find.descendant(
      of: row,
      matching: find.byKey(const ValueKey('settings-row-highlight')),
    );
    expect(
      find.descendant(of: row, matching: find.byType(f.FSwitch)),
      findsOneWidget,
    );
    final oldStrategy = FocusManager.instance.highlightStrategy;
    FocusManager.instance.highlightStrategy =
        FocusHighlightStrategy.alwaysTraditional;
    addTearDown(() => FocusManager.instance.highlightStrategy = oldStrategy);
    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: const Offset(10, 10));
    await tester.pump();
    await mouse.moveTo(tester.getCenter(row));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    final decoration =
        tester.widget<AnimatedContainer>(surface).decoration! as BoxDecoration;
    expect(decoration.borderRadius, SettingsRowSurface.radius);
    expect(decoration.color!.a, greaterThan(0));
    expect(decoration.border, isNull);
    expect(find.byType(f.FDivider), findsWidgets);
    await mouse.removePointer();
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'narrow settings retain all existing categories without a sidebar',
    (tester) async {
      await pump(tester, const Size(600, 900));
      expect(section('PLAYBACK'), findsNothing);
      expect(find.text('Video & Upscaling'), findsOneWidget);
      expect(find.text('Clear cache'), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );
}
