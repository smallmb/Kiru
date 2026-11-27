import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart' as f;
import 'package:zplay/widgets/ui/kiru_tappable.dart';

void main() {
  testWidgets(
    'flat interaction surface supports pointer, remote and disabled state',
    (tester) async {
      var hits = 0;
      final node = FocusNode();
      addTearDown(node.dispose);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                KiruTappable(
                  focusNode: node,
                  onTap: () => hits++,
                  child: const SizedBox(
                    width: 120,
                    height: 44,
                    child: Text('Action'),
                  ),
                ),
                const KiruTappable(
                  child: SizedBox(
                    width: 120,
                    height: 44,
                    child: Text('Disabled'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      expect(find.byType(f.FTappable), findsNWidgets(2));
      expect(find.byType(InkWell), findsNothing);
      await tester.tap(find.text('Action'));
      await tester.pump(const Duration(milliseconds: 150));
      expect(hits, 1);
      node.requestFocus();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.select);
      await tester.pump(const Duration(milliseconds: 150));
      expect(hits, 2);
      await tester.tap(find.text('Disabled'));
      await tester.pump(const Duration(milliseconds: 150));
      expect(hits, 2);
    },
  );
}
