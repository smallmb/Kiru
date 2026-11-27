import '../../widgets/immersive/immersive_content_layout.dart';
import 'package:zplay/l10n/anime_titles.dart';
import 'package:zplay/l10n/media_labels.dart';
import '../../l10n/l10n.dart';

import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/anime/anime_media.dart';
import '../../services/anime/anilist_service.dart';
import '../../services/anime/anime_metadata_service.dart';
import '../../services/anime/anime_source_settings.dart';
import '../../services/anime/anime_library_service.dart';
import '../../services/anime_arabic/anime_arabic_service.dart';
import '../../services/content/content_settings.dart';
import '../../services/layout/form_factor.dart';
import '../../services/theme/design_tokens.dart';
import '../../utils/navigation/route_transitions.dart';
import '../../widgets/anime/anime_slider_section.dart';
import '../../widgets/common/animated_ambient_background.dart';
import '../../widgets/common/error_view.dart';
import '../../widgets/common/focusable_card.dart';
import '../../widgets/common/hero_meta_line.dart';
import '../../widgets/common/pill_button.dart';
import '../../widgets/common/rail_skeleton.dart';
import '../../widgets/common/slider_arrow.dart';
import '../../widgets/home/continue_watching_slider.dart';
import '../../widgets/movie/movie_card.dart';
import 'anime_details_page.dart';
import 'anime_stream_sheet.dart';
import '../anime_arabic/anime_arabic_details_page.dart';
import '../anime_arabic/anime_arabic_stream_sheet.dart';
import '../../services/storage/app_image_cache.dart';

class AnimePage extends StatefulWidget {
  const AnimePage({super.key, this.metadata});

  final AnimeMetadataService? metadata;

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  AnimeMetadataService get _metadata =>
      widget.metadata ?? AnimeMetadataService.instance;
  int _loadRevision = 0;
  final AnimeLibraryService _libraryService = AnimeLibraryService.instance;
  final AnimeArabicService _arabicService = AnimeArabicService.instance;
  final ScrollController _scrollController = ScrollController();

  bool _loading = true;
  String? _error;

  // General Anime data
  List<AnimeMedia> _trending = [];
  List<AnimeMedia> _popularSeason = [];
  List<AnimeMedia> _topRated = [];
  List<AnimeMedia> _upcoming = [];
  List<AnimeMedia> _actionAnime = [];
  List<AnimeMedia> _romanceAnime = [];
  List<AnimeMedia> _fantasyAnime = [];
  List<AnimeMedia> _sciFiAnime = [];

  @override
  void initState() {
    super.initState();
    _libraryService.addListener(_onLibraryChanged);
    _libraryService.init();
    ContentSettings.adultEnabled.addListener(_onAdultContentChanged);
    AnimeSourceSettings.revision.addListener(_onSourceChanged);
    _loadAnimeData();
  }

  void _onSourceChanged() {
    if (mounted) _loadAnimeData();
  }

  @override
  void dispose() {
    AnimeSourceSettings.revision.removeListener(_onSourceChanged);
    ContentSettings.adultEnabled.removeListener(_onAdultContentChanged);
    _libraryService.removeListener(_onLibraryChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onLibraryChanged() {
    if (mounted) setState(() {});
  }

  /// AniList queries embed the 18+ switch, so refetch the rows through the
  /// existing load path when it flips.
  void _onAdultContentChanged() {
    if (!mounted) return;
    _loadAnimeData();
  }

  Future<void> _loadAnimeData() async {
    final revision = ++_loadRevision;
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final trendingFut = _metadata.fetchTrendingAnime(perPage: 18);
      final seasonFut = _metadata.fetchPopularThisSeason(perPage: 18);
      final topRatedFut = _metadata.fetchTopRated(perPage: 18);
      final upcomingFut = _metadata.fetchUpcomingNextSeason(perPage: 18);
      final actionFut = _metadata.fetchByGenre('Action', perPage: 18);
      final romanceFut = _metadata.fetchByGenre('Romance', perPage: 18);
      final fantasyFut = _metadata.fetchByGenre('Fantasy', perPage: 18);
      final sciFiFut = _metadata.fetchByGenre('Sci-Fi', perPage: 18);

      final results = await Future.wait(
        [
          trendingFut,
          seasonFut,
          topRatedFut,
          upcomingFut,
          actionFut,
          romanceFut,
          fantasyFut,
          sciFiFut,
        ].map((request) => request.catchError((Object _) => <AnimeMedia>[])),
      );

      if (mounted && revision == _loadRevision) {
        final hasAnyData = results.any((list) => list.isNotEmpty);
        setState(() {
          _trending = results[0];
          _popularSeason = results[1];
          _topRated = results[2];
          _upcoming = results[3];
          _actionAnime = results[4];
          _romanceAnime = results[5];
          _fantasyAnime = results[6];
          _sciFiAnime = results[7];
          _loading = false;
          if (!hasAnyData) {
            _error =
                'Failed to load Anime catalog. Please check your internet connection or retry.';
          }
        });
      }
    } catch (e) {
      debugPrint('Error loading Anime data: $e');
      if (mounted && revision == _loadRevision) {
        setState(() {
          _error =
              'Failed to load Anime catalog. Check your internet connection.';
          _loading = false;
        });
      }
    }
  }

  void _playEpisode(AnimeMedia anime, int episodeNumber) {
    if (anime.isArabic) {
      final card = ArabicAnimeCard(
        slug: (anime.slug != null && anime.slug!.isNotEmpty)
            ? anime.slug!
            : anime.titleEnglish.toLowerCase().replaceAll(' ', '-'),
        title: anime.displayTitle,
        cover: anime.coverUrl,
      );
      _arabicService.getDetails(card.slug).then((details) {
        if (!mounted) return;
        final ep = details.episodes.firstWhere(
          (e) => e.number == episodeNumber,
          orElse: () => details.episodes.isNotEmpty
              ? details.episodes.first
              : ArabicEpisode(
                  number: episodeNumber,
                  title: l10nOf(
                    context,
                  ).dynamicAnimePageEpisode((episodeNumber).toString()),
                  encodedHref: '',
                  watchPath: '/e/${card.slug}-$episodeNumber#tok',
                ),
        );
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (_) => AnimeArabicStreamSheet(
            details: details,
            episode: ep,
            autoPlay: false,
          ),
        );
      });
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => AnimeStreamSheet(
        anime: anime,
        episodeNumber: episodeNumber,
        autoPlay: false,
      ),
    );
  }

  void _openDetails(AnimeMedia anime, [int? preferredEpisode]) {
    if (anime.isArabic) {
      final card = ArabicAnimeCard(
        slug: (anime.slug != null && anime.slug!.isNotEmpty)
            ? anime.slug!
            : anime.titleEnglish.toLowerCase().replaceAll(' ', '-'),
        title: anime.displayTitle,
        cover: anime.coverUrl,
      );
      final epNum =
          preferredEpisode ??
          (anime.totalEpisodes > 0 ? anime.totalEpisodes : null);
      Navigator.push(
        context,
        CinematicSlideRoute(
          page: AnimeArabicDetailsPage(
            anime: card,
            initialEpisodeNumber: epNum,
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      CinematicSlideRoute(page: AnimeDetailsPage(anime: anime)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // The shell reports its overlay height as top padding.
    final topPadding = MediaQuery.paddingOf(context).top;
    // Pointer chrome is painted over the page, just as on Home. Spend
    // its inset inside the artwork rather than reserving an opaque strip.
    final factor = FormFactorService.of(context);
    final bleedTop =
        factor == FormFactor.medium || factor == FormFactor.expanded
        ? topPadding
        : 0.0;
    final reservedTop = topPadding - bleedTop;
    final immersive = _animeImmersive(context);
    final size = MediaQuery.sizeOf(context);
    final heroOverlap = immersive ? 112.0 : 0.0;
    final heroHeight =
        _AnimeHeroCarousel.heightFor(
          size.width,
          size.height,
          immersive: immersive,
        ) +
        bleedTop;
    final tokens = context.tokens;
    // The palette needs no listener of its own here: it decides the app's
    // `ThemeData` (main.dart), `context.tokens` is read off that theme, and a
    // themed widget rebuilds when it changes.
    final hasContent = _trending.isNotEmpty;

    final backgroundContent = AnimatedAmbientBackground(
      child: Stack(
        children: [
          // Main scrollable content
          if (_loading && !hasContent)
            _AnimeSkeleton(heroHeight: heroHeight)
          else if (_error != null && !hasContent)
            Padding(
              padding: EdgeInsets.only(top: bleedTop),
              child: ErrorView(
                title: l10nOf(context).animeLoadFailed,
                error: _error,
                onRetry: _loadAnimeData,
              ),
            )
          else
            RefreshIndicator(
              color: tokens.accent,
              backgroundColor: tokens.surface,
              onRefresh: _loadAnimeData,
              edgeOffset: bleedTop,
              child: ListView(
                controller: _scrollController,
                clipBehavior: Clip.none,
                padding: EdgeInsets.only(top: hasContent ? 0 : bleedTop),
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: [
                  // 1. Full Bleed Hero Carousel (Matching Home Page)
                  if (_trending.isNotEmpty)
                    if (immersive)
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          _AnimeHeroCarousel(
                            height: heroHeight,
                            topInset: bleedTop,
                            animeList: _trending.take(6).toList(),
                            onWatchNow: (anime) => _playEpisode(anime, 1),
                            onDetailsTap: _openDetails,
                            overlap: heroOverlap,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: heroHeight - heroOverlap),
                              AnimeSliderSection(
                                title: l10nOf(context).animeTrending,
                                animeList: _trending,
                                onAnimeTap: _openDetails,
                              ),
                            ],
                          ),
                        ],
                      )
                    else
                      _AnimeHeroCarousel(
                        height: heroHeight,
                        topInset: bleedTop,
                        animeList: _trending.take(6).toList(),
                        onWatchNow: (anime) => _playEpisode(anime, 1),
                        onDetailsTap: _openDetails,
                      ),

                  const SizedBox(height: ZplaySpacing.s16),

                  // 2. Anime Continue Watching Slider
                  ContinueWatchingSlider(
                    typeFilter: 'general_anime',
                    title: l10nOf(context).animeContinueWatching,
                  ),

                  const SizedBox(height: ZplaySpacing.s8),

                  // 3. Sliders with Desktop Scroll Arrows
                  if (!immersive)
                    AnimeSliderSection(
                      title: l10nOf(context).animeTrending,
                      subtitle: l10nOf(context).animeTrendingDescription,
                      animeList: _trending,
                      onAnimeTap: _openDetails,
                    ),
                  AnimeSliderSection(
                    title: l10nOf(context).animeSeasonPopular,
                    subtitle: l10nOf(context)
                        .dynamicAnimePageCurrentlyAiringHits(
                          mediaLabel(context, AnilistService.currentSeason()),
                        ),
                    animeList: _popularSeason,
                    onAnimeTap: _openDetails,
                  ),
                  AnimeSliderSection(
                    title: l10nOf(context).animeMasterpieces,
                    subtitle: l10nOf(context).animeMasterpiecesDescription,
                    animeList: _topRated,
                    onAnimeTap: _openDetails,
                  ),
                  AnimeSliderSection(
                    title: l10nOf(context).animeNextSeason,
                    subtitle: l10nOf(context).animeNextSeasonDescription,
                    animeList: _upcoming,
                    onAnimeTap: _openDetails,
                  ),
                  AnimeSliderSection(
                    title: l10nOf(context).animeAction,
                    subtitle: l10nOf(context).animeActionDescription,
                    animeList: _actionAnime,
                    onAnimeTap: _openDetails,
                  ),
                  AnimeSliderSection(
                    title: l10nOf(context).animeRomance,
                    subtitle: l10nOf(context).animeRomanceDescription,
                    animeList: _romanceAnime,
                    onAnimeTap: _openDetails,
                  ),
                  AnimeSliderSection(
                    title: l10nOf(context).animeFantasy,
                    subtitle: l10nOf(context).animeFantasyDescription,
                    animeList: _fantasyAnime,
                    onAnimeTap: _openDetails,
                  ),
                  AnimeSliderSection(
                    title: l10nOf(context).animeSciFi,
                    subtitle: l10nOf(context).animeSciFiDescription,
                    animeList: _sciFiAnime,
                    onAnimeTap: _openDetails,
                  ),

                  // Trailing gap only: the dock used to reserve 110 px of clearance here.
                  SizedBox(
                    height:
                        ZplaySpacing.s24 + MediaQuery.paddingOf(context).bottom,
                  ),
                ],
              ),
            ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: reservedTop),
          Expanded(
            child: ClipRect(
              key: const ValueKey('kiru-anime-content'),
              child: RepaintBoundary(
                child: immersive
                    ? ImmersiveContentLayout(
                        gutter: ImmersiveContentLayout.gutterFor(size.width),
                        overlap: heroOverlap,
                        child: backgroundContent,
                      )
                    : backgroundContent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The page's own shapes while the catalogue is in flight.
///
/// It replaced a bare `CircularProgressIndicator` centred in the canvas, which
/// says nothing about what is coming and - on a 540 dp television - is the only
/// thing on the screen. Home's `_HomeSkeleton` is the precedent, down to the
/// hero band this page actually draws and rails at the geometry the real cards
/// arrive at, so nothing moves when they land.
class _AnimeSkeleton extends StatelessWidget {
  const _AnimeSkeleton({required this.heroHeight});
  final double heroHeight;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final size = MediaQuery.sizeOf(context);
    final sizing = MovieCardSizing.fromWidth(size.width);

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: heroHeight,
            width: double.infinity,
            child: ColoredBox(color: tokens.surface),
          ),
          const SizedBox(height: ZplaySpacing.s16),
          RailSkeleton(sizing: sizing, showHeader: true),
          const SizedBox(height: ZplaySpacing.s24),
          RailSkeleton(sizing: sizing, showHeader: true, count: 5),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
bool _animeImmersive(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final factor = FormFactorService.of(context);
  return (factor == FormFactor.medium || factor == FormFactor.expanded) &&
      size.width >= 900 &&
      size.height >= 700;
}

class _AnimeHeroCarousel extends StatefulWidget {
  final double height;
  final double topInset;
  final double overlap;
  final List<AnimeMedia> animeList;
  final Function(AnimeMedia) onWatchNow;
  final Function(AnimeMedia) onDetailsTap;

  const _AnimeHeroCarousel({
    required this.height,
    required this.topInset,
    required this.animeList,
    required this.onWatchNow,
    required this.onDetailsTap,
    this.overlap = 0,
  });

  /// The prototype's anime spotlight is a band, not the screen: 220 of 540 dp
  /// on a television, so the seasonal rails under it are on screen at the same
  /// time. The curve this replaces asked for 0.52-0.82 of the viewport with a
  /// 380-620 dp floor, which on a 540 dp canvas produced a 620 dp hero - taller
  /// than the display it was drawn on, so the first rail was always below the
  /// fold and the page opened as a hero with nothing else.
  ///
  /// On the widget rather than on the state, because the loading skeleton draws
  /// the same band: a placeholder that is not the height of the hero it
  /// precedes is the jump the skeleton exists to prevent.
  static double heightFor(
    double screenWidth,
    double screenHeight, {
    bool immersive = false,
  }) {
    if (immersive) return (screenHeight * 0.76).clamp(530.0, 820.0);
    final target = screenHeight * (screenWidth < 600 ? 0.62 : 0.55);
    return target.clamp(screenWidth < 600 ? 320.0 : 260.0, 560.0);
  }

  @override
  State<_AnimeHeroCarousel> createState() => _AnimeHeroCarouselState();
}

class _AnimeHeroCarouselState extends State<_AnimeHeroCarousel> {
  static const _rotateEvery = Duration(seconds: 8);
  final PageController _pageController = PageController();

  Timer? _timer;
  int _index = 0;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    if (widget.animeList.length < 2) return;
    _timer = Timer.periodic(_rotateEvery, (_) {
      if (!mounted || !_pageController.hasClients) return;
      final next = (_index + 1) % widget.animeList.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 700),
        curve: ZplayMotion.emphasized,
      );
    });
  }

  void _pauseTimer() => _timer?.cancel();

  void _goTo(int index) {
    if (!_pageController.hasClients) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: ZplayMotion.emphasized,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final heroHeight = widget.height;

    if (widget.animeList.isEmpty) return SizedBox(height: heroHeight);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _pauseTimer();
      },
      onExit: (_) {
        setState(() => _isHovering = false);
        _startTimer();
      },
      child: SizedBox(
        key: const ValueKey('kiru-anime-hero'),
        height: heroHeight,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.animeList.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) {
                final anime = widget.animeList[i];
                return _AnimeHeroSlide(
                  anime: anime,
                  screenWidth: screenWidth,
                  compactHeight: heroHeight - widget.topInset < 400,
                  topInset: widget.topInset,
                  overlap: widget.overlap,
                  onWatchNow: () => widget.onWatchNow(anime),
                  onDetailsTap: () => widget.onDetailsTap(anime),
                );
              },
            ),

            // Dot indicators.
            //
            // Same treatment as Home's: on a television these are decoration,
            // not controls. A 7 dp dot is not a target anyone from a sofa is
            // meant to find, and directional traversal from the hero's buttons
            // found them first - one DOWN jumped the carousel instead of moving
            // into the rails, with the focus ring drawn around a 7 dp mark.
            // Rotation still runs on its timer and the slides still exist, so a
            // slide is reachable by waiting; a pointer keeps both.
            if (widget.animeList.length > 1)
              Positioned(
                bottom: 16 + widget.overlap,
                left: 0,
                right: 0,
                child: Focus(
                  canRequestFocus:
                      FormFactorService.of(context) != FormFactor.television,
                  skipTraversal:
                      FormFactorService.of(context) == FormFactor.television,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.animeList.length, (i) {
                      final active = i == _index;
                      return FocusableCard(
                        onTap: () => _goTo(i),
                        builder: (_, state) => CardFocusRing(
                          focused: state.focused,
                          radius: ZplayRadius.xsAll,
                          child: AnimatedContainer(
                            duration: ZplayMotion.base,
                            curve: ZplayMotion.standard,
                            margin: const EdgeInsets.symmetric(
                              horizontal: ZplaySpacing.s4,
                            ),
                            width: active ? 22 : 7,
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: ZplayRadius.xsAll,
                              // The accent marks which slide is showing, and
                              // nothing else. The glow that used to sit under the
                              // active mark was a second, blurred edge saying the
                              // same thing.
                              color: active
                                  ? tokens.accent
                                  : tokens.textDisabled,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

            // Desktop Hover Arrows
            if (widget.animeList.length > 1 &&
                _isHovering &&
                screenWidth > 600) ...[
              if (_index > 0)
                Positioned(
                  left: 24,
                  top: widget.topInset,
                  bottom: 0,
                  child: Center(
                    child: SliderArrow(
                      icon: Icons.arrow_back_ios_new_rounded,
                      onTap: () => _goTo(_index - 1),
                    ),
                  ),
                ),
              if (_index < widget.animeList.length - 1)
                Positioned(
                  right: 24,
                  top: widget.topInset,
                  bottom: 0,
                  child: Center(
                    child: SliderArrow(
                      icon: Icons.arrow_forward_ios_rounded,
                      onTap: () => _goTo(_index + 1),
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _AnimeHeroSlide extends StatelessWidget {
  final double topInset;
  final AnimeMedia anime;
  final double screenWidth;
  final double overlap;

  /// True when the hero band is too short for the full spotlight - a television
  /// at 960x540 gets ~300 dp, where the prototype's own spotlight is 220. The
  /// synopsis is dropped there rather than letting the column overflow the band.
  final bool compactHeight;

  final VoidCallback onWatchNow;
  final VoidCallback onDetailsTap;

  const _AnimeHeroSlide({
    required this.topInset,
    required this.anime,
    required this.screenWidth,
    required this.compactHeight,
    required this.overlap,
    required this.onWatchNow,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final isCompact = screenWidth < 600;
    final hasBanner = anime.bannerImage.trim().isNotEmpty;
    final bannerUrl = hasBanner ? anime.bannerImage : null;
    final posterUrl = anime.coverUrl.trim().isNotEmpty ? anime.coverUrl : null;
    final effectiveUrl = bannerUrl ?? posterUrl;
    // Layer 1 blur + foreground Layer 2 decode each URL once: same URL +
    // same memCacheWidth hits the shared ResizeImage cache entry.
    final heroCacheWidth = hasBanner ? (overlap > 0 ? 1920 : 1280) : 512;
    Widget heroArtwork({
      required String url,
      required BoxFit fit,
      required Alignment alignment,
      FilterQuality filterQuality = FilterQuality.medium,
      Widget Function(BuildContext, String)? placeholder,
      Widget Function(BuildContext, String, Object)? errorWidget,
    }) {
      return CachedNetworkImage(
        imageUrl: url,
        cacheManager: AppImageCache.manager,
        memCacheWidth: heroCacheWidth,
        fit: fit,
        alignment: alignment,
        filterQuality: filterQuality,
        fadeInDuration: const Duration(milliseconds: 300),
        placeholder: placeholder ?? (_, __) => const SizedBox.shrink(),
        errorWidget: errorWidget ?? (_, __, ___) => const SizedBox.shrink(),
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        // ── Background Layers ──
        if (effectiveUrl != null && effectiveUrl.trim().isNotEmpty)
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final containerWidth = constraints.maxWidth;
                final containerHeight = constraints.maxHeight;
                final containerAspect = containerWidth / containerHeight;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Layer 1: Ambient blurred background fill (eliminates all black bars)
                    ClipRect(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: 32,
                              sigmaY: 32,
                            ),
                            child: Transform.scale(
                              scale: 1.15,
                              child: heroArtwork(
                                url: effectiveUrl,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                filterQuality: FilterQuality.low,
                                placeholder: (_, __) =>
                                    ColoredBox(color: tokens.surface),
                                errorWidget: (_, __, ___) =>
                                    ColoredBox(color: tokens.surface),
                              ),
                            ),
                          ),
                          ColoredBox(color: tokens.bg.withValues(alpha: 0.50)),
                        ],
                      ),
                    ),

                    // Layer 2: Crisp foreground artwork
                    if (hasBanner) ...[
                      // Landscape 16:9 banner available
                      if (overlap > 0 || containerAspect <= 1.78)
                        Positioned.fill(
                          child: heroArtwork(
                            url: bannerUrl!,
                            fit: BoxFit.cover,
                            alignment: overlap > 0
                                ? const Alignment(0.15, -0.15)
                                : const Alignment(0, -0.15),
                          ),
                        )
                      else
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          width: (containerHeight * (16 / 9)).clamp(
                            0.0,
                            containerWidth,
                          ),
                          child: ShaderMask(
                            shaderCallback: (bounds) {
                              return const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.0, 0.22],
                                colors: [Colors.transparent, Colors.white],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: heroArtwork(
                              url: bannerUrl!,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                    ] else ...[
                      // Portrait poster fallback (when no 16:9 banner is available)
                      if (containerAspect <= 1.2)
                        Positioned.fill(
                          child: heroArtwork(
                            url: effectiveUrl,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        )
                      else
                        Positioned(
                          top: 40 + topInset,
                          bottom: isCompact ? 70 : 60,
                          right: isCompact ? 24 : 72,
                          child: AspectRatio(
                            aspectRatio: 2 / 3,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: ZplayRadius.lgAll,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.65),
                                    blurRadius: 36,
                                    spreadRadius: 4,
                                    offset: const Offset(0, 14),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: ZplayRadius.lgAll,
                                child: heroArtwork(
                                  url: effectiveUrl,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ],
                );
              },
            ),
          )
        else
          ColoredBox(color: tokens.surface),

        // Left horizontal wash for cinematic readability. The wash keeps its
        // gradient structure — it is a legibility scrim over artwork, not chrome —
        // and only takes its colour from the palette, like Home's hero.
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.0, 0.38, 0.85],
                colors: [
                  tokens.bg.withValues(alpha: overlap > 0 ? 0.88 : 0.95),
                  tokens.bg.withValues(alpha: overlap > 0 ? 0.48 : 0.70),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Top Gradient
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  tokens.bg.withValues(
                    alpha: overlap > 0 || topInset > 0 ? 0.32 : 0.75,
                  ),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Bottom Gradient
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: overlap > 0
                    ? const [0.0, 0.20, 0.65]
                    : const [0.0, 0.30, 0.75],
                colors: [
                  tokens.bg,
                  tokens.bg.withValues(alpha: overlap > 0 ? 0.55 : 0.80),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Content Overlay
        Positioned(
          left:
              ImmersiveContentLayout.maybeOf(context)?.gutter ??
              (isCompact ? ZplaySpacing.s20 : ZplaySpacing.s48),
          right:
              ImmersiveContentLayout.maybeOf(context)?.gutter ??
              (isCompact ? ZplaySpacing.s20 : ZplaySpacing.s48),
          bottom: overlap + (compactHeight ? 24 : (isCompact ? 36 : 56)),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isCompact ? double.infinity : 680.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // One metadata line, in the reference's order: the genres,
                  // the year, the episode count and the studio, with the score
                  // in a badge in front of it.
                  //
                  // This was a hand-built `Row` carrying its own badge and its
                  // own separator. It held the same facts as Home's meta line in
                  // a second visual register, which is the one thing the shared
                  // line exists to end, so it is now that line.
                  //
                  // The "AniList Sync" prefix is gone because AniList is where
                  // every title on this page comes from: naming the source on
                  // every slide says nothing that tells one slide from the next.
                  //
                  // **No band grew.** The line replaced a row of the same height
                  // in the same place, and the terms it drops are the ones the
                  // model cannot fill - a title with no season year, no episode
                  // count and no studio prints fewer terms rather than padding
                  // the line out.
                  HeroMetaLine(
                    terms: [
                      ...anime.genres
                          .take(3)
                          .map((g) => mediaLabel(context, g)),
                      if (anime.seasonYear > 0) '${anime.seasonYear}',
                      if (anime.totalEpisodes > 0)
                        l10nOf(context).animeEpisodeCount(anime.totalEpisodes),
                      if (anime.studioName.isNotEmpty) anime.studioName,
                    ],
                    leadingRating: anime.averageScore > 0
                        ? anime.formattedScore
                        : null,
                  ),

                  SizedBox(
                    height: compactHeight ? ZplaySpacing.s8 : ZplaySpacing.s16,
                  ),

                  // Title
                  Text(
                    localizedAnimeTitle(context, anime),
                    style: ZplayType.display
                        .copyWith(
                          size: compactHeight
                              ? 32
                              : (isCompact ? 30 : (overlap > 0 ? 48 : 44)),
                        )
                        .toStyle(color: tokens.textPrimary),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Synopsis: the prototype's spotlight has none, so a hero
                  // band that is only ~300 dp tall on a television keeps the
                  // title, the meta line and the two actions instead of
                  // overflowing to fit a paragraph.
                  if (anime.description.isNotEmpty && !compactHeight) ...[
                    SizedBox(
                      height: isCompact ? ZplaySpacing.s12 : ZplaySpacing.s16,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isCompact ? double.infinity : 580,
                      ),
                      child: Text(
                        anime.description,
                        maxLines: isCompact ? 2 : 3,
                        overflow: TextOverflow.ellipsis,
                        style: ZplayType.body
                            .copyWith(size: isCompact ? 14.5 : 15.5)
                            .toStyle(color: tokens.textEmphasis),
                      ),
                    ),
                  ],

                  // Genre chips used to sit here as a second row of pills. The
                  // prototype carries the genres in the meta line above, which
                  // is both what the design asks for and 44 dp less chrome
                  // before the first rail on a 540 dp television.

                  // Action buttons (Matching Home Page)
                  SizedBox(
                    height: compactHeight
                        ? ZplaySpacing.s12
                        : (isCompact ? ZplaySpacing.s20 : ZplaySpacing.s24),
                  ),
                  Wrap(
                    spacing: isCompact ? ZplaySpacing.s8 : ZplaySpacing.s12,
                    runSpacing: ZplaySpacing.s8,
                    children: [
                      // The shared pill, so this band's calls to action are the
                      // same shape as Home's hero and the details page's Play.
                      // It replaced an accent-gradient `ElevatedButton` whose
                      // focus treatment changed the border width - a reflow of
                      // the label on every focus move, which is what the ring
                      // drawn *over* the pill exists to avoid.
                      Builder(
                        builder: (context) => PillButton(
                          label: l10nOf(context).auxAnimePageWatchS1E1,
                          icon: Icons.play_arrow_rounded,
                          onPressed: onWatchNow,
                          expand: isCompact,
                        ),
                      ),
                      // The qualifier beside the affirmative, so the row is two
                      // pills of one height and one shape rather than a pill
                      // and an outlined rectangle.
                      Builder(
                        builder: (context) => PillButton(
                          label: l10nOf(context).auxAnimePageAnilistDetails,
                          icon: Icons.info_outline_rounded,
                          variant: PillVariant.secondary,
                          onPressed: onDetailsTap,
                          expand: isCompact,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
