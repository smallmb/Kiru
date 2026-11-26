import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:zplay/l10n/language_labels.dart';
import 'package:zplay/l10n/generated/app_localizations.dart';
import 'package:zplay/models/anime/anime_media.dart';
import 'package:zplay/services/metadata/anime_chinese_titles.dart';
import 'package:zplay/services/metadata/anime_chinese_synopsis.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(AnimeChineseTitles.initialize);
  const anime = AnimeMedia(id: 154587, idMal: 52991, description: 'Original');
  test('Bangumi ID is exact; contradictory source IDs fail closed', () {
    expect(
      AnimeChineseTitles.bangumiId(anilistId: 154587, malId: 52991),
      400602,
    );
    expect(
      AnimeChineseTitles.bangumiId(anilistId: 154587, malId: 59978),
      isNull,
    );
  });
  test(
    'localized synopsis verifies identity, coalesces requests and caches',
    () async {
      int count = 0;
      final service = AnimeChineseSynopsis(
        client: MockClient((r) async {
          count++;
          expect(r.url.path, '/v0/subjects/400602');
          return http.Response.bytes(
            utf8.encode(
              jsonEncode({
                'id': 400602,
                'type': 2,
                'summary': '中文剧情简介',
                'nsfw': false,
              }),
            ),
            200,
          );
        }),
      );
      addTearDown(service.dispose);
      final results = await Future.wait([
        service.lookup(anime),
        service.lookup(anime),
      ]);
      expect(results, ['中文剧情简介', '中文剧情简介']);
      expect(await service.lookup(anime), '中文剧情简介');
      expect(count, 1);
      expect(anime.description, 'Original');
    },
  );
  test(
    'invalid data, foreign synopsis and HTTP failure preserve original',
    () async {
      for (final data in [
        {'id': 515759, 'type': 2, 'summary': '不相关简介'},
        {'id': 400602, 'type': 1, 'summary': '不相关简介'},
        {'id': 400602, 'type': 2, 'summary': 'Japanese あらすじ'},
        {'id': 400602, 'type': 2, 'summary': 'English summary'},
        {'id': 400602, 'type': 2, 'summary': '中文简介', 'nsfw': true},
      ]) {
        final service = AnimeChineseSynopsis(
          client: MockClient(
            (_) async =>
                http.Response.bytes(utf8.encode(jsonEncode(data)), 200),
          ),
        );
        expect(await service.lookup(anime), isNull);
        service.dispose();
      }
      final service = AnimeChineseSynopsis(
        client: MockClient((_) async => http.Response('', 503)),
      );
      expect(await service.lookup(anime), isNull);
      service.dispose();
    },
  );
  testWidgets('language display preserves locale and unknown labels', (
    tester,
  ) async {
    Widget app(Locale locale) => MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: Builder(
        builder: (context) => Column(
          children: [
            for (final lang in ['eng', 'jpn', 'zh-Hant', 'zh-CN', 'xxz', 'und'])
              Text(localizedLanguageLabel(context, lang)),
          ],
        ),
      ),
    );
    await tester.pumpWidget(app(const Locale('zh')));
    for (final text in ['英语', '日语', '繁体中文', '简体中文', 'xxz', '未知语言']) {
      expect(find.text(text), findsOneWidget);
    }
    await tester.pumpWidget(app(const Locale('en')));
    expect(find.text('eng'), findsOneWidget);
    expect(find.text('zh-Hant'), findsOneWidget);
  });
}
