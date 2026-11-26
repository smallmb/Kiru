import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/l10n/config_labels.dart';
import 'package:zplay/l10n/generated/app_localizations.dart';
import 'package:zplay/services/home/home_page_settings.dart';
import 'package:zplay/services/music/music_settings.dart';
import 'package:zplay/widgets/common/segmented_tabs.dart';

void main() {
  testWidgets(
    'bundled config labels follow locale without altering stored enums',
    (tester) async {
      final original = HeroStyle.values.first.label;
      Widget app(Locale locale) => MaterialApp(
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Builder(
            builder: (context) => Column(
              children: [
                Text(configLabel(context, 'The 90s: Action')),
                Text(configLabel(context, '10 picks from 1990 to 1999')),
                Text(configLabel(context, 'Signal Teal')),
                Text(
                  configLabel(
                    context,
                    'Direct GPU hardware decoding (Direct3D 11 / MediaCodec / VAAPI).',
                  ),
                ),
                Text(
                  configLabel(
                    context,
                    MusicFullscreenPreset.values.first.label,
                  ),
                ),
                Text(configLabel(context, 'Unrecognized third-party label')),
                SegmentedTabs<HeroStyle>(
                  options: HeroStyle.values
                      .map((v) => SegmentedTabOption(value: v, label: v.label))
                      .toList(),
                  selected: HeroStyle.values.first,
                  onSelected: (_) {},
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pumpWidget(app(const Locale('zh')));
      expect(find.text('90 年代 · 动作'), findsOneWidget);
      expect(find.text('10 部作品（1990—1999 年）'), findsOneWidget);
      expect(find.text('信号青'), findsOneWidget);
      expect(
        find.text('直接使用 GPU 硬件解码（Direct3D 11 / MediaCodec / VAAPI）。'),
        findsOneWidget,
      );
      expect(find.text('黑胶唱片工作室'), findsOneWidget);
      expect(find.text('沉浸式影院轮播'), findsOneWidget);
      expect(find.text('Unrecognized third-party label'), findsOneWidget);
      expect(HeroStyle.values.first.label, original);
      await tester.pumpWidget(app(const Locale('en')));
      expect(find.text('The 90s: Action'), findsOneWidget);
      expect(find.text('Signal Teal'), findsOneWidget);
      expect(find.text(original), findsOneWidget);
    },
  );
}
