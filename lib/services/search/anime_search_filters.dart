import '../anime/anime_metadata_service.dart';
import '../../models/anime/anime_media.dart';

/// Provider taxonomy is separate from translated menu labels.
class AnimeSearchFilters {
  const AnimeSearchFilters({
    this.genre,
    this.year,
    this.season,
    this.format,
    this.status,
  });
  final String? genre, season, format, status;
  final int? year;
  bool get active =>
      genre != null ||
      year != null ||
      season != null ||
      format != null ||
      status != null;

  Future<List<AnimeMedia>> search(
    String query, {
    String sort = 'SEARCH_MATCH',
    AnimeMetadataService? service,
  }) => (service ?? AnimeMetadataService.instance).searchUnifiedAnime(
    query,
    genre: genre,
    year: year,
    season: season,
    format: format,
    status: status,
    sort: sort,
  );

  AnimeSearchFilters change(String key, String? value) => AnimeSearchFilters(
    genre: key == 'genre' ? value : genre,
    year: key == 'year' ? int.tryParse(value ?? '') : year,
    season: key == 'season' ? value : season,
    format: key == 'format' ? value : format,
    status: key == 'status' ? value : status,
  );
}
