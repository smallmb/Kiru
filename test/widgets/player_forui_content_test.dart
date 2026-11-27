import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart' as f;
import 'package:zplay/services/theme/glass_settings.dart';
import 'package:zplay/widgets/player/player_glass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/services/theme/forui_theme.dart';
import 'package:zplay/widgets/player/player_sub_style_modal.dart';
import 'package:zplay/widgets/player/player_forui.dart';
import 'package:zplay/widgets/player/player_seek_bar.dart';
import 'package:zplay/widgets/player/player_volume_control.dart';

Widget host(Widget child) => MaterialApp(
  builder: (context, child) => KiruForuiTheme.wrap(context, child!),
  home: Scaffold(body: child),
);

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('subtitle appearance mounts Forui tabs, select and sliders', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(host(PlayerSubStyleModal(onClose: () {})));
    await tester.pumpAndSettle();
    expect(find.byType(f.FTabs), findsOneWidget);
    expect(
      find.byWidgetPredicate((w) => w is f.FSelect<String>),
      findsOneWidget,
    );
    expect(find.byType(f.FSlider), findsWidgets);
    final advanced = find.text('Advanced / ASS');
    final tabs = find.byWidgetPredicate(
      (w) => w is Scrollable && w.axisDirection == AxisDirection.right,
    );
    await tester.scrollUntilVisible(advanced, 180, scrollable: tabs.first);
    await tester.tap(advanced);
    await tester.pumpAndSettle();
    expect(find.byType(f.FRadio), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('timeline and boosted volume expose immediate Forui progress', (
    tester,
  ) async {
    final position = ValueNotifier(const Duration(seconds: 20));
    final buffered = ValueNotifier<Duration?>(const Duration(seconds: 40));
    addTearDown(position.dispose);
    addTearDown(buffered.dispose);
    Duration? sought;
    double? volume;
    await tester.pumpWidget(
      host(
        Column(
          children: [
            SizedBox(
              width: 600,
              child: PlayerSeekBar(
                positionListenable: position,
                duration: const Duration(seconds: 100),
                bufferedListenable: buffered,
                onSeek: (v) => sought = v,
              ),
            ),
            PlayerVolumeControl(
              volume: 2,
              isMuted: false,
              onVolumeChanged: (v) => volume = v,
              onToggleMute: () {},
            ),
          ],
        ),
      ),
    );
    await tester.pump();
    final bars = tester
        .widgetList<f.FDeterminateProgress>(find.byType(f.FDeterminateProgress))
        .toList();
    expect(bars.length, 2);
    expect(bars.first.value, closeTo(0.2, 0.0001));
    expect(bars.last.value, closeTo(0.85, 0.0001));
    position.value = const Duration(seconds: 50);
    await tester.pump();
    expect(
      tester
          .widget<f.FDeterminateProgress>(
            find.byType(f.FDeterminateProgress).first,
          )
          .value,
      0.5,
    );
    await tester.tapAt(tester.getCenter(find.byType(PlayerTrackFill).first));
    await tester.pump(const Duration(milliseconds: 16));
    expect(sought, isNotNull);
    await tester.tapAt(tester.getCenter(find.byType(PlayerTrackFill).last));
    await tester.pump(const Duration(milliseconds: 16));
    expect(volume, isNotNull);
    expect(tester.takeException(), isNull);
  });
  testWidgets('Forui tooltip shows on pointer hover and hides on exit', (
    tester,
  ) async {
    await tester.pumpWidget(
      host(
        const Center(
          child: PlayerTooltip(
            message: 'Playback help',
            child: SizedBox(width: 48, height: 48, child: Icon(Icons.info)),
          ),
        ),
      ),
    );
    expect(find.byType(f.FTooltip), findsOneWidget);
    final mouse = await tester.createGesture(kind: PointerDeviceKind.mouse);
    await mouse.addPointer(location: Offset.zero);
    await mouse.moveTo(tester.getCenter(find.byType(PlayerTooltip)));
    await tester.pump(const Duration(milliseconds: 450));
    await tester.pumpAndSettle();
    expect(find.text('Playback help'), findsOneWidget);
    await mouse.moveTo(const Offset(5, 5));
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pumpAndSettle();
    expect(find.text('Playback help'), findsNothing);
    await mouse.removePointer();
  });
  testWidgets(
    'player ghost button has no liquid lens even with global glass enabled',
    (tester) async {
      final previous = GlassSettings.enabled.value;
      GlassSettings.enabled.value = true;
      addTearDown(() => GlassSettings.enabled.value = previous);
      var tapped = 0;
      await tester.pumpWidget(
        host(
          Center(
            child: PlayerIconButton(
              icon: const Icon(Icons.play_arrow_rounded),
              tooltip: 'Play',
              size: 42,
              onPressed: () => tapped++,
            ),
          ),
        ),
      );
      final button = tester.widget<f.FButton>(find.byType(f.FButton));
      expect(button.variant, f.FButtonVariant.ghost);
      final style = button.style(
        f.FTheme.of(tester.element(find.byType(f.FButton))).buttonStyles
            .resolve({f.FButtonVariant.ghost})
            .resolve({f.FButtonSizeVariant.md}),
      );
      final idle = style.decoration.resolve({});
      expect((idle as ShapeDecoration).color, Colors.transparent);
      expect(idle.shadows, isNull);
      expect((idle.shape as RoundedRectangleBorder).side, BorderSide.none);
      expect(
        find.byWidgetPredicate(
          (w) => w.runtimeType.toString() == 'LiquidGlassLens',
        ),
        findsNothing,
      );
      expect(tester.getSize(find.byType(f.FButton)), const Size(42, 42));
      await tester.tap(find.byIcon(Icons.play_arrow_rounded));
      await tester.pump(const Duration(milliseconds: 120));
      expect(tapped, 1);
      expect(tester.takeException(), isNull);
    },
  );
}
