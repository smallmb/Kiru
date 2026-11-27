import 'dart:io';
import 'package:flutter/material.dart';
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
      final strip = find.byKey(const ValueKey('kiru-global-caption-drag'));
      await tester.drag(strip, const Offset(40, 0));
      await tester.pump();
      expect(calls.where((m) => m == 'startDragging'), hasLength(1));
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      await tester.drag(strip, const Offset(40, 0));
      await tester.pump();
      expect(calls.where((m) => m == 'startDragging'), hasLength(2));
      await tester.tap(find.text('Action'));
      await tester.pumpAndSettle();
      expect(taps, 1);
      window.isFullscreenNotifier.value = true;
      await tester.pump();
      expect(strip, findsNothing);
      expect(find.text('Action'), findsOneWidget);
    },
    skip: !Platform.isWindows,
  );
}
