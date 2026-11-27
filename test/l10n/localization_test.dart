/// The shell and settings chrome in Arabic.
///
/// Two things are being guarded here, and only one of them is copy: the shell
/// has to say its destinations in the app's language, and the app has to lay
/// itself out right-to-left when that language is Arabic. The second is the
/// one a translated string cannot prove on its own, so the direction is read
/// off the live element rather than inferred from the locale.
///
/// The English case is asserted too, because the fallback used by every widget
/// pumped without the app's delegates must keep the words the rest of the suite
/// searches for.
library;

import 'package:zplay/widgets/ui/kiru_controls.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/l10n/generated/app_localizations.dart';
import 'package:zplay/l10n/l10n.dart';
import 'package:zplay/l10n/media_labels.dart';
import 'package:zplay/pages/browse/browse_page.dart';
import 'package:zplay/pages/settings/diagnostics_page.dart';
import 'package:zplay/services/diagnostics/diagnostics_export.dart';
import 'package:zplay/services/layout/device_profile.dart';
import 'package:zplay/services/settings/locale_settings.dart';
import 'package:zplay/shell/app_shell.dart';
import 'package:zplay/shell/shell_rail.dart';

const _ar = Locale('ar');

Widget _app(Locale locale, Widget home) => MaterialApp(
  locale: locale,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: home,
);

Widget _rail() => Scaffold(
  body: ShellRail(current: ShellSlot.home, onSelect: (_) {}, onLiveTv: () {}),
);

/// A page that reports the bundle it sees, for asserting the delegate wiring
/// itself rather than a widget's rendering.
class _Probe extends StatelessWidget {
  const _Probe();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context),
      child: Text(l10nOf(context).navHome),
    );
  }
}

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    LocaleSettings.locale.value = null;
    DeviceProfile.debugSetTelevision(value: false);
  });

  tearDown(() {
    LocaleSettings.locale.value = null;
    DeviceProfile.debugSetTelevision(value: false);
  });

  testWidgets('Arabic shell is RTL and names every destination in Arabic', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(_app(_ar, _rail()));
    await tester.pump();

    final context = tester.element(find.byType(ShellRail));
    expect(
      Directionality.of(context),
      TextDirection.rtl,
      reason: 'an Arabic MaterialApp has to lay the shell out right-to-left',
    );

    final labels = l10nOf(context);
    for (final label in <String>[
      labels.navHome,
      BrowseVertical.moviesAndTv.localizedLabel(context),
      BrowseVertical.anime.localizedLabel(context),
      BrowseVertical.music.localizedLabel(context),
      labels.navLibrary,
      labels.navSearch,
      labels.navSettings,
    ]) {
      // Search and Settings are icons in the desktop capsule, so their
      // name is the tooltip (and the semantics label) rather than a Text.
      expect(
        find.text(label).evaluate().length +
            find
                .byWidgetPredicate(
                  (w) =>
                      (w is KiruTooltip && w.message == label) ||
                      (w is Tooltip && w.message == label),
                )
                .evaluate()
                .length,
        greaterThanOrEqualTo(1),
        reason: 'the shell must name "$label" in Arabic',
      );
    }
  });

  testWidgets('Chinese media labels retain unknown provider labels', (
    tester,
  ) async {
    Widget probe(Locale locale) => _app(
      locale,
      Builder(
        builder: (context) {
          return Column(
            children: [
              Text(mediaLabel(context, 'Action')),
              Text(mediaLabel(context, 'WINTER')),
              Text(mediaLabel(context, 'RELEASING')),
              Text(mediaLabel(context, 'Custom provider')),
              Text(l10nOf(context).detailsSeasonLabel(2)),
            ],
          );
        },
      ),
    );
    await tester.pumpWidget(probe(const Locale('zh')));
    expect(find.text('动作'), findsOneWidget);
    expect(find.text('冬季'), findsOneWidget);
    expect(find.text('连载中'), findsOneWidget);
    expect(find.text('Custom provider'), findsOneWidget);
    expect(find.text('第 2 季'), findsOneWidget);
    await tester.pumpWidget(probe(const Locale('en')));
    expect(find.text('Action'), findsOneWidget);
    expect(find.text('WINTER'), findsOneWidget);
  });

  testWidgets('English stays the default copy', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(_app(const Locale('en'), _rail()));
    await tester.pump();

    final context = tester.element(find.byType(ShellRail));
    expect(Directionality.of(context), TextDirection.ltr);
    expect(find.text('Home'), findsOneWidget);
    // An icon in the desktop capsule: named by its tooltip.
    expect(
      find.byWidgetPredicate(
        (w) =>
            (w is KiruTooltip && w.message == 'Settings') ||
            (w is Tooltip && w.message == 'Settings'),
      ),
      findsOneWidget,
    );
    expect(
      find.text(BrowseVertical.moviesAndTv.localizedLabel(context)),
      findsOneWidget,
    );
    expect(find.text('Anime'), findsOneWidget);
    expect(find.text('Music'), findsOneWidget);
    expect(find.text('Live TV'), findsNothing);
  });

  testWidgets('a plain MaterialApp still sees English through l10nOf', (
    tester,
  ) async {
    // No delegates: the situation every older widget test is in.
    await tester.pumpWidget(const MaterialApp(home: _Probe()));
    await tester.pump();

    expect(find.text('Home'), findsOneWidget);
  });

  testWidgets('diagnostics page renders its Arabic chrome', (tester) async {
    await tester.pumpWidget(
      _app(_ar, Scaffold(body: DiagnosticsPage(export: _FakeDiagnostics()))),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text('التشخيص'), findsOneWidget);
    expect(find.text('نسخ التقرير'), findsOneWidget);
    expect(find.text('حفظ التقرير'), findsOneWidget);
    expect(find.textContaining('2 مسجّل'), findsOneWidget);
  });

  testWidgets('Chinese browse labels and source copy use generated resources', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        const Locale('zh'),
        Builder(
          builder: (context) {
            final l10n = l10nOf(context);
            return Column(
              children: [
                Text(BrowseVertical.moviesAndTv.localizedLabel(context)),
                Text(BrowseVertical.anime.localizedLabel(context)),
                Text(l10n.sourcesTitle),
                Text(l10n.sourcesEmpty),
              ],
            );
          },
        ),
      ),
    );
    expect(find.text('电影与剧集'), findsOneWidget);
    expect(find.text('动漫'), findsOneWidget);
    expect(find.text('播放源'), findsOneWidget);
    expect(find.text('暂无可用播放源'), findsOneWidget);
    await tester.pumpWidget(
      _app(
        const Locale('en'),
        Builder(
          builder: (context) {
            return Text(BrowseVertical.moviesAndTv.localizedLabel(context));
          },
        ),
      ),
    );
    expect(find.text('Movies & TV'), findsOneWidget);
  });

  test('LocaleSettings persists Chinese and restores it', () async {
    await LocaleSettings.setLocale('zh');
    expect(LocaleSettings.locale.value, const Locale('zh'));
    LocaleSettings.locale.value = null;
    await LocaleSettings.initialize();
    expect(LocaleSettings.locale.value, const Locale('zh'));
    await LocaleSettings.setLocale(LocaleSettings.systemCode);
    expect(LocaleSettings.locale.value, isNull);
  });

  test('LocaleSettings persists Arabic and initialize restores it', () async {
    await LocaleSettings.setLocale('ar');
    expect(LocaleSettings.locale.value, _ar);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('zplay_locale'), 'ar');

    // A fresh launch reads the stored choice rather than defaulting to system.
    LocaleSettings.locale.value = null;
    await LocaleSettings.initialize();
    expect(LocaleSettings.locale.value, _ar);

    // And the system choice is stored as an absence, not the word "system".
    await LocaleSettings.setLocale(LocaleSettings.systemCode);
    expect(LocaleSettings.locale.value, isNull);
    expect(prefs.getString('zplay_locale'), isNull);
  });
}

class _FakeDiagnostics extends DiagnosticsExport {
  @override
  Future<Map<String, Object?>> collect() async => <String, Object?>{
    'app': <String, Object?>{'version': '9.9.9'},
    'device': <String, Object?>{'formFactor': 'television'},
    'player': <String, Object?>{'engine': 'media3'},
    'breadcrumbs': <String, Object?>{
      'count': 2,
      'entries': <Object?>[
        <String, Object?>{
          'at': '2026-10-19T10:00:00.000Z',
          'category': 'route',
          'message': 'push DetailsPage',
        },
        <String, Object?>{
          'at': '2026-10-19T10:00:01.000Z',
          'category': 'stream',
          'message': 'stream.open',
        },
      ],
    },
  };

  @override
  Future<String> copyText() async => '{"fake":true}';

  @override
  Future<String?> saveReport() async => null;
}
