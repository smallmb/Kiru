import '../../models/anime/anime_media.dart';

/// Metadata only. Playback providers and saved AniList identities are separate.
abstract interface class AnimeMetadataProvider {
  Future<List<AnimeMedia>> fetchTrendingAnime({int page = 1, int perPage = 20});
  Future<List<AnimeMedia>> fetchPopularThisSeason({
    int page = 1,
    int perPage = 20,
  });
  Future<List<AnimeMedia>> fetchUpcomingNextSeason({
    int page = 1,
    int perPage = 20,
  });
  Future<List<AnimeMedia>> fetchTopRated({int page = 1, int perPage = 20});
  Future<List<AnimeMedia>> fetchByGenre(
    String genre, {
    int page = 1,
    int perPage = 20,
  });
  Future<List<AnimeMedia>> searchAnime(
    String search, {
    String? genre,
    int? year,
    String? season,
    String? format,
    String? status,
    String sort = 'SEARCH_MATCH',
    bool isAdult = false,
    int page = 1,
    int perPage = 30,
  });
  Future<AnimeMedia?> fetchAnimeDetails(int anilistId);
}
