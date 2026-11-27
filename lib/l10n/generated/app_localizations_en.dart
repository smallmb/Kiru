// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Kiru';

  @override
  String get navHome => 'Home';

  @override
  String get navBrowse => 'Browse';

  @override
  String get navSearch => 'Search';

  @override
  String get navLibrary => 'Library';

  @override
  String get navSettings => 'Settings';

  @override
  String get navLiveTv => 'Live TV';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionClose => 'Close';

  @override
  String get actionRetry => 'Retry';

  @override
  String get actionTryAgain => 'Try again';

  @override
  String get actionCopy => 'Copy';

  @override
  String get actionSave => 'Save';

  @override
  String get actionCopyReport => 'Copy report';

  @override
  String get actionSaveReport => 'Save report';

  @override
  String get actionCopyDiagnostic => 'Copy diagnostic';

  @override
  String get shellFullscreen => 'Fullscreen';

  @override
  String get shellExitFullscreen => 'Exit Fullscreen';

  @override
  String get shellFullscreenTooltip => 'Fullscreen (F11)';

  @override
  String get shellExitFullscreenTooltip => 'Exit Fullscreen (F11)';

  @override
  String get shellMinimizeWindowTooltip => 'Minimize window';

  @override
  String get shellMaximizeWindowTooltip => 'Maximize window';

  @override
  String get shellRestoreWindowTooltip => 'Restore window';

  @override
  String get shellCloseWindowTooltip => 'Close window';

  @override
  String get errorLoadFailed => 'Could not load movies';

  @override
  String get errorUnknown => 'Unknown error';

  @override
  String get listSeparator => ', ';

  @override
  String get shortcutsTitle => 'Keyboard shortcuts';

  @override
  String get shortcutsClose => 'Close keyboard shortcuts';

  @override
  String get shortcutsGroupAnywhere => 'Anywhere';

  @override
  String get shortcutsGroupMoving => 'Moving around';

  @override
  String get shortcutsGroupPlaying => 'While playing';

  @override
  String get shortcutsGroupReading => 'While reading';

  @override
  String get shortcutsShowSheet => 'Show this sheet';

  @override
  String get shortcutsShowSheetNote => 'Also Shift + /';

  @override
  String get shortcutsToggleFullscreen => 'Toggle fullscreen';

  @override
  String get shortcutsLeaveFullscreen =>
      'Leave fullscreen, or close what is open';

  @override
  String get shortcutsLeaveFullscreenNote =>
      'Never navigates away from a page by itself';

  @override
  String get shortcutsMyList => 'My List and Downloads';

  @override
  String get shortcutsSearchMacNote => 'Cmd + K on macOS';

  @override
  String get shortcutsSettingsMacNote => 'Cmd + , on macOS';

  @override
  String get shortcutsPlayPause => 'Play or pause';

  @override
  String get shortcutsPlayPauseNote => 'K does the same';

  @override
  String get shortcutsSeek => 'Back or forward 10 seconds';

  @override
  String get shortcutsSeekNote =>
      'The arrow keys do this too, when the video has focus';

  @override
  String get shortcutsMute => 'Mute or unmute';

  @override
  String get shortcutsAspect => 'Change how the video fills the screen';

  @override
  String get shortcutsPage => 'Previous or next page or chapter';

  @override
  String get shortcutsLine => 'Down or up a line, in focus mode';

  @override
  String nowPlayingSemantics(String title, String subtitle) {
    return 'Now playing, $title, $subtitle';
  }

  @override
  String get nowPlayingOpenHint => 'Open the full player';

  @override
  String get playerPrevious => 'Previous';

  @override
  String get playerNext => 'Next';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSectionPlayback => 'PLAYBACK';

  @override
  String get settingsSectionSources => 'SOURCES';

  @override
  String get settingsSectionIntegrations => 'INTEGRATIONS';

  @override
  String get settingsSectionAppearance => 'APPEARANCE';

  @override
  String get settingsSectionContent => 'CONTENT';

  @override
  String get settingsSectionApp => 'APP';

  @override
  String get stateEnabled => 'Enabled';

  @override
  String get stateDisabled => 'Disabled';

  @override
  String get stateActive => 'Active';

  @override
  String get stateOffline => 'Offline';

  @override
  String get stateConnected => 'Connected';

  @override
  String get stateNotSet => 'Not set';

  @override
  String get stateOn => 'On';

  @override
  String get stateOff => 'Off';

  @override
  String get settingsVideoTitle => 'Video & Upscaling';

  @override
  String get settingsVideoSubtitle =>
      'Anime4K neural GLSL shader presets and GPU pipeline';

  @override
  String get settingsP2pTitle => 'Built-in P2P Torrent Source';

  @override
  String get settingsP2pActiveSubtitle =>
      'ZPlay torrent swarms (Knaben, TorrentGalaxy) active';

  @override
  String get settingsP2pDisabledSubtitle =>
      'P2P disabled. Using only direct HTTP streaming (ZPlayHTTP)';

  @override
  String get settingsP2pActiveValue => 'P2P Active';

  @override
  String get settingsP2pHttpValue => 'HTTP Only';

  @override
  String get settingsP2pInfoTooltip => 'P2P Advisory Details';

  @override
  String get settingsAddonsTitle => 'Addons';

  @override
  String get settingsAddonsSubtitle => 'Stremio catalogs and content providers';

  @override
  String settingsAddonsInstalled(int count) {
    return '$count Installed';
  }

  @override
  String get settingsBuiltinTitle => 'Built-in Providers';

  @override
  String get settingsBuiltinSubtitle =>
      'ZPlayHTTP streaming sources, priority order & toggles';

  @override
  String get settingsBuiltinCustom => 'Custom';

  @override
  String get settingsBuiltinDefault => 'Default';

  @override
  String get settingsDebridTitle => 'Debrid & Cloud Streaming';

  @override
  String get settingsDebridSubtitle =>
      'Real-Debrid, TorBox, AllDebrid, Premiumize & Debrid-Link';

  @override
  String get settingsTraktTitle => 'Trakt.tv Sync';

  @override
  String get settingsTraktSubtitle =>
      'Cross-device watchlist, history & playback synchronization';

  @override
  String get settingsSimklTitle => 'Simkl Sync';

  @override
  String get settingsSimklSubtitle =>
      'Cross-device Movies, TV & Anime synchronization';

  @override
  String get settingsTmdbTitle => 'TMDb API Key';

  @override
  String get settingsTmdbSubtitle =>
      'Your own key for the ranked 1990s rails and scraper metadata';

  @override
  String get settingsTmdbYourKey => 'Your key';

  @override
  String get settingsServiceKeysTitle => 'Service API Keys';

  @override
  String get settingsServiceKeysSubtitle =>
      'Subtitles, audiobooks and scraper keys you supply yourself';

  @override
  String settingsServiceKeysCount(int provided, int total) {
    return '$provided of $total set';
  }

  @override
  String get settingsDiscordTitle => 'Discord Rich Presence';

  @override
  String get settingsDiscordEnabledSubtitle =>
      'Broadcasting movies, shows, music & live activity to Discord';

  @override
  String get settingsDiscordDisabledSubtitle =>
      'Disabled. Activity is hidden from Discord';

  @override
  String get settingsAppearanceTitle => 'Appearance & Interface';

  @override
  String get settingsAppearanceSubtitle =>
      'Liquid Glass setup, color themes, and Home Page UI';

  @override
  String get settingsGlassOn => 'Glass ON';

  @override
  String get settingsCalendarTitle => 'TV Airing Calendar';

  @override
  String get settingsCalendarOnSubtitle =>
      'Calendar buttons active on Home top bar and section headers';

  @override
  String get settingsCalendarOffSubtitle =>
      'Calendar disabled and hidden across all pages';

  @override
  String get settingsAiQuizTitle => 'AI Recommendation Quiz';

  @override
  String get settingsAiQuizOnSubtitle =>
      'AI Taste Profile Quiz active on Home and Search bars';

  @override
  String get settingsAiQuizOffSubtitle =>
      'AI quiz disabled and hidden across all pages';

  @override
  String get settingsAdultTitle => 'Adult Content';

  @override
  String get settingsAdultOnSubtitle =>
      '18+ catalogs, search results and sources are enabled';

  @override
  String get settingsAdultOffSubtitle =>
      'Hidden. No 18+ catalogs, search results or sources are fetched';

  @override
  String get settingsBackupTitle => 'Backup & Restore';

  @override
  String get settingsBackupSubtitle =>
      'Export or import settings, theme and library progress (JSON)';

  @override
  String get settingsBackupDialogSubtitle => 'Cross-device JSON configuration';

  @override
  String get settingsBackupDescription =>
      'Exports your settings, theme, My List and progress. Leave the passphrase blank for a redacted profile that keeps credentials, IPTV portals and addon URLs on this device. A passphrase encrypts a full profile with them included.';

  @override
  String get settingsPassphraseOptional => 'Passphrase (optional)';

  @override
  String get settingsPassphraseHelper =>
      'At least 8 characters for an encrypted full profile.';

  @override
  String get settingsExportProfile => 'Export Profile';

  @override
  String get settingsPassphraseTooShort =>
      'Use at least 8 characters for the passphrase.';

  @override
  String get settingsRedactedProfileCopied =>
      'Redacted profile copied. Credentials, portals and addons stay on this device.';

  @override
  String get settingsEncryptedProfileCopied =>
      'Encrypted full profile copied. Keep the passphrase safe; it cannot be recovered.';

  @override
  String get settingsImportJson => 'Import JSON';

  @override
  String get settingsPasteJsonTitle => 'Paste Configuration JSON';

  @override
  String get settingsPasteJsonHint => 'Paste backup JSON here...';

  @override
  String get settingsPassphraseEncrypted => 'Passphrase (encrypted profiles)';

  @override
  String get settingsPassphraseEncryptedHelper =>
      'Leave blank for a redacted profile. Encrypted profiles need the passphrase they were exported with.';

  @override
  String get settingsPasteFromClipboard => 'Paste from Clipboard';

  @override
  String get settingsFromFile => 'From File';

  @override
  String get settingsRestoreNow => 'Restore Now';

  @override
  String settingsImportFailed(String error) {
    return 'Import failed: $error';
  }

  @override
  String get settingsChooseProfile => 'Choose a Kiru profile';

  @override
  String get settingsClearCacheTitle => 'Clear cache';

  @override
  String get settingsClearCacheSubtitle =>
      'Drop cached artwork & metadata. Sign-in, addons, My List & history stay';

  @override
  String get settingsClearCacheConfirmTitle => 'Clear cache?';

  @override
  String get settingsClearCacheConfirmBody =>
      'Removes cached artwork and metadata so fresh copies are fetched. This does not sign you out or remove addons - your profile, My List, watch history and settings stay exactly as they are.';

  @override
  String get settingsClear => 'Clear';

  @override
  String settingsCacheArtwork(String error) {
    return 'artwork cache ($error)';
  }

  @override
  String settingsCacheMetadata(String error) {
    return 'metadata cache ($error)';
  }

  @override
  String settingsCacheHero(String error) {
    return 'hero artwork cache ($error)';
  }

  @override
  String get settingsCacheCleared => 'Cache cleared.';

  @override
  String settingsCacheClearedExcept(String failures) {
    return 'Cache cleared except the $failures.';
  }

  @override
  String get settingsCacheClearedSuffix =>
      'You are still signed in - addons, My List, watch history and settings are untouched.';

  @override
  String get settingsUpdatesTitle => 'App Updates';

  @override
  String get settingsUpdatesSubtitle =>
      'Check for latest software versions and patches';

  @override
  String get settingsUpdatesCheck => 'Check';

  @override
  String get settingsDiagnosticsSubtitle =>
      'App, device and player state (redacted) you can copy or save';

  @override
  String get settingsLanguageSubtitle =>
      'Simplified Chinese, English, Arabic, or follow the device';

  @override
  String get settingsAboutTitle => 'About Kiru';

  @override
  String get settingsAboutSubtitle => 'Architecture, video engine, and credits';

  @override
  String get diagnosticsTitle => 'Diagnostics';

  @override
  String get diagnosticsSubtitle =>
      'Local app, device and player report (no telemetry)';

  @override
  String get diagnosticsDescription =>
      'A local-only snapshot of this install: app and device details, player settings, the stream engine state and the recent crash breadcrumbs. Credentials, addon URLs, IPTV portals and playlist links are never included. Nothing is uploaded - the report only exists once you copy or save it.';

  @override
  String get diagnosticsSectionDevice => 'DEVICE';

  @override
  String get diagnosticsSectionPlayerEngine => 'PLAYER & ENGINE';

  @override
  String get diagnosticsSectionBreadcrumbs => 'CRASH BREADCRUMBS';

  @override
  String get diagnosticsSummary => 'Summary';

  @override
  String get diagnosticsNotAvailable => 'Not available';

  @override
  String diagnosticsBreadcrumbCount(int count, int shown) {
    return '$count recorded • last $shown shown';
  }

  @override
  String get diagnosticsBreadcrumbs => 'Recent activity';

  @override
  String get diagnosticsEmpty => 'No breadcrumbs recorded yet.';

  @override
  String get diagnosticsCopied => 'Diagnostics report copied.';

  @override
  String get diagnosticsCopiedToClipboard =>
      'Diagnostic report copied to clipboard';

  @override
  String get diagnosticsCopyFailed => 'Could not copy the report';

  @override
  String get diagnosticsSaveFailed => 'Could not save the report';

  @override
  String diagnosticsSaved(String path) {
    return 'Diagnostics saved to $path';
  }

  @override
  String get searchHintTv => 'Search for a movie or series';

  @override
  String get searchHint => 'Search movies, series, or paste links';

  @override
  String get searchVoice => 'Search by voice';

  @override
  String get searchVoiceDenied =>
      'Microphone access is off. Allow it for Kiru to search by voice.';

  @override
  String get searchAiQuiz => 'AI Taste Quiz';

  @override
  String get searchPaste => 'Paste from clipboard';

  @override
  String get searchFailureTitle => 'Search could not reach its sources';

  @override
  String searchFailureBody(int failed, int total) {
    return '$failed of $total sources did not respond';
  }

  @override
  String get searchFailureAdvice =>
      'A dead addon or an expired provider runtime is fixed in Addons.';

  @override
  String searchNoResults(String query) {
    return 'No results for \"$query\"';
  }

  @override
  String get searchingMoreSources => 'Searching more sources...';

  @override
  String searchPartialFailure(String sources) {
    return 'Partial Source Failure: $sources did not respond. Other sources answered normally, so the results below are real but incomplete.';
  }

  @override
  String get searchRecent => 'Recent Searches';

  @override
  String get searchClearAll => 'Clear All';

  @override
  String get searchTrending => 'Trending & Suggested';

  @override
  String get searchNothingToSuggest => 'Nothing to suggest yet';

  @override
  String get searchNothingToSuggestBody =>
      'Search for a title above, or connect an addon in Settings to have something to search.';

  @override
  String get searchPinnedSpine => 'PINNED SPINE';

  @override
  String searchCloudstreamSection(String provider) {
    return 'CloudStream • $provider';
  }

  @override
  String get searchCloudstreamExtension => 'CloudStream Extension';

  @override
  String get searchTitlesSection => 'Titles';

  @override
  String get searchImdbSuggestions => 'IMDb suggestions';

  @override
  String get searchDirectStream => 'Direct Stream';

  @override
  String get searchSourceTitleLookup => 'Title lookup';

  @override
  String get playerSeekBack => 'Seek -10s';

  @override
  String get playerSeekForward => 'Seek +10s';

  @override
  String get playerPlay => 'Play';

  @override
  String get playerPause => 'Pause';

  @override
  String get playerMute => 'Mute';

  @override
  String get playerUnmute => 'Unmute';

  @override
  String get playerPreviousEpisode => 'Previous Episode';

  @override
  String get playerNextEpisode => 'Next Episode';

  @override
  String get playerEpisodes => 'Episodes';

  @override
  String get playerAspectRatio => 'Aspect Ratio (C)';

  @override
  String get playerPlaybackSpeed => 'Playback Speed';

  @override
  String get playerAudioTracks => 'Audio Tracks';

  @override
  String get playerSubtitles => 'Subtitles';

  @override
  String get playerSubtitleSync => 'Subtitle Sync';

  @override
  String get playerFullscreen => 'Fullscreen (F)';

  @override
  String get playerExitFullscreen => 'Exit Fullscreen (F)';

  @override
  String playerVolume(int percent) {
    return 'Volume $percent%';
  }

  @override
  String playerSeekPosition(String position, String duration) {
    return '$position of $duration';
  }

  @override
  String get a11yOpenDetails => 'Open details';

  @override
  String a11yResume(String title, int percent) {
    return 'Resume $title, $percent% watched';
  }

  @override
  String get emptyMyList => 'Your list is empty';

  @override
  String get emptyMyListBody =>
      'Save your favorite movies and TV shows to watch anytime';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSubtitle => 'App language. System follows your device.';

  @override
  String get languageSystem => 'System';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get languageChinese => 'Simplified Chinese';

  @override
  String get a11yResumePlayback => 'Resume playback';

  @override
  String get playerPlaybackPosition => 'Playback position';

  @override
  String get playerVolumeLabel => 'Volume';

  @override
  String get browseVerticalMoviesAndTv => 'Movies & TV';

  @override
  String get browseVerticalCollections => 'Collections';

  @override
  String get browseVerticalLiveTv => 'Live TV';

  @override
  String get browseVerticalAnime => 'Anime';

  @override
  String get browseVerticalManga => 'Manga';

  @override
  String get browseVerticalBooks => 'Books';

  @override
  String get browseVerticalAudiobooks => 'Audiobooks';

  @override
  String get browseVerticalMusic => 'Music';

  @override
  String get browseVerticalAdult => '18+';

  @override
  String get homeAiTasteQuiz => 'AI Taste Quiz';

  @override
  String get homeTvCalendar => 'TV Airing Calendar';

  @override
  String get homeContinueWatching => 'Continue Watching';

  @override
  String get homeTopTenMovies => 'Top 10 Movies';

  @override
  String get homeSkipIntro => 'Skip intro';

  @override
  String get homeCinemaUniverse => 'Your Cinema Universe';

  @override
  String get discoverNoTitles => 'No titles found in this catalog';

  @override
  String get discoverRequiredFilter => 'Select Required Filter';

  @override
  String get discoverSearchCatalog => 'Search catalog';

  @override
  String get discoverPageTitle => 'Discover';

  @override
  String get detailsUnavailable => 'Details unavailable.';

  @override
  String get detailsGoBack => 'Go Back';

  @override
  String get animeLoadFailed => 'Could not load anime';

  @override
  String get animeContinueWatching => 'Continue Watching';

  @override
  String get animeTrending => 'Trending on AniList';

  @override
  String get animeTrendingDescription => 'Top popular and trending series';

  @override
  String get animeSeasonPopular => 'Popular This Season (AniList Sync)';

  @override
  String get animeMasterpieces => 'All-Time Masterpieces';

  @override
  String get animeMasterpiecesDescription =>
      'Critically acclaimed top rated anime';

  @override
  String get animeNextSeason => 'Anticipated Next Season';

  @override
  String get animeNextSeasonDescription => 'Upcoming anime you cannot miss';

  @override
  String get animeAction => 'Action & Adventure';

  @override
  String get animeActionDescription => 'High octane battles and epic journeys';

  @override
  String get animeRomance => 'Romance & Drama';

  @override
  String get animeRomanceDescription => 'Heartfelt emotional stories';

  @override
  String get animeFantasy => 'Fantasy & Isekai';

  @override
  String get animeFantasyDescription => 'Magical realms and alternate worlds';

  @override
  String get animeSciFi => 'Sci-Fi & Cyberpunk';

  @override
  String get animeSciFiDescription =>
      'Futuristic technologies and dystopian worlds';

  @override
  String get sourcesTitle => 'Watch Sources';

  @override
  String get sourcesSeederFilter => 'Seeders Filter';

  @override
  String get sourcesAllSeeds => 'All Seeds';

  @override
  String get sourcesMostSeeds => 'Most Seeds (High to Low)';

  @override
  String get sourcesMostSeedsShort => 'Most Seeds';

  @override
  String get sourcesSeeds50 => '50+ Seeds';

  @override
  String get sourcesSeeds20 => '20+ Seeds';

  @override
  String get sourcesSeeds5 => '5+ Seeds';

  @override
  String get sourcesActiveSeeds => 'Active Seeds (>0)';

  @override
  String get sourcesActiveSeedsShort => 'Active Seeds';

  @override
  String get sourcesSizeFilter => 'File Size Filter';

  @override
  String get sourcesAllSizes => 'All Sizes';

  @override
  String get sourcesLargestFirst => 'Largest First';

  @override
  String get sourcesLargest => 'Largest';

  @override
  String get sourcesSmallestFirst => 'Smallest First';

  @override
  String get sourcesSmallest => 'Smallest';

  @override
  String get sourcesProvider => 'Source Provider';

  @override
  String get sourcesAll => 'All Sources';

  @override
  String get sourcesAudioLanguage => 'Audio & Dub Language';

  @override
  String get sourcesAllAudio => 'All Audio';

  @override
  String get sourcesMultiAudio => '🌐 Multi-Audio';

  @override
  String get sourcesEnglishAudio => '🇺🇸 English / Orig';

  @override
  String get sourcesHindiAudio => '🇮🇳 Hindi / Indian';

  @override
  String get sourcesGermanAudio => '🇩🇪 German';

  @override
  String get sourcesFrenchAudio => '🇫🇷 French';

  @override
  String get sourcesSpanishSpain => '🇪🇸 Spanish (Castilian)';

  @override
  String get sourcesSpanishLatin => '🇲🇽 Spanish (Latin)';

  @override
  String get sourcesSpanishAll => '🌎 All Spanish';

  @override
  String get sourcesRussianAudio => '🇷🇺 Russian';

  @override
  String get sourcesJapaneseAudio => '🇯🇵 Japanese';

  @override
  String get sourcesItalianAudio => '🇮🇹 Italian';

  @override
  String get sourcesEmpty => 'No sources found';

  @override
  String get sourcesEmptyHint =>
      'No streams found. Install more addons from Settings or try another title.';

  @override
  String get sourcesInstallAddons => 'Install Addons';

  @override
  String get sourcesMagnetCopied => 'Magnet link copied to clipboard';

  @override
  String get uiHeroBannerPlay => 'Play';

  @override
  String get uiHeroBannerMoreInfo => 'More Info';

  @override
  String get uiHeroBannerTrailer => 'Trailer';

  @override
  String get uiContinueWatchingSliderHoldOkForOptions => 'Hold OK for options';

  @override
  String get uiContinueWatchingSliderViewDetails => 'View Details';

  @override
  String get uiContinueWatchingSliderViewDetails3 => 'View details';

  @override
  String get uiContinueWatchingSliderRemoveFromContinueWatching =>
      'Remove from Continue Watching';

  @override
  String get uiContinueWatchingSliderResume => 'Resume';

  @override
  String get uiPlayerTopBarBack => 'Back';

  @override
  String get uiPlayerTopBarEpisodes => 'Episodes';

  @override
  String get uiPlayerTopBarSources => 'Sources';

  @override
  String get uiPlayerTopBarCopyStreamUrl => 'Copy Stream URL';

  @override
  String get uiPlayerTopBarScreenshot => 'Screenshot';

  @override
  String get uiPlayerTopBarLockScreen => 'Lock Screen';

  @override
  String get uiPlayerTopBarCast => 'Cast';

  @override
  String get uiPlayerSpeedMenuPlaybackSpeed => 'PLAYBACK SPEED';

  @override
  String get uiPlayerAspectMenuAspectRatio => 'ASPECT RATIO';

  @override
  String get uiPlayerAspectMenuSubtitleSizeScale => 'Subtitle Size Scale';

  @override
  String get uiPlayerAudioMenuAudioTracks => 'AUDIO TRACKS';

  @override
  String get uiPlayerAudioMenuClose => 'Close';

  @override
  String get uiPlayerAudioMenuDefaultAudioStreamPlaying =>
      'Default audio stream playing.';

  @override
  String get uiPlayerAudioMenuAudioSyncOffset => 'Audio Sync Offset';

  @override
  String get uiPlayerEpisodesPanelScrollUp => 'Scroll Up';

  @override
  String get uiPlayerEpisodesPanelScrollDown => 'Scroll Down';

  @override
  String get uiPlayerEpisodesPanelEpisodes => 'Episodes';

  @override
  String get uiPlayerEpisodesPanelClose => 'Close';

  @override
  String get uiPlayerEpisodesPanelPreviousSeasons => 'Previous Seasons';

  @override
  String get uiPlayerEpisodesPanelNextSeasons => 'Next Seasons';

  @override
  String get uiPlayerEpisodesPanelPlaying => 'PLAYING';

  @override
  String get uiPlayerEpisodesPanelSelectSources => 'Select Sources';

  @override
  String get uiPlayerLoadingOverlayPlaybackIssue => 'PLAYBACK ISSUE';

  @override
  String get uiPlayerLoadingOverlayThisSourceIsnTResponding =>
      'This source isn\'t responding';

  @override
  String get uiPlayerLoadingOverlayChooseAnotherSource =>
      'Choose another source';

  @override
  String get uiPlayerLoadingOverlayGoBack => 'Go back';

  @override
  String get uiPlayerLoadingOverlayCopyDiagnostic => 'Copy diagnostic';

  @override
  String get uiPlayerMenuRowsClose => 'Close';

  @override
  String get uiPlayerSourcesPanelBackToEpisodes => 'Back to Episodes';

  @override
  String get uiPlayerSourcesPanelClose => 'Close';

  @override
  String get uiPlayerSourcesPanelSearchingEveryProvider =>
      'Searching every provider…';

  @override
  String get uiPlayerSourcesPanelRescrapeSources => 'Rescrape Sources';

  @override
  String get uiPlayerSourcesPanelScrapingAdditionalSources =>
      'Scraping additional sources...';

  @override
  String get uiPlayerSourcesPanelMagnetLinkCopiedToClipboard =>
      'Magnet link copied to clipboard';

  @override
  String get uiPlayerSubtitleMenuSubtitles => 'Subtitles';

  @override
  String get uiPlayerSubtitleMenuRefreshOnlineSubtitles =>
      'Refresh Online Subtitles';

  @override
  String get uiPlayerSubtitleMenuSubtitleSyncBar => 'Subtitle Sync Bar';

  @override
  String get uiPlayerSubtitleMenuSubtitleAppearance => 'Subtitle Appearance';

  @override
  String get uiPlayerSubtitleMenuSpeechTextSync => 'Speech Text Sync';

  @override
  String get uiPlayerSubtitleMenuClose => 'Close';

  @override
  String get uiPlayerSubtitleMenuOff => 'Off';

  @override
  String get uiPlayerSubtitleMenuEmbedded => 'Embedded';

  @override
  String get uiPlayerSubtitleMenuAll => 'All';

  @override
  String get uiPlayerSubtitleMenuForced => 'Forced';

  @override
  String get uiPlayerSubtitleMenuSearchOnline => 'Search Online';

  @override
  String get uiPlayerSubtitleMenuEmbedded12 => 'EMBEDDED';

  @override
  String get uiPlayerSubtitleMenuSearchingSubtitles => 'Searching subtitles...';

  @override
  String get uiPlayerSubtitleMenuNoSubtitlesAvailable =>
      'No subtitles available.';

  @override
  String get uiPlayerSubtitleMenuSearchOnlineProviders =>
      'Search Online Providers';

  @override
  String get uiPlayerSubtitleMenuSearchingAdditionalSubtitlesOnline =>
      'Searching additional subtitles online...';

  @override
  String get uiPlayerSubtitleMenuForced17 => 'FORCED';

  @override
  String get uiPlayerSubtitleMenuFindMoreSubtitles => 'Find more subtitles';

  @override
  String get uiPlayerSubStyleModalSubtitleAppearance => 'Subtitle Appearance';

  @override
  String get uiPlayerSubStyleModalLibassLibmpvHardwareRenderedSubtitles =>
      'libass / libmpv hardware-rendered subtitles';

  @override
  String get uiPlayerSubStyleModalResetSubtitleDefaults =>
      'Reset Subtitle Defaults';

  @override
  String get uiPlayerSubStyleModalClose => 'Close';

  @override
  String get uiPlayerSubStyleModalZplaySampleSubtitlePreview =>
      'Kiru • Sample Subtitle Preview';

  @override
  String get uiPlayerSubStyleModalBoldText => 'Bold Text';

  @override
  String get uiPlayerSubStyleModalItalicText => 'Italic Text';

  @override
  String get uiPlayerSubStyleModalFlutterSubtitleEngineRecommended =>
      'Flutter Subtitle Engine (Recommended)';

  @override
  String get uiPlayerSubStyleModalNativeMpvLibassEngine =>
      'Native MPV libass Engine';

  @override
  String get uiPlayerSubStyleModal100ReliableHardwareAcceleratedSubtitle =>
      '100% reliable hardware-accelerated subtitle overlay across Android, iOS, Windows, Mac, and Linux with full styling support.';

  @override
  String get uiPlayerSubStyleModalDirectGpuVideoTextureRendering =>
      'Direct GPU video texture rendering powered by libass with bundled Poppins font and SSA/ASS script layout support.';

  @override
  String get uiSubSyncBarTextSync => 'Text Sync';

  @override
  String get uiSubSyncBarDiscardChanges => 'Discard changes';

  @override
  String get uiSubSyncBarDone => 'Done';

  @override
  String get uiSubSyncBarClose => 'Close';

  @override
  String get uiTextSyncOverlayClose => 'Close';

  @override
  String get uiTextSyncOverlaySearchDialogue => 'Search dialogue...';

  @override
  String get uiTextSyncOverlayNow => 'NOW';

  @override
  String get uiTextSyncOverlaySyncFromHere => 'Sync from here';

  @override
  String get uiTextSyncOverlayJumpHere => 'Jump here';

  @override
  String get uiTextSyncOverlayJumpToNow => 'Jump to now';

  @override
  String get uiTextSyncOverlayResetTiming => 'Reset timing';

  @override
  String get uiPlayerScreenFailedToDownloadSubtitle =>
      'Failed to download subtitle';

  @override
  String get uiPlayerScreenSubtitleTimingSynchronizedAndSaved =>
      'Subtitle timing synchronized and saved!';

  @override
  String get uiPlayerScreenScreenIsLockedTapThe =>
      'Screen is locked. Tap the lock icon to unlock.';

  @override
  String get uiPlayerScreenTestingOtherSourcesForYou =>
      'Testing other sources for you';

  @override
  String get uiPlayerScreenChooseASourceMyself => 'Choose a source myself';

  @override
  String get uiPlayerScreenDownloadAlreadyInProgressIn =>
      'Download already in progress in background.';

  @override
  String get uiPlayerScreenThisMediaIsAlreadyDownloaded =>
      'This media is already downloaded.';

  @override
  String get uiPlayerScreenDownloadStartedInBackgroundTrack =>
      'Download started in background. Track progress in Downloads tab.';

  @override
  String get uiPlayerScreenStreamUrlCopiedToClipboard =>
      'Stream URL copied to clipboard';

  @override
  String get uiPlayerScreenNoActiveStreamUrlAvailable =>
      'No active stream URL available to copy.';

  @override
  String get uiPlayerScreenSubtitleSyncIsNotSupported =>
      'Subtitle sync is not supported for embedded subtitles. Please select an external subtitle.';

  @override
  String get uiPlayerScreenPleaseLoadAnExternalSubtitle =>
      'Please load an external subtitle to use subtitle sync.';

  @override
  String get uiPlayerScreenSubtitleSyncIsNotSupported13 =>
      'Subtitle sync is not supported for embedded subtitles.';

  @override
  String get uiPlayerScreenSpeechSyncRequiresAnExternal =>
      'Speech sync requires an external subtitle file.';

  @override
  String get uiPlayerScreen2xSpeed => '2X Speed';

  @override
  String get uiPlayerScreenUnlock => 'Unlock';

  @override
  String get uiAnimeSearchPageClear => 'Clear';

  @override
  String get uiAnimeSearchPageReleaseYear => 'Release Year';

  @override
  String get uiAnimeSearchPageSearchAnimeMoviesOvas =>
      'Search anime, movies, OVAs...';

  @override
  String get uiAnimeSearchPageSortBy => 'Sort By';

  @override
  String get uiAnimeSearchPageGenre => 'Genre';

  @override
  String get uiAnimeSearchPageSeason => 'Season';

  @override
  String get uiAnimeSearchPageFormat => 'Format';

  @override
  String get uiAnimeSearchPageStatus => 'Status';

  @override
  String get uiAnimeSearchPageReset => 'Reset';

  @override
  String get uiAnimeSearchPageNoAnimeFoundMatchingYour =>
      'No anime found matching your criteria';

  @override
  String get uiAnimeSearchPageTryDifferentKeywordsOrClearing =>
      'Try different keywords or clearing filters';

  @override
  String get uiAnimeSearchPageAnimeTvSeries => 'Anime TV Series';

  @override
  String get uiAnimeSearchPageAnimeMovies => 'Anime Movies';

  @override
  String get uiAnimeSearchPageOvasOnasSpecials => 'OVAs, ONAs & Specials';

  @override
  String get uiAnimeSearchPageTrendingAnime => 'Trending Anime';

  @override
  String get uiAnimeSearchPagePopularThisSeason => 'Popular This Season';

  @override
  String get uiAnimeSearchPageAllTimeTopRated => 'All-Time Top Rated';

  @override
  String get uiAnimeDetailsPageEpisodes => 'Episodes';

  @override
  String get uiAnimeDetailsPageWatching => 'Watching';

  @override
  String get uiAnimeDetailsPagePlanToWatch => 'Plan to Watch';

  @override
  String get uiAnimeDetailsPageCompleted => 'Completed';

  @override
  String get uiAnimeDetailsPageDropped => 'Dropped';

  @override
  String get uiAnimeDetailsPageSub => 'SUB';

  @override
  String get uiAnimeDetailsPageDub => 'DUB';

  @override
  String get uiAnimeDetailsPageJumpToEp => 'Jump to ep #';

  @override
  String get uiAnimeStreamSheetSubtitleOrDub => 'Subtitle or dub';

  @override
  String get uiAnimeStreamSheetAll => 'All';

  @override
  String get uiAnimeStreamSheetSub => 'Sub';

  @override
  String get uiAnimeStreamSheetDub => 'Dub';

  @override
  String get uiAnimeStreamSheetSources => 'Sources';

  @override
  String get uiAnimeStreamSheetRetryScraping => 'Retry Scraping';

  @override
  String get uiMyListPageRemoveFromMyList => 'Remove from My List?';

  @override
  String get uiMyListPageCancel => 'Cancel';

  @override
  String get uiMyListPageRemove => 'Remove';

  @override
  String get uiMyListPageMyList => 'My List';

  @override
  String get uiMyListPageAll => 'All';

  @override
  String get uiMyListPageMovies => 'Movies';

  @override
  String get uiMyListPageTvShows => 'TV Shows';

  @override
  String get uiMyListPageFilterSavedTitles => 'Filter saved titles';

  @override
  String get uiMyListPageRecentlyAdded => 'Recently Added';

  @override
  String get uiMyListPageAlphabetical => 'Alphabetical';

  @override
  String get uiMyListPageReleaseYear => 'Release Year';

  @override
  String get uiMyListPageSearchSavedTitles => 'Search saved titles...';

  @override
  String get uiMyListPageResetFilters => 'Reset Filters';

  @override
  String get uiDownloadsPageFileNotFoundOnDisk =>
      'File not found on disk. It may have been moved or deleted.';

  @override
  String get uiDownloadsPageDeleteDownload => 'Delete Download';

  @override
  String get uiDownloadsPageCancel => 'Cancel';

  @override
  String get uiDownloadsPageDelete => 'Delete';

  @override
  String get uiDownloadsPageDownloadList => 'Download list';

  @override
  String get uiDownloadsPageActive => 'Active';

  @override
  String get uiDownloadsPageDownloaded => 'Downloaded';

  @override
  String get uiDownloadsPageDownloads => 'Downloads';

  @override
  String get uiDownloadsPageOpenDownloadsFolder => 'Open Downloads Folder';

  @override
  String get uiDownloadsPageNoActiveDownloads => 'No active downloads';

  @override
  String get uiDownloadsPageMediaYouDownloadFromThe =>
      'Media you download from the video player will show up here.';

  @override
  String get uiDownloadsPagePause => 'Pause';

  @override
  String get uiDownloadsPageResume => 'Resume';

  @override
  String get uiDownloadsPageRetryReconnect => 'Retry / Reconnect';

  @override
  String get uiDownloadsPageOpenFolderLocation => 'Open Folder Location';

  @override
  String get uiDownloadsPageNoDownloadedMedia => 'No downloaded media';

  @override
  String get uiDownloadsPageCompletedDownloadsWillAppearHere =>
      'Completed downloads will appear here for offline playback.';

  @override
  String get uiDiscoverPageCancel => 'Cancel';

  @override
  String get uiDiscoverPageApply => 'Apply';

  @override
  String get uiVideoSettingsPageVideoUpscaling => 'Video & Upscaling';

  @override
  String get uiVideoSettingsPageGpuUpscaling => 'GPU Upscaling';

  @override
  String get uiVideoSettingsPageUpscalingPresets => 'UPSCALING PRESETS';

  @override
  String get uiVideoSettingsPageDisabledOff => 'Disabled (Off)';

  @override
  String get uiVideoSettingsPageStandardVideoPlaybackWithoutGlsl =>
      'Standard video playback without GLSL neural filters. Lowest GPU overhead.';

  @override
  String get uiVideoSettingsPageModeAFastBalanced => 'Mode A — Fast / Balanced';

  @override
  String get uiVideoSettingsPageSharpLineRestoration2xCnn =>
      'Sharp line restoration & 2x CNN upscale. Best for 1080p anime and balanced GPU power.';

  @override
  String get uiVideoSettingsPageModeAHighQualityUltra =>
      'Mode A — High Quality (Ultra)';

  @override
  String get uiVideoSettingsPageMaximumPerceptualFidelityUsingVery =>
      'Maximum perceptual fidelity using Very Large CNNs. Recommended for discrete GPUs (RTX/Radeon).';

  @override
  String get uiVideoSettingsPageModeBSoftDenoise => 'Mode B — Soft / Denoise';

  @override
  String get uiVideoSettingsPageSmoothLineReconstructionAndArtifact =>
      'Smooth line reconstruction and artifact reduction. Best for blurry, compressed, or older anime.';

  @override
  String get uiVideoSettingsPageModeCDeblurScale => 'Mode C — Deblur & Scale';

  @override
  String get uiVideoSettingsPageAggressiveDeblurringAndScalingBest =>
      'Aggressive deblurring and scaling. Best for 480p and 720p low-resolution anime episodes.';

  @override
  String get uiVideoSettingsPageFsr10Smooth => 'FSR 1.0 — Smooth';

  @override
  String get uiVideoSettingsPageFsr10Sharp => 'FSR 1.0 — Sharp';

  @override
  String get uiVideoSettingsPagePipelineCompatibility =>
      'PIPELINE & COMPATIBILITY';

  @override
  String get uiVideoSettingsPagePlaybackStartApplication =>
      'Playback Start Application';

  @override
  String get uiVideoSettingsPageHardwareDecoderAcceleration =>
      'Hardware Decoder Acceleration';

  @override
  String get uiVideoSettingsPagePlatformRecommendation =>
      'Platform Recommendation';

  @override
  String get uiVideoSettingsPageHardwareAccelerationDecoding =>
      'HARDWARE ACCELERATION & DECODING';

  @override
  String get uiVideoSettingsPageAllPlatforms => 'All Platforms';

  @override
  String get uiVideoSettingsPageAutoSafeRecommended =>
      'Auto-Safe (Recommended)';

  @override
  String get uiVideoSettingsPageGpuHardwareDecodingWithSafe =>
      'GPU hardware decoding with safe driver fallbacks. Best efficiency for most PCs and devices.';

  @override
  String get uiVideoSettingsPageSoftwareDecodingCrashProof =>
      'Software Decoding (Crash-Proof)';

  @override
  String get uiVideoSettingsPagePureCpuDecodingViaFfmpeg =>
      'Pure CPU decoding via FFmpeg libavcodec. Eliminates black screens and driver lockups on older GPUs or virtual machines.';

  @override
  String get uiVideoSettingsPageDirectHardware => 'Direct Hardware';

  @override
  String get uiVideoSettingsPageDirectGpuDecodingDirect3d11 =>
      'Direct GPU decoding (Direct3D 11 / MediaCodec / VAAPI). Fastest on modern high-end graphics.';

  @override
  String get uiVideoSettingsPagePlaybackEngine => 'PLAYBACK ENGINE';

  @override
  String get uiVideoSettingsPageTorrentsAndLiveTvAlways =>
      'Torrents and live TV always use mpv';

  @override
  String get uiVideoSettingsPageAutoRecoverBlackScreens =>
      'Auto-Recover Black Screens';

  @override
  String get uiVideoSettingsPageActiveWatchdog => 'Active Watchdog';

  @override
  String get uiVideoSettingsPageAndroidRenderingEngine =>
      'ANDROID RENDERING ENGINE';

  @override
  String get uiVideoSettingsPageDirectSurfaceSurfaceview =>
      'Direct Surface (SurfaceView)';

  @override
  String get uiAppearanceSettingsPageAppearanceInterface =>
      'Appearance & Interface';

  @override
  String get uiAppearanceSettingsPageFineTuneTheVisualAtmosphere =>
      'Fine-tune the visual atmosphere, custom wallpaper background, color palettes, and interface layouts.';

  @override
  String get uiAppearanceSettingsPageInterfaceAtmosphere =>
      'INTERFACE & ATMOSPHERE';

  @override
  String get uiAppearanceSettingsPageCustomBackgroundWallpaper =>
      'Custom Background & Wallpaper';

  @override
  String get uiAppearanceSettingsPageLiquidGlassSetup => 'Liquid Glass Setup';

  @override
  String get uiAppearanceSettingsPageHomePageUiThemes =>
      'Home Page UI & Themes';

  @override
  String get uiAppearanceSettingsPageLiveTvSportsUi => 'Live TV & Sports UI';

  @override
  String get uiAppearanceSettingsPageContent => 'CONTENT';

  @override
  String get uiAppearanceSettingsPageMangaUiReaderAtmosphere =>
      'Manga UI & Reader Atmosphere';

  @override
  String get uiAppearanceSettingsPagePlayback => 'PLAYBACK';

  @override
  String get uiAppearanceSettingsPageAudiobookUiPlayerStudio =>
      'Audiobook UI & Player Studio';

  @override
  String get uiAppearanceSettingsPageMusicUiPlayerStudio =>
      'Music UI & Player Studio';

  @override
  String get uiAppearanceSettingsPageDiagnostics => 'DIAGNOSTICS';

  @override
  String get uiAppearanceSettingsPageGraphicsBackend => 'Graphics Backend';

  @override
  String get uiAppearanceSettingsPageRestartTheAppToApply =>
      'Restart the app to apply — the backend is fixed when the engine starts.';

  @override
  String get uiAboutSettingsPageAboutZplay => 'About Kiru';

  @override
  String get uiAboutSettingsPageUniversalEntertainmentEcosystem =>
      'Universal Entertainment Ecosystem';

  @override
  String get uiAboutSettingsPageCoreTechnologies => 'CORE TECHNOLOGIES';

  @override
  String get uiAboutSettingsPageHighPerformanceVideoEngine =>
      'High-Performance Video Engine';

  @override
  String get uiAboutSettingsPagePoweredByEmbeddedMediaKitLibmpv =>
      'Powered by embedded media_kit / libmpv with hardware-accelerated decoding.';

  @override
  String get uiAboutSettingsPageCreditsLicence => 'CREDITS & LICENCE';

  @override
  String get uiAboutSettingsPageIndependentForkMaintainedByTzero86 =>
      'Independent fork maintained by tzero86';

  @override
  String get uiAboutSettingsPageBasedOnPlaytorrioV3 => 'Based on PlayTorrio V3';

  @override
  String get uiAboutSettingsPageOriginalProjectByAymanAyman708Ux =>
      'Original project by Ayman (@ayman708-UX)';

  @override
  String get uiAboutSettingsPageThisProductUsesTheTmdbApi =>
      'This product uses the TMDB API but is not endorsed or certified by TMDB.';

  @override
  String get uiAddonsSettingsPageShareYourDebridKey => 'Share your Debrid key?';

  @override
  String get uiAddonsSettingsPageCancel => 'Cancel';

  @override
  String get uiAddonsSettingsPageContinue => 'Continue';

  @override
  String get uiAddonsSettingsPageAddStremioAddon => 'Add Stremio Addon';

  @override
  String get uiAddonsSettingsPagePasteTheStremioAddonManifestJson =>
      'Paste the Stremio addon manifest.json URL to install catalogs, metadata, streams, or subtitles.';

  @override
  String get uiAddonsSettingsPageInstall => 'Install';

  @override
  String get uiAddonsSettingsPageRemove => 'Remove';

  @override
  String get uiAddonsSettingsPageRepositoryAddedSuccessfully =>
      'Repository added successfully!';

  @override
  String get uiAddonsSettingsPageInstallRepositoryPlugins =>
      'Install Repository Plugins?';

  @override
  String get uiAddonsSettingsPageBrowseLater => 'Browse Later';

  @override
  String get uiAddonsSettingsPageInstallAllNow => 'Install All Now';

  @override
  String get uiAddonsSettingsPageInstallingPlugins => 'Installing Plugins';

  @override
  String get uiAddonsSettingsPageAddCloudstreamRepository =>
      'Add CloudStream Repository';

  @override
  String get uiAddonsSettingsPageBrowseMarketplace => 'Browse Marketplace';

  @override
  String get uiAddonsSettingsPageAddRepository => 'Add Repository';

  @override
  String get uiAddonsSettingsPageAddonsExtensions => 'Addons & Extensions';

  @override
  String get uiAddonsSettingsPageStremioAddons => 'Stremio Addons';

  @override
  String get uiAddonsSettingsPageAddonsProvideMetadataCatalogsAndStreaming =>
      'Addons provide metadata, catalogs, and streaming sources. Hold and drag to reorder priority. Providers higher up load and appear first in watch sources.';

  @override
  String get uiAddonsSettingsPageInstalledProvidersAddons =>
      'INSTALLED PROVIDERS & ADDONS';

  @override
  String get uiAddonsSettingsPageNoAddonsInstalled => 'No Addons Installed';

  @override
  String get uiAddonsSettingsPageClickAddAddonAboveToInstall =>
      'Click \"Add Addon\" above to install a Stremio manifest URL.';

  @override
  String get uiAddonsSettingsPageDebridAddons => 'DEBRID ADDONS';

  @override
  String get uiAddonsSettingsPageRepositoryMarketplace =>
      'Repository Marketplace';

  @override
  String get uiAddonsSettingsPageBrowseAvailablePlugins =>
      'Browse Available Plugins';

  @override
  String get uiAddonsSettingsPageInstalledExtensions => 'INSTALLED EXTENSIONS';

  @override
  String get uiAddonsSettingsPageInstalledCloudstreamExtensions =>
      'INSTALLED CLOUDSTREAM EXTENSIONS';

  @override
  String get uiAddonsSettingsPageNoExtensionsInstalled =>
      'No Extensions Installed';

  @override
  String get uiAddonsSettingsPageClickBrowseAvailablePluginsToFind =>
      'Click \"Browse Available Plugins\" to find and install extensions.';

  @override
  String get uiAddonsSettingsPageRepositories => 'REPOSITORIES';

  @override
  String get uiAddonsSettingsPageNoCustomRepositoriesAddedClickAdd =>
      'No custom repositories added. Click \"Add Repository\" to subscribe to a CloudStream repository.';

  @override
  String get uiAddonsSettingsPageInstallAllPluginsFromThisRepository =>
      'Install all plugins from this repository';

  @override
  String get uiAddonsSettingsPageBrowseRepositoryPlugins =>
      'Browse repository plugins';

  @override
  String get uiAddonsSettingsPageRemoveRepository => 'Remove repository';

  @override
  String get uiAddonsSettingsPageSetupEngine => 'Setup Engine';

  @override
  String get uiAddonsSettingsPageMoveUpInPriority => 'Move up in priority';

  @override
  String get uiAddonsSettingsPageMoveDownInPriority => 'Move down in priority';

  @override
  String get uiAddonsSettingsPageRemoveAddon => 'Remove addon';

  @override
  String get uiAddonsSettingsPageFunctions => 'FUNCTIONS';

  @override
  String get uiAddonsSettingsPageCatalogs => 'Catalogs';

  @override
  String get uiAddonsSettingsPageSearch => 'Search';

  @override
  String get uiAddonsSettingsPageSources => 'Sources';

  @override
  String get uiAddonsSettingsPageSubtitles => 'Subtitles';

  @override
  String get uiAddonsSettingsPageDisconnect => 'Disconnect';

  @override
  String get uiAddonsSettingsPageConnected => 'Connected';

  @override
  String get uiBuiltinProvidersSettingsPageBuiltInProviders =>
      'Built-in Providers';

  @override
  String get uiBuiltinProvidersSettingsPageReset => 'Reset';

  @override
  String get uiBuiltinProvidersSettingsPageResetProvidersOrder =>
      'Reset Providers Order?';

  @override
  String get uiBuiltinProvidersSettingsPageCancel => 'Cancel';

  @override
  String get uiBuiltinProvidersSettingsPageDefaultMode => 'Default Mode';

  @override
  String get uiBuiltinProvidersSettingsPageCustomMode => 'Custom Mode';

  @override
  String
  get uiBuiltinProvidersSettingsPageManualProviderOrderTogglesPriorityScraping =>
      'Manual provider order, toggles & priority scraping';

  @override
  String get uiBuiltinProvidersSettingsPageDefault => 'Default';

  @override
  String get uiBuiltinProvidersSettingsPageStandardAutoSorting =>
      'Standard auto-sorting';

  @override
  String get uiBuiltinProvidersSettingsPageCustom => 'Custom';

  @override
  String get uiBuiltinProvidersSettingsPageManualOrderToggles =>
      'Manual order & toggles';

  @override
  String get uiBuiltinProvidersSettingsPageDefaultModeActive =>
      'Default Mode Active';

  @override
  String get uiBuiltinProvidersSettingsPageSwitchToCustomMode =>
      'Switch to Custom Mode';

  @override
  String get uiBuiltinProvidersSettingsPagePriorityScrapeResultSorting =>
      'Priority Scrape & Result Sorting';

  @override
  String get uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrc =>
      'Search providers (e.g. CineSrc)...';

  @override
  String get uiBuiltinProvidersSettingsPageEnableAll => 'Enable All';

  @override
  String get uiBuiltinProvidersSettingsPageDisableAll => 'Disable All';

  @override
  String get uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrcDulo =>
      'Search providers (e.g. CineSrc, Dulo)...';

  @override
  String get uiBuiltinProvidersSettingsPageClearSearchToDragReorder =>
      'Clear search to drag & reorder';

  @override
  String get uiBuiltinProvidersSettingsPageOff => 'Off';

  @override
  String get uiBuiltinProvidersSettingsPageMoveUp => 'Move Up';

  @override
  String get uiBuiltinProvidersSettingsPageMoveDown => 'Move Down';

  @override
  String get uiCloudstreamMarketplaceModalLater => 'Later';

  @override
  String get uiCloudstreamMarketplaceModalInstallAllNow => 'Install All Now';

  @override
  String get uiCloudstreamMarketplaceModalInstallingRepositoryPlugins =>
      'Installing Repository Plugins';

  @override
  String get uiCloudstreamMarketplaceModalMarketplace => 'Marketplace';

  @override
  String get uiCloudstreamMarketplaceModalRefreshListFromWeb =>
      'Refresh list from web';

  @override
  String get uiCloudstreamMarketplaceModalSearchRepositoryOrPluginEG =>
      'Search repository or plugin (e.g. Turkish, 3rabi, DiziBox, Shahid)...';

  @override
  String get uiCloudstreamMarketplaceModalAdded => 'Added';

  @override
  String get uiCloudstreamMarketplaceModalInstallAllPlugins =>
      'Install All Plugins';

  @override
  String get uiCloudstreamMarketplaceModalBrowse => 'Browse';

  @override
  String get uiCloudstreamRepoModalAllMatchingPluginsAreAlreadyInstalled =>
      'All matching plugins are already installed!';

  @override
  String get uiCloudstreamRepoModalCancel => 'Cancel';

  @override
  String get uiCloudstreamRepoModalAvailablePlugins => 'Available Plugins';

  @override
  String get uiCloudstreamRepoModalAvailableCloudstreamPlugins =>
      'Available CloudStream Plugins';

  @override
  String get uiCloudstreamRepoModalSearchPluginsEGSflixSuperstream =>
      'Search plugins (e.g. Sflix, SuperStream)...';

  @override
  String get uiCloudstreamRepoModalInstalled => 'Installed';

  @override
  String get uiCloudstreamRepoModalUninstall => 'Uninstall';

  @override
  String get uiCloudstreamRepoModalInstall => 'Install';

  @override
  String get uiDebridSettingsPageDismiss => 'Dismiss';

  @override
  String get uiDebridSettingsPageDebridCloudStreaming =>
      'Debrid & Cloud Streaming';

  @override
  String get uiDebridSettingsPageUseDebridForStreams =>
      'Use Debrid for Streams';

  @override
  String get uiDebridSettingsPageRouteTorrentLinksThroughCloudServers =>
      'Route torrent links through cloud servers';

  @override
  String get uiDebridSettingsPageActiveProvider => 'ACTIVE PROVIDER';

  @override
  String get uiDebridSettingsPageSelectDefaultDebridProvider =>
      'Select Default Debrid Provider';

  @override
  String get uiDebridSettingsPageZplayWillSendRequestsToThis =>
      'Kiru will send requests to this provider when streaming.';

  @override
  String get uiDebridSettingsPageProviderCredentials => 'PROVIDER CREDENTIALS';

  @override
  String get uiDebridSettingsPageActive => 'ACTIVE';

  @override
  String get uiDebridSettingsPagePasteApiKeyToken => 'Paste API Key / Token';

  @override
  String get uiDebridSettingsPageClear => 'Clear';

  @override
  String get uiDebridSettingsPagePasteFromClipboard => 'Paste from Clipboard';

  @override
  String get uiDebridSettingsPageSave => 'Save';

  @override
  String get uiServiceKeysSettingsPageDismiss => 'Dismiss';

  @override
  String get uiServiceKeysSettingsPageServiceApiKeys => 'Service API Keys';

  @override
  String get uiServiceKeysSettingsPageKeysYouCanObtain => 'KEYS YOU CAN OBTAIN';

  @override
  String get uiServiceKeysSettingsPageBorrowedCredentials =>
      'BORROWED CREDENTIALS';

  @override
  String get uiServiceKeysSettingsPageRelated => 'RELATED';

  @override
  String get uiServiceKeysSettingsPageSaved => 'SAVED';

  @override
  String get uiServiceKeysSettingsPagePasteFromClipboard =>
      'Paste from Clipboard';

  @override
  String get uiServiceKeysSettingsPageSave => 'Save';

  @override
  String get uiServiceKeysSettingsPageClearKey => 'Clear key';

  @override
  String get uiServiceKeysSettingsPageTmdbApiKey => 'TMDb API Key';

  @override
  String get uiSimklSettingsPageFailedToRequestSimklPinCode =>
      'Failed to request Simkl PIN code.';

  @override
  String get uiSimklSettingsPageSimklSynchronization => 'Simkl Synchronization';

  @override
  String get uiSimklSettingsPageDisconnect => 'Disconnect';

  @override
  String get uiSimklSettingsPageConnectSimkl => 'Connect Simkl';

  @override
  String get uiSimklSettingsPageEnterThisPinCodeAtSimkl =>
      'Enter this PIN code at simkl.com/pin:';

  @override
  String get uiSimklSettingsPagePinCopiedToClipboard =>
      'PIN copied to clipboard!';

  @override
  String get uiSimklSettingsPageOpenSimklComPin => 'Open simkl.com/pin';

  @override
  String get uiSimklSettingsPageWaitingForPinApprovalOnSimkl =>
      'Waiting for PIN approval on simkl.com...';

  @override
  String get uiSimklSettingsPageCloudSyncControls => 'Cloud Sync Controls';

  @override
  String get uiSimklSettingsPageSyncSimklWatchlistContinueWatching =>
      'Sync Simkl Watchlist & Continue Watching';

  @override
  String get uiSimklSettingsPageManuallyTriggersAnImmediatePullFrom =>
      'Manually triggers an immediate pull from Simkl';

  @override
  String get uiSimklSettingsPageSyncingWithSimkl => 'Syncing with Simkl...';

  @override
  String get uiSimklSettingsPageSimklSyncComplete => 'Simkl sync complete!';

  @override
  String get uiTmdbSettingsPageDismiss => 'Dismiss';

  @override
  String get uiTmdbSettingsPageTmdbApiKey => 'TMDb API Key';

  @override
  String get uiTmdbSettingsPageTmdbCredential => 'TMDB CREDENTIAL';

  @override
  String get uiTmdbSettingsPageCredits => 'CREDITS';

  @override
  String get uiTmdbSettingsPageSaved => 'SAVED';

  @override
  String get uiTmdbSettingsPagePasteYourTmdbApiKey => 'Paste your TMDb API key';

  @override
  String get uiTmdbSettingsPagePasteFromClipboard => 'Paste from Clipboard';

  @override
  String get uiTmdbSettingsPageSaveAndTest => 'Save and test';

  @override
  String get uiTmdbSettingsPageClearKey => 'Clear key';

  @override
  String get uiTraktSettingsPageTraktTvSynchronization =>
      'Trakt.tv Synchronization';

  @override
  String get uiTraktSettingsPageDisconnect => 'Disconnect';

  @override
  String get uiTraktSettingsPagePairAccount => 'Pair Account';

  @override
  String get uiTraktSettingsPageEnterThisActivationCodeAtTrakt =>
      'Enter this activation code at trakt.tv/activate:';

  @override
  String get uiTraktSettingsPageCodeCopiedToClipboard =>
      'Code copied to clipboard!';

  @override
  String get uiTraktSettingsPageOpenTraktTvActivate => 'Open trakt.tv/activate';

  @override
  String get uiTraktSettingsPageWaitingForAuthorizationOnTraktTv =>
      'Waiting for authorization on trakt.tv...';

  @override
  String get uiTraktSettingsPageCloudSyncControls => 'Cloud Sync Controls';

  @override
  String get uiTraktSettingsPageSyncWatchlistContinueWatchingNow =>
      'Sync Watchlist & Continue Watching Now';

  @override
  String get uiTraktSettingsPageManuallyTriggersAnImmediatePullFrom =>
      'Manually triggers an immediate pull from Trakt';

  @override
  String get uiTraktSettingsPageSyncingWithTraktTv =>
      'Syncing with Trakt.tv...';

  @override
  String get uiTraktSettingsPageTraktSyncComplete => 'Trakt sync complete!';

  @override
  String get uiUpdatesSettingsPageZplayIsUpToDate => 'Kiru is up to date!';

  @override
  String get uiUpdatesSettingsPageAppUpdatesSystem => 'App Updates & System';

  @override
  String get uiUpdatesSettingsPageKeepZplayUpToDateWith =>
      'Keep Kiru up to date with the latest features, security patches, and performance improvements.';

  @override
  String get uiUpdatesSettingsPageReleaseChannels => 'RELEASE CHANNELS';

  @override
  String get uiUpdatesSettingsPageOfficialStableChannel =>
      'Official Stable Channel';

  @override
  String
  get uiUpdatesSettingsPageDirectGithubReleaseDistributionWithAutomated =>
      'Direct GitHub release distribution with automated checksum verification.';

  @override
  String get uiUpdatesSettingsPageSeamlessInAppPatching =>
      'Seamless In-App Patching';

  @override
  String
  get uiUpdatesSettingsPageDownloadsAndAppliesExecutableUpdatesDirectly =>
      'Downloads and applies executable updates directly without manual file downloads.';

  @override
  String get libraryMyList => 'My List';

  @override
  String get libraryDownloads => 'Downloads';

  @override
  String get librarySection => 'Library section';

  @override
  String get mediaTypeMovie => 'Movie';

  @override
  String get mediaTypeSeries => 'Series';

  @override
  String get mediaTypeAnime => 'Anime';

  @override
  String get mediaTypeOther => 'Other';

  @override
  String get aspectFit => 'Fit to screen (Contain)';

  @override
  String get aspectCover => 'Fill screen (Crop/Zoom)';

  @override
  String get aspectStretch => 'Stretch to fill';

  @override
  String get detailsPlayFirst => 'Play First Movie';

  @override
  String get detailsPlayEpisodes => 'Play Episodes';

  @override
  String get detailsPlayMovie => 'Play Movie';

  @override
  String get detailsCollectionMovies => 'Movies in Collection';

  @override
  String get detailsEpisodes => 'Episodes';

  @override
  String get detailsSimilar => 'Similar Content';

  @override
  String get detailsCast => 'Top Cast & Characters';

  @override
  String get detailsRecommendations => 'More Like This';

  @override
  String detailsSeasonCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Seasons',
      one: '1 Season',
    );
    return '$_temp0';
  }

  @override
  String detailsSeasonLabel(int season) {
    return 'Season $season';
  }

  @override
  String playerSubtitleSwitched(String title) {
    return 'Switched to embedded subtitle: $title';
  }

  @override
  String playerSubtitleDownloading(String language) {
    return 'Downloading $language subtitle...';
  }

  @override
  String playerSubtitleLoaded(String language, int count) {
    return '$language subtitle loaded ($count lines)';
  }

  @override
  String playerSubtitleLoadError(String error) {
    return 'Could not load subtitle: $error';
  }

  @override
  String playerSourceAttempt(String source, int attempt, int total) {
    return '$source • Attempt $attempt of $total';
  }

  @override
  String playerDownloadError(String error) {
    return 'Download failed to start: $error';
  }

  @override
  String animeTotalEpisodes(int count) {
    return '($count total)';
  }

  @override
  String animeSearchResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count results',
      one: '1 result',
    );
    return '$_temp0';
  }

  @override
  String libraryRemoveTitle(String title) {
    return 'Remove \"$title\" from your list?';
  }

  @override
  String downloadsSummary(int active, int completed) {
    return '$active active • $completed downloaded';
  }

  @override
  String downloadsFolderPath(String path) {
    return 'Folder path: $path';
  }

  @override
  String downloadsDeleteConfirm(String title) {
    return 'Delete \"$title\" and remove its file from storage?';
  }

  @override
  String get auxShellBackGuardPressBackAgainToExit =>
      'Press back again to exit';

  @override
  String get auxSectionHeaderSeeAll => 'See All';

  @override
  String get auxTrailerModalTrailerUnavailable => 'Trailer unavailable';

  @override
  String get auxTrailerModalThisTrailerCouldNotBePlayedIn =>
      'This trailer could not be played in the app.';

  @override
  String get auxTrailerModalWatchOnYoutube => 'Watch on YouTube';

  @override
  String get auxTrailerModalCloseTrailer => 'Close trailer';

  @override
  String get auxIptvChannelCardHdLive => 'HD Live';

  @override
  String get auxIptvHeroCarouselInstantLiveMultiSourceStreamingWithReal =>
      'Instant live multi-source streaming with real-time stream resolution & high-framerate playback.';

  @override
  String get auxIptvHeroCarouselWatchLive => 'Watch Live';

  @override
  String get auxIptvHeroCarouselStreamFeeds => 'Stream Feeds';

  @override
  String get auxMultinutzChannelSheetSearchChannels => 'Search channels...';

  @override
  String get auxMultinutzChannelSheetPortals => 'Portals';

  @override
  String get auxMultinutzChannelSheetCopyLoginUrlUserPass =>
      'Copy Login (url:user:pass)';

  @override
  String get auxMultinutzChannelSheetRemovePortal => 'Remove Portal';

  @override
  String get auxMultinutzChannelSheetNoLiveChannelsAvailableForThisPortal =>
      'No live channels available for this portal';

  @override
  String get auxMultinutzChannelSheetPlaylists => 'Playlists';

  @override
  String get auxMultinutzChannelSheetCopyPlaylistUrl => 'Copy Playlist URL';

  @override
  String get auxMultinutzChannelSheetRemovePlaylist => 'Remove Playlist';

  @override
  String get auxMultinutzChannelSheetNoChannelsInThisPlaylist =>
      'No channels in this playlist';

  @override
  String get auxMangaCategoryDropdownMangaCategories => 'Manga Categories';

  @override
  String get auxMangaCategoryDropdownFilterCategories => 'Filter categories...';

  @override
  String get auxMangaCategoryDropdownNoMatchingCategories =>
      'No matching categories';

  @override
  String get auxMangaCategoryDropdownResetToAllCategories =>
      'Reset to All Categories';

  @override
  String get auxMovieSliderSectionCalendar => 'Calendar';

  @override
  String get auxP2PWarningDialogP2pTorrentStreamingNotice =>
      'P2P Torrent Streaming Notice';

  @override
  String get auxP2PWarningDialogExit => 'Exit';

  @override
  String get auxP2PWarningDialogWouldYouLikeToTurnOffThe =>
      'Would you like to turn off the built-in ZPlay P2P torrent source and use only direct HTTP streaming?';

  @override
  String get auxP2PWarningDialogP2pPeerToPeerTorrentStreamingConnects =>
      'P2P (peer-to-peer torrent) streaming connects directly to public torrent swarms to download and seed video pieces. In certain countries and regions, unencrypted torrent activity may be monitored and could result in warning letters or notices from your Internet Service Provider (ISP).';

  @override
  String get auxP2PWarningDialogZplayhttpDirectStream =>
      'ZPlayHTTP (Direct Stream)';

  @override
  String get auxP2PWarningDialogSafeDirectHttpsWebStreamsNoTorrenting =>
      'Safe direct HTTPS web streams. No torrenting or peer uploading.';

  @override
  String get auxP2PWarningDialogZplayTorrentEngine => 'ZPlay (Torrent Engine)';

  @override
  String get auxP2PWarningDialogP2pSwarmsKnabenTorrentgalaxyInvolvesPeerData =>
      'P2P swarms (Knaben, TorrentGalaxy). Involves peer data sharing.';

  @override
  String get auxP2PWarningDialogNoteYouCanEasilyToggleTheBuilt =>
      'Note: You can easily toggle the built-in P2P source back on or off anytime in Settings.';

  @override
  String get auxP2PWarningDialogDonTShowAgain => 'Don\'t Show Again';

  @override
  String get auxP2PWarningDialogP2pTorrentSourceTurnedOffZplayhttpWill =>
      'P2P torrent source turned off. ZPlayHTTP will be used.';

  @override
  String get auxP2PWarningDialogYesTurnOffP2p => 'Yes, Turn Off P2P';

  @override
  String get auxPlayerSkipButtonDismiss => 'Dismiss (✕)';

  @override
  String get auxMagnetFilesViewGatheringFileListStreamMetadata =>
      'Gathering file list & stream metadata';

  @override
  String get auxMagnetFilesViewFailedToReadMagnet => 'Failed to Read Magnet';

  @override
  String get auxMagnetFilesViewTryAgain => 'Try Again';

  @override
  String get auxMagnetFilesViewNoFilesMatchFilter => 'No files match filter';

  @override
  String get auxMagnetFilesViewFilterFilesByName => 'Filter files by name...';

  @override
  String get auxMagnetFilesViewNonVideo => 'Non-video';

  @override
  String get auxTvOnScreenKeyboardSpace => 'Space';

  @override
  String get auxUpdateDialogCurrent => 'Current';

  @override
  String get auxUpdateDialogLatest => 'Latest';

  @override
  String get auxUpdateDialogDownloading => 'Downloading...';

  @override
  String get auxUpdateDialogUpdateNow => 'Update Now';

  @override
  String get auxUpdateDialogUpdateCouldNotBeVerified =>
      'Update could not be verified';

  @override
  String get auxUpdateDialogOpenReleasePage => 'Open release page';

  @override
  String get auxUpdateDialogPleaseEnableInstallUnknownAppsPermissionFor =>
      'Please enable \"Install unknown apps\" permission for Kiru in Android settings.';

  @override
  String get auxUpdateDialogDownloadComplete => 'Download Complete';

  @override
  String get auxUpdateDialogOpenFolder => 'Open Folder';

  @override
  String get auxAdultPageCouldNotLoad18Sources => 'Could not load 18+ sources';

  @override
  String get auxAdultPageTitlesFromTheAddonsMarked18Or =>
      'Titles from the addons marked 18+ or hybrid.';

  @override
  String get auxWewatchQuizPageRecommendationQuiz => 'Recommendation Quiz';

  @override
  String get auxWewatchQuizPageRetake => 'Retake';

  @override
  String get auxWewatchQuizPageWhatDoYouLikeToWatch =>
      'What do you like to watch?';

  @override
  String get auxWewatchQuizPageRate3OrMoreMoviesOrTv =>
      'Rate 3 or more movies or TV shows. Choose what you liked or disliked, and select key elements to generate pinpoint AI recommendations.';

  @override
  String get auxWewatchQuizPageAddAnotherTitle => 'Add Another Title';

  @override
  String get auxWewatchQuizPageRemoveThisTitle => 'Remove this title';

  @override
  String get auxWewatchQuizPageSearchMovieOrTvSeries =>
      'Search movie or TV series...';

  @override
  String get auxWewatchQuizPageNeedIdeas => 'Need ideas?';

  @override
  String get auxWewatchQuizPageHowWasYourExperienceWithIt =>
      'How was your experience with it?';

  @override
  String get auxWewatchQuizPageWhatStoodOutPickKeyElementsOr =>
      'What stood out? (Pick key elements or write a note):';

  @override
  String get auxWewatchQuizPageFetchingReasonTags => 'Fetching reason tags...';

  @override
  String get auxWewatchQuizPageAdditionalNotesOrSpecificsOptional =>
      'Additional notes or specifics (optional)...';

  @override
  String get auxWewatchQuizPageSynthesizingTasteVectorsWithMultiSignalAi =>
      'Synthesizing taste vectors with multi-signal AI...';

  @override
  String get auxWewatchQuizPageYourPersonalizedMatches =>
      'Your Personalized Matches';

  @override
  String get auxAnimePageAnimeCatalogue => 'Anime catalogue';

  @override
  String get auxAnimePageWatchS1E1 => 'Watch S1:E1';

  @override
  String get auxAnimePageAnilistDetails => 'AniList Details';

  @override
  String
  get auxAnimeStreamSheetExtractingMegaplayVidwishAllanimeMiruroStreams =>
      'Extracting MegaPlay, VidWish, AllAnime & Miruro streams...';

  @override
  String get auxAudiobooksPageCustomizeAudiobookSection =>
      'Customize Audiobook Section';

  @override
  String get auxAudiobooksPagePosterCardDensity => 'Poster Card Density';

  @override
  String get auxAudiobooksPageAudiobookPosterCardDensity =>
      'Audiobook poster card density';

  @override
  String get auxAudiobooksPageFeaturedHeroSpotlightCarousel =>
      'Featured Hero Spotlight Carousel';

  @override
  String get auxAudiobooksPageMovingAmbientBackgroundGlow =>
      'Moving Ambient Background Glow';

  @override
  String get auxAudiobooksPageShowContinueListeningCarousel =>
      'Show \"Continue Listening\" Carousel';

  @override
  String get auxAudiobooksPageOpenPlayerStudioThemes =>
      'Open Player Studio & Themes';

  @override
  String get auxAudiobooksPageAudiobookHub => 'Audiobook Hub';

  @override
  String get auxAudiobooksPageExploreStreamListenToThousandsOfStories =>
      'Explore, stream & listen to thousands of stories';

  @override
  String get auxAudiobooksPageAudiobookGeneratorStudio =>
      'Audiobook Generator & Studio';

  @override
  String get auxAudiobooksPageAudiobookCustomizer => 'Audiobook Customizer';

  @override
  String get auxAudiobooksPageSearchAudiobooksByTitleAuthorOrGenre =>
      'Search audiobooks by title, author, or genre...';

  @override
  String get auxAudiobooksPageAudiobookGenres => 'Audiobook genres';

  @override
  String get auxAudiobooksPageScrapingHighQualityAudiobookSources =>
      'Scraping high-quality audiobook sources...';

  @override
  String get auxAudiobooksPageCouldNotLoadAudiobooks =>
      'Could not load audiobooks';

  @override
  String get auxAudiobooksPageNoAudiobooksFoundTryAnotherSearchQuery =>
      'No audiobooks found. Try another search query.';

  @override
  String get auxAudiobooksPageContinueListening => 'Continue Listening';

  @override
  String get auxAudiobooksPageAiAudiobookStudioEpubGenerator =>
      'AI Audiobook Studio & EPUB Generator';

  @override
  String get auxAudiobooksPageGenerateAudiobooksFromEpubsOrImportYour =>
      'Generate audiobooks from EPUBs or import your own MP3/M4B audiobooks.';

  @override
  String get auxAudiobooksPageOpenStudio => 'Open Studio';

  @override
  String get auxAudiobooksPageMyGeneratedUploadedAudiobooks =>
      'My Generated & Uploaded Audiobooks';

  @override
  String get auxAudiobooksPageStudio => 'Studio';

  @override
  String get auxAudiobookDetailPageAudiobookDetails => 'Audiobook Details';

  @override
  String get auxAudiobookDetailPageChaptersAudioFiles =>
      'Chapters & Audio Files';

  @override
  String get auxAudiobookDetailPageCouldNotLoadChapters =>
      'Could not load chapters';

  @override
  String get auxAudiobookDetailPageNoPlayableChaptersFound =>
      'No playable chapters found.';

  @override
  String get auxAudiobookDetailPagePlayFirstChapter => 'Play First Chapter';

  @override
  String get auxAudiobookPlayerScreenAudioPlayerStyleStudio =>
      'Audio Player Style & Studio';

  @override
  String get auxAudiobookPlayerScreenSelectPlayerDesignPreset =>
      'Select Player Design Preset';

  @override
  String get auxAudiobookPlayerScreenAudioPlayerDesignPreset =>
      'Audio player design preset';

  @override
  String get auxAudiobookPlayerScreenSeekBarScrubberStyle =>
      'Seek Bar Scrubber Style';

  @override
  String get auxAudiobookPlayerScreenSeekBarScrubberStyle2 =>
      'Seek bar scrubber style';

  @override
  String get auxAudiobookPlayerScreenPlayPauseButtonStyle =>
      'Play / Pause Button Style';

  @override
  String get auxAudiobookPlayerScreenPlayPauseButtonStyle2 =>
      'Play pause button style';

  @override
  String get auxAudiobookPlayerScreenOpenDragDropPlayerStudio =>
      'Open Drag & Drop Player Studio';

  @override
  String get auxAudiobookPlayerScreenAutoplay => 'Autoplay';

  @override
  String get auxAudiobookPlayerScreenCustomizeAudioPlayer =>
      'Customize Audio Player';

  @override
  String get auxAudiobookPlayerScreenChaptersList => 'Chapters List';

  @override
  String get auxAudiobookPlayerScreenRetryChapter => 'Retry Chapter';

  @override
  String get auxAudiobookPlayerScreenOpenChaptersPanel => 'Open Chapters Panel';

  @override
  String get auxAudiobookPlayerScreenPreviousChapter => 'Previous Chapter';

  @override
  String get auxAudiobookPlayerScreenRewind10s => 'Rewind 10s';

  @override
  String get auxAudiobookPlayerScreenForward10s => 'Forward 10s';

  @override
  String get auxAudiobookPlayerScreenNextChapter => 'Next Chapter';

  @override
  String get auxAudiobookPlayerScreenAudiobookChapters => 'Audiobook Chapters';

  @override
  String get auxAudiobookPlayerScreenFilterChaptersByName =>
      'Filter chapters by name...';

  @override
  String get auxGenerateAudiobookScreenEpubExceeds250kWords =>
      'EPUB Exceeds 250k Words';

  @override
  String get auxGenerateAudiobookScreenSplitGenerate => 'Split & Generate';

  @override
  String get auxGenerateAudiobookScreenStreamUrlCopiedToClipboard =>
      'Stream URL copied to clipboard!';

  @override
  String get auxGenerateAudiobookScreenRemoveGenerationJob =>
      'Remove Generation Job?';

  @override
  String get auxGenerateAudiobookScreenAddPersonalAudiobook =>
      'Add Personal Audiobook';

  @override
  String get auxGenerateAudiobookScreenImportToLibrary => 'Import to Library';

  @override
  String get auxGenerateAudiobookScreenAudiobookStudioGenerator =>
      'Audiobook Studio & Generator';

  @override
  String get auxGenerateAudiobookScreenAudiobookStudioTabs =>
      'Audiobook studio tabs';

  @override
  String get auxGenerateAudiobookScreenAiEpubGeneratorTts =>
      'AI EPUB Generator (TTS)';

  @override
  String get auxGenerateAudiobookScreenMyUploadedAudiobooks =>
      'My Uploaded Audiobooks';

  @override
  String get auxGenerateAudiobookScreenRefreshStatus => 'Refresh Status';

  @override
  String get auxGenerateAudiobookScreenNoGeneratedAudiobooksYet =>
      'No generated audiobooks yet';

  @override
  String get auxGenerateAudiobookScreenPickAnEpubAboveToSynthesizeHigh =>
      'Pick an EPUB above to synthesize high-quality voice narrations.';

  @override
  String get auxGenerateAudiobookScreenAiNarratorVoiceKokoroEngine =>
      'AI Narrator Voice (Kokoro Engine)';

  @override
  String get auxGenerateAudiobookScreenRescanBooks => 'Rescan Books';

  @override
  String get auxGenerateAudiobookScreenGenerate => 'Generate';

  @override
  String get auxGenerateAudiobookScreenPickAnyEpubFileFromYourDevice =>
      'Pick any .epub file from your device. Large books (>250k words) are auto-split.';

  @override
  String get auxGenerateAudiobookScreenPlayInApp => 'Play in App';

  @override
  String get auxGenerateAudiobookScreenUploadPersonalAudiobookFiles =>
      'Upload Personal Audiobook Files';

  @override
  String get auxGenerateAudiobookScreenImportYourOwnMp3M4bM4aOr =>
      'Import your own .mp3, .m4b, .m4a, or .flac audiobooks to listen offline.';

  @override
  String get auxGenerateAudiobookScreenNoPersonalAudiobooksAddedYet =>
      'No personal audiobooks added yet';

  @override
  String get auxGenerateAudiobookScreenTapTheBannerAboveToImportAudio =>
      'Tap the banner above to import audio files from your device.';

  @override
  String get auxGenerateAudiobookScreenDeleteAudiobook => 'Delete Audiobook?';

  @override
  String get auxBooksPageCouldNotLoadBooks => 'Could not load books';

  @override
  String get auxBooksPageNoBooksFound => 'No books found';

  @override
  String get auxBooksPageTrySearchingForAnotherTitleAuthorOr =>
      'Try searching for another title, author, or language';

  @override
  String get auxBooksPageSearchMillionsOfBooksAuthors =>
      'Search millions of books & authors...';

  @override
  String get auxBooksPageFontEngine => 'Font Engine:';

  @override
  String get auxBooksPageReaderFontEngine => 'Reader font engine';

  @override
  String get auxBooksPageAllFormats => 'All Formats';

  @override
  String get auxBooksPageBookFormats => 'Book formats';

  @override
  String get auxBookDetailSheetGenerateAiAudiobookTts =>
      'Generate AI Audiobook (TTS)';

  @override
  String get auxBookDetailSheetDeleteDownloadedFile => 'Delete downloaded file';

  @override
  String get auxBookDetailSheetInformation => 'Information';

  @override
  String get auxBookDetailSheetOverview => 'Overview';

  @override
  String get auxEpubReaderPageBackToLibrary => 'Back to Library';

  @override
  String get auxEpubReaderPageTableOfContentsT => 'Table of Contents (T)';

  @override
  String get auxEpubReaderPageFocusModeLineByLine =>
      'Focus Mode (Line-by-Line)';

  @override
  String get auxEpubReaderPageAppearanceCustomization =>
      'Appearance & Customization';

  @override
  String get auxEpubReaderPageToggleFullscreenF => 'Toggle Fullscreen (F)';

  @override
  String get auxEpubReaderPagePreviousChapterLeftArrow =>
      'Previous Chapter (Left Arrow)';

  @override
  String get auxEpubReaderPageNextChapterRightArrow =>
      'Next Chapter (Right Arrow)';

  @override
  String get auxEpubReaderPageNoReadableChaptersFound =>
      'No readable chapters found.';

  @override
  String get auxEpubReaderPageTableOfContents => 'Table of Contents';

  @override
  String get auxEpubReaderPageNoTableOfContentsAvailable =>
      'No table of contents available';

  @override
  String get auxPdfReaderPageZoomIn => 'Zoom In';

  @override
  String get auxPdfReaderPageZoomOut => 'Zoom Out';

  @override
  String get auxPdfReaderPagePreviousPage => 'Previous Page';

  @override
  String get auxPdfReaderPageNextPage => 'Next Page';

  @override
  String get auxBrowsePageBrowseVerticals => 'Browse verticals';

  @override
  String get auxTvCalendarPageTvShowsAiringCalendar =>
      'TV Shows Airing Calendar';

  @override
  String
  get auxTvCalendarPageUpcomingBroadcastStreamingEpisodesWithLiveNetwork =>
      'Upcoming broadcast & streaming episodes with live network filters';

  @override
  String get auxTvCalendarPageFilterShows => 'Filter shows...';

  @override
  String get auxTvCalendarPageNetwork => 'Network:';

  @override
  String get auxTvCalendarPageShowAllNetworks => 'Show All Networks';

  @override
  String get auxCatalogPageNoItemsFound => 'No items found';

  @override
  String get auxCatalogPageSearch => 'Search...';

  @override
  String get auxCollectionsPageFranchises => 'Franchises';

  @override
  String get auxCollectionsPageMemoryLane => 'Memory Lane';

  @override
  String get auxCollectionsPageCuratedFranchisesEras =>
      'Curated Franchises & Eras';

  @override
  String get auxCollectionsPageHandPickedFilmPacksInWatchOrder =>
      'Hand-picked film packs, in watch order.';

  @override
  String get auxIptvChannelSheetStop => 'Stop';

  @override
  String get auxIptvChannelSheetScanningAllVerifiedPortalsInParallel =>
      'Scanning all verified portals in parallel…';

  @override
  String get auxIptvChannelSheetNoAliveStreamsDiscoveredYet =>
      'No alive streams discovered yet.';

  @override
  String get auxIptvChannelSheetTapScanMorePortalsToDiscoverFresh =>
      'Tap \"Scan More Portals\" to discover fresh feeds.';

  @override
  String get auxIptvChannelSheetClearSearch => 'Clear Search';

  @override
  String get auxIptvChannelSheetScanMore => 'Scan More';

  @override
  String get auxIptvPageChannelListAndProgrammeSchedule =>
      'Channel list and programme schedule';

  @override
  String get auxIptvPageMultiStreamsMultiViewWindow =>
      'Multi Streams (Multi-View Window)';

  @override
  String get auxIptvPageMultiStreams => 'Multi Streams';

  @override
  String get auxIptvPageManagePortalsPlaylists => 'Manage Portals & Playlists';

  @override
  String get auxIptvPageSearchChannels => 'Search Channels';

  @override
  String get auxIptvPageQuickChannels => 'Quick Channels';

  @override
  String get auxIptvPageAddQuickChannel => 'Add Quick Channel';

  @override
  String get auxIptvPageAddChannel => 'Add Channel';

  @override
  String get auxIptvPageEGCnnNewsInternational =>
      'e.g. cnn, news, international';

  @override
  String get auxIptvPageGradient => 'Gradient';

  @override
  String get auxIptvPortalsModalPortalDisplaySettings =>
      'Portal Display Settings';

  @override
  String get auxIptvPortalsModalChoosePortalSource => 'Choose Portal Source';

  @override
  String get auxIptvPortalsModalCloudVault => 'Cloud Vault';

  @override
  String get auxIptvPortalsModalHighSpeedCloudDatabaseWithLiveIptv =>
      'High-speed cloud database with live IPTV servers';

  @override
  String get auxIptvPortalsModalRedditCommunities => 'Reddit Communities';

  @override
  String get auxIptvPortalsModalScrapesLiveSharedPastesFromSubreddits =>
      'Scrapes live shared pastes from subreddits';

  @override
  String get auxIptvPortalsModalDeleteAll => 'Delete All';

  @override
  String get auxIptvPortalsModalAddXtreamCodesPortal =>
      'Add Xtream Codes Portal';

  @override
  String get auxIptvPortalsModalVerifySave => 'Verify & Save';

  @override
  String get auxIptvPortalsModalAddM3uPlaylistSubscription =>
      'Add M3U Playlist Subscription';

  @override
  String get auxIptvPortalsModalFetchSave => 'Fetch & Save';

  @override
  String get auxIptvPortalsModalNoM3uPlaylistsSaved =>
      'No M3U playlists saved.';

  @override
  String get auxIptvPortalBrowserPageCustomizePortalBrowser =>
      'Customize Portal Browser';

  @override
  String get auxIptvPortalBrowserPageChannelStreamLayoutMode =>
      'Channel Stream Layout Mode';

  @override
  String get auxIptvPortalBrowserPageGridStreamColumns => 'Grid Stream Columns';

  @override
  String get auxIptvPortalBrowserPageShowChannelStreamLogos =>
      'Show Channel Stream Logos';

  @override
  String get auxIptvPortalBrowserPageShowEpgNowPlayingSnippet =>
      'Show EPG \"Now Playing\" Snippet';

  @override
  String get auxIptvPortalBrowserPageShowCategoryStreamCounts =>
      'Show Category Stream Counts';

  @override
  String get auxIptvPortalBrowserPageSelectCategory => 'Select Category';

  @override
  String get auxIptvPortalBrowserPageCustomizePortalBrowserLayout =>
      'Customize Portal Browser Layout';

  @override
  String get auxIptvPortalBrowserPageCheckHealth => 'Check Health';

  @override
  String get auxIptvPortalBrowserPageCustomize => 'Customize';

  @override
  String get auxIptvPortalBrowserPageCouldNotLoadThisPortal =>
      'Could not load this portal';

  @override
  String get auxIptvPortalBrowserPageNoFavoritedChannels =>
      'No Favorited Channels';

  @override
  String get auxIptvPortalBrowserPageTapTheStarIconOnAnyChannel =>
      'Tap the star icon on any channel to save it to your Favorites.';

  @override
  String get auxIptvPortalBrowserPageLiveStreamFeed => 'Live Stream Feed';

  @override
  String get auxIptvPortalBrowserPageCouldNotLoadEpisodes =>
      'Could not load episodes';

  @override
  String get auxIptvSearchPageSearch60LiveChannelsLeaguesNetworks =>
      'Search 60+ live channels, leagues, networks…';

  @override
  String get auxIptvSearchPageChannelCategories => 'Channel categories';

  @override
  String get auxIptvSearchPageNoChannelsMatchYourSearch =>
      'No channels match your search.';

  @override
  String get auxMangaDetailsPageSynopsis => 'Synopsis';

  @override
  String get auxMangaDetailsPageChapters => 'Chapters';

  @override
  String get auxMangaDetailsPageSearchChapters => 'Search chapters...';

  @override
  String get auxMangaDetailsPageStartReading => 'Start Reading';

  @override
  String get auxMangaPageCustomizeMangaSection => 'Customize Manga Section';

  @override
  String get auxMangaPageMangaPosterCardDensity => 'Manga poster card density';

  @override
  String get auxMangaPageShowContinueReadingSlider =>
      'Show \"Continue Reading\" Slider';

  @override
  String get auxMangaPageShowContentTypeBadgeOnPosters =>
      'Show Content Type Badge on Posters';

  @override
  String get auxMangaPageMoreAppearanceReaderSettings =>
      'More Appearance & Reader Settings';

  @override
  String get auxMangaPageContinueReading => 'Continue Reading';

  @override
  String get auxMangaPageNoMangaFound => 'No manga found';

  @override
  String get auxMangaPageSearchMangaManhwaManhua =>
      'Search Manga, Manhwa, Manhua...';

  @override
  String get auxMangaPageRemoveFromContinueReading =>
      'Remove from Continue Reading';

  @override
  String get auxMangaReaderPageReaderSettingsLayout =>
      'Reader Settings & Layout';

  @override
  String get auxMangaReaderPageReadingOrientationMode =>
      'Reading Orientation Mode';

  @override
  String get auxMangaReaderPageReadingOrientationMode2 =>
      'Reading orientation mode';

  @override
  String get auxMangaReaderPagePageReadingWidthConstraint =>
      'Page Reading Width Constraint';

  @override
  String get auxMangaReaderPagePageReadingWidthConstraint2 =>
      'Page reading width constraint';

  @override
  String get auxMangaReaderPageReaderBackgroundAtmosphere =>
      'Reader Background Atmosphere';

  @override
  String get auxMangaReaderPageShowPageDeckPreviewsDrawer =>
      'Show Page Deck Previews Drawer';

  @override
  String get auxMangaReaderPageShowNextChapterDeckCard =>
      'Show Next Chapter Deck Card';

  @override
  String get auxMangaReaderPageNoPagesFoundForThisChapter =>
      'No pages found for this chapter.';

  @override
  String get auxMangaReaderPageReadNextChapter => 'Read Next Chapter';

  @override
  String get auxMangaReaderPageBackToMangaDetails => 'Back to Manga Details';

  @override
  String get auxMangaReaderPagePageDeckPreview => 'Page Deck Preview';

  @override
  String get auxMultinutzPageSelectChannel => 'Select Channel';

  @override
  String get auxMultinutzPageStreamDetails => 'Stream Details';

  @override
  String get auxMultinutzPageAddLiveStreamFeed => 'Add Live Stream Feed';

  @override
  String get auxMultinutzPageBackToLiveTv => 'Back to Live TV';

  @override
  String get auxMultinutzPagePreviousLayout => 'Previous Layout';

  @override
  String get auxMultinutzPageNextLayout => 'Next Layout';

  @override
  String get auxMultinutzPageMuteAll => 'Mute All';

  @override
  String get auxMultinutzPageClearAllWindows => 'Clear All Windows';

  @override
  String get auxMusicPageNewPlaylist => 'New Playlist';

  @override
  String get auxMusicPageEnterPlaylistTitle => 'Enter playlist title...';

  @override
  String get auxMusicPageCreate => 'Create';

  @override
  String get auxMusicPageSaveToPlaylist => 'Save to Playlist';

  @override
  String get auxMusicPageNoCustomPlaylistsYet => 'No custom playlists yet';

  @override
  String get auxMusicPageCreateFirstPlaylist => 'Create First Playlist';

  @override
  String get auxMusicPageNewAlbumReleases => 'New Album Releases';

  @override
  String get auxMusicPageCuratedChartsMixes => 'Curated Charts & Mixes';

  @override
  String get auxMusicPageSearchResults => 'Search results';

  @override
  String get auxMusicPageSongs => 'Songs';

  @override
  String get auxMusicPageArtists => 'Artists';

  @override
  String get auxMusicPageAlbums => 'Albums';

  @override
  String get auxMusicPageBrowseMoodsGenres => 'Browse Moods & Genres';

  @override
  String get auxMusicPageRadioStationsLiveStreams =>
      'Radio Stations & Live Streams';

  @override
  String get auxMusicPageContinuousMusicChannelsTunedToYourMood =>
      'Continuous music channels tuned to your mood.';

  @override
  String get auxMusicPageYourLibrary => 'Your Library';

  @override
  String get auxMusicPageLikedSongs => 'Liked Songs';

  @override
  String get auxMusicPageDownloadedSongs => 'Downloaded Songs';

  @override
  String get auxMusicPageCustomPlaylists => 'Custom Playlists';

  @override
  String get auxMusicPageRecentlyPlayed => 'Recently Played';

  @override
  String get auxMusicPageMusicPlayerStudio => 'Music Player Studio';

  @override
  String get auxMusicPageMusicAtmosphereSettings => 'Music Atmosphere Settings';

  @override
  String get auxMusicPageAppSettings => 'App Settings';

  @override
  String get auxMusicPageMusicView => 'Music view';

  @override
  String get auxMusicPageAudioSourceQuality => 'Audio Source & Quality';

  @override
  String get auxMusicPageChooseYourPreferredMusicExtractionEngine =>
      'Choose your preferred music extraction engine';

  @override
  String get auxMusicPageFlacLosslessQobuzHiRes =>
      'FLAC Lossless (Qobuz Hi-Res)';

  @override
  String get auxMusicPageStudioMasterQualityUpTo24Bit =>
      'Studio master quality up to 24-bit/192kHz with zero compression';

  @override
  String get auxMusicPageYoutubeAudio => 'YouTube Audio';

  @override
  String get auxMusicPageHighSpeedAudioExtractionWithIntelligentTrack =>
      'High-speed audio extraction with intelligent track & duration matching';

  @override
  String get auxMusicPagePlayNow => 'Play Now';

  @override
  String get auxMusicPageTrendingArtists => 'Trending Artists';

  @override
  String get auxMusicPageDownloadedOffline => 'Downloaded (Offline)';

  @override
  String get auxMusicPageQueuedForDownload => 'Queued for download';

  @override
  String get auxMusicPageDownloadTrack => 'Download Track';

  @override
  String get auxMusicPageSyncedLyrics => 'Synced Lyrics';

  @override
  String get auxMusicPageNoLyricsFoundForThisTrack =>
      'No lyrics found for this track.';

  @override
  String get auxMusicPageQueueIsEmpty => 'Queue is empty';

  @override
  String get auxMusicPagePlayAll => 'Play All';

  @override
  String get auxMusicPageTopSongs => 'Top Songs';

  @override
  String get auxMusicPageAlbumsDiscography => 'Albums & Discography';

  @override
  String get auxMusicPagePlayAlbum => 'Play Album';

  @override
  String get auxMusicPageDownloadAlbum => 'Download Album';

  @override
  String get auxMusicPagePlayPlaylist => 'Play Playlist';

  @override
  String get auxMusicPageDownloadPlaylist => 'Download Playlist';

  @override
  String get auxMusicPageDownloadAll => 'Download All';

  @override
  String get auxMusicPageNoTracksInThisPlaylistYet =>
      'No tracks in this playlist yet';

  @override
  String get auxMusicPagePlayingQueue => 'Playing Queue';

  @override
  String get auxMusicPageKeyboardShortcuts => 'Keyboard Shortcuts';

  @override
  String get auxMusicPageShuffle => 'Shuffle';

  @override
  String get auxMusicPageSearchOffline => 'Search offline...';

  @override
  String get auxMusicPageDeleteFromDownloads => 'Delete from downloads';

  @override
  String get auxMusicPageDeleteDownloadedSong => 'Delete Downloaded Song';

  @override
  String get auxAboutSettingsPageZplayIsAnAllInOneEntertainment =>
      'Kiru is an all-in-one entertainment client bringing together movies, TV series, anime, live IPTV, music, manga, and audiobooks into a unified, high-performance interface with custom Liquid Glass visuals.';

  @override
  String get auxAboutSettingsPageDebridMultiSourceScrapers =>
      'Debrid & Multi-Source Scrapers';

  @override
  String get auxAboutSettingsPageDirectHighSpeedCloudPlaybackViaReal =>
      'Direct high-speed cloud playback via Real-Debrid, TorBox, and Stremio addons.';

  @override
  String get auxAboutSettingsPageLiquidGlassGlslShaders =>
      'Liquid Glass GLSL Shaders';

  @override
  String get auxAboutSettingsPageCustomRealTimeOpticalRefractionLensesAnd =>
      'Custom real-time optical refraction, lenses, and fluid physics.';

  @override
  String get auxAboutSettingsPageTraktCloudSynchronization =>
      'Trakt & Cloud Synchronization';

  @override
  String
  get auxAboutSettingsPageCrossPlatformWatchlistEpisodeTrackingAndPlayback =>
      'Cross-platform watchlist, episode tracking, and playback scrobbling.';

  @override
  String get auxAboutSettingsPagePoppinsIsBundledUnderTheSilOpen =>
      'Poppins is bundled under the SIL Open Font License 1.1.';

  @override
  String get auxAddonsSettingsPageItsCatalogsAndMetadataWillBeRemoved =>
      'Its catalogs and metadata will be removed from your home page.';

  @override
  String get auxAddonsSettingsPageWouldYouLikeToInstallAllPlugins =>
      'Would you like to install all plugins from this repository now so their streaming sources become available immediately on the watch screen?';

  @override
  String
  get auxAddonsSettingsPagePasteTheRepositoryUrlSupportsCloudstreamrepoRepo =>
      'Paste the repository URL (supports cloudstreamrepo://, repo.json, or plugins.json).';

  @override
  String get auxAddonsSettingsPageThisCloudstreamExtensionWillBeUninstalled =>
      'This CloudStream extension will be uninstalled.';

  @override
  String get auxAddonsSettingsPagePluginsFromThisRepositoryWillNotBe =>
      'Plugins from this repository will not be deleted, but repository updates will no longer be fetched.';

  @override
  String get auxAddonsSettingsPageInstallsTheAddonForTheDebridProvider =>
      'Installs the addon for the Debrid provider selected in Settings and fills your saved key in at request time, so the key is never stored twice.';

  @override
  String
  get auxAddonsSettingsPageCloudstreamCs3ExtensionsProvideStreamProvidersDirectly =>
      'CloudStream (.cs3) extensions provide stream providers directly from popular media sites. Extensions run locally in a sandboxed sidecar or native ART engine.';

  @override
  String get auxAddonsSettingsPage45Repos => '45+ Repos';

  @override
  String get auxAddonsSettingsPageBrowseCuratedTurkish3rabiEnglishHindiGlobal =>
      'Browse curated Turkish, 3rabi, English, Hindi & global repos with direct install links.';

  @override
  String get auxAddonsSettingsPageSetUpADebridProviderInSettings =>
      'Set up a Debrid provider in Settings first, then come back to connect it.';

  @override
  String
  get auxAppearanceSettingsPageUploadCustomPhotosChooseCuratedDarkWallpapers =>
      'Upload custom photos, choose curated dark wallpapers, and blend theme ambient lighting';

  @override
  String
  get auxAppearanceSettingsPageAdjustHoverImpactWobbleSpringPhysicsLens =>
      'Adjust hover impact, wobble spring physics, lens refraction, and chromatic aberration';

  @override
  String get auxAppearanceSettingsPageColorSchemesBecauseYouHaveOnYour =>
      'Color schemes, \"Because you have on your list\" smart slider, hero spotlight, and card density';

  @override
  String
  get auxAppearanceSettingsPageBroadcastHeroSpotlightChannelCardDensityCategory =>
      'Broadcast hero spotlight, channel card density, category ordering, and live badge styling';

  @override
  String
  get auxAppearanceSettingsPageAmbientMovingLightingCardDensityReadingLayout =>
      'Ambient moving lighting, card density, reading layout widths, webtoon/horizontal modes, and page deck preview';

  @override
  String get auxAppearanceSettingsPageHeroSpotlight5DistinctPlayerDesignsDrag =>
      'Hero spotlight, 5 distinct player designs, drag & drop modular studio, waveform canvas scrubber, and custom controls';

  @override
  String
  get auxAppearanceSettingsPageHeroSpotlightLosslessBadgesAndFullscreenPlayer =>
      'Hero spotlight, lossless badges, and fullscreen player studio for layout, seekbar, physics & turntable styling';

  @override
  String
  get auxBuiltinProvidersSettingsPageThisWillRestoreAll45ZplayhttpProviders =>
      'This will restore all 45 ZPlayHTTP providers to their default order and re-enable any disabled providers.';

  @override
  String
  get auxBuiltinProvidersSettingsPageStandardAutoSortingAcrossAll45Providers =>
      'Standard auto-sorting across all 45 providers';

  @override
  String get auxBuiltinProvidersSettingsPageInDefaultModeZplayUsesItsNative =>
      'In Default mode, ZPlay uses its native multi-source streaming engine. All providers run simultaneously, and results are smartly sorted by video resolution (4K, 1080p, 720p) and file size.';

  @override
  String get auxBuiltinProvidersSettingsPageProvidersAtTheTopScrapeFirstAnd =>
      'Providers at the top scrape first, and their results strictly display at the top of stream results, no matter the file size or quality.';

  @override
  String
  get auxDebridSettingsPageStreamTorrentsAndMagnetLinksInstantlyThrough =>
      'Stream torrents and magnet links instantly through high-speed cloud debrid providers without local peer-to-peer downloading.';

  @override
  String get auxDebridSettingsPageWhenEnabledAllTorrentsFromZplayAnd =>
      'When enabled, all torrents from Kiru and Stremio addons are resolved exclusively through your active Debrid provider without touching the local torrent engine.';

  @override
  String get auxServiceKeysSettingsPageRanksThe1990sRailsAndCoversThe =>
      'Ranks the 1990s rails and covers the scraper metadata lookups.';

  @override
  String get auxSimklSettingsPageConnectYourSimklAccountToSynchronizeMovies =>
      'Connect your Simkl account to synchronize Movies, TV Shows, and Anime watchlists, continue watching progress, and custom lists.';

  @override
  String get auxTraktSettingsPageConnectYourTraktTvAccountToSeamlessly =>
      'Connect your Trakt.tv account to seamlessly synchronize your watch history, watchlist, continue watching progress, and ratings across all your devices.';

  @override
  String get auxVideoSettingsPageAndroidSExoplayerFastestAt4k =>
      'Android\'s ExoPlayer (Fastest at 4K)';

  @override
  String get auxVideoSettingsPageMpvFullSubtitleControl =>
      'mpv (Full subtitle control)';

  @override
  String
  get auxVideoSettingsPageUsesFlutterSurfaceproducerToRenderFramesDirectly =>
      'Uses Flutter SurfaceProducer to render frames directly to hardware surface without texture blitting. Significantly boosts 4K/60fps playback and reduces battery usage on Android. (Keep disabled if your device experiences display glitches).';

  @override
  String get auxAudiobookPlayerStudioPagePlayerStudio => 'Player Studio';

  @override
  String get auxAudiobookPlayerStudioPageCustomAudiobookPlayerStudio =>
      'Custom Audiobook Player Studio';

  @override
  String
  get auxAudiobookPlayerStudioPageDragComponentsTransformSeekbarsCustomizeButtonPhysics =>
      'Drag components, transform seekbars, customize button physics';

  @override
  String get auxAudiobookPlayerStudioPageApplyAsActivePlayer =>
      'Apply As Active Player';

  @override
  String get auxAudiobookPlayerStudioPageCustomPlayerStudioLayoutAppliedSetAs =>
      'Custom Player Studio layout applied & set as active player!';

  @override
  String get auxAudiobookPlayerStudioPageStudioDesigner => 'Studio Designer';

  @override
  String get auxAudiobookPlayerStudioPageLivePreviewCanvas =>
      'Live Preview Canvas';

  @override
  String get auxAudiobookPlayerStudioPageTestLiveCanvas => 'Test Live Canvas';

  @override
  String get auxAudiobookPlayerStudioPageBackToCustomizer =>
      'Back to Customizer';

  @override
  String get auxAudiobookPlayerStudioPageLiveInteractiveCanvas =>
      'LIVE INTERACTIVE CANVAS';

  @override
  String get auxAudiobookPlayerStudioPageCustomStudio => 'CUSTOM STUDIO';

  @override
  String get auxAudiobookPlayerStudioPagePremadeChaptersPanel =>
      'Premade Chapters Panel';

  @override
  String get auxAudiobookPlayerStudioPagePremadeChaptersPanelPreview =>
      'Premade Chapters Panel Preview';

  @override
  String get auxAudiobookPlayerStudioPageDragDropComponentArranger =>
      'Drag & Drop Component Arranger';

  @override
  String get auxAudiobookPlayerStudioPageHoldAndDragAnyBlockToReorder =>
      'Hold and drag any block to reorder the vertical layout of your audio player in real-time.';

  @override
  String get auxAudiobookPlayerStudioPageSeekBarCanvasScrubberStyles =>
      'Seek Bar Canvas & Scrubber Styles';

  @override
  String get auxAudiobookPlayerStudioPageSelectHowYourProgressBarAndScrubber =>
      'Select how your progress bar and scrubber render inside your custom player canvas.';

  @override
  String get auxAudiobookPlayerStudioPageHoverTouchPhysics =>
      'Hover & Touch Physics';

  @override
  String get auxAudiobookPlayerStudioPageLiveTouchHoverPhysicsPlayground =>
      'Live Touch & Hover Physics Playground';

  @override
  String get auxAudiobookPlayerStudioPageArtworkDisplayMode =>
      'Artwork Display Mode';

  @override
  String get auxAudiobookSettingsPageEnableMovingAmbientAtmosphere =>
      'Enable Moving Ambient Atmosphere';

  @override
  String get auxAudiobookSettingsPageLightingFlowPattern =>
      'Lighting Flow Pattern';

  @override
  String get auxAudiobookSettingsPageGlowStrengthOpacity =>
      'Glow Strength / Opacity';

  @override
  String get auxAudiobookSettingsPageMotionDriftSpeed => 'Motion Drift Speed';

  @override
  String get auxAudiobookSettingsPageLiveAtmospherePreview =>
      'Live Atmosphere Preview';

  @override
  String get auxAudiobookSettingsPageShowHeroSpotlightCarousel =>
      'Show Hero Spotlight Carousel';

  @override
  String
  get auxAudiobookSettingsPageFeaturedBestsellingAudiobookShowcaseAtTheTop =>
      'Featured bestselling audiobook showcase at the top of the hub';

  @override
  String get auxAudiobookSettingsPageQuickResumeCardsWithChapterProgressBar =>
      'Quick resume cards with chapter progress bar and direct play';

  @override
  String get auxAudiobookSettingsPageAudiobookPosterCardDensity =>
      'Audiobook Poster Card Density';

  @override
  String get auxAudiobookSettingsPageShowQuickGenreCategoryBadges =>
      'Show Quick Genre & Category Badges';

  @override
  String get auxAudiobookSettingsPageShowAudiobookRuntimeTotalDuration =>
      'Show Audiobook Runtime / Total Duration';

  @override
  String get auxAudiobookSettingsPagePosterCardHoverGlowElevation =>
      'Poster Card Hover Glow & Elevation';

  @override
  String get auxAudiobookSettingsPageVisualCustomPlayerStudio =>
      'Visual Custom Player Studio';

  @override
  String get auxAudiobookSettingsPageFullStudio => 'FULL STUDIO';

  @override
  String
  get auxAudiobookSettingsPageDragDropLayoutElementsProceduralWaveformCanvases =>
      'Drag & drop layout elements, procedural waveform canvases, liquid glass buttons, and premade chapters panel in real-time.';

  @override
  String get auxAudiobookSettingsPageEnterCustomPlayerStudio =>
      'Enter Custom Player Studio';

  @override
  String get auxAudiobookSettingsPageInteractiveStudioPreview =>
      'Interactive Studio Preview';

  @override
  String get auxAudiobookSettingsPageSeekBarScrubberStyle =>
      'Seek Bar / Scrubber Style';

  @override
  String get auxAudiobookSettingsPagePlayPauseButtonStyling =>
      'Play / Pause Button Styling';

  @override
  String get auxAudiobookSettingsPageArtworkDisplayStyle =>
      'Artwork Display Style';

  @override
  String get auxAudiobookSettingsPageButtonHoverTouchPhysics =>
      'Button Hover & Touch Physics';

  @override
  String get auxAudiobookSettingsPagePlayerLayoutComponentsDragToArrange =>
      'Player Layout Components (Drag to Arrange)';

  @override
  String get auxAudiobookSettingsPageHoldAndDragAnyBlockToReorder =>
      'Hold and drag any block to reorder how controls appear inside your player';

  @override
  String get auxAudiobookSettingsPageLiquidGlassPlayerBlurRefraction =>
      'Liquid Glass Player Blur & Refraction';

  @override
  String get auxAudiobookSettingsPageShowPlaybackSpeedSelector05x2 =>
      'Show Playback Speed Selector (0.5x - 2.5x)';

  @override
  String get auxAudiobookSettingsPageShowSkipForwardRewindButtons10s =>
      'Show Skip Forward/Rewind Buttons (±10s)';

  @override
  String get auxAudiobookSettingsPageShowQuickChaptersSlidingDrawerButton =>
      'Show Quick Chapters Sliding Drawer Button';

  @override
  String get auxAudiobookSettingsPageLaunchFullCustomPlayerStudio =>
      'Launch Full Custom Player Studio';

  @override
  String get auxCustomBackgroundSettingsPageUploadYourOwnPhotoOrChooseA =>
      'Upload your own photo or choose a curated wallpaper. Theme colors and moving ambient lights softly blend into the background for a unified look.';

  @override
  String get auxCustomBackgroundSettingsPageResetToDefaultBackground =>
      'Reset to Default Background';

  @override
  String get auxCustomBackgroundSettingsPageOrPasteImageUrlHttps =>
      'Or paste image URL (https://...)';

  @override
  String get auxCustomBackgroundSettingsPageCuratedDarkWallpapers =>
      'CURATED DARK WALLPAPERS';

  @override
  String get auxCustomBackgroundSettingsPageWallpaperLightBlendingControls =>
      'WALLPAPER & LIGHT BLENDING CONTROLS';

  @override
  String get auxCustomBackgroundSettingsPagePhotoVisibilityDarkness =>
      'Photo Visibility / Darkness';

  @override
  String get auxCustomBackgroundSettingsPagePhotoSoftBlur => 'Photo Soft Blur';

  @override
  String get auxCustomBackgroundSettingsPageThemeColorTintOverlay =>
      'Theme Color Tint Overlay';

  @override
  String get auxCustomBackgroundSettingsPageBlendMovingAmbientLights =>
      'Blend Moving Ambient Lights';

  @override
  String
  get auxCustomBackgroundSettingsPageSoftlyIlluminatesAndAnimatesThemeLightsOver =>
      'Softly illuminates and animates theme lights over your wallpaper';

  @override
  String get auxHomeUiSettingsPageColorThemesAccents =>
      'COLOR THEMES & ACCENTS';

  @override
  String get auxHomeUiSettingsPageAmbientBackgroundLightingMovingGlows =>
      'AMBIENT BACKGROUND LIGHTING & MOVING GLOWS';

  @override
  String get auxHomeUiSettingsPageCustomBackgroundWallpaper =>
      'CUSTOM BACKGROUND & WALLPAPER';

  @override
  String get auxHomeUiSettingsPageCustomWallpaperLightingBlend =>
      'Custom Wallpaper & Lighting Blend';

  @override
  String get auxHomeUiSettingsPageSmartRecommendationsBecauseYouHaveOnYour =>
      'SMART RECOMMENDATIONS (\"BECAUSE YOU HAVE ON YOUR LIST\")';

  @override
  String get auxHomeUiSettingsPageCuratedCollections => 'CURATED COLLECTIONS';

  @override
  String get auxHomeUiSettingsPageHeroBannerSpotlight =>
      'HERO BANNER & SPOTLIGHT';

  @override
  String get auxHomeUiSettingsPagePosterCardsDensity =>
      'POSTER CARDS & DENSITY';

  @override
  String get auxHomeUiSettingsPageHeaderShortcutsButtons =>
      'HEADER SHORTCUTS & BUTTONS';

  @override
  String get auxHomeUiSettingsPageLiveLightingEnginePreview =>
      'LIVE LIGHTING ENGINE PREVIEW';

  @override
  String get auxHomeUiSettingsPageMovingAmbientLightsGlows =>
      'Moving Ambient Lights & Glows';

  @override
  String get auxHomeUiSettingsPageDriftingFadedLightWavesFloatingColorOrbs =>
      'Drifting faded light waves & floating color orbs in background';

  @override
  String get auxHomeUiSettingsPageLightingPatternPosition =>
      'Lighting Pattern & Position';

  @override
  String get auxHomeUiSettingsPageGlowStrengthIntensity =>
      'Glow Strength / Intensity';

  @override
  String get auxHomeUiSettingsPageMotionFlowSpeed => 'Motion Flow Speed';

  @override
  String get auxHomeUiSettingsPageSmartRecommendations =>
      'Smart Recommendations';

  @override
  String
  get auxHomeUiSettingsPageConfigurePersonalizedAlgorithmicRecommendationSliders =>
      'Configure personalized & algorithmic recommendation sliders';

  @override
  String get auxHomeUiSettingsPageBecauseYouHaveMyList =>
      '\"Because You Have...\" (My List)';

  @override
  String
  get auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnTitlesSavedIn =>
      'BestSimilar recommendations based on titles saved in My List';

  @override
  String
  get auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnActiveContinueWatching =>
      'BestSimilar recommendations based on active Continue Watching titles';

  @override
  String get auxHomeUiSettingsPageHideRailsWithNoArtwork =>
      'Hide Rails With No Artwork';

  @override
  String get auxHomeUiSettingsPageTraktRecommendations =>
      'Trakt Recommendations';

  @override
  String get auxHomeUiSettingsPageSimklRecommendations =>
      'Simkl Recommendations';

  @override
  String get auxHomeUiSettingsPageRecommendationSlidersPositionOnHomePage =>
      'Recommendation Sliders Position on Home Page';

  @override
  String get auxHomeUiSettingsPageShowCuratedCollectionRailsOnTheHome =>
      'Show curated collection rails on the Home page';

  @override
  String get auxHomeUiSettingsPageShowHeroSpotlightBanner =>
      'Show Hero Spotlight Banner';

  @override
  String get auxHomeUiSettingsPageFeaturedRotationBannerAtTheTopOf =>
      'Featured rotation banner at the top of the home page';

  @override
  String get auxHomeUiSettingsPageSpotlightStyle => 'Spotlight Style';

  @override
  String get auxHomeUiSettingsPageAutoRotateSpotlight =>
      'Auto-Rotate Spotlight';

  @override
  String get auxHomeUiSettingsPageCyclesThroughFeaturedTitlesAutomatically =>
      'Cycles through featured titles automatically';

  @override
  String get auxHomeUiSettingsPageAmbientBackdropLighting =>
      'Ambient Backdrop Lighting';

  @override
  String get auxHomeUiSettingsPageSoftDiffusedColorGlowBehindActiveHero =>
      'Soft diffused color glow behind active hero poster';

  @override
  String get auxHomeUiSettingsPagePosterSizeGridDensity =>
      'Poster Size & Grid Density';

  @override
  String get auxHomeUiSettingsPageShowImdbRatingBadges =>
      'Show IMDB Rating Badges';

  @override
  String get auxHomeUiSettingsPageDisplayRatingStarPillOnPosterCorners =>
      'Display rating star pill on poster corners';

  @override
  String get auxHomeUiSettingsPagePosterHoverZoomScale =>
      'Poster Hover Zoom Scale';

  @override
  String get auxHomeUiSettingsPageShowTvCalendarButtonsOnHomeBar =>
      'Show TV Calendar buttons on Home bar & sliders';

  @override
  String get auxHomeUiSettingsPageAiRecommendationQuiz =>
      'AI Recommendation Quiz';

  @override
  String get auxHomeUiSettingsPageShowAiQuizButtonOnHomeSearch =>
      'Show AI Quiz button on Home & Search bars';

  @override
  String get auxLiquidGlassSettingsPageLiquidGlassSettingsResetToDefaults =>
      'Liquid Glass settings reset to defaults.';

  @override
  String get auxLiquidGlassSettingsPageEnableLiquidGlass =>
      'Enable Liquid Glass';

  @override
  String
  get auxLiquidGlassSettingsPageRealTimeRefractionShadersJellySpringsAnd =>
      'Real-time refraction shaders, jelly springs, and lenses';

  @override
  String get auxLiquidGlassSettingsPagePresets => 'PRESETS';

  @override
  String get auxLiquidGlassSettingsPagePhysicsOpticalParameters =>
      'PHYSICS & OPTICAL PARAMETERS';

  @override
  String get auxLiquidGlassSettingsPageHoverScaleImpact => 'Hover Scale Impact';

  @override
  String
  get auxLiquidGlassSettingsPageMagnificationAmountAppliedToThePlayerGlass =>
      'Magnification amount applied to the player glass controls on hover';

  @override
  String get auxLiquidGlassSettingsPageWobbleFluidElasticity =>
      'Wobble & Fluid Elasticity';

  @override
  String
  get auxLiquidGlassSettingsPageSpringBounceIntensityAndDeformationResponsiveness =>
      'Spring bounce intensity and deformation responsiveness';

  @override
  String get auxLiquidGlassSettingsPageOpticalRefractionIndex =>
      'Optical Refraction Index';

  @override
  String
  get auxLiquidGlassSettingsPageLightBendingAndBackgroundWarpIndexInside =>
      'Light bending and background warp index inside glass lenses';

  @override
  String get auxLiquidGlassSettingsPageLensMagnification =>
      'Lens Magnification';

  @override
  String
  get auxLiquidGlassSettingsPageUnderlyingZoomFactorSeenThroughTheGlass =>
      'Underlying zoom factor seen through the glass volume';

  @override
  String get auxLiquidGlassSettingsPageChromaticAberrationPrismSplit =>
      'Chromatic Aberration (Prism Split)';

  @override
  String
  get auxLiquidGlassSettingsPageSeparatesRgbSpectrumColorsAlongOpticalGlass =>
      'Separates RGB spectrum colors along optical glass bevels';

  @override
  String get auxLiquidGlassSettingsPageFrostedGlassBlur => 'Frosted Glass Blur';

  @override
  String
  get auxLiquidGlassSettingsPageGaussianBlurDiffusionAppliedBehindGlassComponents =>
      'Gaussian blur diffusion applied behind glass components';

  @override
  String get auxLiquidGlassSettingsPageSpecularLightShimmer =>
      'Specular Light & Shimmer';

  @override
  String
  get auxLiquidGlassSettingsPageGlossySpecularReflectionAndBorderIlluminationIntensity =>
      'Glossy specular reflection and border illumination intensity';

  @override
  String get auxLiquidGlassSettingsPageBorderWidth => 'Border Width';

  @override
  String
  get auxLiquidGlassSettingsPageThicknessOfTheRefractiveOuterBoundaryEdge =>
      'Thickness of the refractive outer boundary edge';

  @override
  String get auxLiquidGlassSettingsPageHoverOrTapTheIconsToPreview =>
      'Hover or tap the icons to preview spring wobble & scale';

  @override
  String get auxLiveTvSettingsPageLiveSpotlightHeroBanner =>
      'LIVE SPOTLIGHT & HERO BANNER';

  @override
  String get auxLiveTvSettingsPageChannelCardsPosterDensity =>
      'CHANNEL CARDS & POSTER DENSITY';

  @override
  String get auxLiveTvSettingsPageSectionsCategoryManager =>
      'SECTIONS & CATEGORY MANAGER';

  @override
  String get auxLiveTvSettingsPagePortalsPlaylistsModal =>
      'PORTALS & PLAYLISTS MODAL';

  @override
  String get auxLiveTvSettingsPagePortalBrowserChannelGuide =>
      'PORTAL BROWSER & CHANNEL GUIDE';

  @override
  String get auxLiveTvSettingsPageStreamSources => 'STREAM SOURCES';

  @override
  String get auxLiveTvSettingsPageShowLiveSpotlightBanner =>
      'Show Live Spotlight Banner';

  @override
  String
  get auxLiveTvSettingsPageFeaturedChampionshipMatchesAndTopBroadcastChannels =>
      'Featured championship matches and top broadcast channels at the top';

  @override
  String get auxLiveTvSettingsPageHeroBannerStyle => 'Hero Banner Style';

  @override
  String get auxLiveTvSettingsPageAutoRotateChannels => 'Auto-Rotate Channels';

  @override
  String get auxLiveTvSettingsPageAutomaticallyCycleThroughFeaturedLiveEvents =>
      'Automatically cycle through featured live events';

  @override
  String get auxLiveTvSettingsPageRotationInterval => 'Rotation Interval';

  @override
  String get auxLiveTvSettingsPageChannelCardSize => 'Channel Card Size';

  @override
  String get auxLiveTvSettingsPageCardHoverScaleZoom => 'Card Hover Scale Zoom';

  @override
  String get auxLiveTvSettingsPageShowLiveHdStreamBadge =>
      'Show LIVE / HD Stream Badge';

  @override
  String get auxLiveTvSettingsPageDisplayRadiantLiveBroadcastBadgeOnChannel =>
      'Display radiant live broadcast badge on channel corners';

  @override
  String get auxLiveTvSettingsPageShowChannelCategoryTag =>
      'Show Channel Category Tag';

  @override
  String get auxLiveTvSettingsPageShowCategoryLabelBelowChannelName =>
      'Show category label below channel name';

  @override
  String get auxLiveTvSettingsPageShowFeedHealthBadge =>
      'Show Feed Health Badge';

  @override
  String get auxLiveTvSettingsPageMarkAChannelAsAliveUncheckedOr =>
      'Mark a channel as alive, unchecked or dead on the Boxing row';

  @override
  String get auxLiveTvSettingsPageChannelCategoriesSections =>
      'Channel Categories & Sections';

  @override
  String get auxLiveTvSettingsPageToggleVisibilityOfLiveTvRows =>
      'Toggle visibility of Live TV rows';

  @override
  String get auxLiveTvSettingsPageResetAll => 'Reset All';

  @override
  String get auxLiveTvSettingsPagePortalCardDisplayStyle =>
      'Portal Card Display Style';

  @override
  String get auxLiveTvSettingsPageShowPortalExpiryDate =>
      'Show Portal Expiry Date';

  @override
  String
  get auxLiveTvSettingsPageDisplaySubscriptionExpirationTagOnPortalCards =>
      'Display subscription expiration tag on portal cards';

  @override
  String get auxLiveTvSettingsPageShowMaxActiveConnectionsTag =>
      'Show Max Active Connections Tag';

  @override
  String
  get auxLiveTvSettingsPageDisplayCurrentAndMaxConcurrentStreamingConnections =>
      'Display current and max concurrent streaming connections';

  @override
  String get auxLiveTvSettingsPageDefaultStartingTab => 'Default Starting Tab';

  @override
  String get auxLiveTvSettingsPageXtreamPanels => 'Xtream Panels';

  @override
  String get auxLiveTvSettingsPageM3uPlaylists => 'M3U Playlists';

  @override
  String get auxLiveTvSettingsPageCategorySidebarWidth =>
      'Category Sidebar Width';

  @override
  String get auxLiveTvSettingsPageDisplayChannelPosterAndLogosInStream =>
      'Display channel poster and logos in stream rows';

  @override
  String
  get auxLiveTvSettingsPageDisplayCurrentTelevisionGuideTitleBelowChannel =>
      'Display current television guide title below channel';

  @override
  String get auxLiveTvSettingsPageShowNumberOfAvailableStreamsNextTo =>
      'Show number of available streams next to category names';

  @override
  String get auxLiveTvSettingsPageIncludeFreePublicSources =>
      'Include Free Public Sources';

  @override
  String get auxMangaSettingsPageEnableMovingAmbientLighting =>
      'Enable Moving Ambient Lighting';

  @override
  String get auxMangaSettingsPageDisplayYourActiveReadingHistoryAtThe =>
      'Display your active reading history at the top of the Manga page';

  @override
  String get auxMangaSettingsPageMangaPosterCardDensity =>
      'Manga Poster Card Density';

  @override
  String get auxMangaSettingsPageShowContentTypeBadgeMangaManhwa =>
      'Show Content Type Badge (Manga/Manhwa)';

  @override
  String get auxMangaSettingsPageShowPublicationYearOnCards =>
      'Show Publication Year on Cards';

  @override
  String get auxMangaSettingsPagePosterCardHoverGlowEffect =>
      'Poster Card Hover Glow Effect';

  @override
  String get auxMangaSettingsPageShowDesktopScrollTrack =>
      'Show Desktop Scroll Track';

  @override
  String get auxMangaSettingsPageDefaultReadingMode => 'Default Reading Mode';

  @override
  String get auxMangaSettingsPageControlToolbarStyle => 'Control Toolbar Style';

  @override
  String get auxMangaSettingsPageVerticalPageGap => 'Vertical Page Gap';

  @override
  String get auxMangaSettingsPageShowPageDeckThumbnailPreviews =>
      'Show Page Deck / Thumbnail Previews';

  @override
  String get auxMangaSettingsPageInteractiveVisualTrayOfThumbnailPreviewsFor =>
      'Interactive visual tray of thumbnail previews for instant page jumping';

  @override
  String get auxMangaSettingsPageShowPageScrubberSlider =>
      'Show Page Scrubber Slider';

  @override
  String get auxMangaSettingsPageEnableNextChapterPreviewCardDeck =>
      'Enable Next Chapter Preview Card Deck';

  @override
  String get auxMangaSettingsPageRichGlassDeckCardAtTheEnd =>
      'Rich glass deck card at the end of each chapter with chapter art and direct launch';

  @override
  String get auxMusicPlayerStudioPageCustomMusicPlayerStudio =>
      'Custom Music Player Studio';

  @override
  String
  get auxMusicPlayerStudioPageDesignTheFullscreenPlayerDragComponentsCustomize =>
      'Design the fullscreen player, drag components, customize physics & liquid glass';

  @override
  String get auxMusicPlayerStudioPageApplyActive => 'Apply Active';

  @override
  String get auxMusicPlayerStudioPageCustomFullscreenPlayerStudioLayoutSetAs =>
      'Custom Fullscreen Player Studio layout set as active player!';

  @override
  String get auxMusicPlayerStudioPageFullscreenLiveStudio =>
      'FULLSCREEN LIVE STUDIO';

  @override
  String get auxMusicPlayerStudioPageFlac24Bit96khzLossless =>
      'FLAC 24-BIT / 96KHZ LOSSLESS';

  @override
  String get auxMusicPlayerStudioPageSyncedLyricsSandbox =>
      'Synced Lyrics Sandbox';

  @override
  String get auxMusicPlayerStudioPagePlayingQueueSandbox4Tracks =>
      'Playing Queue Sandbox (4 Tracks)';

  @override
  String get auxMusicPlayerStudioPageFullscreenPlayerDragDropArranger =>
      'Fullscreen Player Drag & Drop Arranger';

  @override
  String get auxMusicPlayerStudioPageHoldAndDragAnyBlockToReorder =>
      'Hold and drag any block to reorder the layout of your fullscreen player in real-time.';

  @override
  String get auxMusicPlayerStudioPageSeekBarCanvasScrubberEngine =>
      'Seek Bar Canvas Scrubber Engine';

  @override
  String
  get auxMusicPlayerStudioPageSelectHowAudioWaveformsAndScrubbingTracks =>
      'Select how audio waveforms and scrubbing tracks render across your music player.';

  @override
  String get auxMusicPlayerStudioPagePlayButtonAestheticStyle =>
      'Play Button Aesthetic & Style';

  @override
  String get auxMusicPlayerStudioPageHoverTouchPhysicsEngine =>
      'Hover & Touch Physics Engine';

  @override
  String
  get auxMusicPlayerStudioPageSelectTheInteractivePhysicsFeedbackAppliedWhen =>
      'Select the interactive physics feedback applied when hovering or pressing controls.';

  @override
  String get auxMusicPlayerStudioPageLivePhysicsTestingPad =>
      'Live Physics Testing Pad';

  @override
  String get auxMusicPlayerStudioPageArtworkTurntablePresentation =>
      'Artwork & Turntable Presentation';

  @override
  String
  get auxMusicPlayerStudioPageSelectHowAlbumCoversVinylTurntableAnimations =>
      'Select how album covers, vinyl turntable animations, and cards display in the player.';

  @override
  String get auxMusicSettingsPageMusicUiPlayerAtmosphere =>
      'Music UI & Player Atmosphere';

  @override
  String get auxMusicSettingsPageMovingBackgroundAmbientLighting =>
      'Moving Background Ambient Lighting';

  @override
  String get auxMusicSettingsPageDynamicMovingGlowingOrbsReactingWithYour =>
      'Dynamic moving glowing orbs reacting with your theme accent colors';

  @override
  String get auxMusicSettingsPageAmbientLightPattern => 'Ambient Light Pattern';

  @override
  String get auxMusicSettingsPageShowHeroSpotlightShowcase =>
      'Show Hero Spotlight Showcase';

  @override
  String get auxMusicSettingsPageFeaturedBestsellingAlbumTrackShowcaseAtThe =>
      'Featured bestselling album & track showcase at the top of the music page';

  @override
  String get auxMusicSettingsPageShowLosslessHiResAudioBadges =>
      'Show Lossless Hi-Res Audio Badges';

  @override
  String get auxMusicSettingsPageDisplaysFlacHiResLosslessStreamIndicators =>
      'Displays FLAC / Hi-Res lossless stream indicators on music cards and player';

  @override
  String get auxMusicSettingsPageMusicCardGridDensity =>
      'Music Card & Grid Density';

  @override
  String get auxMusicSettingsPageFullPlayerEngine => 'FULL PLAYER ENGINE';

  @override
  String get auxMusicSettingsPageCustomizeTheFullscreenPlayerDragDropBlocks =>
      'Customize the Fullscreen Player. Drag & drop blocks, waveform equalizers, vinyl turntable & liquid glass buttons.';

  @override
  String get auxMusicSettingsPageLiveWaveformControlsPreview =>
      'Live Waveform & Controls Preview';

  @override
  String get auxMusicSettingsPageOpenFullStudio => 'Open Full Studio ➔';

  @override
  String get auxMangaReaderControlsReaderAtmosphere => 'Reader Atmosphere:';

  @override
  String get auxLiveGuideBandUpcomingOnThisChannel =>
      'Upcoming On This Channel';

  @override
  String get auxLiveGuideBandNothingElseListedForThisChannel =>
      'Nothing else listed for this channel.';

  @override
  String get auxLiveGuideBandNoProgrammeGuideForThisChannelYet =>
      'No programme guide for this channel yet.';

  @override
  String get auxLiveGuideBandFindLiveStreams => 'Find Live Streams';

  @override
  String get auxLiveGuideBandWatchLiveStream => 'Watch Live Stream';

  @override
  String get auxComicReaderViewZoomOutCtrl => 'Zoom Out (Ctrl -)';

  @override
  String get auxComicReaderViewZoomInCtrl => 'Zoom In (Ctrl +)';

  @override
  String get auxComicReaderViewResetZoom100 => 'Reset Zoom (100%)';

  @override
  String get auxFocusModeViewFocusModeActive => 'Focus Mode Active';

  @override
  String get auxFocusModeViewExitFocusMode => 'Exit Focus Mode';

  @override
  String get auxFocusModeViewExitEsc => 'Exit (Esc)';

  @override
  String get auxFocusModeViewTapAboveBelowToMoveKeysTo =>
      'Tap above/below to move · ↑ ↓ keys to navigate';

  @override
  String get auxFocusModeViewPreviousLineUpArrow => 'Previous Line (Up Arrow)';

  @override
  String get auxFocusModeViewNextLineDownArrowSpace =>
      'Next Line (Down Arrow / Space)';

  @override
  String get auxReaderCustomizationSheetAppearance => 'Appearance';

  @override
  String get auxReaderCustomizationSheetLight => 'Light';

  @override
  String get auxReaderCustomizationSheetSepia => 'Sepia';

  @override
  String get auxReaderCustomizationSheetDark => 'Dark';

  @override
  String get auxReaderCustomizationSheetContinuousScroll => 'Continuous Scroll';

  @override
  String get auxReaderCustomizationSheetPaginatedTurns => 'Paginated Turns';

  @override
  String dynamicAnimeCardEps(String v1) {
    return '$v1 EPS';
  }

  @override
  String dynamicMultinutzChannelSheetCopied(String v1) {
    return 'Copied: $v1';
  }

  @override
  String dynamicMultinutzChannelSheetExpires(String v1) {
    return 'Expires: $v1';
  }

  @override
  String dynamicMultinutzChannelSheetConnections(String v1, String v2) {
    return 'Connections: $v1/$v2';
  }

  @override
  String dynamicMultinutzChannelSheetLiveChannels(String v1) {
    return '$v1 live channels';
  }

  @override
  String dynamicMultinutzChannelSheetChannels(String v1) {
    return '$v1 channels';
  }

  @override
  String dynamicPlayerEpisodesPanelEpisodes(String v1, String v2) {
    return '$v1 • $v2 Episodes';
  }

  @override
  String dynamicPlayerEpisodesPanelEp(String v1) {
    return 'EP $v1';
  }

  @override
  String dynamicPlayerSourcesPanelEpisode(String v1) {
    return 'Episode $v1';
  }

  @override
  String dynamicPlayerSourcesPanelSE(String v1, String v2) {
    return 'S$v1 : E$v2';
  }

  @override
  String dynamicPlayerSourcesPanelAllProvidersWatchingVia(String v1) {
    return 'All providers · watching via $v1';
  }

  @override
  String dynamicTextSyncOverlayErrorSavingSync(String v1) {
    return 'Error saving sync: $v1';
  }

  @override
  String dynamicMagnetFilesView(String v1, String v2) {
    return '$v1 $v2';
  }

  @override
  String dynamicMagnetFilesView2(String v1, String v2) {
    return '$v1 $v2';
  }

  @override
  String dynamicUpdateDialogVersion(String v1) {
    return 'Version $v1';
  }

  @override
  String dynamicUpdateDialogDownloadFailed(String v1) {
    return 'Download failed: $v1';
  }

  @override
  String dynamicWewatchQuizPage3Rated(String v1) {
    return '$v1/3 rated';
  }

  @override
  String dynamicWewatchQuizPageCinemaPicksTailoredToYourTaste(String v1) {
    return '$v1 cinema picks tailored to your taste profile';
  }

  @override
  String dynamicWewatchQuizPageMatch(String v1) {
    return '$v1% match';
  }

  @override
  String dynamicAnimeDetailsPageEp(String v1, String v2) {
    return '$v1 Ep$v2';
  }

  @override
  String dynamicAnimePageEpisode(String v1) {
    return 'Episode $v1';
  }

  @override
  String dynamicAnimePageCurrentlyAiringHits(String v1) {
    return 'Currently airing hits · $v1';
  }

  @override
  String dynamicAnimeSearchPageSort(String v1) {
    return 'Sort: $v1';
  }

  @override
  String dynamicAnimeStreamSheetEpisode(String v1, String v2) {
    return '$v1 - Episode $v2';
  }

  @override
  String dynamicAnimeStreamSheetEp(String v1, String v2) {
    return '$v1 • Ep $v2';
  }

  @override
  String dynamicAnimeStreamSheetNoSourcesFound(String v1) {
    return 'No $v1 sources found.';
  }

  @override
  String dynamicAnimeArabicDetailsPageWatchEpisode(String v1) {
    return 'Watch episode $v1';
  }

  @override
  String dynamicAnimeArabicDetailsPageEp(String v1) {
    return 'EP $v1';
  }

  @override
  String dynamicAnimeArabicStreamSheetEpisode(String v1, String v2) {
    return '$v1 - Episode $v2';
  }

  @override
  String dynamicAudiobooksPageLeft(String v1) {
    return '$v1 left';
  }

  @override
  String dynamicAudiobooksPageLocal(String v1) {
    return '$v1 • Local';
  }

  @override
  String dynamicAudiobooksPageCompleted(String v1) {
    return '$v1% completed';
  }

  @override
  String dynamicAudiobookPlayerScreenChapterOf(
    String v1,
    String v2,
    String v3,
  ) {
    return 'Chapter $v1 of $v2 • $v3';
  }

  @override
  String dynamicAudiobookPlayerScreenChapters(String v1) {
    return '$v1 CHAPTERS';
  }

  @override
  String dynamicGenerateAudiobookScreenGenerationFailed(String v1) {
    return 'Generation failed: $v1';
  }

  @override
  String dynamicGenerateAudiobookScreenRemoveFromTheGenerationList(String v1) {
    return 'Remove \"$v1\" from the generation list?';
  }

  @override
  String dynamicGenerateAudiobookScreenSelectedAudioFileS(String v1) {
    return 'Selected $v1 audio file(s):';
  }

  @override
  String dynamicGenerateAudiobookScreenGenerationQueueCompleted(String v1) {
    return 'GENERATION QUEUE & COMPLETED ($v1)';
  }

  @override
  String dynamicGenerateAudiobookScreenDownloadedBooksFromLibrary(String v1) {
    return 'DOWNLOADED BOOKS FROM LIBRARY ($v1)';
  }

  @override
  String dynamicGenerateAudiobookScreenSizeMb(String v1) {
    return 'Size: $v1 MB';
  }

  @override
  String dynamicGenerateAudiobookScreenVoice(String v1) {
    return 'Voice: $v1';
  }

  @override
  String dynamicGenerateAudiobookScreenImportedAudiobooks(String v1) {
    return 'IMPORTED AUDIOBOOKS ($v1)';
  }

  @override
  String dynamicGenerateAudiobookScreenPartSMb(
    String v1,
    String v2,
    String v3,
  ) {
    return '$v1 • $v2 part(s) ($v3 MB)';
  }

  @override
  String dynamicGenerateAudiobookScreenDeleteFromYourLibrary(String v1) {
    return 'Delete \"$v1\" from your library?';
  }

  @override
  String dynamicBookDetailSheetFailedToDownloadBook(String v1) {
    return 'Failed to download book: $v1';
  }

  @override
  String dynamicBookDetailSheetCompleted(String v1) {
    return '$v1% Completed';
  }

  @override
  String dynamicEpubReaderPageChOf(String v1, String v2) {
    return 'Ch. $v1 of $v2';
  }

  @override
  String dynamicEpubReaderPageMinLeft(String v1, String v2) {
    return '$v1% · ~$v2 min left';
  }

  @override
  String dynamicPdfReaderPagePageOf(String v1, String v2) {
    return 'Page $v1 of $v2';
  }

  @override
  String dynamicDiscoverPageSelect(String v1, String v2) {
    return 'Select $v1$v2';
  }

  @override
  String dynamicDiscoverPageEnter(String v1) {
    return 'Enter $v1';
  }

  @override
  String dynamicDiscoverPageTypeHere(String v1) {
    return 'Type $v1 here...';
  }

  @override
  String dynamicDiscoverPageAll(String v1) {
    return 'All $v1';
  }

  @override
  String dynamicDiscoverPageBy(String v1) {
    return 'by $v1';
  }

  @override
  String dynamicDiscoverPageNoResultsFoundFor(String v1) {
    return 'No results found for \"$v1\"';
  }

  @override
  String dynamicDownloadsPagePeers(String v1) {
    return '$v1 peers';
  }

  @override
  String dynamicDownloadsPageFolder(String v1) {
    return 'Folder: $v1';
  }

  @override
  String dynamicDownloadsPagePath(String v1) {
    return 'Path: $v1';
  }

  @override
  String dynamicDownloadsPageDeviceStorageUsedOf(String v1, String v2) {
    return 'Device Storage: $v1 Used of $v2';
  }

  @override
  String dynamicDownloadsPageFree(String v1) {
    return '$v1 Free';
  }

  @override
  String dynamicIptvChannelSheetRemovedStreamFeed(String v1, String v2) {
    return 'Removed $v1 stream feed$v2';
  }

  @override
  String dynamicIptvChannelSheetSearchChannelsEG1080p4k(String v1) {
    return 'Search $v1 channels (e.g. 1080p, 4K, feed name)...';
  }

  @override
  String dynamicIptvChannelSheetDelete(String v1) {
    return 'Delete ($v1)';
  }

  @override
  String dynamicIptvChannelSheetNoFeedsMatch(String v1) {
    return 'No feeds match \"$v1\"';
  }

  @override
  String dynamicIptvPageChannels(String v1) {
    return '$v1 CHANNELS';
  }

  @override
  String dynamicIptvPortalsModalRemovedPortal(String v1, String v2) {
    return 'Removed $v1 portal$v2';
  }

  @override
  String dynamicIptvPortalsModalRemovedAllPortals(String v1) {
    return 'Removed all $v1 portals';
  }

  @override
  String dynamicIptvPortalsModalRemovedPlaylist(String v1, String v2) {
    return 'Removed $v1 playlist$v2';
  }

  @override
  String dynamicIptvPortalsModalRemovedAllPlaylists(String v1) {
    return 'Removed all $v1 playlists';
  }

  @override
  String dynamicIptvPortalsModalDelete(String v1) {
    return 'Delete ($v1)';
  }

  @override
  String dynamicIptvPortalsModalCopied(String v1) {
    return 'Copied: $v1';
  }

  @override
  String dynamicIptvPortalsModalExpires(String v1) {
    return 'Expires: $v1';
  }

  @override
  String dynamicIptvPortalsModalConnections(String v1, String v2) {
    return 'Connections: $v1/$v2';
  }

  @override
  String dynamicIptvPortalsModalCh(String v1) {
    return '$v1 ch';
  }

  @override
  String dynamicIptvPortalBrowserPageCols(String v1) {
    return '$v1 Cols';
  }

  @override
  String dynamicIptvPortalBrowserPageTotal(String v1) {
    return '$v1 total';
  }

  @override
  String dynamicIptvPortalBrowserPageExpiry(String v1) {
    return 'Expiry: $v1';
  }

  @override
  String dynamicIptvPortalBrowserPageConnections(String v1, String v2) {
    return 'Connections: $v1/$v2';
  }

  @override
  String dynamicIptvPortalBrowserPageConn(String v1, String v2, String v3) {
    return 'Conn: $v1/$v2 • $v3';
  }

  @override
  String dynamicMangaDetailsPagePageOf(String v1, String v2) {
    return 'Page $v1 of $v2';
  }

  @override
  String dynamicMangaReaderPagePageOf(String v1, String v2) {
    return 'Page $v1 of $v2';
  }

  @override
  String dynamicMangaReaderPagePage(String v1, String v2) {
    return 'Page $v1 / $v2';
  }

  @override
  String dynamicMultinutzPageStreamUrlFor(String v1) {
    return 'Stream URL for $v1';
  }

  @override
  String dynamicMultinutzPageStream(String v1, String v2) {
    return '$v1 Stream$v2';
  }

  @override
  String dynamicMusicPageTracks(String v1) {
    return '$v1 tracks';
  }

  @override
  String dynamicMusicPageTracks2(String v1) {
    return 'Tracks ($v1)';
  }

  @override
  String dynamicMusicPageArtists(String v1) {
    return 'Artists ($v1)';
  }

  @override
  String dynamicMusicPageAlbums(String v1) {
    return 'Albums ($v1)';
  }

  @override
  String dynamicMusicPagePlaylists(String v1) {
    return 'Playlists ($v1)';
  }

  @override
  String dynamicMusicPageFavouriteTracks(String v1) {
    return '$v1 favourite tracks';
  }

  @override
  String dynamicMusicPageQueue(String v1) {
    return 'Queue ($v1)';
  }

  @override
  String dynamicMusicPageOfflineTracksMb(String v1, String v2) {
    return '$v1 offline tracks • $v2 MB';
  }

  @override
  String dynamicMusicPageDownloading(String v1) {
    return 'Downloading $v1%';
  }

  @override
  String dynamicMusicPageAddedToDownloadQueue(String v1) {
    return 'Added \"$v1\" to download queue';
  }

  @override
  String dynamicMusicPageAddedTracksFromToDownloadQueue(String v1, String v2) {
    return 'Added $v1 tracks from \"$v2\" to download queue';
  }

  @override
  String dynamicMusicPageCuratedByTracks(String v1, String v2) {
    return 'Curated by $v1 • $v2 tracks';
  }

  @override
  String dynamicMusicPageAddedTracksFromToDownloadQueue2(String v1, String v2) {
    return 'Added $v1 tracks from \"$v2\" to download queue';
  }

  @override
  String dynamicMusicPageCustomPlaylistTracks(String v1) {
    return 'Custom Playlist • $v1 tracks';
  }

  @override
  String dynamicMusicPageOfflineTracksMbStorage(String v1, String v2) {
    return '$v1 offline tracks • $v2 MB storage';
  }

  @override
  String dynamicMusicPageDeleteFromOfflineStorage(String v1) {
    return 'Delete \"$v1\" from offline storage?';
  }

  @override
  String dynamicMusicPageInQueue(String v1) {
    return '$v1 in queue';
  }

  @override
  String dynamicPlayerScreenAudio(String v1) {
    return 'Audio $v1';
  }

  @override
  String dynamicAboutSettingsPageVersionNextGenStreamingHub(String v1) {
    return 'Version $v1 • Next-Gen Streaming Hub';
  }

  @override
  String dynamicAddonsSettingsPageConnectedTo(String v1, String v2) {
    return '$v1 connected to $v2';
  }

  @override
  String dynamicAddonsSettingsPageInstalledSuccessfully(String v1) {
    return '$v1 installed successfully!';
  }

  @override
  String dynamicAddonsSettingsPageRemove(String v1) {
    return 'Remove $v1?';
  }

  @override
  String dynamicAddonsSettingsPageSuccessfullyInstalledPluginsFromRepository(
    String v1,
  ) {
    return 'Successfully installed $v1 plugins from repository!';
  }

  @override
  String dynamicAddonsSettingsPageInstallationError(String v1) {
    return 'Installation error: $v1';
  }

  @override
  String dynamicAddonsSettingsPageRemove2(String v1) {
    return 'Remove ($v1)';
  }

  @override
  String dynamicAddonsSettingsPageTotal(String v1) {
    return '$v1 Total';
  }

  @override
  String dynamicAddonsSettingsPageRepos(String v1) {
    return '$v1 Repos';
  }

  @override
  String dynamicAddonsSettingsPageRuntimeSetupError(String v1) {
    return 'Runtime setup error: $v1';
  }

  @override
  String dynamicBuiltinProvidersSettingsPageNoProvidersFoundMatching(
    String v1,
  ) {
    return 'No providers found matching \"$v1\"';
  }

  @override
  String dynamicBuiltinProvidersSettingsPageAllZplayhttpProvidersAreActiveAnd(
    String v1,
  ) {
    return 'All $v1 ZPlayHTTP providers are active and queried concurrently.';
  }

  @override
  String dynamicBuiltinProvidersSettingsPageActive(String v1, String v2) {
    return '$v1 / $v2 Active';
  }

  @override
  String dynamicCloudstreamMarketplaceModalAddedSuccessfully(String v1) {
    return '$v1 added successfully!';
  }

  @override
  String dynamicCloudstreamMarketplaceModalInstallPlugins(String v1) {
    return 'Install $v1 Plugins?';
  }

  @override
  String dynamicCloudstreamMarketplaceModalPluginsInstalledAndReady(String v1) {
    return '$v1 plugins installed and ready!';
  }

  @override
  String dynamicCloudstreamMarketplaceModalInstallationError(String v1) {
    return 'Installation error: $v1';
  }

  @override
  String
  dynamicCloudstreamMarketplaceModalReposDirectInstallLinksVerifiedProviders(
    String v1,
  ) {
    return '$v1 repos · Direct install links & verified providers';
  }

  @override
  String dynamicCloudstreamMarketplaceModalNoRepositoriesFoundFor(String v1) {
    return 'No repositories found for \"$v1\"';
  }

  @override
  String dynamicCloudstreamMarketplaceModalPlugins(String v1) {
    return '$v1 Plugins';
  }

  @override
  String dynamicCloudstreamMarketplaceModalCopiedLink(String v1) {
    return 'Copied link: $v1';
  }

  @override
  String dynamicCloudstreamRepoModalInstalledSuccessfully(String v1) {
    return '$v1 installed successfully!';
  }

  @override
  String dynamicCloudstreamRepoModalUninstalled(String v1) {
    return '$v1 uninstalled.';
  }

  @override
  String dynamicCloudstreamRepoModalSuccessfullyInstalledPlugins(String v1) {
    return 'Successfully installed $v1 plugins!';
  }

  @override
  String dynamicCloudstreamRepoModalInstallationError(String v1) {
    return 'Installation error: $v1';
  }

  @override
  String dynamicCloudstreamRepoModalUninstallAllInstalledPluginsFromThis(
    String v1,
  ) {
    return 'Uninstall all $v1 installed plugins from this list? Their downloaded files will be removed.';
  }

  @override
  String dynamicCloudstreamRepoModalRemoveAll(String v1) {
    return 'Remove All ($v1)';
  }

  @override
  String dynamicCloudstreamRepoModalSuccessfullyUninstalledPlugins(String v1) {
    return 'Successfully uninstalled $v1 plugins.';
  }

  @override
  String dynamicCloudstreamRepoModalInstallAll(String v1) {
    return 'Install All ($v1)';
  }

  @override
  String dynamicServiceKeysSettingsPagePasteYourKey(String v1) {
    return 'Paste your $v1 key';
  }

  @override
  String dynamicUpdatesSettingsPageErrorCheckingUpdates(String v1) {
    return 'Error checking updates: $v1';
  }

  @override
  String dynamicUpdatesSettingsPageInstalledVersionVBuild(
    String v1,
    String v2,
  ) {
    return 'Installed Version: v$v1 (Build $v2)';
  }

  @override
  String dynamicAudiobookPlayerStudioPageXSpeed(String v1) {
    return '${v1}x Speed';
  }

  @override
  String dynamicAudiobookPlayerStudioPagePosition(String v1) {
    return 'Position #$v1';
  }

  @override
  String dynamicAudiobookPlayerStudioPageHoverOrTapBelowToPreview(String v1) {
    return 'Hover or tap below to preview \"$v1\":';
  }

  @override
  String dynamicAudiobookPlayerStudioPageTest(String v1) {
    return 'Test \"$v1\"';
  }

  @override
  String dynamicAudiobookSettingsPageSoftFlowingGlowingOrbsAndAurora(
    String v1,
  ) {
    return 'Soft flowing glowing orbs and aurora waves themed to $v1';
  }

  @override
  String dynamicHomeUiSettingsPageIntervalS(String v1) {
    return 'Interval: ${v1}s';
  }

  @override
  String dynamicLiveTvSettingsPageSeconds(String v1) {
    return '$v1 seconds';
  }

  @override
  String dynamicLiveTvSettingsPageColumns(String v1) {
    return '$v1 Columns';
  }

  @override
  String dynamicMangaSettingsPageSoftFlowingGlowingOrbsAndAurora(String v1) {
    return 'Soft flowing glowing orbs and aurora waves themed to $v1';
  }

  @override
  String dynamicMangaReaderControlsPageMode(String v1) {
    return 'Page Mode: $v1';
  }

  @override
  String dynamicMangaReaderControlsAtmosphere(String v1) {
    return 'Atmosphere: $v1';
  }

  @override
  String dynamicLiveGuideBandNowAiringOn(String v1) {
    return 'Now Airing on $v1';
  }

  @override
  String get mediaLabelAction => 'Action';

  @override
  String get mediaLabelAdventure => 'Adventure';

  @override
  String get mediaLabelComedy => 'Comedy';

  @override
  String get mediaLabelDrama => 'Drama';

  @override
  String get mediaLabelEcchi => 'Ecchi';

  @override
  String get mediaLabelFantasy => 'Fantasy';

  @override
  String get mediaLabelHentai => 'Hentai';

  @override
  String get mediaLabelHorror => 'Horror';

  @override
  String get mediaLabelMahouShoujo => 'Mahou Shoujo';

  @override
  String get mediaLabelMecha => 'Mecha';

  @override
  String get mediaLabelMusic => 'Music';

  @override
  String get mediaLabelMystery => 'Mystery';

  @override
  String get mediaLabelPsychological => 'Psychological';

  @override
  String get mediaLabelRomance => 'Romance';

  @override
  String get mediaLabelSciFi => 'Sci-Fi';

  @override
  String get mediaLabelScienceFiction => 'Science Fiction';

  @override
  String get mediaLabelSliceOfLife => 'Slice of Life';

  @override
  String get mediaLabelSports => 'Sports';

  @override
  String get mediaLabelSupernatural => 'Supernatural';

  @override
  String get mediaLabelThriller => 'Thriller';

  @override
  String get mediaLabelAnimation => 'Animation';

  @override
  String get mediaLabelDocumentary => 'Documentary';

  @override
  String get mediaLabelCrime => 'Crime';

  @override
  String get mediaLabelFamily => 'Family';

  @override
  String get mediaLabelHistory => 'History';

  @override
  String get mediaLabelWar => 'War';

  @override
  String get mediaLabelWestern => 'Western';

  @override
  String get mediaLabelBiography => 'Biography';

  @override
  String get mediaLabelSport => 'Sport';

  @override
  String get mediaLabelMusical => 'Musical';

  @override
  String get mediaLabelFilmNoir => 'Film-Noir';

  @override
  String get mediaLabelActionAdventure => 'Action & Adventure';

  @override
  String get mediaLabelSciFiFantasy => 'Sci-Fi & Fantasy';

  @override
  String get mediaLabelWarPolitics => 'War & Politics';

  @override
  String get mediaLabelKids => 'Kids';

  @override
  String get mediaLabelReality => 'Reality';

  @override
  String get mediaLabelTalk => 'Talk';

  @override
  String get mediaLabelNews => 'News';

  @override
  String get mediaLabelSoap => 'Soap';

  @override
  String get mediaLabelTvMovie => 'TV Movie';

  @override
  String get mediaLabelWinter => 'WINTER';

  @override
  String get mediaLabelSpring => 'SPRING';

  @override
  String get mediaLabelSummer => 'SUMMER';

  @override
  String get mediaLabelFall => 'FALL';

  @override
  String get mediaLabelTv => 'TV';

  @override
  String get mediaLabelTvShort => 'TV_SHORT';

  @override
  String get mediaLabelMovie => 'MOVIE';

  @override
  String get mediaLabelOva => 'OVA';

  @override
  String get mediaLabelOna => 'ONA';

  @override
  String get mediaLabelSpecial => 'SPECIAL';

  @override
  String get mediaLabelMusic50 => 'MUSIC';

  @override
  String get mediaLabelReleasing => 'RELEASING';

  @override
  String get mediaLabelFinished => 'FINISHED';

  @override
  String get mediaLabelNotYetReleased => 'NOT_YET_RELEASED';

  @override
  String get mediaLabelCancelled => 'CANCELLED';

  @override
  String get mediaLabelHiatus => 'HIATUS';

  @override
  String get mediaLabelTrending => 'Trending';

  @override
  String get mediaLabelMostPopular => 'Most Popular';

  @override
  String get mediaLabelTopRated => 'Top Rated';

  @override
  String get mediaLabelMostFavorited => 'Most Favorited';

  @override
  String get mediaLabelNewest => 'Newest';

  @override
  String get mediaLabelOldest => 'Oldest';

  @override
  String get mediaLabelTitleAZ => 'Title (A-Z)';

  @override
  String get mediaLabelNewSeason => 'New season';

  @override
  String get mediaLabelNewEpisode => 'New episode';

  @override
  String get mediaLabelNewRelease => 'New release';

  @override
  String get mediaLabelMovie66 => 'Movie';

  @override
  String get mediaLabelSeries => 'Series';

  @override
  String get mediaLabelAnime => 'Anime';

  @override
  String get mediaLabelInLibrary => 'In Library';

  @override
  String get mediaLabelLibrary => 'Library';

  @override
  String get mediaLabelShowLess => 'Show less';

  @override
  String get mediaLabelReadMore => 'Read more';

  @override
  String get mediaLabelYear => 'Year';

  @override
  String get mediaLabelMuted => 'Muted';

  @override
  String get mediaLabelDownloading => 'Downloading...';

  @override
  String get mediaLabelDownloadMedia => 'Download Media';

  @override
  String get mediaLabelLiveAction => 'Live action';

  @override
  String get mediaLabelUseWithCare => 'Use with care';

  @override
  String get mediaLabelFasterAt4k => 'Faster at 4K';

  @override
  String get mediaLabelMostFeatures => 'Most features';

  @override
  String get mediaLabelSortBy => 'Sort by';

  @override
  String get mediaLabelRequired => 'Required *';

  @override
  String get mediaLabelEnter => 'Enter';

  @override
  String get mediaLabelAll => 'All';

  @override
  String get mediaLabelGenre => 'Genre';

  @override
  String get mediaLabelSeason => 'Season';

  @override
  String get mediaLabelFormat => 'Format';

  @override
  String get mediaLabelStatus => 'Status';

  @override
  String get mediaLabelClear => 'Clear';

  @override
  String get mediaLabelRetry => 'Retry';

  @override
  String get mediaLabelPlay => 'Play';

  @override
  String get mediaLabelAdd => 'Add';

  @override
  String get mediaLabelCopyStreamUrl => 'Copy Stream URL';

  @override
  String get mediaLabelCustomBackgroundWallpaper =>
      'Custom Background & Wallpaper';

  @override
  String get mediaLabelHomePageUiThemes => 'Home Page UI & Themes';

  @override
  String get mediaLabelTvAiringCalendar => 'TV Airing Calendar';

  @override
  String get mediaLabelLiveTvSportsUi => 'Live TV & Sports UI';

  @override
  String get mediaLabelMangaUiReaderAtmosphere =>
      'Manga UI & Reader Atmosphere';

  @override
  String get mediaLabelPasteFromClipboard => 'Paste from Clipboard';

  @override
  String get videoUpscalingExplanation =>
      'Real-time GLSL upscaling on the video engine. Anime4K reconstructs line art; AMD FSR upscales live action and film. Pick one family — they are never combined.';

  @override
  String get videoFsrSmoothExplanation =>
      'AMD FidelityFX edge-adaptive upscaling, for live action and film. Upscales without sharpening, so it is the safe FSR option. Runs on any GPU, unlike NVIDIA RTX Video.';

  @override
  String get videoFsrSharpExplanation =>
      'FSR with contrast-adaptive sharpening. Adds bite to soft or low-bitrate video. On a 2K or 4K source this can look worse than no upscaling at all.';

  @override
  String get videoMedia3Explanation =>
      'Decodes straight into a surface, so 4K arrives without being copied out of the decoder first. On a 2 GB television that is the difference between 904 ms and over 1,900 ms of delay, and between no dropped frames and one and a half a second. Subtitles are rendered by Android, so the styling options below do not apply here.';

  @override
  String get videoMpvExplanation =>
      'The bundled engine. Plays torrents and live streams, offers the complete subtitle styling surface below, and supports the upscaling presets. Decoded frames are copied through a texture, which is what makes 4K stutter on small televisions.';

  @override
  String get videoWatchdogExplanation =>
      'Monitors stream startup. If audio plays for 2.5s without video frames, or a GPU decoder error occurs, the player recovers automatically. On Android it switches to software decoding only up to 1080p and re-syncs the hardware decoder above that, because a software 4K decoder needs more memory than the device has. A source that is merely not delivering data yet is waited on rather than treated as a decoder fault.';

  @override
  String get catalogLabelMovies => 'Movies';

  @override
  String get catalogLabelSeries => 'SERIES';

  @override
  String get catalogLabelAnime => 'ANIME';

  @override
  String get catalogLabelChannels => 'Channels';

  @override
  String get catalogLabelCollections => 'Collections';

  @override
  String get catalogLabelAdult => 'Adult';

  @override
  String get catalogLabelBrowse => 'Browse';

  @override
  String get catalogLabelPopular => 'Popular';

  @override
  String get catalogLabelTop => 'Top';

  @override
  String get catalogLabelTrendingMovies => 'Trending Movies';

  @override
  String get catalogLabelTrendingSeries => 'Trending Series';

  @override
  String get catalogLabelTrendingAnime => 'Trending Anime';

  @override
  String get catalogLabelPopularMovies => 'Popular Movies';

  @override
  String get catalogLabelPopularSeries => 'Popular Series';

  @override
  String get catalogLabelPopularAnime => 'Popular Anime';

  @override
  String get catalogLabelPopularTvShows => 'Popular TV Shows';

  @override
  String get catalogLabelNewMovies => 'New Movies';

  @override
  String get catalogLabelNewSeries => 'New Series';

  @override
  String get catalogLabelNewAnime => 'New Anime';

  @override
  String get catalogLabelTopRatedMovies => 'Top Rated Movies';

  @override
  String get catalogLabelTopRatedSeries => 'Top Rated Series';

  @override
  String get catalogLabelTopRatedAnime => 'Top Rated Anime';

  @override
  String get catalogLabelFeatured => 'Featured';

  @override
  String get catalogLabelLatest => 'Latest';

  @override
  String get catalogLabelLatestMovies => 'Latest Movies';

  @override
  String get catalogLabelLatestSeries => 'Latest Series';

  @override
  String get catalogLabelRecentlyAdded => 'Recently Added';

  @override
  String get catalogLabelNewReleases => 'New Releases';

  @override
  String get catalogLabelContinueWatching => 'Continue Watching';

  @override
  String get catalogLabelGenres => 'Genres';

  @override
  String get catalogLabelYears => 'Years';

  @override
  String get catalogLabelLanguages => 'Languages';

  @override
  String get catalogLabelCountries => 'Countries';

  @override
  String get catalogLabelRegions => 'Regions';

  @override
  String get catalogLabelGenre => 'genre';

  @override
  String get catalogLabelYear => 'year';

  @override
  String get catalogLabelLanguage => 'language';

  @override
  String get catalogLabelCountry => 'country';

  @override
  String get catalogLabelRegion => 'region';

  @override
  String get catalogLabelSearch => 'search';

  @override
  String get catalogLabelSort => 'sort';

  @override
  String get catalogLabelSortby => 'sortBy';

  @override
  String get catalogLabelRequired => 'Required';

  @override
  String get catalogLabelCustom => 'Custom';

  @override
  String get catalogLabelSearch44 => 'Search...';

  @override
  String get catalogLabelDiscoverTheLatestAndGreatestFilms =>
      'Discover the latest and greatest films';

  @override
  String get catalogLabelBingeWorthyShowsAndTheNewestSeasons =>
      'Binge-worthy shows and the newest seasons';

  @override
  String get catalogLabelSimulcastsClassicsAndEverythingInBetween =>
      'Simulcasts, classics and everything in between';

  @override
  String get catalogLabelLiveChannelsFromYourAddons =>
      'Live channels from your addons';

  @override
  String get catalogLabelEverythingYourAddonsHaveToOffer =>
      'Everything your addons have to offer';

  @override
  String get catalogLabelAddToList => 'ADD TO LIST';

  @override
  String get catalogLabelWatching => 'WATCHING';

  @override
  String get catalogLabelPlantowatch => 'PLANTOWATCH';

  @override
  String get catalogLabelPlanToWatch => 'PLAN_TO_WATCH';

  @override
  String get catalogLabelCompleted => 'COMPLETED';

  @override
  String get catalogLabelDropped => 'DROPPED';

  @override
  String get catalogLabelFindingAWorkingSource => 'Finding a working source…';

  @override
  String get catalogLabelFindBestSource => 'Find best source';

  @override
  String get catalogLabelChooseAnotherSource => 'Choose another source';

  @override
  String get catalogLabelSub => 'Sub';

  @override
  String get catalogLabelDub => 'Dub';

  @override
  String get catalogLabelSub61 => 'SUB';

  @override
  String get catalogLabelDub62 => 'DUB';

  @override
  String get catalogLabelAll => 'ALL';

  @override
  String discoverSortCatalog(String name) {
    return 'Sort by: $name';
  }

  @override
  String discoverSearchWithin(String catalog) {
    return 'Search within $catalog...';
  }

  @override
  String discoverRequiredFields(String fields) {
    return 'This catalog requires selecting $fields before loading titles.';
  }

  @override
  String get discoverDefaultCatalog => 'catalog';

  @override
  String get updateChecksumWarning =>
      'This release does not publish a SHA-256 checksum, so Kiru will not install it automatically. Open the release page and verify the download yourself before installing it.';

  @override
  String get playerExternalSubtitleEngine =>
      'External subtitle files need the mpv engine. Pick an embedded track instead.';

  @override
  String get aboutUpstreamLicense =>
      'ZPlay is a modified version of PlayTorrio V3, distributed under the GNU General Public License v3.0. Tap to read the licence.';

  @override
  String get addonCredentialSharingWarning =>
      'This addon URL contains a Debrid placeholder. Kiru will fill it with your saved key, so the addon server receives that key in the request URL. Only continue if you trust this addon.';

  @override
  String addonCredentialPlaceholderHelp(String example) {
    return 'Addons that take the key as a plain URL parameter accept a $example style placeholder. Addons that hide it inside a base64 config blob have to be pasted fully configured instead.';
  }

  @override
  String get appearanceSkiaRecommendation =>
      'Skia is recommended on Windows here — Impeller coincided with an NVIDIA driver crash.';

  @override
  String get serviceKeysIntroduction =>
      'Kiru talks to several third-party services. Any key you save here replaces the one this build uses and takes effect immediately, with no restart.';

  @override
  String get serviceKeysExternalCredentials =>
      'These cannot be obtained: each is a credential for a third-party service that did not issue it to ZPlay, so leave its field blank unless you have your own. A private build can supply its own with --dart-define, and blanking the registry entry in the source disables only that one source.';

  @override
  String get serviceKeysStorageNotice =>
      'Every value is stored only on this device and is never shown back in these fields.';

  @override
  String get tmdbKeyIntroduction =>
      'Add your own free TMDb key to rank the six \"The 90s\" rails by TMDb vote counts, and to cover the TMDb lookups the built-in scrapers make. Get a key at themoviedb.org.';

  @override
  String get tmdbKeyStorageNotice =>
      'The key is stored only on this device. This app ships with no key, and a built-in fallback keeps the scraper lookups working without one. Clearing your key restores the built-in 1990s picks.';

  @override
  String get traktPairingRejected =>
      'Trakt rejected the pairing request. Check the Client ID in Settings > Service API Keys - and add the Client Secret if Trakt requires one for your app.';

  @override
  String get homeHideArtlessRailsHelp =>
      'Drops a Home rail when none of its titles can show a picture. A landscape tile has no name under it, so such a rail is a row of blank rectangles.';

  @override
  String get p2pPrivacyHeading => 'PRIVACY & NETWORK ADVISORY';

  @override
  String get updateAvailableHeading => 'UPDATE AVAILABLE';

  @override
  String get updateWhatsNewHeading => 'WHAT\'S NEW';

  @override
  String get cardTopRank => 'TOP';

  @override
  String get channelLiveBadge => 'LIVE';

  @override
  String get channelLiveBroadcast => 'LIVE BROADCAST';

  @override
  String get channelFreeBadge => 'FREE';

  @override
  String get multiStreamsHeading => 'MULTI STREAMS';

  @override
  String get copyPlaybackUrl => 'Copy Stream URL';

  @override
  String get commonAddAction => 'Add';

  @override
  String get appearanceCustomWallpaper => 'Custom Background & Wallpaper';

  @override
  String get commonPasteClipboard => 'Paste from Clipboard';

  @override
  String get appearanceHomeTitle => 'Home Page UI & Themes';

  @override
  String get homeBecauseWatching => '\"Because You\'re Watching...\"';

  @override
  String get homeAiringCalendar => 'TV Airing Calendar';

  @override
  String get appearanceLiveTvTitle => 'Live TV & Sports UI';

  @override
  String get appearancePublicPlaylistHelp =>
      'Add public M3U playlists (e.g. iptv-org) to a channel\'s stream list';

  @override
  String get appearanceMangaTitle => 'Manga UI & Reader Atmosphere';

  @override
  String traktPairingClientIdRequired(String url) {
    return 'Trakt needs a Client ID before it can pair. Create an app at $url, then paste its Client ID in Settings > Service API Keys. The Client Secret is optional.';
  }

  @override
  String playerSourceRetrySemantics(String source, int attempt, int total) {
    return 'Testing other sources. Trying $source. Attempt $attempt of $total.';
  }

  @override
  String animeEpisodeCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count episodes',
      one: '1 episode',
    );
    return '$_temp0';
  }

  @override
  String get animeTitleDataAttribution =>
      'Chinese anime titles · bangumi-data v0.3.237 · CC BY 4.0';

  @override
  String get animeCastHeading => 'Characters & Cast';

  @override
  String get animeRelationsHeading => 'Franchise & Relations';

  @override
  String get animeRecommendationsHeading => 'You May Also Like';

  @override
  String channelGuideWaiting(String channel) {
    return 'Programme data appears once a verified live feed for $channel is available.';
  }

  @override
  String get finalPlayerSubStyleModalTypography => 'Typography';

  @override
  String get finalPlayerSubStyleModalColorsBox => 'Colors & Box';

  @override
  String get finalPlayerSubStyleModalOutlineShadow => 'Outline & Shadow';

  @override
  String get finalPlayerSubStyleModalPosition => 'Position';

  @override
  String get finalPlayerSubStyleModalAdvancedAss => 'Advanced / ASS';

  @override
  String get finalPlayerSubStyleModalFontFamily => 'FONT FAMILY';

  @override
  String get finalPlayerSubStyleModalSubtitleTextColor => 'SUBTITLE TEXT COLOR';

  @override
  String get finalPlayerSubStyleModalBackgroundBoxAccessibilityReadability =>
      'BACKGROUND BOX (ACCESSIBILITY & READABILITY)';

  @override
  String get finalPlayerSubStyleModalOutlineBorderColor =>
      'OUTLINE / BORDER COLOR';

  @override
  String get finalPlayerSubStyleModalHorizontalAlignment =>
      'HORIZONTAL ALIGNMENT';

  @override
  String get finalPlayerSubStyleModalSubtitleRenderingEngine =>
      'SUBTITLE RENDERING ENGINE';

  @override
  String get finalPlayerSubStyleModalSsaAssFansubScriptOverrideMode =>
      'SSA / ASS FANSUB SCRIPT OVERRIDE MODE';

  @override
  String get finalReaderCustomizationSheetTheme => 'Theme';

  @override
  String get finalReaderCustomizationSheetLayout => 'Layout';

  @override
  String get finalReaderCustomizationSheetReset => 'Reset ✓';

  @override
  String get finalReaderCustomizationSheetFontFamily => 'Font Family';

  @override
  String get finalReaderCustomizationSheetFontSize => 'Font Size';

  @override
  String get finalReaderCustomizationSheetLineHeight => 'Line Height';

  @override
  String get finalReaderCustomizationSheetAlignment => 'Alignment';

  @override
  String get finalReaderCustomizationSheetFirstLineIndent =>
      'First-Line Indent';

  @override
  String get finalReaderCustomizationSheetReadingThemes => 'Reading Themes';

  @override
  String get finalReaderCustomizationSheetReaderBrightness =>
      'Reader Brightness';

  @override
  String get finalReaderCustomizationSheetPageMargins => 'Page Margins';

  @override
  String get finalReaderCustomizationSheetReadingMode => 'Reading Mode';

  @override
  String get finalTrailerMuteButtonUnmuteTrailer => 'Unmute trailer';

  @override
  String get finalTrailerMuteButtonMuteTrailer => 'Mute trailer';

  @override
  String get finalMultinutzChannelSheetRemoveFavorite => 'Remove Favorite';

  @override
  String get finalTextSyncOverlaySelecting => 'Selecting';

  @override
  String get finalTextSyncOverlaySaving => 'Saving...';

  @override
  String get finalAnimePageGeneral => '🇯🇵 General';

  @override
  String get finalAnimePageArabicAnime => '🇸🇦 Arabic Anime';

  @override
  String get finalAnimePageSearchAnime => 'Search anime';

  @override
  String get finalAnimeSearchPageArabic => '🇸🇦 Arabic';

  @override
  String get finalAnimeStreamSheetCascadingNativeAnimeExtractors =>
      'Cascading native anime extractors…';

  @override
  String get finalAudiobookPlayerScreenPause => 'PAUSE';

  @override
  String get finalGenerateAudiobookScreenUnknownAuthor => 'Unknown Author';

  @override
  String get finalGenerateAudiobookScreenAnalyzingUploadingBook =>
      'Analyzing & Uploading Book...';

  @override
  String get finalIptvChannelSheetCancelSelection => 'Cancel Selection';

  @override
  String get finalIptvChannelSheetDeselectAll => 'Deselect All';

  @override
  String get finalIptvPlayerPageMuted => 'MUTED';

  @override
  String get finalIptvPortalsModalShowPassword => 'Show Password';

  @override
  String get finalIptvPortalsModalAddM3u => 'Add M3U';

  @override
  String get finalMangaReaderPageUpNext => 'UP NEXT';

  @override
  String get finalMultinutzPageCustomUrl => 'Custom URL';

  @override
  String get finalMultinutzPageDoneRearranging => 'Done Rearranging';

  @override
  String get finalMusicPageSearch => 'Search…';

  @override
  String get finalMyListPageSyncing => 'Syncing...';

  @override
  String get finalMyListPageYourListIsEmpty => 'Your list is empty';

  @override
  String get finalWatchScreenCopied => 'Copied!';

  @override
  String get finalAddonsSettingsPageBuiltInTorrent => 'BUILT-IN TORRENT';

  @override
  String get finalAddonsSettingsPageInstalling => 'Installing...';

  @override
  String get finalAddonsSettingsPageConnecting => 'Connecting...';

  @override
  String get finalCloudstreamMarketplaceModalHidePlugins => 'Hide plugins';

  @override
  String get finalCloudstreamMarketplaceModalAddingRepository =>
      'Adding Repository...';

  @override
  String get finalDebridSettingsPageShowKey => 'Show Key';

  @override
  String get finalDebridSettingsPageHideKey => 'Hide Key';

  @override
  String get finalSimklSettingsPageConnected => 'CONNECTED';

  @override
  String get finalUpdatesSettingsPageCheckingForUpdates =>
      'Checking for updates...';

  @override
  String get finalAudiobookSettingsPageAmbientBackgroundLightingMovingGlows =>
      'AMBIENT BACKGROUND LIGHTING & MOVING GLOWS';

  @override
  String get finalAudiobookSettingsPageDiscoveryAudiobookPosters =>
      'DISCOVERY & AUDIOBOOK POSTERS';

  @override
  String get finalAudiobookSettingsPageChooseAudioPlayerPreset =>
      'CHOOSE AUDIO PLAYER PRESET';

  @override
  String get finalAudiobookSettingsPageMakeYourCustomAudiobookPlayerDragDrop =>
      'MAKE YOUR CUSTOM AUDIOBOOK PLAYER (DRAG & DROP STUDIO)';

  @override
  String get finalCustomBackgroundSettingsPageUploading => 'Uploading...';

  @override
  String
  get finalHomeUiSettingsPagePersonalizedRecommendationsComputedByTrakt =>
      'Personalized recommendations computed by Trakt';

  @override
  String get finalHomeUiSettingsPageTopRatedPersonalizedSuggestionsFromSimkl =>
      'Top-rated & personalized suggestions from Simkl';

  @override
  String get finalLiquidGlassSettingsPageLiveInteractivePreview =>
      'LIVE INTERACTIVE PREVIEW';

  @override
  String get finalMangaSettingsPageDiscoveryPosterCards =>
      'DISCOVERY & POSTER CARDS';

  @override
  String get finalMangaSettingsPageMangaReaderChapterViewer =>
      'MANGA READER & CHAPTER VIEWER';

  @override
  String get finalMusicSettingsPageVisualThemePalette => 'VISUAL THEME PALETTE';

  @override
  String get finalMusicSettingsPageAmbientAtmosphereGlow =>
      'AMBIENT ATMOSPHERE & GLOW';

  @override
  String get finalMusicSettingsPageDiscoveryCatalogConfiguration =>
      'DISCOVERY & CATALOG CONFIGURATION';

  @override
  String get finalMusicSettingsPageFullscreenPlayerPresets =>
      'FULLSCREEN PLAYER PRESETS';

  @override
  String get finalMusicSettingsPageCustomPlayerEngineDesigner =>
      'CUSTOM PLAYER ENGINE DESIGNER';

  @override
  String get arabicSectionContinueWatching0 => 'Continue watching';

  @override
  String get arabicSectionLatestEpisodes1 => '⚡ Latest episodes';

  @override
  String get arabicSectionLatestEpisodesWithArabicSubtitles2 =>
      'Latest episodes with Arabic subtitles';

  @override
  String get arabicSectionTrending3 => '🔥 Trending';

  @override
  String get arabicSectionMostWatchedAnimeRightNow4 =>
      'Most watched anime right now';

  @override
  String get arabicSectionPopularFilms5 => '🎬 Popular films';

  @override
  String get arabicSectionFeaturedAnimeFilms6 => 'Featured anime films';

  @override
  String get arabicSectionTopRatedAnime7 => '👑 Top rated anime';

  @override
  String get arabicSectionHighlyRatedAnime8 => 'Highly rated anime';

  @override
  String get arabicSectionSeasonalAnime9 => '🌟 Seasonal anime';

  @override
  String get arabicSectionCurrentSeasonShows10 => 'Current season shows';

  @override
  String get arabicSectionClassicAnime11 => '⚔️ Classic anime';

  @override
  String get arabicSectionTimelessAnimeClassics12 => 'Timeless anime classics';

  @override
  String get arabicSectionComingSoon13 => '🚀 Coming soon';

  @override
  String get arabicSectionUpcomingAnime14 => 'Upcoming anime';

  @override
  String get arabicSectionAiringNow15 => 'Airing now';

  @override
  String get arabicSectionShowLess16 => 'Show less';

  @override
  String get arabicSectionShowMore17 => 'Show more';

  @override
  String get arabicSectionEpisodes18 => 'Episodes';

  @override
  String get arabicSectionJumpToEpisode19 => 'Jump to episode...';

  @override
  String get arabicSectionRelatedAnime20 => 'Related anime';

  @override
  String get arabicSectionCheckingServers21 => 'Checking servers...';

  @override
  String get arabicSectionServers22 => 'Servers';

  @override
  String get arabicSectionRetry23 => 'Retry';

  @override
  String get arabicSectionPlaybackServer24 => 'Playback server';

  @override
  String get arabicSectionDirectStreamingHighQuality25 =>
      'Direct streaming • High quality';

  @override
  String subtitleBaseFontSize(String value) {
    return 'BASE FONT SIZE (${value}pt)';
  }

  @override
  String subtitleScaleMultiplier(String value) {
    return 'SCALE MULTIPLIER ($value%)';
  }

  @override
  String subtitleOutlineThickness(String value) {
    return 'OUTLINE THICKNESS (${value}px)';
  }

  @override
  String subtitleShadowOffset(String value) {
    return 'DROP SHADOW OFFSET (${value}px)';
  }

  @override
  String subtitleBottomMargin(String value) {
    return 'BOTTOM MARGIN / OFFSET (${value}px)';
  }

  @override
  String subtitleVerticalPosition(String value) {
    return 'VERTICAL POSITION ($value%)';
  }

  @override
  String arabicEpisodeNumber(String number) {
    return 'Episode $number';
  }

  @override
  String downloadFailedDetail(String error) {
    return 'Failed: $error';
  }

  @override
  String get downloadUnknownError => 'Unknown error';

  @override
  String downloadPausedProgress(String progress) {
    return 'Paused ($progress%)';
  }

  @override
  String downloadEtaProgress(String progress, String speed, String eta) {
    return '$progress% · $speed · ETA: $eta';
  }

  @override
  String get subtitleOptionWhite0 => 'White';

  @override
  String get subtitleOptionCinemaYellow1 => 'Cinema Yellow';

  @override
  String get subtitleOptionAmberGold2 => 'Amber Gold';

  @override
  String get subtitleOptionElectricCyan3 => 'Electric Cyan';

  @override
  String get subtitleOptionNeonGreen4 => 'Neon Green';

  @override
  String get subtitleOptionVibrantOrange5 => 'Vibrant Orange';

  @override
  String get subtitleOptionSoftRose6 => 'Soft Rose';

  @override
  String get subtitleOptionLightGray7 => 'Light Gray';

  @override
  String get subtitleOptionNone8 => 'None';

  @override
  String get subtitleOption25Dark9 => '25% Dark';

  @override
  String get subtitleOption50Dark10 => '50% Dark';

  @override
  String get subtitleOption75Dark11 => '75% Dark';

  @override
  String get subtitleOption100Solid12 => '100% Solid';

  @override
  String get subtitleOption50Indigo13 => '50% Indigo';

  @override
  String get subtitleOptionTransparent14 => 'Transparent';

  @override
  String get subtitleOptionSubtle15 => 'Subtle';

  @override
  String get subtitleOptionStandardBox16 => 'Standard Box';

  @override
  String get subtitleOptionHighContrast17 => 'High Contrast';

  @override
  String get subtitleOptionOpaqueBlack18 => 'Opaque Black';

  @override
  String get subtitleOptionSlateTint19 => 'Slate Tint';

  @override
  String get subtitleOptionBlack20 => 'Black';

  @override
  String get subtitleOptionDarkSlate21 => 'Dark Slate';

  @override
  String get subtitleOptionGold22 => 'Gold';

  @override
  String get subtitleOptionCrimson23 => 'Crimson';

  @override
  String get subtitleOptionNeonCyan24 => 'Neon Cyan';

  @override
  String get subtitleOptionPreserveAnimeSsaAssStylingRecommended25 =>
      'Preserve Anime & SSA/ASS Styling (Recommended)';

  @override
  String get subtitleOptionLeavesSsaAssAnimeSubtitlesUntouched26 =>
      'Leaves SSA/ASS anime subtitles untouched to preserve custom karaoke, styling & positions. Plain SRT/VTT are styled with your custom theme.';

  @override
  String get subtitleOptionScaleOnly27 => 'Scale Only';

  @override
  String get subtitleOptionAppliesSizeScalingToSsaAss28 =>
      'Applies size scaling to SSA/ASS scripts while preserving their fonts, colors, and author typography.';

  @override
  String get subtitleOptionOverrideColorsOutlines29 =>
      'Override Colors & Outlines';

  @override
  String get subtitleOptionAppliesYourCustomColorsAndOutlines30 =>
      'Applies your custom colors and outlines on top of SSA/ASS subtitle scripts.';

  @override
  String get uiFinalTextSyncOverlayFixSection => 'FIX SECTION';

  @override
  String get uiFinalTextSyncOverlaySubtitleTiming => 'SUBTITLE TIMING';

  @override
  String get uiFinalTextSyncOverlaySelectRangeSync => 'Select Range & Sync';

  @override
  String get uiFinalTextSyncOverlaySpeechDialogueSync => 'Speech Dialogue Sync';

  @override
  String get uiFinalAdultPageNo18SourcesYet => 'No 18+ sources yet.';

  @override
  String get uiFinalAdultPage18SourcesFoundNothingToShow =>
      '18+ sources found nothing to show.';

  @override
  String get uiFinalAdultPageMarkAnAddonAs18Or =>
      'Mark an addon as 18+ or hybrid in Settings → Addons, or install one.';

  @override
  String get uiFinalAdultPageTheAddonsThisPageListsAnswered =>
      'The addons this page lists answered with no titles. Try again in a moment.';

  @override
  String get uiFinalMyListPageSaveYourFavoriteMoviesAndTv =>
      'Save your favorite movies and TV shows to watch anytime';

  @override
  String get uiFinalMyListPageTryAdjustingYourSearchQueryOr =>
      'Try adjusting your search query or filter settings';

  @override
  String get uiFinalAddonsSettingsPageCloudstreamEngineReady =>
      'CloudStream Engine Ready';

  @override
  String get uiFinalAddonsSettingsPageRuntimeSetupRequired =>
      'Runtime Setup Required';

  @override
  String get uiFinalAddonsSettingsPageNativeEngineActiveAndListeningFor =>
      'Native engine active and listening for queries.';

  @override
  String get uiFinalAddonsSettingsPageDeselectAll => 'Deselect All';

  @override
  String get uiFinalAddonsSettingsPageSelectAll => 'Select All';

  @override
  String get uiFinalAddonsSettingsPageNoDebridProviderIsSetUp =>
      'No Debrid provider is set up yet';

  @override
  String get uiFinalIptvPortalsModalPortalsPlaylists => 'Portals & Playlists';

  @override
  String get uiFinalIptvPortalsModalIptvPortalsPlaylists =>
      'IPTV Portals & Playlists';

  @override
  String get uiFinalIptvPortalBrowserPageCheckHealth => 'Check Health';

  @override
  String get uiFinalIptvPortalBrowserPageNow => 'NOW: ';

  @override
  String get uiFinalIptvPortalBrowserPageNext => '   NEXT: ';

  @override
  String get uiFinalTvCalendarPageNoEpisodesFoundForThisDay =>
      'No episodes found for this day';

  @override
  String get uiFinalTvCalendarPageTrySelectingAllOrADifferent =>
      'Try selecting \"All\" or a different network above';

  @override
  String get uiFinalTvCalendarPageSelectAnotherDayFromTheTimeline =>
      'Select another day from the timeline above';

  @override
  String get uiFinalMusicPageDownloadedOfflineTapToRemove =>
      'Downloaded Offline (Tap to Remove)';

  @override
  String get uiFinalMusicPageDownloadingQueued => 'Downloading / Queued...';

  @override
  String get uiFinalMusicPageDownloadTrackOffline => 'Download Track Offline';

  @override
  String get uiFinalTmdbSettingsPageSavedOnThisDeviceEnterA =>
      'Saved on this device. Enter a new key to replace it.';

  @override
  String get uiFinalTmdbSettingsPageFreeKeyFromThemoviedbOrg =>
      'Free key from themoviedb.org';

  @override
  String get uiFinalTraktSettingsPageCheckingCredentials =>
      'Checking credentials...';

  @override
  String get uiFinalTraktSettingsPageSignInToActivateTwoWay =>
      'Sign in to activate two-way cloud sync';

  @override
  String get uiFinalSimklSettingsPageCheckingCredentials =>
      'Checking credentials...';

  @override
  String get uiFinalSimklSettingsPageSignInWithPinToActivate =>
      'Sign in with PIN to activate Simkl cloud sync';

  @override
  String get uiFinalHomeUiSettingsPageCustomBackgroundActiveWithAmbientLight =>
      'Custom background active with ambient light blending';

  @override
  String get uiFinalHomeUiSettingsPageUploadPhotosOrChooseCuratedDark =>
      'Upload photos or choose curated dark wallpapers';

  @override
  String get uiFinalBookDetailSheetResumeReading => 'Resume Reading';

  @override
  String get uiFinalBookDetailSheetReadNow => 'Read Now';

  @override
  String get uiFinalMagnetFilesViewConnectingToSwarmPeers =>
      'Connecting to swarm peers...';

  @override
  String get uiFinalMagnetFilesViewP2pSwarm => 'P2P Swarm';

  @override
  String get uiFinalWewatchQuizPageRate3TitlesToUnlockRecommendations =>
      'Rate 3 Titles to Unlock Recommendations';

  @override
  String addonsRemoveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Remove $count plugins?',
      one: 'Remove 1 plugin?',
    );
    return '$_temp0';
  }

  @override
  String addonsRemovedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Removed $count plugins.',
      one: 'Removed 1 plugin.',
    );
    return '$_temp0';
  }

  @override
  String addonsUsesServiceKey(String value) {
    return 'Uses your $value key';
  }

  @override
  String addonsContainsPlugins(String value) {
    return 'Contains: $value';
  }

  @override
  String iptvCurrentChannel(int index, int total, String name) {
    return 'Channel $index/$total · $name';
  }

  @override
  String iptvCurrentSource(int index, int total, String name) {
    return 'Source $index/$total · $name';
  }

  @override
  String iptvNoPlayableStream(String name) {
    return 'No playable stream for \"$name\". Reconnect the portal or remove it and add another.';
  }

  @override
  String iptvStopHealthCheck(int checked, int total) {
    return 'Stop ($checked/$total)';
  }

  @override
  String calendarNoNetworkEpisodes(String value) {
    return 'No episodes on $value for this day';
  }

  @override
  String musicLosslessQuality(String value) {
    return '$value • HI-RES LOSSLESS AUDIO';
  }

  @override
  String musicExtractingTrack(String value) {
    return 'Extracting stream for \"$value\"...';
  }

  @override
  String musicDownloadingTrack(String title, int progress) {
    return 'Downloading \"$title\" ($progress%)';
  }

  @override
  String accountLoggedInTrakt(String value) {
    return 'Logged in as $value';
  }

  @override
  String accountLoggedInSimkl(String value) {
    return 'Logged in as $value';
  }

  @override
  String wallpaperActivePalette(String value) {
    return 'Wallpaper active with $value ambient lighting';
  }

  @override
  String wallpaperDefaultPalette(String value) {
    return 'Default $value theme background';
  }

  @override
  String bookDownloadingProgress(int progress) {
    return 'Downloading $progress%...';
  }

  @override
  String mediaCollectionPart(String value) {
    return 'PART $value';
  }

  @override
  String magnetUsingProvider(String value) {
    return 'Using $value for files...';
  }

  @override
  String magnetProviderCloud(String value) {
    return '$value Cloud';
  }

  @override
  String aiDiscoverRated(int count) {
    return 'Discover Recommendations ($count Titles)';
  }

  @override
  String iptvChannelsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count channels',
      one: '1 channel',
    );
    return '$_temp0';
  }

  @override
  String audiobookVoiceName(String value) {
    return 'Voice: $value';
  }

  @override
  String audiobookGeneratingProgress(int progress) {
    return 'Generating $progress%';
  }

  @override
  String updateExecutableInstructions(String file) {
    return 'Make the file executable and run it:\nchmod +x \"$file\"\n./$file';
  }

  @override
  String get videoZeroCopy => 'Zero-Copy';

  @override
  String get videoTextureViewOff => 'Off (TextureView)';

  @override
  String get aiRecMediaSeries => 'TV Series';

  @override
  String audiobookSplitNotice(String words, int parts) {
    return 'This book has approximately $words words. It will be split into $parts parts along chapter boundaries and queued:';
  }

  @override
  String audiobookSplitPart(String name, String words) {
    return '$name (approximately $words words)';
  }

  @override
  String get configCopyModernGlassIsland => 'Modern Glass Island';

  @override
  String get configCopySleekFloatingGlassmorphismPlayerWithWaveformScrubber =>
      'Sleek floating glassmorphism player with waveform scrubber & ambient glow';

  @override
  String get configCopyVinylTurntableStudio => 'Vinyl Turntable Studio';

  @override
  String get configCopyRotatingVinylDiscTonearmAnimationAnalogVintage =>
      'Rotating vinyl disc, tonearm animation & analog vintage VU styling';

  @override
  String get configCopyMinimalistFocusCapsule => 'Minimalist Focus Capsule';

  @override
  String get configCopyCompactDistractionFreeFloatingCapsuleWithEssential =>
      'Compact distraction-free floating capsule with essential controls';

  @override
  String get configCopyImmersiveCanvasStudio => 'Immersive Canvas Studio';

  @override
  String get configCopyFullScreenCinematicAmbientBlurCanvasWith =>
      'Full-screen cinematic ambient blur canvas with oversized artwork';

  @override
  String get configCopyCustomDragDropStudio => 'Custom Drag & Drop Studio';

  @override
  String get configCopyYourFullyCustomizedArrangedAndStyledAudio =>
      'Your fully customized, arranged and styled audio player';

  @override
  String get configCopyDynamicAudioWaveformCanvas =>
      'Dynamic Audio Waveform Canvas';

  @override
  String get configCopyProceduralAnimatedWaveformBarsWithLiveEqualizer =>
      'Procedural animated waveform bars with live equalizer scrubbing';

  @override
  String get configCopyNeonGradientProgressBar => 'Neon Gradient Progress Bar';

  @override
  String get configCopyMultiColorVibrantLinearGradientScrubberWith =>
      'Multi-color vibrant linear gradient scrubber with glowing tip';

  @override
  String get configCopyPrecisionGlassSlider => 'Precision Glass Slider';

  @override
  String get configCopyTactileInteractiveGlassTrackWithTimecodeReadouts =>
      'Tactile interactive glass track with timecode readouts';

  @override
  String get configCopyRadialCircularRingScrubber =>
      'Radial Circular Ring Scrubber';

  @override
  String get configCopyRadialCircularDialScrubberForCompactModern =>
      'Radial circular dial scrubber for compact modern interfaces';

  @override
  String get configCopyCircleAuraGlow => 'Circle Aura Glow';

  @override
  String get configCopyLiquidGlassNeomorphic => 'Liquid Glass Neomorphic';

  @override
  String get configCopyRoundedGlassSquare => 'Rounded Glass Square';

  @override
  String get configCopyWideAccentPill => 'Wide Accent Pill';

  @override
  String get configCopyScaleSpringBounce => 'Scale & Spring Bounce';

  @override
  String get configCopyThemeAccentGlowAura => 'Theme Accent Glow Aura';

  @override
  String get configCopyLiquidGlassRipple => 'Liquid Glass Ripple';

  @override
  String get configCopy3dSubtleTiltPerspective => '3D Subtle Tilt Perspective';

  @override
  String get configCopy3dRoundedSquareWithGlow => '3D Rounded Square with Glow';

  @override
  String get configCopySpinningVinylDisc => 'Spinning Vinyl Disc';

  @override
  String get configCopyFloatingGlassCard => 'Floating Glass Card';

  @override
  String get configCopyHiddenFocusMode => 'Hidden / Focus Mode';

  @override
  String get configCopyCompactDenseGrid => 'Compact (Dense Grid)';

  @override
  String get configCopyStandardBalanced => 'Standard (Balanced)';

  @override
  String get configCopySpaciousLargeCovers => 'Spacious (Large Covers)';

  @override
  String get configCopyRecommendedOnWindowsFasterInPracticeHere =>
      'Recommended on Windows — faster in practice here and avoids the NVIDIA driver crash seen with Impeller.';

  @override
  String get configCopyEngineDefaultKeptSelectableForTestingCoincided =>
      'Engine default — kept selectable for testing. Coincided with an NVIDIA driver crash notice on this machine.';

  @override
  String get configCopyTopBelowHeroBanner => 'Top (Below Hero Banner)';

  @override
  String get configCopyUnderCinemetaAddon => 'Under Cinemeta Addon';

  @override
  String get configCopyMiddleOfCatalog => 'Middle of Catalog';

  @override
  String get configCopyBottomOfPage => 'Bottom of Page';

  @override
  String get configCopyImmersiveCinematicCarousel =>
      'Immersive Cinematic Carousel';

  @override
  String get configCopyCompactSpotlight => 'Compact Spotlight';

  @override
  String get configCopyMinimalistHeader => 'Minimalist Header';

  @override
  String get configCopyDualFloatingOrbs => 'Dual Floating Orbs';

  @override
  String get configCopyTopAuroraHorizon => 'Top Aurora Horizon';

  @override
  String get configCopyFullDeepAmbientMesh => 'Full Deep Ambient Mesh';

  @override
  String get configCopyPulsingCore => 'Pulsing Core';

  @override
  String get configCopyStandardBalanced2 => 'Standard Balanced';

  @override
  String get configCopyCinematicLargePosters => 'Cinematic (Large Posters)';

  @override
  String get configCopyCloudVault => 'Cloud Vault';

  @override
  String get configCopyHighSpeedCloudDatabaseWith9000 =>
      'High-speed cloud database with 9,000+ live IPTV servers';

  @override
  String get configCopyLiveScrapersFromRedditIptvSubreddits =>
      'Live scrapers from Reddit IPTV subreddits';

  @override
  String get configCopyRichCardWithBadges => 'Rich Card with Badges';

  @override
  String get configCopyCompactRow => 'Compact Row';

  @override
  String get configCopyGridCards => 'Grid Cards';

  @override
  String get configCopyDetailedListWithEpg => 'Detailed List with EPG';

  @override
  String get configCopyCompactChannelList => 'Compact Channel List';

  @override
  String get configCopySpaciousLargePosters => 'Spacious (Large Posters)';

  @override
  String get configCopyVerticalContinuousWebtoon =>
      'Vertical Continuous (Webtoon)';

  @override
  String get configCopyHorizontalLeftToRight => 'Horizontal (Left to Right)';

  @override
  String get configCopyHorizontalRightToLeftManga =>
      'Horizontal (Right to Left / Manga)';

  @override
  String get configCopyFullScreen100 => 'Full Screen (100%)';

  @override
  String get configCopyCompact720px => 'Compact (720px)';

  @override
  String get configCopyStandard900px => 'Standard (900px)';

  @override
  String get configCopyWide1150px => 'Wide (1150px)';

  @override
  String get configCopyPitchBlack => 'Pitch Black';

  @override
  String get configCopyDeepCharcoal => 'Deep Charcoal';

  @override
  String get configCopySepiaDark => 'Sepia Dark';

  @override
  String get configCopyFloatingGlassIsland => 'Floating Glass Island';

  @override
  String get configCopyDockedBottomBar => 'Docked Bottom Bar';

  @override
  String get configCopyMinimalistFloatingPill => 'Minimalist Floating Pill';

  @override
  String get configCopyRotating33rpmVinylDiscWithTonearmAnd =>
      'Rotating 33rpm vinyl disc with tonearm and warm studio atmosphere';

  @override
  String get configCopyCyberpunkWaveVisualizer => 'Cyberpunk Wave Visualizer';

  @override
  String get configCopyRealTimeAnimatedAudioVisualizerCanvasWith =>
      'Real-time animated audio visualizer canvas with neon glow';

  @override
  String get configCopyLiquidGlassSanctuary => 'Liquid Glass Sanctuary';

  @override
  String get configCopyDeepOpticalRefractionGlassSheetsPoweredBy =>
      'Frosted panels with Gaussian backdrop blur';

  @override
  String get configCopyCinematicPosterFocus => 'Cinematic Poster Focus';

  @override
  String get configCopyMassiveEdgeToEdgeImmersiveAlbumArt =>
      'Massive edge-to-edge immersive album art with blurred atmosphere';

  @override
  String get configCopyCustomDragDropFullPlayer =>
      'Custom Drag & Drop Full Player';

  @override
  String get configCopyYourFullyCustomizedArrangedAndStyledFullscreen =>
      'Your fully customized, arranged and styled fullscreen player';

  @override
  String get configCopyLiquidGlassTrackSlider => 'Liquid Glass Track Slider';

  @override
  String get configCopyRefractiveFrostedGlassSliderTrackWithSmooth =>
      'Refractive frosted glass slider track with smooth thumb';

  @override
  String get configCopyPrecisionTactileSlider => 'Precision Tactile Slider';

  @override
  String get configCopyRadialCircularRingDial => 'Radial Circular Ring Dial';

  @override
  String get configCopyAuraGlowCircle => 'Aura Glow Circle';

  @override
  String get configCopyNeonGlassSquare => 'Neon Glass Square';

  @override
  String get configCopySpinningVinylDiscWithCenterLabel =>
      'Spinning Vinyl Disc with Center Label';

  @override
  String get configCopy3dFloatingGlassCardWithElevation =>
      '3D Floating Glass Card with Elevation';

  @override
  String get configCopyRoundedNeomorphicSquareWithGlow =>
      'Rounded Neomorphic Square with Glow';

  @override
  String get configCopyAtmosphericGlowOrb => 'Atmospheric Glow Orb';

  @override
  String get configCopyClassicWhite => 'Classic White';

  @override
  String get configCopyCrispWhiteTextWithBlackOutline =>
      'Crisp white text with black outline';

  @override
  String get configCopyWarmYellowTextWithSubtleShadowAnd =>
      'Warm yellow text with subtle shadow and border';

  @override
  String get configCopyStreamingBox => 'Streaming Box';

  @override
  String get configCopyWhiteTextInsideA50TranslucentBlack =>
      'White text inside a 50% translucent black box';

  @override
  String get configCopyBoldYellowTextWithSolidOpaqueBlack =>
      'Bold yellow text with solid opaque black box';

  @override
  String get configCopyAnimeClean => 'Anime Clean';

  @override
  String get configCopyBoldWhiteTextWithDeepOutlineShadow =>
      'Bold white text with deep outline & shadow';

  @override
  String get configCopyCyberpunkCyan => 'Cyberpunk Cyan';

  @override
  String get configCopyVibrantCyanTextWithDarkBorder =>
      'Vibrant cyan text with dark border';

  @override
  String get configCopyNightModeWarm => 'Night Mode Warm';

  @override
  String get configCopySoftCreamTextWith40TranslucentBackground =>
      'Soft cream text with 40% translucent background';

  @override
  String get configCopyUserConfiguredCustomSubtitleStyles =>
      'User configured custom subtitle styles';

  @override
  String get configCopyStandardVideoPlaybackWithoutNeuralUpscalingShaders =>
      'Standard video playback without neural upscaling shaders';

  @override
  String get configCopyModeAFastBalanced => 'Mode A (Fast / Balanced)';

  @override
  String get configCopyRestoresLineArtAndUpscalesCleanlyBalanced =>
      'Restores line art and upscales cleanly. Balanced GPU load, ideal for 1080p anime and mobile/integrated GPUs.';

  @override
  String get configCopyModeAHighQualityHq => 'Mode A (High Quality / HQ)';

  @override
  String get configCopyUltraCrispPerceptualLineReconstructionAndUpscale =>
      'Ultra-crisp perceptual line reconstruction and upscale using Very Large CNNs. Best for discrete desktop GPUs.';

  @override
  String get configCopyModeBSoftDenoise => 'Mode B (Soft / Denoise)';

  @override
  String get configCopySoftLineReconstructionAndArtifactReductionBest =>
      'Soft line reconstruction and artifact reduction. Best for blurry, compressed, or older anime.';

  @override
  String get configCopyModeCDeblurUpscale => 'Mode C (Deblur / Upscale)';

  @override
  String get configCopyAggressiveDeblurringAndScalingBestFor720p =>
      'Aggressive deblurring and scaling. Best for 720p / 480p low-resolution anime streams.';

  @override
  String get configCopyFsr10Smooth => 'FSR 1.0 (Smooth)';

  @override
  String get configCopyEdgeAdaptiveUpscalingForLiveActionAnd =>
      'Edge-adaptive upscaling for live action and older sources. Upscales rather than sharpens, so it is the safer of the two FSR modes. Not useful on a source already at display resolution.';

  @override
  String get configCopyFsr10Sharp => 'FSR 1.0 (Sharp)';

  @override
  String get configCopyFsrWithContrastAdaptiveSharpeningAddsBite =>
      'FSR with contrast-adaptive sharpening. Adds bite to soft or low-bitrate sources. On a 2K or 4K source this can look worse than no upscaling, so use it deliberately.';

  @override
  String get configCopyAutoSafeHardwareAccelerated =>
      'Auto-Safe (Hardware Accelerated)';

  @override
  String get configCopyGpuHardwareDecodingWithSafeDriverFallbacks =>
      'GPU hardware decoding with safe driver fallbacks (recommended)';

  @override
  String get configCopyPureCpuDecodingUsingFfmpegLibavcodecGuarantees =>
      'Pure CPU decoding using FFmpeg libavcodec. Guarantees frame rendering and eliminates black screens.';

  @override
  String get configCopyDirectGpuHardwareDecodingDirect3d11Mediacodec =>
      'Direct GPU hardware decoding (Direct3D 11 / MediaCodec / VAAPI).';

  @override
  String get configCopySubtleGlass => 'Subtle Glass';

  @override
  String get configCopyBalancedLiquid => 'Balanced Liquid';

  @override
  String get configCopyHyperJelly => 'Hyper Jelly';

  @override
  String get configCopyCrystalPrism => 'Crystal Prism';

  @override
  String get configCopyFrostedCyber => 'Frosted Cyber';

  @override
  String get configCopySignalTeal => 'Signal Teal';

  @override
  String get configCopyAmethystViolet => 'Amethyst Violet';

  @override
  String get configCopyCyberpunkNeon => 'Cyberpunk Neon';

  @override
  String get configCopyEmeraldAurora => 'Emerald Aurora';

  @override
  String get configCopySunsetCrimson => 'Sunset Crimson';

  @override
  String get configCopyMidnightSapphire => 'Midnight Sapphire';

  @override
  String get configCopyGoldenAmber => 'Golden Amber';

  @override
  String get configCopyVampireRed => 'Vampire Red';

  @override
  String get configCopyPinkBarbie => 'Pink Barbie';

  @override
  String get configCopyEmberCrimson => 'Ember Crimson';

  @override
  String get configCopyStudioBone => 'Studio Bone';

  @override
  String get configCopyCyberNeonCity => 'Cyber Neon City';

  @override
  String get configCopyCosmicNebula => 'Cosmic Nebula';

  @override
  String get configCopyDarkLiquidSilk => 'Dark Liquid Silk';

  @override
  String get configCopySynthwaveHorizon => 'Synthwave Horizon';

  @override
  String get configCopyMoodyForestMist => 'Moody Forest Mist';

  @override
  String get configCopyAbstractDarkNeon => 'Abstract Dark Neon';

  @override
  String get configCopyRecommendedForYouTrakt => 'Recommended for You (Trakt)';

  @override
  String get configCopyPersonalizedBasedOnYourTraktWatchHistory =>
      'Personalized based on your Trakt watch history';

  @override
  String get configCopyTrendingThisWeek => 'Trending This Week';

  @override
  String get configCopyWhatTraktViewersAreWatchingRightNow =>
      'What Trakt viewers are watching right now';

  @override
  String get configCopyPopularNow => 'Popular Now';

  @override
  String get configCopyMostWatchedTitlesAcrossTrakt =>
      'Most-watched titles across Trakt';

  @override
  String get configCopyComingSoon => 'Coming Soon';

  @override
  String get configCopyMostAnticipatedUpcomingReleases =>
      'Most anticipated upcoming releases';

  @override
  String get configCopyFromTrakt => 'From Trakt';

  @override
  String get configCopyRecommendedForYouSimkl => 'Recommended for You (Simkl)';

  @override
  String get configCopyThe1970s => 'The 1970s';

  @override
  String get configCopyThe1980s => 'The 1980s';

  @override
  String get configCopyThe2000s => 'The 2000s';

  @override
  String get configCopyThe2010s => 'The 2010s';

  @override
  String get configCopyThe90sAction => 'The 90s: Action';

  @override
  String get configCopyThe90sComedy => 'The 90s: Comedy';

  @override
  String get configCopyThe90sHorror => 'The 90s: Horror';

  @override
  String get configCopyThe90sSciFi => 'The 90s: Sci-Fi';

  @override
  String get configCopyThe90sAnimation => 'The 90s: Animation';

  @override
  String get configCopyThe90sThriller => 'The 90s: Thriller';

  @override
  String get configCopyGodfatherCollection => 'Godfather Collection';

  @override
  String get configCopyRockyAndCreed => 'Rocky and Creed';

  @override
  String get configCopyBackToTheFuture => 'Back to the Future';

  @override
  String get configCopyAlien => 'Alien';

  @override
  String get configCopyDieHard => 'Die Hard';

  @override
  String get configCopyLethalWeapon => 'Lethal Weapon';

  @override
  String get configCopyTheTerminator => 'The Terminator';

  @override
  String get configCopyPredator => 'Predator';

  @override
  String get configCopyJurassicPark => 'Jurassic Park';

  @override
  String get configCopyRambo => 'Rambo';

  @override
  String get configCopyIndianaJones => 'Indiana Jones';

  @override
  String get configCopyTheMarxBrothers => 'The Marx Brothers';

  @override
  String get configCopyGrouchoAndHisBrothers13Films1929 =>
      'Groucho and his brothers, 13 films, 1929 to 1949';

  @override
  String get configCopyOnHold => 'On Hold';

  @override
  String get configCopyDropped => 'Dropped';

  @override
  String get configCopyRatings => 'Ratings';

  @override
  String get configCopyTrending => 'Trending';

  @override
  String get configCopyTopRated => 'Top Rated';

  @override
  String get configCopyNewUpcoming => 'New & Upcoming';

  @override
  String get configCopyWatchlist => 'Watchlist';

  @override
  String get configCopyHistory => 'History';

  @override
  String get configCopyCollection => 'Collection';

  @override
  String get configCopyRecommendations => 'Recommendations';

  @override
  String get configCopyAnticipated => 'Anticipated';

  @override
  String get configCopyUntitledList => 'Untitled list';

  @override
  String get configCopyStreamSource => 'Stream Source';

  @override
  String get configCopyAllLanguages => 'All Languages';

  @override
  String get configCopyDefaultZplaySubfont => 'Default (ZPlay Subfont)';

  @override
  String get configCopyAddToFavorites => 'Add to Favorites';

  @override
  String get configCopyHidePassword => 'Hide Password';

  @override
  String get configCopyAspectFitContain => 'ASPECT: FIT (CONTAIN)';

  @override
  String get configCopyAspectFillZoomCrop => 'ASPECT: FILL (ZOOM / CROP)';

  @override
  String get configCopyAspectStretchFill => 'ASPECT: STRETCH (FILL)';

  @override
  String get configCopyPreviousChapterPage => 'Previous chapter page';

  @override
  String get configCopyNextChapterPage => 'Next chapter page';

  @override
  String get configCopyClearChapterSearch => 'Clear chapter search';

  @override
  String get configCopyClearSearch => 'Clear search';

  @override
  String get configCopyReaderCustomization => 'Reader Customization';

  @override
  String get configCopyZoomOut => 'Zoom Out (-)';

  @override
  String get configCopyZoomIn => 'Zoom In (+)';

  @override
  String get configCopyTogglePageDeck => 'Toggle Page Deck';

  @override
  String get configCopyRearrangeStreams => 'Rearrange Streams';

  @override
  String get configCopyAllCategories => 'All Categories';

  @override
  String get configCopyFavorites => 'Favorites';

  @override
  String get configCopyUnknownSource => 'Unknown source';

  @override
  String get configCopyUnknown => 'Unknown';

  @override
  String get configCopyUnknownTitle => 'Unknown Title';

  @override
  String get configCopyUnknownTrack => 'Unknown Track';

  @override
  String get configCopyUntitledBook => 'Untitled Book';

  @override
  String get configCopyUntitledAudiobook => 'Untitled Audiobook';

  @override
  String get configCopyUnknownAddon => 'Unknown Addon';

  @override
  String get configCopyUnknownPlugin => 'Unknown Plugin';

  @override
  String get configCopyTitles => 'Titles';

  @override
  String get configCopySkipIntro => 'Skip Intro';

  @override
  String get configCopySkipRecap => 'Skip Recap';

  @override
  String get configCopySkipCredits => 'Skip Credits';

  @override
  String get configCopySkipPreview => 'Skip Preview';

  @override
  String get configCopySegment => 'Segment';

  @override
  String get configCopyPublisher => 'Publisher';

  @override
  String get configCopySize => 'Size';

  @override
  String get configCopyTvShort => 'TV Short';

  @override
  String get configCopySpecial => 'Special';

  @override
  String get configCopyAiring => 'Airing';

  @override
  String get configCopyUpcoming => 'Upcoming';

  @override
  String get configCopyCancelled => 'Cancelled';

  @override
  String get configCopyOnHiatus => 'On Hiatus';

  @override
  String get configCopyAiringSoon => 'Airing soon';

  @override
  String get configCopySearchesTheWyzieSubtitleCatalogueForMovies =>
      'Searches the Wyzie subtitle catalogue for movies and episodes.';

  @override
  String get configCopyMintsTheAnonymousTokenTheAudionestAudiobook =>
      'Mints the anonymous token the Audionest audiobook search API requires.';

  @override
  String get configCopyBearerForTheAudionestAudiobookSearchEndpoint =>
      'Bearer for the Audionest audiobook search endpoint.';

  @override
  String get configCopyFirebaseKeyForThePaper2audioPdfTo =>
      'Firebase key for the paper2audio PDF to audiobook backend.';

  @override
  String get configCopyBearerForTheVidgodCloudCacheBehind =>
      'Bearer for the VidGod cloud cache behind ZPlayHTTP streams.';

  @override
  String get configCopyBearerForTheFilms365DirectStreamApi =>
      'Bearer for the Films365 direct stream API.';

  @override
  String get configCopyIdentifiesTheTraktApplicationThePairingFlow =>
      'Identifies the Trakt application the pairing flow asks for a device code on, and stamps every Trakt API call.';

  @override
  String get configCopyExchangesTheDeviceCodeForATrakt =>
      'Exchanges the device code for a Trakt access token.';

  @override
  String get configCopyYourKeyIsInUse => 'Your key is in use.';

  @override
  String get configCopySuppliedAtBuildTimeForThisBuild =>
      'Supplied at build time for this build.';

  @override
  String get configCopyRunningOnTheValueThisAppShips =>
      'Running on the value this app ships with.';

  @override
  String get configCopyNoKeyAvailableSoThisSourceStays =>
      'No key available, so this source stays off.';

  @override
  String get configCopyThatKeyWasRejectedByTmdb =>
      'That key was rejected by TMDb';

  @override
  String get configCopyCouldNotReachTmdb => 'Could not reach TMDb';

  @override
  String get configCopy10PicksFrom1970To1979 => '10 picks from 1970 to 1979';

  @override
  String get configCopy10PicksFrom1980To1989 => '10 picks from 1980 to 1989';

  @override
  String get configCopy10PicksFrom2000To2009 => '10 picks from 2000 to 2009';

  @override
  String get configCopy10PicksFrom2010To2019 => '10 picks from 2010 to 2019';

  @override
  String get configCopy10PicksFrom1990To1999 => '10 picks from 1990 to 1999';

  @override
  String get configCopy3Films1972To1990 => '3 films, 1972 to 1990';

  @override
  String get configCopy9Films1976To2023 => '9 films, 1976 to 2023';

  @override
  String get configCopy3Films1985To1990 => '3 films, 1985 to 1990';

  @override
  String get configCopy7Films1979To2024 => '7 films, 1979 to 2024';

  @override
  String get configCopy5Films1988To2013 => '5 films, 1988 to 2013';

  @override
  String get configCopy4Films1987To1998 => '4 films, 1987 to 1998';

  @override
  String get configCopy6Films1984To2019 => '6 films, 1984 to 2019';

  @override
  String get configCopy5Films1987To2022 => '5 films, 1987 to 2022';

  @override
  String get configCopy6Films1993To2022 => '6 films, 1993 to 2022';

  @override
  String get configCopy5Films1982To2019 => '5 films, 1982 to 2019';

  @override
  String get configCopy5Films1981To2023 => '5 films, 1981 to 2023';

  @override
  String get configCopyStremioBasedMultiResolutionHttpStreamScraper =>
      'Stremio-based multi-resolution HTTP stream scraper';

  @override
  String get configCopyDirectHighSpeedHttpMediaStorageScraper =>
      'Direct high-speed HTTP media storage scraper';

  @override
  String get configCopy4kHdDirectStreamExtractor =>
      '4K & HD direct stream extractor';

  @override
  String get configCopyFastMultiSourceStreamDownloader =>
      'Fast multi-source stream downloader';

  @override
  String get configCopyVideasyMultiCdnEncryptedHlsScraper =>
      'Videasy multi-CDN encrypted HLS scraper';

  @override
  String get configCopyVidsrcStreamingNetworkResolver =>
      'VidSrc streaming network resolver';

  @override
  String get configCopy2embedMultiHostStreamAggregator =>
      '2Embed multi-host stream aggregator';

  @override
  String get configCopyMultiSourceHdVideoCoreExtractor =>
      'Multi-source HD video core extractor';

  @override
  String get configCopyUltraFastHlsStreamingNetwork =>
      'Ultra-fast HLS streaming network';

  @override
  String get configCopyMovienightMultiServerHlsStreams =>
      'MovieNight multi-server HLS streams';

  @override
  String get configCopyDirectMediaDownloadStreamExtractor =>
      'Direct media download & stream extractor';

  @override
  String get configCopyDirectEncryptedMp4HlsSourceProvider =>
      'Direct encrypted MP4/HLS source provider';

  @override
  String get configCopyFastCloudHlsStreamResolver =>
      'Fast cloud HLS stream resolver';

  @override
  String get configCopyRiveMultiServerDirectStreamProvider =>
      'Rive multi-server direct stream provider';

  @override
  String get configCopyCinejoyMultiCdnVideoSourceProvider =>
      'Cinejoy multi-CDN video source provider';

  @override
  String get configCopyDuloHighSpeedDirectStreamNetwork =>
      'Dulo high-speed direct stream network';

  @override
  String get configCopyVidupCloudVideoHostingScraper =>
      'VidUp cloud video hosting scraper';

  @override
  String get configCopyFlaxmoviesMultiCdnDirectStreams =>
      'FlaxMovies multi-CDN direct streams';

  @override
  String get configCopyMultiServerCloudVideoStreams =>
      'Multi-server cloud video streams';

  @override
  String get configCopyLowLatencyDirectStreamingProvider =>
      'Low-latency direct streaming provider';

  @override
  String get configCopyFastCloudVideoSourceProvider =>
      'Fast cloud video source provider';

  @override
  String get configCopyLookmovieDirectMultiQualityStreams =>
      'LookMovie direct multi-quality streams';

  @override
  String get configCopyHexaMultiHostVideoExtractor =>
      'Hexa multi-host video extractor';

  @override
  String get configCopyBcineDirectMasterHlsProvider =>
      'Bcine direct master HLS provider';

  @override
  String get configCopyMappleFastStreamingProvider =>
      'Mapple fast streaming provider';

  @override
  String get configCopyNovaMultiServerStreamExtractor =>
      'Nova multi-server stream extractor';

  @override
  String get configCopyMegasourceMultiCdnVideoNetwork =>
      'MegaSource multi-CDN video network';

  @override
  String get configCopyPurstreamDirectVideoStreamResolver =>
      'Purstream direct video stream resolver';

  @override
  String get configCopyVidapiDirectVideoSourceExtractor =>
      'VidApi direct video source extractor';

  @override
  String get configCopyVidrockCloudVideoProvider =>
      'VidRock cloud video provider';

  @override
  String get configCopyVidvaultSecureStreamingNetwork =>
      'VidVault secure streaming network';

  @override
  String get configCopyVidzeeHighSpeedVideoProvider =>
      'VidZee high-speed video provider';

  @override
  String get configCopyCinesrcDirectMasterHlsWithBright67Subtitles =>
      'CineSrc direct master HLS with bright67 subtitles';

  @override
  String get configCopyCinesuDirectVideoStreamExtractor =>
      'CineSu direct video stream extractor';

  @override
  String get configCopyFrameMultiResolutionStreamProvider =>
      'Frame multi-resolution stream provider';

  @override
  String get configCopyFsharetvCloudStreamingNetwork =>
      'FshareTV cloud streaming network';

  @override
  String get configCopyFsonicDirectCloudVideoScraper =>
      'FSonic direct cloud video scraper';

  @override
  String get configCopyFsonlineMultiHostStreamResolver =>
      'FSOnline multi-host stream resolver';

  @override
  String get configCopyKisskhAsianDramaAnimeStreamingProvider =>
      'KissKH Asian drama & anime streaming provider';

  @override
  String get configCopyLmscriptVideoSourceExtractor =>
      'LMScript video source extractor';

  @override
  String get configCopyMeowtvDirectStreamingNetwork =>
      'MeowTV direct streaming network';

  @override
  String get configCopyVidlinkFastMultiCdnStreamProvider =>
      'VidLink fast multi-CDN stream provider';

  @override
  String get configCopyVixsrcDirectMasterStreamingExtractor =>
      'VixSrc direct master streaming extractor';

  @override
  String get configCopyXpassMultiServerVideoScraper =>
      'XPass multi-server video scraper';

  @override
  String get configCopyZxcstreamMultiSourceDirectProvider =>
      'ZxcStream multi-source direct provider';

  @override
  String get configCopyBollywoodHindiDualAudioHollywoodDirectStreams =>
      'Bollywood, Hindi Dual-Audio & Hollywood direct streams';

  @override
  String get configExtraStandard => 'Standard';

  @override
  String get configExtraRecommended => 'Recommended';

  @override
  String get configExtraUltraQuality => 'Ultra Quality';

  @override
  String get configExtraDenoise => 'Denoise';

  @override
  String get configExtraDeblur => 'Deblur';

  @override
  String get configExtraDefault => 'Default';

  @override
  String get configExtra100Reliable => '100% Reliable';

  @override
  String get configExtraMaxGpu => 'Max GPU';

  @override
  String get configExtraSimilarTo => 'Similar to';

  @override
  String get configExtraMoviesTv => 'Movies & TV';

  @override
  String get configExtraLiveTv => 'Live TV';

  @override
  String get configExtraMyList => 'My List';

  @override
  String get configExtraDownloads => 'Downloads';

  @override
  String get configExtraManga => 'Manga';

  @override
  String get configExtraBooks => 'Books';

  @override
  String get configExtraAudiobooks => 'Audiobooks';

  @override
  String get configExtraMusic => 'Music';

  @override
  String get configExtraCollections => 'Collections';

  @override
  String get configExtraAnime => 'Anime';

  @override
  String get configExtraAll => 'All';

  @override
  String get configExtraNone => 'None';

  @override
  String get configExtraSeries => 'Series';

  @override
  String get configExtraMovie => 'Movie';

  @override
  String get configExtraCustomStream => 'Custom Stream';

  @override
  String get configExtraLiveStream => 'Live Stream';

  @override
  String get configExtraTorrentEngine => 'Torrent Engine';

  @override
  String get configExtraRefusedByProvider => 'Refused by provider';

  @override
  String get configExtraAccountRejected => 'Account rejected';

  @override
  String get appearanceDetailCustomActive => 'Custom Active';

  @override
  String get appearanceDetailDefaultTheme => 'Default Theme';

  @override
  String get appearanceDetailSpotlightOn => 'Spotlight ON';

  @override
  String get appearanceDetailCompact => 'Compact';

  @override
  String get appearanceDetailWebtoon => 'Webtoon';

  @override
  String get appearanceDetailHorizontal => 'Horizontal';

  @override
  String get appearanceDetailSkiaRecommended => 'Skia (Recommended)';

  @override
  String get appearanceDetailDisabled => 'Disabled';

  @override
  String get appearanceDetailBackgroundImageUploadedAndAppliedAcrossAllUi =>
      'Background image uploaded and applied across all UI!';

  @override
  String get appearanceDetailPleaseEnterAValidHttpOrHttpsImage =>
      'Please enter a valid HTTP or HTTPS image URL.';

  @override
  String get appearanceDetailCustomBackgroundUrlApplied =>
      'Custom background URL applied!';

  @override
  String get appearanceDetailUploadPhotoFromDevice =>
      'Upload Photo from Device';

  @override
  String get appearanceDetailBackgroundResetToDefaultTheme =>
      'Background reset to default theme.';

  @override
  String appearanceDetailAppliedWallpaperName(String name) {
    return 'Applied wallpaper: $name';
  }

  @override
  String get appearanceDetailRequiresTraktLoginInSettingsTrakt =>
      'Requires Trakt login in Settings -> Trakt';

  @override
  String get appearanceDetailRequiresSimklLoginInSettingsSimkl =>
      'Requires Simkl login in Settings -> Simkl';

  @override
  String get appearanceDetailDisconnected => 'DISCONNECTED';

  @override
  String get appearanceDetailPreviewEnableGlassAbove =>
      'PREVIEW (ENABLE GLASS ABOVE)';

  @override
  String get appearanceDetailDragDropLayout => 'Drag & Drop Layout';

  @override
  String get appearanceDetailSeekBarCanvas => 'Seek Bar Canvas';

  @override
  String get appearanceDetailPlayButtonPhysics => 'Play Button & Physics';

  @override
  String get appearanceDetailArtworkFrame => 'Artwork & Frame';

  @override
  String get appearanceDetailArtworkVinylFrame => 'Artwork & Vinyl Frame';

  @override
  String get appearanceDetailChapterBookTitles => 'Chapter & Book Titles';

  @override
  String get appearanceDetailSeekBarScrubberCanvas =>
      'Seek Bar Scrubber Canvas';

  @override
  String get appearanceDetailPrimaryControlsPlayPauseSkip10s =>
      'Primary Controls (Play, Pause, Skip ±10s)';

  @override
  String get appearanceDetailSecondaryControlsSpeedPillVolume =>
      'Secondary Controls (Speed Pill & Volume)';

  @override
  String get appearanceDetailPremadeChaptersPanelButton =>
      'Premade Chapters Panel Button';

  @override
  String get appearanceDetailPlay => 'PLAY';

  @override
  String get appearanceDetailChapter4TheSecretsOfTheNight =>
      'Chapter 4: The Secrets of the Night';

  @override
  String get appearanceDetailChapter4Of24HarryPotterTheSorcerer =>
      'Chapter 4 of 24 • Harry Potter & The Sorcerer\'s Stone';

  @override
  String get appearanceDetailChapter1TheBoyWhoLived =>
      'Chapter 1: The Boy Who Lived';

  @override
  String get appearanceDetailChapter2TheVanishingGlass =>
      'Chapter 2: The Vanishing Glass';

  @override
  String get appearanceDetailChapter3TheLettersFromNoOne =>
      'Chapter 3: The Letters from No One';

  @override
  String get appearanceDetailChapter4TheKeeperOfTheKeys =>
      'Chapter 4: The Keeper of the Keys';

  @override
  String get appearanceDetailChapter5DiagonAlley => 'Chapter 5: Diagon Alley';

  @override
  String get appearanceDetailArtworkTurntable => 'Artwork & Turntable';

  @override
  String get appearanceDetailAlbumArtVinylTurntable =>
      'Album Art & Vinyl Turntable';

  @override
  String get appearanceDetailTrackArtistAlbumTitles =>
      'Track, Artist & Album Titles';

  @override
  String get appearanceDetailTrackTitleQualityBadge =>
      'Track Title & Quality Badge';

  @override
  String get appearanceDetailLosslessHiResAudioQualityBadge =>
      'Lossless Hi-Res Audio Quality Badge';

  @override
  String get appearanceDetailPrimaryControlsPlayPauseSkipShuffleRepeat =>
      'Primary Controls (Play, Pause, Skip, Shuffle, Repeat)';

  @override
  String get appearanceDetailSecondaryControlsVolumeSlider =>
      'Secondary Controls (Volume Slider)';

  @override
  String get appearanceDetailSyncedLyricsQueueQuickButtons =>
      'Synced Lyrics & Queue Quick Buttons';

  @override
  String get appearanceDetailAudiobookCoverArtworkDeck =>
      'Audiobook Cover Artwork Deck';

  @override
  String get appearanceDetailTitleAuthorChapterLabel =>
      'Title, Author & Chapter Label';

  @override
  String get appearanceDetailSeekBarWaveformCanvasScrubber =>
      'Seek Bar & Waveform Canvas Scrubber';

  @override
  String get appearanceDetailMainPlayPauseSkip10sCluster =>
      'Main Play / Pause / Skip (±10s) Cluster';

  @override
  String get appearanceDetailSpeedSelectorVolumeControls =>
      'Speed Selector & Volume Controls';

  @override
  String get appearanceDetailPremadeSlidingChaptersPanelTrigger =>
      'Premade Sliding Chapters Panel Trigger';

  @override
  String get appearanceDetailTheWayOfKings => 'The Way of Kings';

  @override
  String get appearanceDetailBrandonSandersonChapter1Stormblessed =>
      'Brandon Sanderson • Chapter 1: Stormblessed';

  @override
  String get animeSourceSettingsTitle => 'Anime metadata sources';

  @override
  String get animeSourceSettingsSubtitle =>
      'Switch catalog, search and detail providers; playback sources are unchanged.';

  @override
  String get animeSourceAniList => 'AniList';

  @override
  String get animeSourceBangumi => 'Bangumi (Chinese metadata)';

  @override
  String get animeSourceFallback => 'Fallback and supplemental data';

  @override
  String get animeSourceFallbackHelp =>
      'When Bangumi fails or does not support a filter, use AniList. Also supplement cast and playback identity fields.';

  @override
  String get animeSourceMirror => 'Optional HTTPS mirror';

  @override
  String get animeSourceMirrorHelp =>
      'Leave blank to use official API. Only enter a trusted, authorized Bangumi-compatible mirror origin. Public search queries will be sent to it.';

  @override
  String get animeSourceProxy => 'Optional HTTP proxy';

  @override
  String get animeSourceProxyHelp =>
      'Example: http://127.0.0.1:7890. Blank uses process proxy environment, then Windows system proxy.';

  @override
  String get animeSourceSave => 'Save network settings';

  @override
  String get animeSourceSaved => 'Network settings saved';

  @override
  String get animeSourceInvalid =>
      'Invalid origin or proxy. Use HTTPS mirror and HTTP proxy with a port.';

  @override
  String get animeSourceIdentityHelp =>
      'Only subjects with a verified AniList mapping are shown in Bangumi catalogs for now. Existing history and library IDs stay unchanged.';

  @override
  String get animeSourceCheck => 'Test Bangumi connection';

  @override
  String get animeSourceCheckOk => 'Bangumi connection succeeded';

  @override
  String get animeSourceCheckFail =>
      'Bangumi connection failed; check network settings.';
}
