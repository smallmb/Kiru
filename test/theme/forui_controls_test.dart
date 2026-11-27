import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart' as f;
import 'package:zplay/services/theme/app_theme_service.dart';
import 'package:zplay/services/theme/design_tokens.dart';
import 'package:zplay/services/theme/fonts/font_registry.dart';
import 'package:zplay/services/theme/forui_theme.dart';
import 'package:zplay/widgets/ui/kiru_controls.dart';

void main() {
  testWidgets('Forui inherits the Kiru palette and font registry', (
    tester,
  ) async {
    final palette = AppThemeService.palettes.first;
    final tokens = AppThemeService.tokensFor(palette);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppThemeService.createThemeData(palette),
        builder: (context, child) => KiruForuiTheme.wrap(context, child!),
        home: Scaffold(
          body: Builder(
            builder: (context) {
              final theme = f.FTheme.of(context);
              expect(theme.colors.primary, tokens.accent);
              expect(theme.colors.background, tokens.bg);
              expect(theme.typography.body.fontFamily, FontRegistry.primary);
              expect(
                theme.typography.body.fontFamilyFallback,
                FontRegistry.fallback,
              );
              expect(context.tokens.accent, tokens.accent);
              return const Text('Theme ready');
            },
          ),
        ),
      ),
    );
    expect(find.text('Theme ready'), findsOneWidget);
  });

  testWidgets('Forui controls forward callbacks and preserve disabled state', (
    tester,
  ) async {
    var pressed = 0;
    var enabled = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppThemeService.createThemeData(AppThemeService.palettes.first),
        builder: (context, child) => KiruForuiTheme.wrap(context, child!),
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => Column(
              children: [
                KiruButton(
                  onPressed: () => pressed++,
                  child: const Text('Apply'),
                ),
                const KiruButton(onPressed: null, child: Text('Disabled')),
                KiruSwitchRow(
                  title: const Text('Enable'),
                  value: enabled,
                  onChanged: (value) => setState(() => enabled = value),
                ),
                const KiruBadge(child: Text('Active')),
              ],
            ),
          ),
        ),
      ),
    );
    expect(find.byType(f.FButton), findsNWidgets(2));
    expect(find.byType(f.FSwitch), findsOneWidget);
    expect(find.byType(f.FBadge), findsOneWidget);
    await tester.tap(find.text('Apply'));
    await tester.pumpAndSettle();
    expect(pressed, 1);
    await tester.tap(find.text('Disabled'));
    await tester.pumpAndSettle();
    expect(pressed, 1);
    await tester.tap(find.byType(f.FSwitch));
    await tester.pumpAndSettle();
    expect(enabled, isTrue);
  });
  testWidgets(
    'select updates external state and fields retain their controller',
    (tester) async {
      var selected = 'a';
      final controller = TextEditingController(text: 'https://example.org');
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        MaterialApp(
          theme: AppThemeService.createThemeData(
            AppThemeService.palettes.first,
          ),
          builder: (context, child) => KiruForuiTheme.wrap(context, child!),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  KiruSelect<String>(
                    value: selected,
                    items: const {'Source A': 'a', 'Source B': 'b'},
                    onChanged: (value) {
                      if (value != null) setState(() => selected = value);
                    },
                  ),
                  KiruTextField(
                    controller: controller,
                    label: 'Mirror',
                    keyboardType: TextInputType.url,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      expect(
        find.byWidgetPredicate((widget) => widget is f.FSelect<String>),
        findsOneWidget,
      );
      expect(find.byType(f.FTextField), findsWidgets);
      await tester.tap(find.text('Source A'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Source B').last);
      await tester.pumpAndSettle();
      expect(selected, 'b');
      final input = find.byWidgetPredicate(
        (widget) => widget is EditableText && widget.controller == controller,
      );
      expect(input, findsOneWidget);
      await tester.enterText(input, 'https://example.com');
      await tester.pumpAndSettle();
      expect(controller.text, 'https://example.com');
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );
  testWidgets('Forui dialog returns result and keeps form control', (
    tester,
  ) async {
    bool? result;
    final ctrl = TextEditingController();
    addTearDown(ctrl.dispose);
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => KiruForuiTheme.wrap(context, child!),
        home: Scaffold(
          body: Builder(
            builder: (context) => KiruButton(
              onPressed: () async => result = await showDialog<bool>(
                context: context,
                builder: (context) => KiruAlertDialog(
                  title: const Text('Confirm'),
                  content: TextField(controller: ctrl),
                  actions: [
                    KiruButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    expect(find.byType(f.FDialog), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'test');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(result, isTrue);
    expect(ctrl.text, 'test');
  });
  testWidgets('Forui feedback preserves progress values and finite bounds', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => KiruForuiTheme.wrap(context, child!),
        home: const Scaffold(
          body: Column(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: KiruLoader(strokeWidth: 2),
              ),
              KiruProgress(value: 0.4, minHeight: 5),
              KiruProgress(),
              KiruDivider(color: Colors.grey, height: 16),
            ],
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.byType(f.FCircularProgress), findsOneWidget);
    expect(
      tester
          .widget<f.FDeterminateProgress>(find.byType(f.FDeterminateProgress))
          .value,
      0.4,
    );
    expect(tester.getSize(find.byType(f.FDeterminateProgress)).height, 5);
    expect(find.byType(f.FProgress), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
  testWidgets(
    'styled buttons preserve callbacks and sliders retain discrete units',
    (tester) async {
      int taps = 0;
      double value = 6;
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => KiruForuiTheme.wrap(context, child!),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  KiruButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => taps++,
                    child: const Text('Styled'),
                  ),
                  KiruIconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: 'Edit',
                    onPressed: () => taps++,
                  ),
                  SizedBox(
                    width: 320,
                    child: KiruSlider(
                      min: 2,
                      max: 10,
                      divisions: 4,
                      value: value,
                      onChanged: (v) => setState(() => value = v),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Styled'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();
      expect(taps, 2);
      final slider = find.byType(f.FSlider);
      expect(slider, findsOneWidget);
      final bounds = tester.getRect(slider);
      await tester.tapAt(Offset(bounds.right - 12, bounds.center.dy));
      await tester.pumpAndSettle();
      expect(value, greaterThan(6));
      expect((value - 2) % 2, closeTo(0, 0.00001));
      expect(tester.takeException(), isNull);
    },
  );
}
