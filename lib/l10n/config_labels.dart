import 'package:flutter/widgets.dart';
import 'l10n.dart';

/// Presentation adapter for fixed, bundled configuration labels only.
/// Never use this for persistence, source IDs, or arbitrary media titles.
String configLabel(BuildContext context, String raw) {
  final l10n = l10nOf(context);
  return switch (raw) {
    'Modern Glass Island' => l10n.configCopyModernGlassIsland,
    'Sleek floating glassmorphism player with waveform scrubber & ambient glow' =>
      l10n.configCopySleekFloatingGlassmorphismPlayerWithWaveformScrubber,
    'Vinyl Turntable Studio' => l10n.configCopyVinylTurntableStudio,
    'Rotating vinyl disc, tonearm animation & analog vintage VU styling' =>
      l10n.configCopyRotatingVinylDiscTonearmAnimationAnalogVintage,
    'Minimalist Focus Capsule' => l10n.configCopyMinimalistFocusCapsule,
    'Compact distraction-free floating capsule with essential controls' =>
      l10n.configCopyCompactDistractionFreeFloatingCapsuleWithEssential,
    'Immersive Canvas Studio' => l10n.configCopyImmersiveCanvasStudio,
    'Full-screen cinematic ambient blur canvas with oversized artwork' =>
      l10n.configCopyFullScreenCinematicAmbientBlurCanvasWith,
    'Custom Drag & Drop Studio' => l10n.configCopyCustomDragDropStudio,
    'Your fully customized, arranged and styled audio player' =>
      l10n.configCopyYourFullyCustomizedArrangedAndStyledAudio,
    'Dynamic Audio Waveform Canvas' =>
      l10n.configCopyDynamicAudioWaveformCanvas,
    'Procedural animated waveform bars with live equalizer scrubbing' =>
      l10n.configCopyProceduralAnimatedWaveformBarsWithLiveEqualizer,
    'Neon Gradient Progress Bar' => l10n.configCopyNeonGradientProgressBar,
    'Multi-color vibrant linear gradient scrubber with glowing tip' =>
      l10n.configCopyMultiColorVibrantLinearGradientScrubberWith,
    'Precision Glass Slider' => l10n.configCopyPrecisionGlassSlider,
    'Tactile interactive glass track with timecode readouts' =>
      l10n.configCopyTactileInteractiveGlassTrackWithTimecodeReadouts,
    'Radial Circular Ring Scrubber' =>
      l10n.configCopyRadialCircularRingScrubber,
    'Radial circular dial scrubber for compact modern interfaces' =>
      l10n.configCopyRadialCircularDialScrubberForCompactModern,
    'Circle Aura Glow' => l10n.configCopyCircleAuraGlow,
    'Liquid Glass Neomorphic' => l10n.configCopyLiquidGlassNeomorphic,
    'Rounded Glass Square' => l10n.configCopyRoundedGlassSquare,
    'Wide Accent Pill' => l10n.configCopyWideAccentPill,
    'Scale & Spring Bounce' => l10n.configCopyScaleSpringBounce,
    'Theme Accent Glow Aura' => l10n.configCopyThemeAccentGlowAura,
    'Liquid Glass Ripple' => l10n.configCopyLiquidGlassRipple,
    '3D Subtle Tilt Perspective' => l10n.configCopy3dSubtleTiltPerspective,
    '3D Rounded Square with Glow' => l10n.configCopy3dRoundedSquareWithGlow,
    'Spinning Vinyl Disc' => l10n.configCopySpinningVinylDisc,
    'Floating Glass Card' => l10n.configCopyFloatingGlassCard,
    'Hidden / Focus Mode' => l10n.configCopyHiddenFocusMode,
    'Compact (Dense Grid)' => l10n.configCopyCompactDenseGrid,
    'Standard (Balanced)' => l10n.configCopyStandardBalanced,
    'Spacious (Large Covers)' => l10n.configCopySpaciousLargeCovers,
    'Recommended on Windows — faster in practice here and avoids the NVIDIA driver crash seen with Impeller.' =>
      l10n.configCopyRecommendedOnWindowsFasterInPracticeHere,
    'Engine default — kept selectable for testing. Coincided with an NVIDIA driver crash notice on this machine.' =>
      l10n.configCopyEngineDefaultKeptSelectableForTestingCoincided,
    'Top (Below Hero Banner)' => l10n.configCopyTopBelowHeroBanner,
    'Under Cinemeta Addon' => l10n.configCopyUnderCinemetaAddon,
    'Middle of Catalog' => l10n.configCopyMiddleOfCatalog,
    'Bottom of Page' => l10n.configCopyBottomOfPage,
    'Immersive Cinematic Carousel' => l10n.configCopyImmersiveCinematicCarousel,
    'Compact Spotlight' => l10n.configCopyCompactSpotlight,
    'Minimalist Header' => l10n.configCopyMinimalistHeader,
    'Dual Floating Orbs' => l10n.configCopyDualFloatingOrbs,
    'Top Aurora Horizon' => l10n.configCopyTopAuroraHorizon,
    'Full Deep Ambient Mesh' => l10n.configCopyFullDeepAmbientMesh,
    'Pulsing Core' => l10n.configCopyPulsingCore,
    'Standard Balanced' => l10n.configCopyStandardBalanced2,
    'Cinematic (Large Posters)' => l10n.configCopyCinematicLargePosters,
    'Cloud Vault' => l10n.configCopyCloudVault,
    'High-speed cloud database with 9,000+ live IPTV servers' =>
      l10n.configCopyHighSpeedCloudDatabaseWith9000,
    'Live scrapers from Reddit IPTV subreddits' =>
      l10n.configCopyLiveScrapersFromRedditIptvSubreddits,
    'Rich Card with Badges' => l10n.configCopyRichCardWithBadges,
    'Compact Row' => l10n.configCopyCompactRow,
    'Grid Cards' => l10n.configCopyGridCards,
    'Detailed List with EPG' => l10n.configCopyDetailedListWithEpg,
    'Compact Channel List' => l10n.configCopyCompactChannelList,
    'Spacious (Large Posters)' => l10n.configCopySpaciousLargePosters,
    'Vertical Continuous (Webtoon)' => l10n.configCopyVerticalContinuousWebtoon,
    'Horizontal (Left to Right)' => l10n.configCopyHorizontalLeftToRight,
    'Horizontal (Right to Left / Manga)' =>
      l10n.configCopyHorizontalRightToLeftManga,
    'Full Screen (100%)' => l10n.configCopyFullScreen100,
    'Compact (720px)' => l10n.configCopyCompact720px,
    'Standard (900px)' => l10n.configCopyStandard900px,
    'Wide (1150px)' => l10n.configCopyWide1150px,
    'Pitch Black' => l10n.configCopyPitchBlack,
    'Deep Charcoal' => l10n.configCopyDeepCharcoal,
    'Dark Slate' => l10n.subtitleOptionDarkSlate21,
    'Sepia Dark' => l10n.configCopySepiaDark,
    'Floating Glass Island' => l10n.configCopyFloatingGlassIsland,
    'Docked Bottom Bar' => l10n.configCopyDockedBottomBar,
    'Minimalist Floating Pill' => l10n.configCopyMinimalistFloatingPill,
    'Rotating 33rpm vinyl disc with tonearm and warm studio atmosphere' =>
      l10n.configCopyRotating33rpmVinylDiscWithTonearmAnd,
    'Cyberpunk Wave Visualizer' => l10n.configCopyCyberpunkWaveVisualizer,
    'Real-time animated audio visualizer canvas with neon glow' =>
      l10n.configCopyRealTimeAnimatedAudioVisualizerCanvasWith,
    'Liquid Glass Sanctuary' => l10n.configCopyLiquidGlassSanctuary,
    'Deep optical refraction glass sheets powered by liquid_glass_easy' =>
      l10n.configCopyDeepOpticalRefractionGlassSheetsPoweredBy,
    'Cinematic Poster Focus' => l10n.configCopyCinematicPosterFocus,
    'Massive edge-to-edge immersive album art with blurred atmosphere' =>
      l10n.configCopyMassiveEdgeToEdgeImmersiveAlbumArt,
    'Custom Drag & Drop Full Player' => l10n.configCopyCustomDragDropFullPlayer,
    'Your fully customized, arranged and styled fullscreen player' =>
      l10n.configCopyYourFullyCustomizedArrangedAndStyledFullscreen,
    'Liquid Glass Track Slider' => l10n.configCopyLiquidGlassTrackSlider,
    'Refractive frosted glass slider track with smooth thumb' =>
      l10n.configCopyRefractiveFrostedGlassSliderTrackWithSmooth,
    'Precision Tactile Slider' => l10n.configCopyPrecisionTactileSlider,
    'Radial Circular Ring Dial' => l10n.configCopyRadialCircularRingDial,
    'Aura Glow Circle' => l10n.configCopyAuraGlowCircle,
    'Neon Glass Square' => l10n.configCopyNeonGlassSquare,
    'Spinning Vinyl Disc with Center Label' =>
      l10n.configCopySpinningVinylDiscWithCenterLabel,
    '3D Floating Glass Card with Elevation' =>
      l10n.configCopy3dFloatingGlassCardWithElevation,
    'Rounded Neomorphic Square with Glow' =>
      l10n.configCopyRoundedNeomorphicSquareWithGlow,
    'Atmospheric Glow Orb' => l10n.configCopyAtmosphericGlowOrb,
    'Classic White' => l10n.configCopyClassicWhite,
    'Crisp white text with black outline' =>
      l10n.configCopyCrispWhiteTextWithBlackOutline,
    'Cinema Yellow' => l10n.subtitleOptionCinemaYellow1,
    'Warm yellow text with subtle shadow and border' =>
      l10n.configCopyWarmYellowTextWithSubtleShadowAnd,
    'Streaming Box' => l10n.configCopyStreamingBox,
    'White text inside a 50% translucent black box' =>
      l10n.configCopyWhiteTextInsideA50TranslucentBlack,
    'High Contrast' => l10n.subtitleOptionHighContrast17,
    'Bold yellow text with solid opaque black box' =>
      l10n.configCopyBoldYellowTextWithSolidOpaqueBlack,
    'Anime Clean' => l10n.configCopyAnimeClean,
    'Bold white text with deep outline & shadow' =>
      l10n.configCopyBoldWhiteTextWithDeepOutlineShadow,
    'Cyberpunk Cyan' => l10n.configCopyCyberpunkCyan,
    'Vibrant cyan text with dark border' =>
      l10n.configCopyVibrantCyanTextWithDarkBorder,
    'Night Mode Warm' => l10n.configCopyNightModeWarm,
    'Soft cream text with 40% translucent background' =>
      l10n.configCopySoftCreamTextWith40TranslucentBackground,
    'Custom' => l10n.settingsBuiltinCustom,
    'User configured custom subtitle styles' =>
      l10n.configCopyUserConfiguredCustomSubtitleStyles,
    'Off' => l10n.stateOff,
    'Standard video playback without neural upscaling shaders' =>
      l10n.configCopyStandardVideoPlaybackWithoutNeuralUpscalingShaders,
    'Mode A (Fast / Balanced)' => l10n.configCopyModeAFastBalanced,
    'Restores line art and upscales cleanly. Balanced GPU load, ideal for 1080p anime and mobile/integrated GPUs.' =>
      l10n.configCopyRestoresLineArtAndUpscalesCleanlyBalanced,
    'Mode A (High Quality / HQ)' => l10n.configCopyModeAHighQualityHq,
    'Ultra-crisp perceptual line reconstruction and upscale using Very Large CNNs. Best for discrete desktop GPUs.' =>
      l10n.configCopyUltraCrispPerceptualLineReconstructionAndUpscale,
    'Mode B (Soft / Denoise)' => l10n.configCopyModeBSoftDenoise,
    'Soft line reconstruction and artifact reduction. Best for blurry, compressed, or older anime.' =>
      l10n.configCopySoftLineReconstructionAndArtifactReductionBest,
    'Mode C (Deblur / Upscale)' => l10n.configCopyModeCDeblurUpscale,
    'Aggressive deblurring and scaling. Best for 720p / 480p low-resolution anime streams.' =>
      l10n.configCopyAggressiveDeblurringAndScalingBestFor720p,
    'FSR 1.0 (Smooth)' => l10n.configCopyFsr10Smooth,
    'Edge-adaptive upscaling for live action and older sources. Upscales rather than sharpens, so it is the safer of the two FSR modes. Not useful on a source already at display resolution.' =>
      l10n.configCopyEdgeAdaptiveUpscalingForLiveActionAnd,
    'FSR 1.0 (Sharp)' => l10n.configCopyFsr10Sharp,
    'FSR with contrast-adaptive sharpening. Adds bite to soft or low-bitrate sources. On a 2K or 4K source this can look worse than no upscaling, so use it deliberately.' =>
      l10n.configCopyFsrWithContrastAdaptiveSharpeningAddsBite,
    'Auto-Safe (Hardware Accelerated)' =>
      l10n.configCopyAutoSafeHardwareAccelerated,
    'GPU hardware decoding with safe driver fallbacks (recommended)' =>
      l10n.configCopyGpuHardwareDecodingWithSafeDriverFallbacks,
    'Software Decoding (Crash-Proof)' =>
      l10n.uiVideoSettingsPageSoftwareDecodingCrashProof,
    'Pure CPU decoding using FFmpeg libavcodec. Guarantees frame rendering and eliminates black screens.' =>
      l10n.configCopyPureCpuDecodingUsingFfmpegLibavcodecGuarantees,
    'Direct Hardware' => l10n.uiVideoSettingsPageDirectHardware,
    'Direct GPU hardware decoding (Direct3D 11 / MediaCodec / VAAPI).' =>
      l10n.configCopyDirectGpuHardwareDecodingDirect3d11Mediacodec,
    'Subtle Glass' => l10n.configCopySubtleGlass,
    'Balanced Liquid' => l10n.configCopyBalancedLiquid,
    'Hyper Jelly' => l10n.configCopyHyperJelly,
    'Crystal Prism' => l10n.configCopyCrystalPrism,
    'Frosted Cyber' => l10n.configCopyFrostedCyber,
    'Signal Teal' => l10n.configCopySignalTeal,
    'Amethyst Violet' => l10n.configCopyAmethystViolet,
    'Cyberpunk Neon' => l10n.configCopyCyberpunkNeon,
    'Emerald Aurora' => l10n.configCopyEmeraldAurora,
    'Sunset Crimson' => l10n.configCopySunsetCrimson,
    'Midnight Sapphire' => l10n.configCopyMidnightSapphire,
    'Golden Amber' => l10n.configCopyGoldenAmber,
    'Vampire Red' => l10n.configCopyVampireRed,
    'Pink Barbie' => l10n.configCopyPinkBarbie,
    'Ember Crimson' => l10n.configCopyEmberCrimson,
    'Studio Bone' => l10n.configCopyStudioBone,
    'Cyber Neon City' => l10n.configCopyCyberNeonCity,
    'Cosmic Nebula' => l10n.configCopyCosmicNebula,
    'Dark Liquid Silk' => l10n.configCopyDarkLiquidSilk,
    'Synthwave Horizon' => l10n.configCopySynthwaveHorizon,
    'Moody Forest Mist' => l10n.configCopyMoodyForestMist,
    'Abstract Dark Neon' => l10n.configCopyAbstractDarkNeon,
    'Recommended for You (Trakt)' => l10n.configCopyRecommendedForYouTrakt,
    'Personalized based on your Trakt watch history' =>
      l10n.configCopyPersonalizedBasedOnYourTraktWatchHistory,
    'Trakt Recommendations' => l10n.auxHomeUiSettingsPageTraktRecommendations,
    'Trending This Week' => l10n.configCopyTrendingThisWeek,
    'What Trakt viewers are watching right now' =>
      l10n.configCopyWhatTraktViewersAreWatchingRightNow,
    'Popular Now' => l10n.configCopyPopularNow,
    'Most-watched titles across Trakt' =>
      l10n.configCopyMostWatchedTitlesAcrossTrakt,
    'Coming Soon' => l10n.configCopyComingSoon,
    'Most anticipated upcoming releases' =>
      l10n.configCopyMostAnticipatedUpcomingReleases,
    'From Trakt' => l10n.configCopyFromTrakt,
    'Recommended for You (Simkl)' => l10n.configCopyRecommendedForYouSimkl,
    'Top-rated & personalized suggestions from Simkl' =>
      l10n.finalHomeUiSettingsPageTopRatedPersonalizedSuggestionsFromSimkl,
    'Simkl Recommendations' => l10n.auxHomeUiSettingsPageSimklRecommendations,
    'The 1970s' => l10n.configCopyThe1970s,
    'The 1980s' => l10n.configCopyThe1980s,
    'The 2000s' => l10n.configCopyThe2000s,
    'The 2010s' => l10n.configCopyThe2010s,
    'The 90s: Action' => l10n.configCopyThe90sAction,
    'The 90s: Comedy' => l10n.configCopyThe90sComedy,
    'The 90s: Horror' => l10n.configCopyThe90sHorror,
    'The 90s: Sci-Fi' => l10n.configCopyThe90sSciFi,
    'The 90s: Animation' => l10n.configCopyThe90sAnimation,
    'The 90s: Thriller' => l10n.configCopyThe90sThriller,
    'Godfather Collection' => l10n.configCopyGodfatherCollection,
    'Rocky and Creed' => l10n.configCopyRockyAndCreed,
    'Back to the Future' => l10n.configCopyBackToTheFuture,
    'Alien' => l10n.configCopyAlien,
    'Die Hard' => l10n.configCopyDieHard,
    'Lethal Weapon' => l10n.configCopyLethalWeapon,
    'The Terminator' => l10n.configCopyTheTerminator,
    'Predator' => l10n.configCopyPredator,
    'Jurassic Park' => l10n.configCopyJurassicPark,
    'Rambo' => l10n.configCopyRambo,
    'Indiana Jones' => l10n.configCopyIndianaJones,
    'The Marx Brothers' => l10n.configCopyTheMarxBrothers,
    'Groucho and his brothers, 13 films, 1929 to 1949' =>
      l10n.configCopyGrouchoAndHisBrothers13Films1929,
    'Continue Watching' => l10n.homeContinueWatching,
    'Plan to Watch' => l10n.uiAnimeDetailsPagePlanToWatch,
    'Watching' => l10n.uiAnimeDetailsPageWatching,
    'On Hold' => l10n.configCopyOnHold,
    'Completed' => l10n.uiAnimeDetailsPageCompleted,
    'Dropped' => l10n.configCopyDropped,
    'Ratings' => l10n.configCopyRatings,
    'Trending' => l10n.configCopyTrending,
    'Top Rated' => l10n.configCopyTopRated,
    'New & Upcoming' => l10n.configCopyNewUpcoming,
    'Watchlist' => l10n.configCopyWatchlist,
    'History' => l10n.configCopyHistory,
    'Collection' => l10n.configCopyCollection,
    'Recommendations' => l10n.configCopyRecommendations,
    'Popular' => l10n.catalogLabelPopular,
    'Anticipated' => l10n.configCopyAnticipated,
    'Untitled list' => l10n.configCopyUntitledList,
    'Stream Source' => l10n.configCopyStreamSource,
    'All Languages' => l10n.configCopyAllLanguages,
    'Default (ZPlay Subfont)' => l10n.configCopyDefaultZplaySubfont,
    'Add to Favorites' => l10n.configCopyAddToFavorites,
    'Hide Password' => l10n.configCopyHidePassword,
    'Fullscreen (F11)' => l10n.shellFullscreenTooltip,
    'ASPECT: FIT (CONTAIN)' => l10n.configCopyAspectFitContain,
    'ASPECT: FILL (ZOOM / CROP)' => l10n.configCopyAspectFillZoomCrop,
    'ASPECT: STRETCH (FILL)' => l10n.configCopyAspectStretchFill,
    'Previous chapter page' => l10n.configCopyPreviousChapterPage,
    'Next chapter page' => l10n.configCopyNextChapterPage,
    'Clear chapter search' => l10n.configCopyClearChapterSearch,
    'Customize Manga Section' => l10n.auxMangaPageCustomizeMangaSection,
    'Clear search' => l10n.configCopyClearSearch,
    'Reader Customization' => l10n.configCopyReaderCustomization,
    'Previous Chapter' => l10n.auxAudiobookPlayerScreenPreviousChapter,
    'Next Chapter' => l10n.auxAudiobookPlayerScreenNextChapter,
    'Zoom Out (-)' => l10n.configCopyZoomOut,
    'Zoom In (+)' => l10n.configCopyZoomIn,
    'Toggle Page Deck' => l10n.configCopyTogglePageDeck,
    'Rearrange Streams' => l10n.configCopyRearrangeStreams,
    'All Categories' => l10n.configCopyAllCategories,
    'Favorites' => l10n.configCopyFavorites,
    'Downloaded' => l10n.uiDownloadsPageDownloaded,
    'Muted' => l10n.mediaLabelMuted,
    'Unknown source' => l10n.configCopyUnknownSource,
    'Unknown' => l10n.configCopyUnknown,
    'Unknown Author' => l10n.finalGenerateAudiobookScreenUnknownAuthor,
    'Unknown Title' => l10n.configCopyUnknownTitle,
    'Unknown Track' => l10n.configCopyUnknownTrack,
    'Untitled Book' => l10n.configCopyUntitledBook,
    'Untitled Audiobook' => l10n.configCopyUntitledAudiobook,
    'Unknown Addon' => l10n.configCopyUnknownAddon,
    'Unknown Plugin' => l10n.configCopyUnknownPlugin,
    'Titles' => l10n.configCopyTitles,
    'Skip Intro' => l10n.configCopySkipIntro,
    'Skip Recap' => l10n.configCopySkipRecap,
    'Skip Credits' => l10n.configCopySkipCredits,
    'Skip Preview' => l10n.configCopySkipPreview,
    'Segment' => l10n.configCopySegment,
    'Publisher' => l10n.configCopyPublisher,
    'Language' => l10n.languageTitle,
    'Size' => l10n.configCopySize,
    'TV Series' => l10n.aiRecMediaSeries,
    'TV Short' => l10n.configCopyTvShort,
    'Special' => l10n.configCopySpecial,
    'Airing' => l10n.configCopyAiring,
    'Upcoming' => l10n.configCopyUpcoming,
    'Cancelled' => l10n.configCopyCancelled,
    'On Hiatus' => l10n.configCopyOnHiatus,
    'Airing soon' => l10n.configCopyAiringSoon,
    'Searches the Wyzie subtitle catalogue for movies and episodes.' =>
      l10n.configCopySearchesTheWyzieSubtitleCatalogueForMovies,
    'Mints the anonymous token the Audionest audiobook search API requires.' =>
      l10n.configCopyMintsTheAnonymousTokenTheAudionestAudiobook,
    'Bearer for the Audionest audiobook search endpoint.' =>
      l10n.configCopyBearerForTheAudionestAudiobookSearchEndpoint,
    'Firebase key for the paper2audio PDF to audiobook backend.' =>
      l10n.configCopyFirebaseKeyForThePaper2audioPdfTo,
    'Bearer for the VidGod cloud cache behind ZPlayHTTP streams.' =>
      l10n.configCopyBearerForTheVidgodCloudCacheBehind,
    'Bearer for the Films365 direct stream API.' =>
      l10n.configCopyBearerForTheFilms365DirectStreamApi,
    'Identifies the Trakt application the pairing flow asks for a device code on, and stamps every Trakt API call.' =>
      l10n.configCopyIdentifiesTheTraktApplicationThePairingFlow,
    'Exchanges the device code for a Trakt access token.' =>
      l10n.configCopyExchangesTheDeviceCodeForATrakt,
    'Your key is in use.' => l10n.configCopyYourKeyIsInUse,
    'Supplied at build time for this build.' =>
      l10n.configCopySuppliedAtBuildTimeForThisBuild,
    'Running on the value this app ships with.' =>
      l10n.configCopyRunningOnTheValueThisAppShips,
    'No key available, so this source stays off.' =>
      l10n.configCopyNoKeyAvailableSoThisSourceStays,
    'Connected' => l10n.stateConnected,
    'That key was rejected by TMDb' => l10n.configCopyThatKeyWasRejectedByTmdb,
    'Could not reach TMDb' => l10n.configCopyCouldNotReachTmdb,
    'Disabled' => l10n.stateDisabled,
    'Continue Reading' => l10n.auxMangaPageContinueReading,
    'Continue Listening' => l10n.auxAudiobooksPageContinueListening,
    'Trailer' => l10n.uiHeroBannerTrailer,
    'Close' => l10n.actionClose,
    'Back' => l10n.uiPlayerTopBarBack,
    'Next' => l10n.playerNext,
    'Play' => l10n.playerPlay,
    'Pause' => l10n.playerPause,
    'Settings' => l10n.navSettings,
    'Search' => l10n.navSearch,
    'Unmute' => l10n.playerUnmute,
    'Mute' => l10n.playerMute,
    '10 picks from 1970 to 1979' => l10n.configCopy10PicksFrom1970To1979,
    '10 picks from 1980 to 1989' => l10n.configCopy10PicksFrom1980To1989,
    '10 picks from 2000 to 2009' => l10n.configCopy10PicksFrom2000To2009,
    '10 picks from 2010 to 2019' => l10n.configCopy10PicksFrom2010To2019,
    '10 picks from 1990 to 1999' => l10n.configCopy10PicksFrom1990To1999,
    '3 films, 1972 to 1990' => l10n.configCopy3Films1972To1990,
    '9 films, 1976 to 2023' => l10n.configCopy9Films1976To2023,
    '3 films, 1985 to 1990' => l10n.configCopy3Films1985To1990,
    '7 films, 1979 to 2024' => l10n.configCopy7Films1979To2024,
    '5 films, 1988 to 2013' => l10n.configCopy5Films1988To2013,
    '4 films, 1987 to 1998' => l10n.configCopy4Films1987To1998,
    '6 films, 1984 to 2019' => l10n.configCopy6Films1984To2019,
    '5 films, 1987 to 2022' => l10n.configCopy5Films1987To2022,
    '6 films, 1993 to 2022' => l10n.configCopy6Films1993To2022,
    '5 films, 1982 to 2019' => l10n.configCopy5Films1982To2019,
    '5 films, 1981 to 2023' => l10n.configCopy5Films1981To2023,
    'Stremio-based multi-resolution HTTP stream scraper' =>
      l10n.configCopyStremioBasedMultiResolutionHttpStreamScraper,
    'Direct high-speed HTTP media storage scraper' =>
      l10n.configCopyDirectHighSpeedHttpMediaStorageScraper,
    '4K & HD direct stream extractor' =>
      l10n.configCopy4kHdDirectStreamExtractor,
    'Fast multi-source stream downloader' =>
      l10n.configCopyFastMultiSourceStreamDownloader,
    'Videasy multi-CDN encrypted HLS scraper' =>
      l10n.configCopyVideasyMultiCdnEncryptedHlsScraper,
    'VidSrc streaming network resolver' =>
      l10n.configCopyVidsrcStreamingNetworkResolver,
    '2Embed multi-host stream aggregator' =>
      l10n.configCopy2embedMultiHostStreamAggregator,
    'Multi-source HD video core extractor' =>
      l10n.configCopyMultiSourceHdVideoCoreExtractor,
    'Ultra-fast HLS streaming network' =>
      l10n.configCopyUltraFastHlsStreamingNetwork,
    'MovieNight multi-server HLS streams' =>
      l10n.configCopyMovienightMultiServerHlsStreams,
    'Direct media download & stream extractor' =>
      l10n.configCopyDirectMediaDownloadStreamExtractor,
    'Direct encrypted MP4/HLS source provider' =>
      l10n.configCopyDirectEncryptedMp4HlsSourceProvider,
    'Fast cloud HLS stream resolver' =>
      l10n.configCopyFastCloudHlsStreamResolver,
    'Rive multi-server direct stream provider' =>
      l10n.configCopyRiveMultiServerDirectStreamProvider,
    'Cinejoy multi-CDN video source provider' =>
      l10n.configCopyCinejoyMultiCdnVideoSourceProvider,
    'Dulo high-speed direct stream network' =>
      l10n.configCopyDuloHighSpeedDirectStreamNetwork,
    'VidUp cloud video hosting scraper' =>
      l10n.configCopyVidupCloudVideoHostingScraper,
    'FlaxMovies multi-CDN direct streams' =>
      l10n.configCopyFlaxmoviesMultiCdnDirectStreams,
    'Multi-server cloud video streams' =>
      l10n.configCopyMultiServerCloudVideoStreams,
    'Low-latency direct streaming provider' =>
      l10n.configCopyLowLatencyDirectStreamingProvider,
    'Fast cloud video source provider' =>
      l10n.configCopyFastCloudVideoSourceProvider,
    'LookMovie direct multi-quality streams' =>
      l10n.configCopyLookmovieDirectMultiQualityStreams,
    'Hexa multi-host video extractor' =>
      l10n.configCopyHexaMultiHostVideoExtractor,
    'Bcine direct master HLS provider' =>
      l10n.configCopyBcineDirectMasterHlsProvider,
    'Mapple fast streaming provider' =>
      l10n.configCopyMappleFastStreamingProvider,
    'Nova multi-server stream extractor' =>
      l10n.configCopyNovaMultiServerStreamExtractor,
    'MegaSource multi-CDN video network' =>
      l10n.configCopyMegasourceMultiCdnVideoNetwork,
    'Purstream direct video stream resolver' =>
      l10n.configCopyPurstreamDirectVideoStreamResolver,
    'VidApi direct video source extractor' =>
      l10n.configCopyVidapiDirectVideoSourceExtractor,
    'VidRock cloud video provider' => l10n.configCopyVidrockCloudVideoProvider,
    'VidVault secure streaming network' =>
      l10n.configCopyVidvaultSecureStreamingNetwork,
    'VidZee high-speed video provider' =>
      l10n.configCopyVidzeeHighSpeedVideoProvider,
    'CineSrc direct master HLS with bright67 subtitles' =>
      l10n.configCopyCinesrcDirectMasterHlsWithBright67Subtitles,
    'CineSu direct video stream extractor' =>
      l10n.configCopyCinesuDirectVideoStreamExtractor,
    'Frame multi-resolution stream provider' =>
      l10n.configCopyFrameMultiResolutionStreamProvider,
    'FshareTV cloud streaming network' =>
      l10n.configCopyFsharetvCloudStreamingNetwork,
    'FSonic direct cloud video scraper' =>
      l10n.configCopyFsonicDirectCloudVideoScraper,
    'FSOnline multi-host stream resolver' =>
      l10n.configCopyFsonlineMultiHostStreamResolver,
    'KissKH Asian drama & anime streaming provider' =>
      l10n.configCopyKisskhAsianDramaAnimeStreamingProvider,
    'LMScript video source extractor' =>
      l10n.configCopyLmscriptVideoSourceExtractor,
    'MeowTV direct streaming network' =>
      l10n.configCopyMeowtvDirectStreamingNetwork,
    'VidLink fast multi-CDN stream provider' =>
      l10n.configCopyVidlinkFastMultiCdnStreamProvider,
    'VixSrc direct master streaming extractor' =>
      l10n.configCopyVixsrcDirectMasterStreamingExtractor,
    'XPass multi-server video scraper' =>
      l10n.configCopyXpassMultiServerVideoScraper,
    'ZxcStream multi-source direct provider' =>
      l10n.configCopyZxcstreamMultiSourceDirectProvider,
    'Bollywood, Hindi Dual-Audio & Hollywood direct streams' =>
      l10n.configCopyBollywoodHindiDualAudioHollywoodDirectStreams,
    'Standard' => l10n.configExtraStandard,
    'Recommended' => l10n.configExtraRecommended,
    'Ultra Quality' => l10n.configExtraUltraQuality,
    'Denoise' => l10n.configExtraDenoise,
    'Deblur' => l10n.configExtraDeblur,
    'Default' => l10n.configExtraDefault,
    '100% Reliable' => l10n.configExtra100Reliable,
    'Max GPU' => l10n.configExtraMaxGpu,
    'Similar to' => l10n.configExtraSimilarTo,
    'Movies & TV' => l10n.configExtraMoviesTv,
    'Live TV' => l10n.configExtraLiveTv,
    'My List' => l10n.configExtraMyList,
    'Downloads' => l10n.configExtraDownloads,
    'Manga' => l10n.configExtraManga,
    'Books' => l10n.configExtraBooks,
    'Audiobooks' => l10n.configExtraAudiobooks,
    'Music' => l10n.configExtraMusic,
    'Collections' => l10n.configExtraCollections,
    'Anime' => l10n.configExtraAnime,
    'All' => l10n.configExtraAll,
    'None' => l10n.configExtraNone,
    'Series' => l10n.configExtraSeries,
    'Movie' => l10n.configExtraMovie,
    'Custom Stream' => l10n.configExtraCustomStream,
    'Live Stream' => l10n.configExtraLiveStream,
    'Torrent Engine' => l10n.configExtraTorrentEngine,
    'Refused by provider' => l10n.configExtraRefusedByProvider,
    'Account rejected' => l10n.configExtraAccountRejected,
    _ => raw,
  };
}
