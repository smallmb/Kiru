import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import '../anime/bangumi_client.dart';

/// Only official Bangumi artwork hosts use the Bangumi network settings.
/// Other providers keep the original image transport and disk cache.
class ArtworkFileService extends FileService {
  ArtworkFileService({http.Client? defaultClient, http.Client? bangumiClient})
    : _default = HttpFileService(httpClient: defaultClient),
      _bangumi = HttpFileService(
        httpClient: bangumiClient ?? BangumiClient.createNetworkClient(),
      );

  final HttpFileService _default;
  final HttpFileService _bangumi;

  static bool isBangumiArtwork(Uri uri) =>
      (uri.scheme == 'https' || uri.scheme == 'http') &&
      const {
        'lain.bgm.tv',
        'lain.bangumi.tv',
        'lain.chii.in',
      }.contains(uri.host.toLowerCase());

  @override
  Future<FileServiceResponse> get(String url, {Map<String, String>? headers}) {
    if (!isBangumiArtwork(Uri.parse(url))) {
      return _default.get(url, headers: headers);
    }
    return _bangumi.get(
      url,
      headers: {'User-Agent': 'Kiru/0.1 (anime artwork)', ...?headers},
    );
  }
}
