import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/services/window/window_service.dart';
import 'package:zplay/services/theme/forui_theme.dart';
import 'package:zplay/widgets/player/player_top_bar.dart';

void main() {
  testWidgets(
    'player caption drags without intercepting actions or fullscreen',
    (tester) async {
      final calls = <String>[];
      final window = WindowService.instance;
      final previous = window.isFullscreenNotifier.value;
      window.isFullscreenNotifier.value = false;
      addTearDown(() => window.isFullscreenNotifier.value = previous);
      const channel = MethodChannel('window_manager');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.setMockMethodCallHandler(channel, (call) async {
        calls.add(call.method);
        return call.method == 'isFullScreen' ? false : null;
      });
      addTearDown(() => messenger.setMockMethodCallHandler(channel, null));
      int back = 0, sources = 0, copy = 0, download = 0;
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => KiruForuiTheme.wrap(context, child!),
          home: Scaffold(
            body: Align(
              alignment: Alignment.topCenter,
              child: PlayerTopBar(
                title: 'The Bodyguard',
                subtitle: 'S1:E1',
                sourceLabel: 'Provider',
                onBack: () => back++,
                onShowSources: () => sources++,
                onCopyStreamUrl: () => copy++,
                onDownload: () => download++,
              ),
            ),
          ),
        ),
      );
      final title = find.byKey(const ValueKey('kiru-player-title-drag'));
      final caption = find.byKey(const ValueKey('kiru-player-caption-drag'));
      expect(title, findsOneWidget);
      expect(caption, findsOneWidget);
      await tester.drag(find.text('The Bodyguard'), const Offset(50, 10));
      await tester.pump();
      await tester.dragFrom(
        Offset(tester.getRect(title).right - 20, tester.getCenter(title).dy),
        const Offset(40, 10),
      );
      await tester.pump();
      await tester.dragFrom(
        tester.getTopLeft(caption) + const Offset(5, 5),
        const Offset(40, 10),
      );
      await tester.pump();
      expect(calls.where((method) => method == 'startDragging'), hasLength(3));
      calls.clear();
      for (final icon in [
        Icons.chevron_left_rounded,
        Icons.playlist_play_rounded,
        Icons.link_rounded,
        Icons.file_download_outlined,
      ]) {
        await tester.tap(find.byIcon(icon));
        await tester.pump(const Duration(milliseconds: 150));
      }
      expect([back, sources, copy, download], [1, 1, 1, 1]);
      expect(calls, isNot(contains('startDragging')));
      await tester.drag(find.byIcon(Icons.link_rounded), const Offset(40, 0));
      await tester.pump(const Duration(milliseconds: 150));
      expect(calls, isNot(contains('startDragging')));
      window.isFullscreenNotifier.value = true;
      await tester.pump();
      expect(caption, findsNothing);
      expect(title, findsNothing);
      await tester.drag(find.text('The Bodyguard'), const Offset(40, 0));
      await tester.pump();
      expect(calls, isNot(contains('startDragging')));
      expect(tester.takeException(), isNull);
    },
    skip: !Platform.isWindows,
  );
}
