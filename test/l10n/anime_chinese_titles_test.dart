import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zplay/l10n/anime_titles.dart';
import 'package:zplay/l10n/generated/app_localizations.dart';
import 'package:zplay/l10n/l10n.dart';
import 'package:zplay/models/anime/anime_media.dart';
import 'package:zplay/services/metadata/anime_chinese_titles.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(AnimeChineseTitles.initialize);

  const anime = AnimeMedia(
    id: 154587,
    idMal: 52991,
    titleEnglish: "Frieren: Beyond the Journey's End",
  );

  test('local dataset resolves exact IDs and keeps seasons distinct', () {
    expect(
      AnimeChineseTitles.lookup(anilistId: 154587, malId: 52991),
      '葬送的芙莉莲',
    );
    expect(
      AnimeChineseTitles.lookup(anilistId: 182255, malId: 59978),
      '葬送的芙莉莲 第二季',
    );
    expect(AnimeChineseTitles.lookup(anilistId: 154587, malId: 59978), isNull);
    expect(AnimeChineseTitles.lookup(anilistId: 0, malId: 52991), '葬送的芙莉莲');
    expect(AnimeChineseTitles.lookup(anilistId: -1), isNull);
    expect(anime.displayTitle, "Frieren: Beyond the Journey's End");
  });

  testWidgets('Chinese title follows locale without changing source identity', (
    tester,
  ) async {
    Widget app(Locale locale) => MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Builder(
        builder: (context) => Column(
          children: [
            Text(localizedAnimeTitle(context, anime)),
            Text(
              localizedAnimeTitle(
                context,
                const AnimeMedia(id: -1, titleEnglish: 'Unknown title'),
              ),
            ),
            Text(l10nOf(context).animeEpisodeCount(12)),
            Text(l10nOf(context).playerSourceRetrySemantics('Example', 1, 3)),
          ],
        ),
      ),
    );
    await tester.pumpWidget(app(const Locale('zh')));
    expect(find.text('葬送的芙莉莲'), findsOneWidget);
    expect(find.text('Unknown title'), findsOneWidget);
    expect(find.text('共 12 话'), findsOneWidget);
    expect(find.text('正在尝试其他播放源：Example，第 1/3 次尝试。'), findsOneWidget);
    await tester.pumpWidget(app(const Locale('en')));
    expect(find.text(anime.displayTitle), findsOneWidget);
    expect(find.text('12 episodes'), findsOneWidget);
  });
}
