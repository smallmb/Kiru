import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart' as f;
import 'package:zplay/services/theme/forui_theme.dart';
import 'package:zplay/widgets/ui/kiru_controls.dart';
import 'package:zplay/widgets/ui/kiru_toast.dart';

Widget host(Widget child) => MaterialApp(
  builder: (context, child) => KiruForuiTheme.wrap(context, child!),
  home: Scaffold(body: child),
);

void main() {
  testWidgets('real Forui toaster queues notifications and runs action', (
    tester,
  ) async {
    var actions = 0;
    await tester.pumpWidget(
      host(
        Builder(
          builder: (context) => Center(
            child: KiruButton(
              onPressed: () {
                final messenger = KiruToastMessenger.of(context);
                messenger.showSnackBar(
                  KiruToast(
                    content: const Text('First notice'),
                    duration: const Duration(seconds: 20),
                    action: KiruToastAction(
                      label: 'Confirm',
                      onPressed: () => actions++,
                    ),
                  ),
                );
                messenger.showSnackBar(
                  const KiruToast(
                    content: Text('Second notice'),
                    duration: Duration(seconds: 20),
                  ),
                );
              },
              child: const Text('Queue'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Queue'));
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pumpAndSettle();
    expect(find.byType(f.FToaster), findsOneWidget);
    expect(find.byType(f.FToast), findsOneWidget);
    expect(find.text('First notice'), findsOneWidget);
    expect(find.text('Second notice'), findsNothing);
    await tester.tap(find.text('Confirm'));
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pumpAndSettle();
    expect(actions, 1);
    expect(find.text('Second notice'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 21));
  });

  testWidgets('Forui slider commits at end of interaction', (tester) async {
    double value = .2;
    double? committed;
    await tester.pumpWidget(
      host(
        StatefulBuilder(
          builder: (context, setState) => Center(
            child: SizedBox(
              width: 320,
              child: KiruSlider(
                value: value,
                onChanged: (v) => setState(() => value = v),
                onChangeEnd: (v) => committed = v,
              ),
            ),
          ),
        ),
      ),
    );
    final bounds = tester.getRect(find.byType(f.FSlider));
    await tester.tapAt(
      Offset(bounds.left + bounds.width * .7, bounds.center.dy),
    );
    await tester.pumpAndSettle();
    expect(committed, isNotNull);
    expect(committed!, greaterThan(.2));
  });

  testWidgets('Forui anchored menu returns selected value', (tester) async {
    String? selected;
    await tester.pumpWidget(
      host(
        Builder(
          builder: (context) => Center(
            child: KiruButton(
              onPressed: () async => selected = await showKiruMenu<String>(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 100, 100),
                items: const [
                  PopupMenuItem(value: 'a', child: Text('Choice A')),
                  PopupMenuItem(value: 'b', child: Text('Choice B')),
                ],
              ),
              child: const Text('Open menu'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open menu'));
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pumpAndSettle();
    expect(find.byType(f.FTile), findsNWidgets(2));
    await tester.tap(find.text('Choice B'));
    await tester.pump(const Duration(milliseconds: 150));
    await tester.pumpAndSettle();
    expect(selected, 'b');
  });

  testWidgets('Forui form field retains required validation', (tester) async {
    final key = GlobalKey<FormState>();
    final ctrl = TextEditingController();
    addTearDown(ctrl.dispose);
    await tester.pumpWidget(
      host(
        Form(
          key: key,
          child: KiruFormField(
            controller: ctrl,
            validator: (v) => v == null || v.isEmpty ? 'Required' : null,
          ),
        ),
      ),
    );
    expect(key.currentState!.validate(), isFalse);
    await tester.pumpAndSettle();
    expect(find.text('Required'), findsOneWidget);
    await tester.enterText(find.byType(EditableText), 'Kiru');
    expect(key.currentState!.validate(), isTrue);
    await tester.pump();
  });
}
