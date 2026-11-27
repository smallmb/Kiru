import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:zplay/widgets/ui/kiru_controls.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/services/window/window_service.dart';
import 'package:zplay/widgets/common/desktop_caption_area.dart';

void main() {
  testWidgets(
    'caption strip works on pushed routes and does not intercept buttons',
    (tester) async {
      final window = WindowService.instance;
      final old = window.isFullscreenNotifier.value;
      window.isFullscreenNotifier.value = false;
      addTearDown(() => window.isFullscreenNotifier.value = old);
      const channel = MethodChannel('window_manager');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      final calls = <String>[];
      messenger.setMockMethodCallHandler(channel, (call) async {
        calls.add(call.method);
        return call.method == 'isFullScreen' ? false : null;
      });
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      var taps = 0;
      await tester.pumpWidget(
        MaterialApp(
          builder: (_, child) => DesktopCaptionArea(child: child!),
          home: Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      body: Center(
                        child: TextButton(
                          onPressed: () => taps++,
                          child: const Text('Action'),
                        ),
                      ),
                    ),
                  ),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      );
      const captionPoint = Offset(400, 12);
      await tester.dragFrom(
        captionPoint,
        const Offset(40, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump();
      expect(calls.where((m) => m == 'startDragging'), hasLength(1));
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.dragFrom(
        captionPoint,
        const Offset(40, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump();
      expect(calls.where((m) => m == 'startDragging'), hasLength(2));
      await tester.tap(find.text('Action'));
      await tester.pumpAndSettle();
      expect(taps, 1);
      window.isFullscreenNotifier.value = true;
      await tester.pump();
      await tester.dragFrom(
        captionPoint,
        const Offset(40, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump();
      expect(find.text('Action'), findsOneWidget);
      expect(calls.where((m) => m == 'startDragging'), hasLength(2));
    },
    skip: !Platform.isWindows,
  );
  testWidgets(
    'caption is reachable even with modal open and reports actual viewport',
    (tester) async {
      final window = WindowService.instance;
      final old = window.isFullscreenNotifier.value;
      window.isFullscreenNotifier.value = false;
      addTearDown(() => window.isFullscreenNotifier.value = old);
      final calls = <String>[];
      const channel = MethodChannel('window_manager');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (call) async {
        calls.add(call.method);
        return call.method == 'isFullScreen' ? false : null;
      });
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      final navigator = GlobalKey<NavigatorState>();
      await tester.pumpWidget(
        MaterialApp(
          navigatorKey: navigator,
          builder: (_, child) => DesktopCaptionArea(child: child!),
          home: Scaffold(
            body: Builder(
              builder: (context) => Center(
                child: TextButton(
                  onPressed: () => showDialog<void>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Modal'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Dismiss'),
                        ),
                      ],
                    ),
                  ),
                  child: const Text('Open modal'),
                ),
              ),
            ),
          ),
        ),
      );
      const captionPoint = Offset(400, 12);
      expect(tester.getTopLeft(find.byType(Scaffold)).dy, 0);
      final size = MediaQuery.sizeOf(tester.element(find.text('Open modal')));
      expect(
        size.height,
        tester.view.physicalSize.height / tester.view.devicePixelRatio,
      );
      await tester.tap(find.text('Open modal'));
      await tester.pumpAndSettle();
      await tester.dragFrom(
        captionPoint,
        const Offset(40, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump();
      expect(calls.where((m) => m == 'startDragging'), hasLength(1));
      expect(find.text('Modal'), findsOneWidget);
      final before = navigator.currentState;
      window.isFullscreenNotifier.value = true;
      await tester.pump();
      await tester.dragFrom(
        captionPoint,
        const Offset(40, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump();
      expect(navigator.currentState, same(before));
      expect(find.text('Modal'), findsOneWidget);
      window.isFullscreenNotifier.value = false;
      await tester.pump();
      await tester.tap(find.text('Dismiss'));
      await tester.pumpAndSettle();
      expect(find.text('Modal'), findsNothing);
      expect(calls.where((m) => m == 'startDragging'), hasLength(1));
      expect(tester.takeException(), isNull);
    },
    skip: !Platform.isWindows,
  );
  testWidgets(
    'edge fallback does not steal top controls or local caption gestures',
    (tester) async {
      final window = WindowService.instance;
      final old = window.isFullscreenNotifier.value;
      window.isFullscreenNotifier.value = false;
      addTearDown(() => window.isFullscreenNotifier.value = old);
      final calls = <String>[];
      const channel = MethodChannel('window_manager');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (call) async {
        calls.add(call.method);
        return call.method == 'isFullScreen' ? false : null;
      });
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      var taps = 0;
      await tester.pumpWidget(
        MaterialApp(
          builder: (_, child) => DesktopCaptionArea(child: child!),
          home: Scaffold(
            body: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  SizedBox(
                    width: 160,
                    height: 44,
                    child: KiruButton(
                      onPressed: () => taps++,
                      child: const Text('OK'),
                    ),
                  ),
                  const SizedBox(width: 200, height: 40, child: TextField()),
                  const SizedBox(
                    width: 100,
                    height: 40,
                    child: DesktopCaptionDrag(child: Text('Local caption')),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );
      const point = Offset(80, 12);
      await tester.tapAt(point, kind: PointerDeviceKind.mouse);
      await tester.pump(const Duration(milliseconds: 150));
      expect(taps, 1);
      await tester.dragFrom(
        point,
        const Offset(50, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump(const Duration(milliseconds: 150));
      await tester.dragFrom(
        const Offset(210, 12),
        const Offset(50, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump(const Duration(milliseconds: 150));
      expect(calls.where((m) => m == 'startDragging'), isEmpty);
      await tester.dragFrom(
        const Offset(400, 12),
        const Offset(50, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump(const Duration(milliseconds: 150));
      expect(calls.where((m) => m == 'startDragging'), hasLength(1));
      await tester.dragFrom(
        const Offset(600, 12),
        const Offset(50, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump(const Duration(milliseconds: 150));
      expect(calls.where((m) => m == 'startDragging'), hasLength(2));
      await tester.dragFrom(
        const Offset(600, 80),
        const Offset(50, 0),
        kind: PointerDeviceKind.mouse,
      );
      await tester.pump(const Duration(milliseconds: 150));
      expect(calls.where((m) => m == 'startDragging'), hasLength(2));
      expect(tester.takeException(), isNull);
    },
    skip: !Platform.isWindows,
  );
}
