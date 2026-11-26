import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zplay/services/anime/anime_source_settings.dart';
import 'package:zplay/services/anime/bangumi_client.dart';
import 'package:zplay/services/anime/bangumi_metadata_provider.dart';
import 'package:zplay/services/metadata/anime_chinese_titles.dart';

class RealHttp extends HttpOverrides {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'live Bangumi metadata via configured Windows system proxy',
    () async {
      SharedPreferences.setMockInitialValues({});
      await AnimeSourceSettings.initialize();
      await AnimeChineseTitles.initialize();
      await HttpOverrides.runWithHttpOverrides(() async {
        final client = BangumiClient();
        try {
          final provider = BangumiMetadataProvider(client);
          final detail = await provider.fetchAnimeDetails(154587);
          expect(detail?.bangumiId, 400602);
          expect(detail?.titleChinese, isNotEmpty);
          print(
            'LIVE DETAIL OK: id=400602, title=' +
                detail!.titleChinese +
                ', synopsis length=' +
                detail.descriptionChinese.length.toString(),
          );
          final results = await provider.searchAnime('芙莉莲', perPage: 20);
          expect(results.any((a) => a.id == 154587), isTrue);
          print('LIVE SEARCH OK: mapped results=' + results.length.toString());
          final trending = await provider.fetchTrendingAnime(perPage: 20);
          print('LIVE TRENDING: mapped results=' + trending.length.toString());
          final episodes = await provider.fetchEpisodeTitles(154587);
          print('LIVE EPISODES: Chinese titles=' + episodes.length.toString());
          expect(episodes.isNotEmpty, isTrue);
        } finally {
          client.close();
        }
      }, RealHttp());
    },
    skip: !const bool.fromEnvironment('KIRU_LIVE_BANGUMI'),
    timeout: const Timeout(Duration(seconds: 45)),
  );
}
