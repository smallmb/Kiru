import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/l10n/generated/app_localizations.dart';
import 'package:zplay/pages/settings/appearance_settings_page.dart';
import 'package:zplay/services/theme/app_theme_service.dart';
import 'package:zplay/services/theme/glass_settings.dart';

void main() {
  testWidgets(
    'appearance overview localizes actual row values and switches language',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.binding.setSurfaceSize(const Size(1200, 1400));
      addTearDown(() => tester.binding.setSurfaceSize(null));
      final oldPalette = AppThemeService.currentPalette.value;
      final oldEnabled = GlassSettings.enabled.value;
      final oldPreset = GlassSettings.preset.value;
      addTearDown(() {
        AppThemeService.currentPalette.value = oldPalette;
        GlassSettings.enabled.value = oldEnabled;
        GlassSettings.preset.value = oldPreset;
      });
      AppThemeService.currentPalette.value = AppThemeService.palettes.first;
      GlassSettings.enabled.value = false;
      Widget app(Locale locale) => MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const AppearanceSettingsPage(),
      );
      await tester.pumpWidget(app(const Locale('zh')));
      await tester.pump();
      expect(find.text('默认主题'), findsOneWidget);
      expect(find.text('已停用'), findsOneWidget);
      expect(find.text('信号青'), findsOneWidget);
      expect(find.text('纵向阅读'), findsOneWidget);
      GlassSettings.enabled.value = true;
      GlassSettings.preset.value = GlassPreset.standard;
      await tester.pump();
      expect(find.text('已启用'), findsOneWidget);
      await tester.pumpWidget(app(const Locale('en')));
      await tester.pump();
      expect(find.text('Default Theme'), findsOneWidget);
      expect(find.text('Signal Teal'), findsOneWidget);
      expect(find.text('Enabled'), findsOneWidget);
      await tester.pumpWidget(const SizedBox.shrink());
    },
  );
}
