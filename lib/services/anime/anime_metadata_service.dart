import '../../models/anime/anime_media.dart';
import 'anime_metadata_provider.dart';
import 'anime_source_settings.dart';
import 'anilist_service.dart';
import 'bangumi_client.dart';
import 'bangumi_metadata_provider.dart';

class AnimeMetadataService implements AnimeMetadataProvider {
  AnimeMetadataService({required this.anilist, required this.bangumi});
  static final instance = AnimeMetadataService(
    anilist: AnilistService.instance,
    bangumi: BangumiMetadataProvider(BangumiClient()),
  );
  final AnimeMetadataProvider anilist;
  final AnimeMetadataProvider bangumi;

  Future<T> _route<T>(Future<T> Function(AnimeMetadataProvider) run) async {
    final selected = AnimeSourceSettings.source.value;
    final fallback = AnimeSourceSettings.fallback.value;
    if (selected == AnimeSource.anilist) return run(anilist);
    try {
      return await run(bangumi);
    } catch (_) {
      if (!fallback) rethrow;
      return run(anilist);
    }
  }

  @override
  Future<List<AnimeMedia>> fetchTrendingAnime({
    int page = 1,
    int perPage = 20,
  }) => _route((p) => p.fetchTrendingAnime(page: page, perPage: perPage));
  @override
  Future<List<AnimeMedia>> fetchPopularThisSeason({
    int page = 1,
    int perPage = 20,
  }) => _route((p) => p.fetchPopularThisSeason(page: page, perPage: perPage));
  @override
  Future<List<AnimeMedia>> fetchUpcomingNextSeason({
    int page = 1,
    int perPage = 20,
  }) => _route((p) => p.fetchUpcomingNextSeason(page: page, perPage: perPage));
  @override
  Future<List<AnimeMedia>> fetchTopRated({int page = 1, int perPage = 20}) =>
      _route((p) => p.fetchTopRated(page: page, perPage: perPage));
  @override
  Future<List<AnimeMedia>> fetchByGenre(
    String genre, {
    int page = 1,
    int perPage = 20,
  }) => _route((p) => p.fetchByGenre(genre, page: page, perPage: perPage));
  @override
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
  }) => _route(
    (p) => p.searchAnime(
      search,
      genre: genre,
      year: year,
      season: season,
      format: format,
      status: status,
      sort: sort,
      isAdult: isAdult,
      page: page,
      perPage: perPage,
    ),
  );

  /// Unified search must distinguish unavailable sources from empty matches.
  Future<List<AnimeMedia>> searchUnifiedAnime(
    String query, {
    int perPage = 35,
    String? genre,
    int? year,
    String? season,
    String? format,
    String? status,
    String sort = 'SEARCH_MATCH',
  }) => _route(
    (provider) => provider is AnilistService
        ? provider.searchAnime(
            query,
            perPage: perPage,
            genre: genre,
            year: year,
            season: season,
            format: format,
            status: status,
            sort: sort,
            throwOnFailure: true,
          )
        : provider.searchAnime(
            query,
            perPage: perPage,
            genre: genre,
            year: year,
            season: season,
            format: format,
            status: status,
            sort: sort,
          ),
  );

  /// Use native Bangumi fields and enrich with AniList-only playback and cast
  /// fields, without replacing the original title/identity.
  @override
  Future<AnimeMedia?> fetchAnimeDetails(int anilistId) async {
    if (AnimeSourceSettings.source.value == AnimeSource.anilist) {
      return anilist.fetchAnimeDetails(anilistId);
    }
    final allowFallback = AnimeSourceSettings.fallback.value;
    AnimeMedia? primary;
    try {
      primary = await bangumi.fetchAnimeDetails(anilistId);
    } catch (_) {
      if (!allowFallback) return null;
    }
    if (primary == null) {
      return allowFallback ? anilist.fetchAnimeDetails(anilistId) : null;
    }
    if (!allowFallback) return primary;
    final supplemental = await anilist.fetchAnimeDetails(anilistId);
    return supplemental == null ? primary : merge(primary, supplemental);
  }

  Future<Map<int, String>> fetchEpisodeTitles(int anilistId) async {
    final provider = bangumi;
    if (AnimeSourceSettings.source.value != AnimeSource.bangumi ||
        provider is! BangumiMetadataProvider)
      return {};
    try {
      return await provider.fetchEpisodeTitles(anilistId);
    } catch (_) {
      return {};
    }
  }

  static AnimeMedia merge(AnimeMedia primary, AnimeMedia extra) {
    if (primary.id != extra.id) return primary;
    String prefer(String a, String b) => a.isNotEmpty ? a : b;
    return AnimeMedia(
      id: extra.id,
      idMal: extra.idMal,
      bangumiId: primary.bangumiId,
      titleChinese: primary.titleChinese,
      descriptionChinese: primary.descriptionChinese,
      titleRomaji: extra.titleRomaji,
      titleEnglish: extra.titleEnglish,
      titleNative: prefer(extra.titleNative, primary.titleNative),
      titleUserPreferred: extra.titleUserPreferred,
      coverImageExtraLarge: prefer(primary.coverUrl, extra.coverUrl),
      coverImageMedium: extra.coverImageMedium,
      coverColor: extra.coverColor,
      bannerImage: extra.bannerImage,
      format: prefer(primary.format, extra.format),
      status: extra.status,
      totalEpisodes: primary.totalEpisodes > 0
          ? primary.totalEpisodes
          : extra.totalEpisodes,
      durationMinutes: extra.durationMinutes,
      genres: primary.genres.isNotEmpty ? primary.genres : extra.genres,
      averageScore: primary.averageScore > 0
          ? primary.averageScore
          : extra.averageScore,
      meanScore: extra.meanScore,
      popularity: extra.popularity,
      favourites: extra.favourites,
      season: prefer(primary.season, extra.season),
      seasonYear: primary.seasonYear > 0
          ? primary.seasonYear
          : extra.seasonYear,
      description: extra.description,
      studioName: extra.studioName,
      trailerUrl: extra.trailerUrl,
      trailerSite: extra.trailerSite,
      nextAiring: extra.nextAiring,
      characters: extra.characters,
      relations: extra.relations,
      recommendations: extra.recommendations,
      isAdult: extra.isAdult,
    );
  }
}
