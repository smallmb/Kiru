import 'dart:io';
import 'package:zplay/services/anime/bangumi_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:zplay/services/storage/artwork_file_service.dart';

void main() {
  test(
    'Bangumi artwork uses the shared transport and preserves cache headers',
    () async {
      final regular = <Uri>[];
      final bgm = <Uri>[];
      final service = ArtworkFileService(
        defaultClient: MockClient((request) async {
          regular.add(request.url);
          return http.Response.bytes(
            [1, 2, 3],
            200,
            headers: {'content-type': 'image/jpeg'},
          );
        }),
        bangumiClient: MockClient((request) async {
          bgm.add(request.url);
          expect(request.headers['if-none-match'], 'abc');
          return http.Response.bytes(
            [255, 216, 255],
            200,
            headers: {'content-type': 'image/jpeg'},
          );
        }),
      );
      final image = await service.get(
        'https://lain.bgm.tv/pic/cover/l/a.jpg',
        headers: {'If-None-Match': 'abc'},
      );
      expect(image.statusCode, 200);
      expect(await image.content.expand((bytes) => bytes).toList(), [
        255,
        216,
        255,
      ]);
      await service.get('https://image.tmdb.org/t/p/w500/test.jpg');
      await service.get('https://lain.bgm.tv.example.org/test.jpg');
      expect(bgm, hasLength(1));
      expect(regular, hasLength(2));
    },
  );
  test('live Windows Bangumi artwork transport returns JPEG bytes', () async {
    final client = BangumiClient.createNetworkClient();
    addTearDown(client.close);
    final service = ArtworkFileService(bangumiClient: client);
    final response = await service
        .get('https://lain.bgm.tv/pic/cover/l/cb/57/9717_sAVag.jpg')
        .timeout(const Duration(seconds: 15));
    expect(response.statusCode, 200);
    final bytes = await response.content
        .expand((chunk) => chunk)
        .toList()
        .timeout(const Duration(seconds: 15));
    expect(bytes.length, greaterThan(1000));
    expect(bytes.take(3).toList(), [255, 216, 255]);
    print('Bangumi artwork bytes: ' + bytes.length.toString());
  }, skip: Platform.environment['KIRU_LIVE_ARTWORK_TEST'] != '1');
}
