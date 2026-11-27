import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Kiru'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get navBrowse;

  /// No description provided for @navSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// No description provided for @navLibrary.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get navLibrary;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @navLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get navLiveTv;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get actionRetry;

  /// No description provided for @actionTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get actionTryAgain;

  /// No description provided for @actionCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get actionCopy;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionCopyReport.
  ///
  /// In en, this message translates to:
  /// **'Copy report'**
  String get actionCopyReport;

  /// No description provided for @actionSaveReport.
  ///
  /// In en, this message translates to:
  /// **'Save report'**
  String get actionSaveReport;

  /// No description provided for @actionCopyDiagnostic.
  ///
  /// In en, this message translates to:
  /// **'Copy diagnostic'**
  String get actionCopyDiagnostic;

  /// No description provided for @shellFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen'**
  String get shellFullscreen;

  /// No description provided for @shellExitFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Exit Fullscreen'**
  String get shellExitFullscreen;

  /// No description provided for @shellFullscreenTooltip.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen (F11)'**
  String get shellFullscreenTooltip;

  /// No description provided for @shellExitFullscreenTooltip.
  ///
  /// In en, this message translates to:
  /// **'Exit Fullscreen (F11)'**
  String get shellExitFullscreenTooltip;

  /// No description provided for @shellMinimizeWindowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Minimize window'**
  String get shellMinimizeWindowTooltip;

  /// No description provided for @shellMaximizeWindowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Maximize window'**
  String get shellMaximizeWindowTooltip;

  /// No description provided for @shellRestoreWindowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Restore window'**
  String get shellRestoreWindowTooltip;

  /// No description provided for @shellCloseWindowTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close window'**
  String get shellCloseWindowTooltip;

  /// No description provided for @errorLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load movies'**
  String get errorLoadFailed;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get errorUnknown;

  /// No description provided for @listSeparator.
  ///
  /// In en, this message translates to:
  /// **', '**
  String get listSeparator;

  /// No description provided for @shortcutsTitle.
  ///
  /// In en, this message translates to:
  /// **'Keyboard shortcuts'**
  String get shortcutsTitle;

  /// No description provided for @shortcutsClose.
  ///
  /// In en, this message translates to:
  /// **'Close keyboard shortcuts'**
  String get shortcutsClose;

  /// No description provided for @shortcutsGroupAnywhere.
  ///
  /// In en, this message translates to:
  /// **'Anywhere'**
  String get shortcutsGroupAnywhere;

  /// No description provided for @shortcutsGroupMoving.
  ///
  /// In en, this message translates to:
  /// **'Moving around'**
  String get shortcutsGroupMoving;

  /// No description provided for @shortcutsGroupPlaying.
  ///
  /// In en, this message translates to:
  /// **'While playing'**
  String get shortcutsGroupPlaying;

  /// No description provided for @shortcutsGroupReading.
  ///
  /// In en, this message translates to:
  /// **'While reading'**
  String get shortcutsGroupReading;

  /// No description provided for @shortcutsShowSheet.
  ///
  /// In en, this message translates to:
  /// **'Show this sheet'**
  String get shortcutsShowSheet;

  /// No description provided for @shortcutsShowSheetNote.
  ///
  /// In en, this message translates to:
  /// **'Also Shift + /'**
  String get shortcutsShowSheetNote;

  /// No description provided for @shortcutsToggleFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Toggle fullscreen'**
  String get shortcutsToggleFullscreen;

  /// No description provided for @shortcutsLeaveFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Leave fullscreen, or close what is open'**
  String get shortcutsLeaveFullscreen;

  /// No description provided for @shortcutsLeaveFullscreenNote.
  ///
  /// In en, this message translates to:
  /// **'Never navigates away from a page by itself'**
  String get shortcutsLeaveFullscreenNote;

  /// No description provided for @shortcutsMyList.
  ///
  /// In en, this message translates to:
  /// **'My List and Downloads'**
  String get shortcutsMyList;

  /// No description provided for @shortcutsSearchMacNote.
  ///
  /// In en, this message translates to:
  /// **'Cmd + K on macOS'**
  String get shortcutsSearchMacNote;

  /// No description provided for @shortcutsSettingsMacNote.
  ///
  /// In en, this message translates to:
  /// **'Cmd + , on macOS'**
  String get shortcutsSettingsMacNote;

  /// No description provided for @shortcutsPlayPause.
  ///
  /// In en, this message translates to:
  /// **'Play or pause'**
  String get shortcutsPlayPause;

  /// No description provided for @shortcutsPlayPauseNote.
  ///
  /// In en, this message translates to:
  /// **'K does the same'**
  String get shortcutsPlayPauseNote;

  /// No description provided for @shortcutsSeek.
  ///
  /// In en, this message translates to:
  /// **'Back or forward 10 seconds'**
  String get shortcutsSeek;

  /// No description provided for @shortcutsSeekNote.
  ///
  /// In en, this message translates to:
  /// **'The arrow keys do this too, when the video has focus'**
  String get shortcutsSeekNote;

  /// No description provided for @shortcutsMute.
  ///
  /// In en, this message translates to:
  /// **'Mute or unmute'**
  String get shortcutsMute;

  /// No description provided for @shortcutsAspect.
  ///
  /// In en, this message translates to:
  /// **'Change how the video fills the screen'**
  String get shortcutsAspect;

  /// No description provided for @shortcutsPage.
  ///
  /// In en, this message translates to:
  /// **'Previous or next page or chapter'**
  String get shortcutsPage;

  /// No description provided for @shortcutsLine.
  ///
  /// In en, this message translates to:
  /// **'Down or up a line, in focus mode'**
  String get shortcutsLine;

  /// No description provided for @nowPlayingSemantics.
  ///
  /// In en, this message translates to:
  /// **'Now playing, {title}, {subtitle}'**
  String nowPlayingSemantics(String title, String subtitle);

  /// No description provided for @nowPlayingOpenHint.
  ///
  /// In en, this message translates to:
  /// **'Open the full player'**
  String get nowPlayingOpenHint;

  /// No description provided for @playerPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get playerPrevious;

  /// No description provided for @playerNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get playerNext;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSectionPlayback.
  ///
  /// In en, this message translates to:
  /// **'PLAYBACK'**
  String get settingsSectionPlayback;

  /// No description provided for @settingsSectionSources.
  ///
  /// In en, this message translates to:
  /// **'SOURCES'**
  String get settingsSectionSources;

  /// No description provided for @settingsSectionIntegrations.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATIONS'**
  String get settingsSectionIntegrations;

  /// No description provided for @settingsSectionAppearance.
  ///
  /// In en, this message translates to:
  /// **'APPEARANCE'**
  String get settingsSectionAppearance;

  /// No description provided for @settingsSectionContent.
  ///
  /// In en, this message translates to:
  /// **'CONTENT'**
  String get settingsSectionContent;

  /// No description provided for @settingsSectionApp.
  ///
  /// In en, this message translates to:
  /// **'APP'**
  String get settingsSectionApp;

  /// No description provided for @stateEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get stateEnabled;

  /// No description provided for @stateDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get stateDisabled;

  /// No description provided for @stateActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get stateActive;

  /// No description provided for @stateOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get stateOffline;

  /// No description provided for @stateConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get stateConnected;

  /// No description provided for @stateNotSet.
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get stateNotSet;

  /// No description provided for @stateOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get stateOn;

  /// No description provided for @stateOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get stateOff;

  /// No description provided for @settingsVideoTitle.
  ///
  /// In en, this message translates to:
  /// **'Video & Upscaling'**
  String get settingsVideoTitle;

  /// No description provided for @settingsVideoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Anime4K neural GLSL shader presets and GPU pipeline'**
  String get settingsVideoSubtitle;

  /// No description provided for @settingsP2pTitle.
  ///
  /// In en, this message translates to:
  /// **'Built-in P2P Torrent Source'**
  String get settingsP2pTitle;

  /// No description provided for @settingsP2pActiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'ZPlay torrent swarms (Knaben, TorrentGalaxy) active'**
  String get settingsP2pActiveSubtitle;

  /// No description provided for @settingsP2pDisabledSubtitle.
  ///
  /// In en, this message translates to:
  /// **'P2P disabled. Using only direct HTTP streaming (ZPlayHTTP)'**
  String get settingsP2pDisabledSubtitle;

  /// No description provided for @settingsP2pActiveValue.
  ///
  /// In en, this message translates to:
  /// **'P2P Active'**
  String get settingsP2pActiveValue;

  /// No description provided for @settingsP2pHttpValue.
  ///
  /// In en, this message translates to:
  /// **'HTTP Only'**
  String get settingsP2pHttpValue;

  /// No description provided for @settingsP2pInfoTooltip.
  ///
  /// In en, this message translates to:
  /// **'P2P Advisory Details'**
  String get settingsP2pInfoTooltip;

  /// No description provided for @settingsAddonsTitle.
  ///
  /// In en, this message translates to:
  /// **'Addons'**
  String get settingsAddonsTitle;

  /// No description provided for @settingsAddonsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Stremio catalogs and content providers'**
  String get settingsAddonsSubtitle;

  /// No description provided for @settingsAddonsInstalled.
  ///
  /// In en, this message translates to:
  /// **'{count} Installed'**
  String settingsAddonsInstalled(int count);

  /// No description provided for @settingsBuiltinTitle.
  ///
  /// In en, this message translates to:
  /// **'Built-in Providers'**
  String get settingsBuiltinTitle;

  /// No description provided for @settingsBuiltinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'ZPlayHTTP streaming sources, priority order & toggles'**
  String get settingsBuiltinSubtitle;

  /// No description provided for @settingsBuiltinCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get settingsBuiltinCustom;

  /// No description provided for @settingsBuiltinDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get settingsBuiltinDefault;

  /// No description provided for @settingsDebridTitle.
  ///
  /// In en, this message translates to:
  /// **'Debrid & Cloud Streaming'**
  String get settingsDebridTitle;

  /// No description provided for @settingsDebridSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Real-Debrid, TorBox, AllDebrid, Premiumize & Debrid-Link'**
  String get settingsDebridSubtitle;

  /// No description provided for @settingsTraktTitle.
  ///
  /// In en, this message translates to:
  /// **'Trakt.tv Sync'**
  String get settingsTraktTitle;

  /// No description provided for @settingsTraktSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cross-device watchlist, history & playback synchronization'**
  String get settingsTraktSubtitle;

  /// No description provided for @settingsSimklTitle.
  ///
  /// In en, this message translates to:
  /// **'Simkl Sync'**
  String get settingsSimklTitle;

  /// No description provided for @settingsSimklSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cross-device Movies, TV & Anime synchronization'**
  String get settingsSimklSubtitle;

  /// No description provided for @settingsTmdbTitle.
  ///
  /// In en, this message translates to:
  /// **'TMDb API Key'**
  String get settingsTmdbTitle;

  /// No description provided for @settingsTmdbSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your own key for the ranked 1990s rails and scraper metadata'**
  String get settingsTmdbSubtitle;

  /// No description provided for @settingsTmdbYourKey.
  ///
  /// In en, this message translates to:
  /// **'Your key'**
  String get settingsTmdbYourKey;

  /// No description provided for @settingsServiceKeysTitle.
  ///
  /// In en, this message translates to:
  /// **'Service API Keys'**
  String get settingsServiceKeysTitle;

  /// No description provided for @settingsServiceKeysSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Subtitles, audiobooks and scraper keys you supply yourself'**
  String get settingsServiceKeysSubtitle;

  /// No description provided for @settingsServiceKeysCount.
  ///
  /// In en, this message translates to:
  /// **'{provided} of {total} set'**
  String settingsServiceKeysCount(int provided, int total);

  /// No description provided for @settingsDiscordTitle.
  ///
  /// In en, this message translates to:
  /// **'Discord Rich Presence'**
  String get settingsDiscordTitle;

  /// No description provided for @settingsDiscordEnabledSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Broadcasting movies, shows, music & live activity to Discord'**
  String get settingsDiscordEnabledSubtitle;

  /// No description provided for @settingsDiscordDisabledSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Disabled. Activity is hidden from Discord'**
  String get settingsDiscordDisabledSubtitle;

  /// No description provided for @settingsAppearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Interface'**
  String get settingsAppearanceTitle;

  /// No description provided for @settingsAppearanceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass setup, color themes, and Home Page UI'**
  String get settingsAppearanceSubtitle;

  /// No description provided for @settingsGlassOn.
  ///
  /// In en, this message translates to:
  /// **'Glass ON'**
  String get settingsGlassOn;

  /// No description provided for @settingsCalendarTitle.
  ///
  /// In en, this message translates to:
  /// **'TV Airing Calendar'**
  String get settingsCalendarTitle;

  /// No description provided for @settingsCalendarOnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Calendar buttons active on Home top bar and section headers'**
  String get settingsCalendarOnSubtitle;

  /// No description provided for @settingsCalendarOffSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Calendar disabled and hidden across all pages'**
  String get settingsCalendarOffSubtitle;

  /// No description provided for @settingsAiQuizTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Recommendation Quiz'**
  String get settingsAiQuizTitle;

  /// No description provided for @settingsAiQuizOnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI Taste Profile Quiz active on Home and Search bars'**
  String get settingsAiQuizOnSubtitle;

  /// No description provided for @settingsAiQuizOffSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI quiz disabled and hidden across all pages'**
  String get settingsAiQuizOffSubtitle;

  /// No description provided for @settingsAdultTitle.
  ///
  /// In en, this message translates to:
  /// **'Adult Content'**
  String get settingsAdultTitle;

  /// No description provided for @settingsAdultOnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'18+ catalogs, search results and sources are enabled'**
  String get settingsAdultOnSubtitle;

  /// No description provided for @settingsAdultOffSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hidden. No 18+ catalogs, search results or sources are fetched'**
  String get settingsAdultOffSubtitle;

  /// No description provided for @settingsBackupTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup & Restore'**
  String get settingsBackupTitle;

  /// No description provided for @settingsBackupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Export or import settings, theme and library progress (JSON)'**
  String get settingsBackupSubtitle;

  /// No description provided for @settingsBackupDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Cross-device JSON configuration'**
  String get settingsBackupDialogSubtitle;

  /// No description provided for @settingsBackupDescription.
  ///
  /// In en, this message translates to:
  /// **'Exports your settings, theme, My List and progress. Leave the passphrase blank for a redacted profile that keeps credentials, IPTV portals and addon URLs on this device. A passphrase encrypts a full profile with them included.'**
  String get settingsBackupDescription;

  /// No description provided for @settingsPassphraseOptional.
  ///
  /// In en, this message translates to:
  /// **'Passphrase (optional)'**
  String get settingsPassphraseOptional;

  /// No description provided for @settingsPassphraseHelper.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters for an encrypted full profile.'**
  String get settingsPassphraseHelper;

  /// No description provided for @settingsExportProfile.
  ///
  /// In en, this message translates to:
  /// **'Export Profile'**
  String get settingsExportProfile;

  /// No description provided for @settingsPassphraseTooShort.
  ///
  /// In en, this message translates to:
  /// **'Use at least 8 characters for the passphrase.'**
  String get settingsPassphraseTooShort;

  /// No description provided for @settingsRedactedProfileCopied.
  ///
  /// In en, this message translates to:
  /// **'Redacted profile copied. Credentials, portals and addons stay on this device.'**
  String get settingsRedactedProfileCopied;

  /// No description provided for @settingsEncryptedProfileCopied.
  ///
  /// In en, this message translates to:
  /// **'Encrypted full profile copied. Keep the passphrase safe; it cannot be recovered.'**
  String get settingsEncryptedProfileCopied;

  /// No description provided for @settingsImportJson.
  ///
  /// In en, this message translates to:
  /// **'Import JSON'**
  String get settingsImportJson;

  /// No description provided for @settingsPasteJsonTitle.
  ///
  /// In en, this message translates to:
  /// **'Paste Configuration JSON'**
  String get settingsPasteJsonTitle;

  /// No description provided for @settingsPasteJsonHint.
  ///
  /// In en, this message translates to:
  /// **'Paste backup JSON here...'**
  String get settingsPasteJsonHint;

  /// No description provided for @settingsPassphraseEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Passphrase (encrypted profiles)'**
  String get settingsPassphraseEncrypted;

  /// No description provided for @settingsPassphraseEncryptedHelper.
  ///
  /// In en, this message translates to:
  /// **'Leave blank for a redacted profile. Encrypted profiles need the passphrase they were exported with.'**
  String get settingsPassphraseEncryptedHelper;

  /// No description provided for @settingsPasteFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste from Clipboard'**
  String get settingsPasteFromClipboard;

  /// No description provided for @settingsFromFile.
  ///
  /// In en, this message translates to:
  /// **'From File'**
  String get settingsFromFile;

  /// No description provided for @settingsRestoreNow.
  ///
  /// In en, this message translates to:
  /// **'Restore Now'**
  String get settingsRestoreNow;

  /// No description provided for @settingsImportFailed.
  ///
  /// In en, this message translates to:
  /// **'Import failed: {error}'**
  String settingsImportFailed(String error);

  /// No description provided for @settingsChooseProfile.
  ///
  /// In en, this message translates to:
  /// **'Choose a Kiru profile'**
  String get settingsChooseProfile;

  /// No description provided for @settingsClearCacheTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear cache'**
  String get settingsClearCacheTitle;

  /// No description provided for @settingsClearCacheSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Drop cached artwork & metadata. Sign-in, addons, My List & history stay'**
  String get settingsClearCacheSubtitle;

  /// No description provided for @settingsClearCacheConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear cache?'**
  String get settingsClearCacheConfirmTitle;

  /// No description provided for @settingsClearCacheConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Removes cached artwork and metadata so fresh copies are fetched. This does not sign you out or remove addons - your profile, My List, watch history and settings stay exactly as they are.'**
  String get settingsClearCacheConfirmBody;

  /// No description provided for @settingsClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get settingsClear;

  /// No description provided for @settingsCacheArtwork.
  ///
  /// In en, this message translates to:
  /// **'artwork cache ({error})'**
  String settingsCacheArtwork(String error);

  /// No description provided for @settingsCacheMetadata.
  ///
  /// In en, this message translates to:
  /// **'metadata cache ({error})'**
  String settingsCacheMetadata(String error);

  /// No description provided for @settingsCacheHero.
  ///
  /// In en, this message translates to:
  /// **'hero artwork cache ({error})'**
  String settingsCacheHero(String error);

  /// No description provided for @settingsCacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared.'**
  String get settingsCacheCleared;

  /// No description provided for @settingsCacheClearedExcept.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared except the {failures}.'**
  String settingsCacheClearedExcept(String failures);

  /// No description provided for @settingsCacheClearedSuffix.
  ///
  /// In en, this message translates to:
  /// **'You are still signed in - addons, My List, watch history and settings are untouched.'**
  String get settingsCacheClearedSuffix;

  /// No description provided for @settingsUpdatesTitle.
  ///
  /// In en, this message translates to:
  /// **'App Updates'**
  String get settingsUpdatesTitle;

  /// No description provided for @settingsUpdatesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check for latest software versions and patches'**
  String get settingsUpdatesSubtitle;

  /// No description provided for @settingsUpdatesCheck.
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get settingsUpdatesCheck;

  /// No description provided for @settingsDiagnosticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App, device and player state (redacted) you can copy or save'**
  String get settingsDiagnosticsSubtitle;

  /// No description provided for @settingsLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Simplified Chinese, English, Arabic, or follow the device'**
  String get settingsLanguageSubtitle;

  /// No description provided for @settingsAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Kiru'**
  String get settingsAboutTitle;

  /// No description provided for @settingsAboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Architecture, video engine, and credits'**
  String get settingsAboutSubtitle;

  /// No description provided for @diagnosticsTitle.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics'**
  String get diagnosticsTitle;

  /// No description provided for @diagnosticsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Local app, device and player report (no telemetry)'**
  String get diagnosticsSubtitle;

  /// No description provided for @diagnosticsDescription.
  ///
  /// In en, this message translates to:
  /// **'A local-only snapshot of this install: app and device details, player settings, the stream engine state and the recent crash breadcrumbs. Credentials, addon URLs, IPTV portals and playlist links are never included. Nothing is uploaded - the report only exists once you copy or save it.'**
  String get diagnosticsDescription;

  /// No description provided for @diagnosticsSectionDevice.
  ///
  /// In en, this message translates to:
  /// **'DEVICE'**
  String get diagnosticsSectionDevice;

  /// No description provided for @diagnosticsSectionPlayerEngine.
  ///
  /// In en, this message translates to:
  /// **'PLAYER & ENGINE'**
  String get diagnosticsSectionPlayerEngine;

  /// No description provided for @diagnosticsSectionBreadcrumbs.
  ///
  /// In en, this message translates to:
  /// **'CRASH BREADCRUMBS'**
  String get diagnosticsSectionBreadcrumbs;

  /// No description provided for @diagnosticsSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get diagnosticsSummary;

  /// No description provided for @diagnosticsNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get diagnosticsNotAvailable;

  /// No description provided for @diagnosticsBreadcrumbCount.
  ///
  /// In en, this message translates to:
  /// **'{count} recorded • last {shown} shown'**
  String diagnosticsBreadcrumbCount(int count, int shown);

  /// No description provided for @diagnosticsBreadcrumbs.
  ///
  /// In en, this message translates to:
  /// **'Recent activity'**
  String get diagnosticsBreadcrumbs;

  /// No description provided for @diagnosticsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No breadcrumbs recorded yet.'**
  String get diagnosticsEmpty;

  /// No description provided for @diagnosticsCopied.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics report copied.'**
  String get diagnosticsCopied;

  /// No description provided for @diagnosticsCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Diagnostic report copied to clipboard'**
  String get diagnosticsCopiedToClipboard;

  /// No description provided for @diagnosticsCopyFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not copy the report'**
  String get diagnosticsCopyFailed;

  /// No description provided for @diagnosticsSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save the report'**
  String get diagnosticsSaveFailed;

  /// No description provided for @diagnosticsSaved.
  ///
  /// In en, this message translates to:
  /// **'Diagnostics saved to {path}'**
  String diagnosticsSaved(String path);

  /// No description provided for @searchHintTv.
  ///
  /// In en, this message translates to:
  /// **'Search for a movie or series'**
  String get searchHintTv;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search movies, series, or paste links'**
  String get searchHint;

  /// No description provided for @searchVoice.
  ///
  /// In en, this message translates to:
  /// **'Search by voice'**
  String get searchVoice;

  /// No description provided for @searchVoiceDenied.
  ///
  /// In en, this message translates to:
  /// **'Microphone access is off. Allow it for Kiru to search by voice.'**
  String get searchVoiceDenied;

  /// No description provided for @searchAiQuiz.
  ///
  /// In en, this message translates to:
  /// **'AI Taste Quiz'**
  String get searchAiQuiz;

  /// No description provided for @searchPaste.
  ///
  /// In en, this message translates to:
  /// **'Paste from clipboard'**
  String get searchPaste;

  /// No description provided for @searchFailureTitle.
  ///
  /// In en, this message translates to:
  /// **'Search could not reach its sources'**
  String get searchFailureTitle;

  /// No description provided for @searchFailureBody.
  ///
  /// In en, this message translates to:
  /// **'{failed} of {total} sources did not respond'**
  String searchFailureBody(int failed, int total);

  /// No description provided for @searchFailureAdvice.
  ///
  /// In en, this message translates to:
  /// **'A dead addon or an expired provider runtime is fixed in Addons.'**
  String get searchFailureAdvice;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results for \"{query}\"'**
  String searchNoResults(String query);

  /// No description provided for @searchingMoreSources.
  ///
  /// In en, this message translates to:
  /// **'Searching more sources...'**
  String get searchingMoreSources;

  /// No description provided for @searchPartialFailure.
  ///
  /// In en, this message translates to:
  /// **'Partial Source Failure: {sources} did not respond. Other sources answered normally, so the results below are real but incomplete.'**
  String searchPartialFailure(String sources);

  /// No description provided for @searchRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get searchRecent;

  /// No description provided for @searchClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get searchClearAll;

  /// No description provided for @searchTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending & Suggested'**
  String get searchTrending;

  /// No description provided for @searchNothingToSuggest.
  ///
  /// In en, this message translates to:
  /// **'Nothing to suggest yet'**
  String get searchNothingToSuggest;

  /// No description provided for @searchNothingToSuggestBody.
  ///
  /// In en, this message translates to:
  /// **'Search for a title above, or connect an addon in Settings to have something to search.'**
  String get searchNothingToSuggestBody;

  /// No description provided for @searchPinnedSpine.
  ///
  /// In en, this message translates to:
  /// **'PINNED SPINE'**
  String get searchPinnedSpine;

  /// No description provided for @searchCloudstreamSection.
  ///
  /// In en, this message translates to:
  /// **'CloudStream • {provider}'**
  String searchCloudstreamSection(String provider);

  /// No description provided for @searchCloudstreamExtension.
  ///
  /// In en, this message translates to:
  /// **'CloudStream Extension'**
  String get searchCloudstreamExtension;

  /// No description provided for @searchTitlesSection.
  ///
  /// In en, this message translates to:
  /// **'Titles'**
  String get searchTitlesSection;

  /// No description provided for @searchImdbSuggestions.
  ///
  /// In en, this message translates to:
  /// **'IMDb suggestions'**
  String get searchImdbSuggestions;

  /// No description provided for @searchDirectStream.
  ///
  /// In en, this message translates to:
  /// **'Direct Stream'**
  String get searchDirectStream;

  /// No description provided for @searchSourceTitleLookup.
  ///
  /// In en, this message translates to:
  /// **'Title lookup'**
  String get searchSourceTitleLookup;

  /// No description provided for @playerSeekBack.
  ///
  /// In en, this message translates to:
  /// **'Seek -10s'**
  String get playerSeekBack;

  /// No description provided for @playerSeekForward.
  ///
  /// In en, this message translates to:
  /// **'Seek +10s'**
  String get playerSeekForward;

  /// No description provided for @playerPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get playerPlay;

  /// No description provided for @playerPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get playerPause;

  /// No description provided for @playerMute.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get playerMute;

  /// No description provided for @playerUnmute.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get playerUnmute;

  /// No description provided for @playerPreviousEpisode.
  ///
  /// In en, this message translates to:
  /// **'Previous Episode'**
  String get playerPreviousEpisode;

  /// No description provided for @playerNextEpisode.
  ///
  /// In en, this message translates to:
  /// **'Next Episode'**
  String get playerNextEpisode;

  /// No description provided for @playerEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get playerEpisodes;

  /// No description provided for @playerAspectRatio.
  ///
  /// In en, this message translates to:
  /// **'Aspect Ratio (C)'**
  String get playerAspectRatio;

  /// No description provided for @playerPlaybackSpeed.
  ///
  /// In en, this message translates to:
  /// **'Playback Speed'**
  String get playerPlaybackSpeed;

  /// No description provided for @playerAudioTracks.
  ///
  /// In en, this message translates to:
  /// **'Audio Tracks'**
  String get playerAudioTracks;

  /// No description provided for @playerSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get playerSubtitles;

  /// No description provided for @playerSubtitleSync.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Sync'**
  String get playerSubtitleSync;

  /// No description provided for @playerFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen (F)'**
  String get playerFullscreen;

  /// No description provided for @playerExitFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Exit Fullscreen (F)'**
  String get playerExitFullscreen;

  /// No description provided for @playerVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume {percent}%'**
  String playerVolume(int percent);

  /// No description provided for @playerSeekPosition.
  ///
  /// In en, this message translates to:
  /// **'{position} of {duration}'**
  String playerSeekPosition(String position, String duration);

  /// No description provided for @a11yOpenDetails.
  ///
  /// In en, this message translates to:
  /// **'Open details'**
  String get a11yOpenDetails;

  /// No description provided for @a11yResume.
  ///
  /// In en, this message translates to:
  /// **'Resume {title}, {percent}% watched'**
  String a11yResume(String title, int percent);

  /// No description provided for @emptyMyList.
  ///
  /// In en, this message translates to:
  /// **'Your list is empty'**
  String get emptyMyList;

  /// No description provided for @emptyMyListBody.
  ///
  /// In en, this message translates to:
  /// **'Save your favorite movies and TV shows to watch anytime'**
  String get emptyMyListBody;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App language. System follows your device.'**
  String get languageSubtitle;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageArabic;

  /// No description provided for @languageChinese.
  ///
  /// In en, this message translates to:
  /// **'Simplified Chinese'**
  String get languageChinese;

  /// No description provided for @a11yResumePlayback.
  ///
  /// In en, this message translates to:
  /// **'Resume playback'**
  String get a11yResumePlayback;

  /// No description provided for @playerPlaybackPosition.
  ///
  /// In en, this message translates to:
  /// **'Playback position'**
  String get playerPlaybackPosition;

  /// No description provided for @playerVolumeLabel.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get playerVolumeLabel;

  /// No description provided for @browseVerticalMoviesAndTv.
  ///
  /// In en, this message translates to:
  /// **'Movies & TV'**
  String get browseVerticalMoviesAndTv;

  /// No description provided for @browseVerticalCollections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get browseVerticalCollections;

  /// No description provided for @browseVerticalLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get browseVerticalLiveTv;

  /// No description provided for @browseVerticalAnime.
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get browseVerticalAnime;

  /// No description provided for @browseVerticalManga.
  ///
  /// In en, this message translates to:
  /// **'Manga'**
  String get browseVerticalManga;

  /// No description provided for @browseVerticalBooks.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get browseVerticalBooks;

  /// No description provided for @browseVerticalAudiobooks.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks'**
  String get browseVerticalAudiobooks;

  /// No description provided for @browseVerticalMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get browseVerticalMusic;

  /// No description provided for @browseVerticalAdult.
  ///
  /// In en, this message translates to:
  /// **'18+'**
  String get browseVerticalAdult;

  /// No description provided for @homeAiTasteQuiz.
  ///
  /// In en, this message translates to:
  /// **'AI Taste Quiz'**
  String get homeAiTasteQuiz;

  /// No description provided for @homeTvCalendar.
  ///
  /// In en, this message translates to:
  /// **'TV Airing Calendar'**
  String get homeTvCalendar;

  /// No description provided for @homeContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Continue Watching'**
  String get homeContinueWatching;

  /// No description provided for @homeTopTenMovies.
  ///
  /// In en, this message translates to:
  /// **'Top 10 Movies'**
  String get homeTopTenMovies;

  /// No description provided for @homeSkipIntro.
  ///
  /// In en, this message translates to:
  /// **'Skip intro'**
  String get homeSkipIntro;

  /// No description provided for @homeCinemaUniverse.
  ///
  /// In en, this message translates to:
  /// **'Your Cinema Universe'**
  String get homeCinemaUniverse;

  /// No description provided for @discoverNoTitles.
  ///
  /// In en, this message translates to:
  /// **'No titles found in this catalog'**
  String get discoverNoTitles;

  /// No description provided for @discoverRequiredFilter.
  ///
  /// In en, this message translates to:
  /// **'Select Required Filter'**
  String get discoverRequiredFilter;

  /// No description provided for @discoverSearchCatalog.
  ///
  /// In en, this message translates to:
  /// **'Search catalog'**
  String get discoverSearchCatalog;

  /// No description provided for @discoverPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discoverPageTitle;

  /// No description provided for @detailsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Details unavailable.'**
  String get detailsUnavailable;

  /// No description provided for @detailsGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get detailsGoBack;

  /// No description provided for @animeLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load anime'**
  String get animeLoadFailed;

  /// No description provided for @animeContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Continue Watching'**
  String get animeContinueWatching;

  /// No description provided for @animeTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending on AniList'**
  String get animeTrending;

  /// No description provided for @animeTrendingDescription.
  ///
  /// In en, this message translates to:
  /// **'Top popular and trending series'**
  String get animeTrendingDescription;

  /// No description provided for @animeSeasonPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular This Season (AniList Sync)'**
  String get animeSeasonPopular;

  /// No description provided for @animeMasterpieces.
  ///
  /// In en, this message translates to:
  /// **'All-Time Masterpieces'**
  String get animeMasterpieces;

  /// No description provided for @animeMasterpiecesDescription.
  ///
  /// In en, this message translates to:
  /// **'Critically acclaimed top rated anime'**
  String get animeMasterpiecesDescription;

  /// No description provided for @animeNextSeason.
  ///
  /// In en, this message translates to:
  /// **'Anticipated Next Season'**
  String get animeNextSeason;

  /// No description provided for @animeNextSeasonDescription.
  ///
  /// In en, this message translates to:
  /// **'Upcoming anime you cannot miss'**
  String get animeNextSeasonDescription;

  /// No description provided for @animeAction.
  ///
  /// In en, this message translates to:
  /// **'Action & Adventure'**
  String get animeAction;

  /// No description provided for @animeActionDescription.
  ///
  /// In en, this message translates to:
  /// **'High octane battles and epic journeys'**
  String get animeActionDescription;

  /// No description provided for @animeRomance.
  ///
  /// In en, this message translates to:
  /// **'Romance & Drama'**
  String get animeRomance;

  /// No description provided for @animeRomanceDescription.
  ///
  /// In en, this message translates to:
  /// **'Heartfelt emotional stories'**
  String get animeRomanceDescription;

  /// No description provided for @animeFantasy.
  ///
  /// In en, this message translates to:
  /// **'Fantasy & Isekai'**
  String get animeFantasy;

  /// No description provided for @animeFantasyDescription.
  ///
  /// In en, this message translates to:
  /// **'Magical realms and alternate worlds'**
  String get animeFantasyDescription;

  /// No description provided for @animeSciFi.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi & Cyberpunk'**
  String get animeSciFi;

  /// No description provided for @animeSciFiDescription.
  ///
  /// In en, this message translates to:
  /// **'Futuristic technologies and dystopian worlds'**
  String get animeSciFiDescription;

  /// No description provided for @sourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Watch Sources'**
  String get sourcesTitle;

  /// No description provided for @sourcesSeederFilter.
  ///
  /// In en, this message translates to:
  /// **'Seeders Filter'**
  String get sourcesSeederFilter;

  /// No description provided for @sourcesAllSeeds.
  ///
  /// In en, this message translates to:
  /// **'All Seeds'**
  String get sourcesAllSeeds;

  /// No description provided for @sourcesMostSeeds.
  ///
  /// In en, this message translates to:
  /// **'Most Seeds (High to Low)'**
  String get sourcesMostSeeds;

  /// No description provided for @sourcesMostSeedsShort.
  ///
  /// In en, this message translates to:
  /// **'Most Seeds'**
  String get sourcesMostSeedsShort;

  /// No description provided for @sourcesSeeds50.
  ///
  /// In en, this message translates to:
  /// **'50+ Seeds'**
  String get sourcesSeeds50;

  /// No description provided for @sourcesSeeds20.
  ///
  /// In en, this message translates to:
  /// **'20+ Seeds'**
  String get sourcesSeeds20;

  /// No description provided for @sourcesSeeds5.
  ///
  /// In en, this message translates to:
  /// **'5+ Seeds'**
  String get sourcesSeeds5;

  /// No description provided for @sourcesActiveSeeds.
  ///
  /// In en, this message translates to:
  /// **'Active Seeds (>0)'**
  String get sourcesActiveSeeds;

  /// No description provided for @sourcesActiveSeedsShort.
  ///
  /// In en, this message translates to:
  /// **'Active Seeds'**
  String get sourcesActiveSeedsShort;

  /// No description provided for @sourcesSizeFilter.
  ///
  /// In en, this message translates to:
  /// **'File Size Filter'**
  String get sourcesSizeFilter;

  /// No description provided for @sourcesAllSizes.
  ///
  /// In en, this message translates to:
  /// **'All Sizes'**
  String get sourcesAllSizes;

  /// No description provided for @sourcesLargestFirst.
  ///
  /// In en, this message translates to:
  /// **'Largest First'**
  String get sourcesLargestFirst;

  /// No description provided for @sourcesLargest.
  ///
  /// In en, this message translates to:
  /// **'Largest'**
  String get sourcesLargest;

  /// No description provided for @sourcesSmallestFirst.
  ///
  /// In en, this message translates to:
  /// **'Smallest First'**
  String get sourcesSmallestFirst;

  /// No description provided for @sourcesSmallest.
  ///
  /// In en, this message translates to:
  /// **'Smallest'**
  String get sourcesSmallest;

  /// No description provided for @sourcesProvider.
  ///
  /// In en, this message translates to:
  /// **'Source Provider'**
  String get sourcesProvider;

  /// No description provided for @sourcesAll.
  ///
  /// In en, this message translates to:
  /// **'All Sources'**
  String get sourcesAll;

  /// No description provided for @sourcesAudioLanguage.
  ///
  /// In en, this message translates to:
  /// **'Audio & Dub Language'**
  String get sourcesAudioLanguage;

  /// No description provided for @sourcesAllAudio.
  ///
  /// In en, this message translates to:
  /// **'All Audio'**
  String get sourcesAllAudio;

  /// No description provided for @sourcesMultiAudio.
  ///
  /// In en, this message translates to:
  /// **'🌐 Multi-Audio'**
  String get sourcesMultiAudio;

  /// No description provided for @sourcesEnglishAudio.
  ///
  /// In en, this message translates to:
  /// **'🇺🇸 English / Orig'**
  String get sourcesEnglishAudio;

  /// No description provided for @sourcesHindiAudio.
  ///
  /// In en, this message translates to:
  /// **'🇮🇳 Hindi / Indian'**
  String get sourcesHindiAudio;

  /// No description provided for @sourcesGermanAudio.
  ///
  /// In en, this message translates to:
  /// **'🇩🇪 German'**
  String get sourcesGermanAudio;

  /// No description provided for @sourcesFrenchAudio.
  ///
  /// In en, this message translates to:
  /// **'🇫🇷 French'**
  String get sourcesFrenchAudio;

  /// No description provided for @sourcesSpanishSpain.
  ///
  /// In en, this message translates to:
  /// **'🇪🇸 Spanish (Castilian)'**
  String get sourcesSpanishSpain;

  /// No description provided for @sourcesSpanishLatin.
  ///
  /// In en, this message translates to:
  /// **'🇲🇽 Spanish (Latin)'**
  String get sourcesSpanishLatin;

  /// No description provided for @sourcesSpanishAll.
  ///
  /// In en, this message translates to:
  /// **'🌎 All Spanish'**
  String get sourcesSpanishAll;

  /// No description provided for @sourcesRussianAudio.
  ///
  /// In en, this message translates to:
  /// **'🇷🇺 Russian'**
  String get sourcesRussianAudio;

  /// No description provided for @sourcesJapaneseAudio.
  ///
  /// In en, this message translates to:
  /// **'🇯🇵 Japanese'**
  String get sourcesJapaneseAudio;

  /// No description provided for @sourcesItalianAudio.
  ///
  /// In en, this message translates to:
  /// **'🇮🇹 Italian'**
  String get sourcesItalianAudio;

  /// No description provided for @sourcesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No sources found'**
  String get sourcesEmpty;

  /// No description provided for @sourcesEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'No streams found. Install more addons from Settings or try another title.'**
  String get sourcesEmptyHint;

  /// No description provided for @sourcesInstallAddons.
  ///
  /// In en, this message translates to:
  /// **'Install Addons'**
  String get sourcesInstallAddons;

  /// No description provided for @sourcesMagnetCopied.
  ///
  /// In en, this message translates to:
  /// **'Magnet link copied to clipboard'**
  String get sourcesMagnetCopied;

  /// No description provided for @uiHeroBannerPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get uiHeroBannerPlay;

  /// No description provided for @uiHeroBannerMoreInfo.
  ///
  /// In en, this message translates to:
  /// **'More Info'**
  String get uiHeroBannerMoreInfo;

  /// No description provided for @uiHeroBannerTrailer.
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get uiHeroBannerTrailer;

  /// No description provided for @uiContinueWatchingSliderHoldOkForOptions.
  ///
  /// In en, this message translates to:
  /// **'Hold OK for options'**
  String get uiContinueWatchingSliderHoldOkForOptions;

  /// No description provided for @uiContinueWatchingSliderViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get uiContinueWatchingSliderViewDetails;

  /// No description provided for @uiContinueWatchingSliderViewDetails3.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get uiContinueWatchingSliderViewDetails3;

  /// No description provided for @uiContinueWatchingSliderRemoveFromContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Remove from Continue Watching'**
  String get uiContinueWatchingSliderRemoveFromContinueWatching;

  /// No description provided for @uiContinueWatchingSliderResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get uiContinueWatchingSliderResume;

  /// No description provided for @uiPlayerTopBarBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get uiPlayerTopBarBack;

  /// No description provided for @uiPlayerTopBarEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get uiPlayerTopBarEpisodes;

  /// No description provided for @uiPlayerTopBarSources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get uiPlayerTopBarSources;

  /// No description provided for @uiPlayerTopBarCopyStreamUrl.
  ///
  /// In en, this message translates to:
  /// **'Copy Stream URL'**
  String get uiPlayerTopBarCopyStreamUrl;

  /// No description provided for @uiPlayerTopBarScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Screenshot'**
  String get uiPlayerTopBarScreenshot;

  /// No description provided for @uiPlayerTopBarLockScreen.
  ///
  /// In en, this message translates to:
  /// **'Lock Screen'**
  String get uiPlayerTopBarLockScreen;

  /// No description provided for @uiPlayerTopBarCast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get uiPlayerTopBarCast;

  /// No description provided for @uiPlayerSpeedMenuPlaybackSpeed.
  ///
  /// In en, this message translates to:
  /// **'PLAYBACK SPEED'**
  String get uiPlayerSpeedMenuPlaybackSpeed;

  /// No description provided for @uiPlayerAspectMenuAspectRatio.
  ///
  /// In en, this message translates to:
  /// **'ASPECT RATIO'**
  String get uiPlayerAspectMenuAspectRatio;

  /// No description provided for @uiPlayerAspectMenuSubtitleSizeScale.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Size Scale'**
  String get uiPlayerAspectMenuSubtitleSizeScale;

  /// No description provided for @uiPlayerAudioMenuAudioTracks.
  ///
  /// In en, this message translates to:
  /// **'AUDIO TRACKS'**
  String get uiPlayerAudioMenuAudioTracks;

  /// No description provided for @uiPlayerAudioMenuClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiPlayerAudioMenuClose;

  /// No description provided for @uiPlayerAudioMenuDefaultAudioStreamPlaying.
  ///
  /// In en, this message translates to:
  /// **'Default audio stream playing.'**
  String get uiPlayerAudioMenuDefaultAudioStreamPlaying;

  /// No description provided for @uiPlayerAudioMenuAudioSyncOffset.
  ///
  /// In en, this message translates to:
  /// **'Audio Sync Offset'**
  String get uiPlayerAudioMenuAudioSyncOffset;

  /// No description provided for @uiPlayerEpisodesPanelScrollUp.
  ///
  /// In en, this message translates to:
  /// **'Scroll Up'**
  String get uiPlayerEpisodesPanelScrollUp;

  /// No description provided for @uiPlayerEpisodesPanelScrollDown.
  ///
  /// In en, this message translates to:
  /// **'Scroll Down'**
  String get uiPlayerEpisodesPanelScrollDown;

  /// No description provided for @uiPlayerEpisodesPanelEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get uiPlayerEpisodesPanelEpisodes;

  /// No description provided for @uiPlayerEpisodesPanelClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiPlayerEpisodesPanelClose;

  /// No description provided for @uiPlayerEpisodesPanelPreviousSeasons.
  ///
  /// In en, this message translates to:
  /// **'Previous Seasons'**
  String get uiPlayerEpisodesPanelPreviousSeasons;

  /// No description provided for @uiPlayerEpisodesPanelNextSeasons.
  ///
  /// In en, this message translates to:
  /// **'Next Seasons'**
  String get uiPlayerEpisodesPanelNextSeasons;

  /// No description provided for @uiPlayerEpisodesPanelPlaying.
  ///
  /// In en, this message translates to:
  /// **'PLAYING'**
  String get uiPlayerEpisodesPanelPlaying;

  /// No description provided for @uiPlayerEpisodesPanelSelectSources.
  ///
  /// In en, this message translates to:
  /// **'Select Sources'**
  String get uiPlayerEpisodesPanelSelectSources;

  /// No description provided for @uiPlayerLoadingOverlayPlaybackIssue.
  ///
  /// In en, this message translates to:
  /// **'PLAYBACK ISSUE'**
  String get uiPlayerLoadingOverlayPlaybackIssue;

  /// No description provided for @uiPlayerLoadingOverlayThisSourceIsnTResponding.
  ///
  /// In en, this message translates to:
  /// **'This source isn\'t responding'**
  String get uiPlayerLoadingOverlayThisSourceIsnTResponding;

  /// No description provided for @uiPlayerLoadingOverlayChooseAnotherSource.
  ///
  /// In en, this message translates to:
  /// **'Choose another source'**
  String get uiPlayerLoadingOverlayChooseAnotherSource;

  /// No description provided for @uiPlayerLoadingOverlayGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get uiPlayerLoadingOverlayGoBack;

  /// No description provided for @uiPlayerLoadingOverlayCopyDiagnostic.
  ///
  /// In en, this message translates to:
  /// **'Copy diagnostic'**
  String get uiPlayerLoadingOverlayCopyDiagnostic;

  /// No description provided for @uiPlayerMenuRowsClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiPlayerMenuRowsClose;

  /// No description provided for @uiPlayerSourcesPanelBackToEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Back to Episodes'**
  String get uiPlayerSourcesPanelBackToEpisodes;

  /// No description provided for @uiPlayerSourcesPanelClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiPlayerSourcesPanelClose;

  /// No description provided for @uiPlayerSourcesPanelSearchingEveryProvider.
  ///
  /// In en, this message translates to:
  /// **'Searching every provider…'**
  String get uiPlayerSourcesPanelSearchingEveryProvider;

  /// No description provided for @uiPlayerSourcesPanelRescrapeSources.
  ///
  /// In en, this message translates to:
  /// **'Rescrape Sources'**
  String get uiPlayerSourcesPanelRescrapeSources;

  /// No description provided for @uiPlayerSourcesPanelScrapingAdditionalSources.
  ///
  /// In en, this message translates to:
  /// **'Scraping additional sources...'**
  String get uiPlayerSourcesPanelScrapingAdditionalSources;

  /// No description provided for @uiPlayerSourcesPanelMagnetLinkCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Magnet link copied to clipboard'**
  String get uiPlayerSourcesPanelMagnetLinkCopiedToClipboard;

  /// No description provided for @uiPlayerSubtitleMenuSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get uiPlayerSubtitleMenuSubtitles;

  /// No description provided for @uiPlayerSubtitleMenuRefreshOnlineSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Refresh Online Subtitles'**
  String get uiPlayerSubtitleMenuRefreshOnlineSubtitles;

  /// No description provided for @uiPlayerSubtitleMenuSubtitleSyncBar.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Sync Bar'**
  String get uiPlayerSubtitleMenuSubtitleSyncBar;

  /// No description provided for @uiPlayerSubtitleMenuSubtitleAppearance.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Appearance'**
  String get uiPlayerSubtitleMenuSubtitleAppearance;

  /// No description provided for @uiPlayerSubtitleMenuSpeechTextSync.
  ///
  /// In en, this message translates to:
  /// **'Speech Text Sync'**
  String get uiPlayerSubtitleMenuSpeechTextSync;

  /// No description provided for @uiPlayerSubtitleMenuClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiPlayerSubtitleMenuClose;

  /// No description provided for @uiPlayerSubtitleMenuOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get uiPlayerSubtitleMenuOff;

  /// No description provided for @uiPlayerSubtitleMenuEmbedded.
  ///
  /// In en, this message translates to:
  /// **'Embedded'**
  String get uiPlayerSubtitleMenuEmbedded;

  /// No description provided for @uiPlayerSubtitleMenuAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get uiPlayerSubtitleMenuAll;

  /// No description provided for @uiPlayerSubtitleMenuForced.
  ///
  /// In en, this message translates to:
  /// **'Forced'**
  String get uiPlayerSubtitleMenuForced;

  /// No description provided for @uiPlayerSubtitleMenuSearchOnline.
  ///
  /// In en, this message translates to:
  /// **'Search Online'**
  String get uiPlayerSubtitleMenuSearchOnline;

  /// No description provided for @uiPlayerSubtitleMenuEmbedded12.
  ///
  /// In en, this message translates to:
  /// **'EMBEDDED'**
  String get uiPlayerSubtitleMenuEmbedded12;

  /// No description provided for @uiPlayerSubtitleMenuSearchingSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Searching subtitles...'**
  String get uiPlayerSubtitleMenuSearchingSubtitles;

  /// No description provided for @uiPlayerSubtitleMenuNoSubtitlesAvailable.
  ///
  /// In en, this message translates to:
  /// **'No subtitles available.'**
  String get uiPlayerSubtitleMenuNoSubtitlesAvailable;

  /// No description provided for @uiPlayerSubtitleMenuSearchOnlineProviders.
  ///
  /// In en, this message translates to:
  /// **'Search Online Providers'**
  String get uiPlayerSubtitleMenuSearchOnlineProviders;

  /// No description provided for @uiPlayerSubtitleMenuSearchingAdditionalSubtitlesOnline.
  ///
  /// In en, this message translates to:
  /// **'Searching additional subtitles online...'**
  String get uiPlayerSubtitleMenuSearchingAdditionalSubtitlesOnline;

  /// No description provided for @uiPlayerSubtitleMenuForced17.
  ///
  /// In en, this message translates to:
  /// **'FORCED'**
  String get uiPlayerSubtitleMenuForced17;

  /// No description provided for @uiPlayerSubtitleMenuFindMoreSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Find more subtitles'**
  String get uiPlayerSubtitleMenuFindMoreSubtitles;

  /// No description provided for @uiPlayerSubStyleModalSubtitleAppearance.
  ///
  /// In en, this message translates to:
  /// **'Subtitle Appearance'**
  String get uiPlayerSubStyleModalSubtitleAppearance;

  /// No description provided for @uiPlayerSubStyleModalLibassLibmpvHardwareRenderedSubtitles.
  ///
  /// In en, this message translates to:
  /// **'libass / libmpv hardware-rendered subtitles'**
  String get uiPlayerSubStyleModalLibassLibmpvHardwareRenderedSubtitles;

  /// No description provided for @uiPlayerSubStyleModalResetSubtitleDefaults.
  ///
  /// In en, this message translates to:
  /// **'Reset Subtitle Defaults'**
  String get uiPlayerSubStyleModalResetSubtitleDefaults;

  /// No description provided for @uiPlayerSubStyleModalClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiPlayerSubStyleModalClose;

  /// No description provided for @uiPlayerSubStyleModalZplaySampleSubtitlePreview.
  ///
  /// In en, this message translates to:
  /// **'Kiru • Sample Subtitle Preview'**
  String get uiPlayerSubStyleModalZplaySampleSubtitlePreview;

  /// No description provided for @uiPlayerSubStyleModalBoldText.
  ///
  /// In en, this message translates to:
  /// **'Bold Text'**
  String get uiPlayerSubStyleModalBoldText;

  /// No description provided for @uiPlayerSubStyleModalItalicText.
  ///
  /// In en, this message translates to:
  /// **'Italic Text'**
  String get uiPlayerSubStyleModalItalicText;

  /// No description provided for @uiPlayerSubStyleModalFlutterSubtitleEngineRecommended.
  ///
  /// In en, this message translates to:
  /// **'Flutter Subtitle Engine (Recommended)'**
  String get uiPlayerSubStyleModalFlutterSubtitleEngineRecommended;

  /// No description provided for @uiPlayerSubStyleModalNativeMpvLibassEngine.
  ///
  /// In en, this message translates to:
  /// **'Native MPV libass Engine'**
  String get uiPlayerSubStyleModalNativeMpvLibassEngine;

  /// No description provided for @uiPlayerSubStyleModal100ReliableHardwareAcceleratedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'100% reliable hardware-accelerated subtitle overlay across Android, iOS, Windows, Mac, and Linux with full styling support.'**
  String get uiPlayerSubStyleModal100ReliableHardwareAcceleratedSubtitle;

  /// No description provided for @uiPlayerSubStyleModalDirectGpuVideoTextureRendering.
  ///
  /// In en, this message translates to:
  /// **'Direct GPU video texture rendering powered by libass with bundled Poppins font and SSA/ASS script layout support.'**
  String get uiPlayerSubStyleModalDirectGpuVideoTextureRendering;

  /// No description provided for @uiSubSyncBarTextSync.
  ///
  /// In en, this message translates to:
  /// **'Text Sync'**
  String get uiSubSyncBarTextSync;

  /// No description provided for @uiSubSyncBarDiscardChanges.
  ///
  /// In en, this message translates to:
  /// **'Discard changes'**
  String get uiSubSyncBarDiscardChanges;

  /// No description provided for @uiSubSyncBarDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get uiSubSyncBarDone;

  /// No description provided for @uiSubSyncBarClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiSubSyncBarClose;

  /// No description provided for @uiTextSyncOverlayClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get uiTextSyncOverlayClose;

  /// No description provided for @uiTextSyncOverlaySearchDialogue.
  ///
  /// In en, this message translates to:
  /// **'Search dialogue...'**
  String get uiTextSyncOverlaySearchDialogue;

  /// No description provided for @uiTextSyncOverlayNow.
  ///
  /// In en, this message translates to:
  /// **'NOW'**
  String get uiTextSyncOverlayNow;

  /// No description provided for @uiTextSyncOverlaySyncFromHere.
  ///
  /// In en, this message translates to:
  /// **'Sync from here'**
  String get uiTextSyncOverlaySyncFromHere;

  /// No description provided for @uiTextSyncOverlayJumpHere.
  ///
  /// In en, this message translates to:
  /// **'Jump here'**
  String get uiTextSyncOverlayJumpHere;

  /// No description provided for @uiTextSyncOverlayJumpToNow.
  ///
  /// In en, this message translates to:
  /// **'Jump to now'**
  String get uiTextSyncOverlayJumpToNow;

  /// No description provided for @uiTextSyncOverlayResetTiming.
  ///
  /// In en, this message translates to:
  /// **'Reset timing'**
  String get uiTextSyncOverlayResetTiming;

  /// No description provided for @uiPlayerScreenFailedToDownloadSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to download subtitle'**
  String get uiPlayerScreenFailedToDownloadSubtitle;

  /// No description provided for @uiPlayerScreenSubtitleTimingSynchronizedAndSaved.
  ///
  /// In en, this message translates to:
  /// **'Subtitle timing synchronized and saved!'**
  String get uiPlayerScreenSubtitleTimingSynchronizedAndSaved;

  /// No description provided for @uiPlayerScreenScreenIsLockedTapThe.
  ///
  /// In en, this message translates to:
  /// **'Screen is locked. Tap the lock icon to unlock.'**
  String get uiPlayerScreenScreenIsLockedTapThe;

  /// No description provided for @uiPlayerScreenTestingOtherSourcesForYou.
  ///
  /// In en, this message translates to:
  /// **'Testing other sources for you'**
  String get uiPlayerScreenTestingOtherSourcesForYou;

  /// No description provided for @uiPlayerScreenChooseASourceMyself.
  ///
  /// In en, this message translates to:
  /// **'Choose a source myself'**
  String get uiPlayerScreenChooseASourceMyself;

  /// No description provided for @uiPlayerScreenDownloadAlreadyInProgressIn.
  ///
  /// In en, this message translates to:
  /// **'Download already in progress in background.'**
  String get uiPlayerScreenDownloadAlreadyInProgressIn;

  /// No description provided for @uiPlayerScreenThisMediaIsAlreadyDownloaded.
  ///
  /// In en, this message translates to:
  /// **'This media is already downloaded.'**
  String get uiPlayerScreenThisMediaIsAlreadyDownloaded;

  /// No description provided for @uiPlayerScreenDownloadStartedInBackgroundTrack.
  ///
  /// In en, this message translates to:
  /// **'Download started in background. Track progress in Downloads tab.'**
  String get uiPlayerScreenDownloadStartedInBackgroundTrack;

  /// No description provided for @uiPlayerScreenStreamUrlCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Stream URL copied to clipboard'**
  String get uiPlayerScreenStreamUrlCopiedToClipboard;

  /// No description provided for @uiPlayerScreenNoActiveStreamUrlAvailable.
  ///
  /// In en, this message translates to:
  /// **'No active stream URL available to copy.'**
  String get uiPlayerScreenNoActiveStreamUrlAvailable;

  /// No description provided for @uiPlayerScreenSubtitleSyncIsNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Subtitle sync is not supported for embedded subtitles. Please select an external subtitle.'**
  String get uiPlayerScreenSubtitleSyncIsNotSupported;

  /// No description provided for @uiPlayerScreenPleaseLoadAnExternalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please load an external subtitle to use subtitle sync.'**
  String get uiPlayerScreenPleaseLoadAnExternalSubtitle;

  /// No description provided for @uiPlayerScreenSubtitleSyncIsNotSupported13.
  ///
  /// In en, this message translates to:
  /// **'Subtitle sync is not supported for embedded subtitles.'**
  String get uiPlayerScreenSubtitleSyncIsNotSupported13;

  /// No description provided for @uiPlayerScreenSpeechSyncRequiresAnExternal.
  ///
  /// In en, this message translates to:
  /// **'Speech sync requires an external subtitle file.'**
  String get uiPlayerScreenSpeechSyncRequiresAnExternal;

  /// No description provided for @uiPlayerScreen2xSpeed.
  ///
  /// In en, this message translates to:
  /// **'2X Speed'**
  String get uiPlayerScreen2xSpeed;

  /// No description provided for @uiPlayerScreenUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get uiPlayerScreenUnlock;

  /// No description provided for @uiAnimeSearchPageClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get uiAnimeSearchPageClear;

  /// No description provided for @uiAnimeSearchPageReleaseYear.
  ///
  /// In en, this message translates to:
  /// **'Release Year'**
  String get uiAnimeSearchPageReleaseYear;

  /// No description provided for @uiAnimeSearchPageSearchAnimeMoviesOvas.
  ///
  /// In en, this message translates to:
  /// **'Search anime, movies, OVAs...'**
  String get uiAnimeSearchPageSearchAnimeMoviesOvas;

  /// No description provided for @uiAnimeSearchPageSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get uiAnimeSearchPageSortBy;

  /// No description provided for @uiAnimeSearchPageGenre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get uiAnimeSearchPageGenre;

  /// No description provided for @uiAnimeSearchPageSeason.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get uiAnimeSearchPageSeason;

  /// No description provided for @uiAnimeSearchPageFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get uiAnimeSearchPageFormat;

  /// No description provided for @uiAnimeSearchPageStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get uiAnimeSearchPageStatus;

  /// No description provided for @uiAnimeSearchPageReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get uiAnimeSearchPageReset;

  /// No description provided for @uiAnimeSearchPageNoAnimeFoundMatchingYour.
  ///
  /// In en, this message translates to:
  /// **'No anime found matching your criteria'**
  String get uiAnimeSearchPageNoAnimeFoundMatchingYour;

  /// No description provided for @uiAnimeSearchPageTryDifferentKeywordsOrClearing.
  ///
  /// In en, this message translates to:
  /// **'Try different keywords or clearing filters'**
  String get uiAnimeSearchPageTryDifferentKeywordsOrClearing;

  /// No description provided for @uiAnimeSearchPageAnimeTvSeries.
  ///
  /// In en, this message translates to:
  /// **'Anime TV Series'**
  String get uiAnimeSearchPageAnimeTvSeries;

  /// No description provided for @uiAnimeSearchPageAnimeMovies.
  ///
  /// In en, this message translates to:
  /// **'Anime Movies'**
  String get uiAnimeSearchPageAnimeMovies;

  /// No description provided for @uiAnimeSearchPageOvasOnasSpecials.
  ///
  /// In en, this message translates to:
  /// **'OVAs, ONAs & Specials'**
  String get uiAnimeSearchPageOvasOnasSpecials;

  /// No description provided for @uiAnimeSearchPageTrendingAnime.
  ///
  /// In en, this message translates to:
  /// **'Trending Anime'**
  String get uiAnimeSearchPageTrendingAnime;

  /// No description provided for @uiAnimeSearchPagePopularThisSeason.
  ///
  /// In en, this message translates to:
  /// **'Popular This Season'**
  String get uiAnimeSearchPagePopularThisSeason;

  /// No description provided for @uiAnimeSearchPageAllTimeTopRated.
  ///
  /// In en, this message translates to:
  /// **'All-Time Top Rated'**
  String get uiAnimeSearchPageAllTimeTopRated;

  /// No description provided for @uiAnimeDetailsPageEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get uiAnimeDetailsPageEpisodes;

  /// No description provided for @uiAnimeDetailsPageWatching.
  ///
  /// In en, this message translates to:
  /// **'Watching'**
  String get uiAnimeDetailsPageWatching;

  /// No description provided for @uiAnimeDetailsPagePlanToWatch.
  ///
  /// In en, this message translates to:
  /// **'Plan to Watch'**
  String get uiAnimeDetailsPagePlanToWatch;

  /// No description provided for @uiAnimeDetailsPageCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get uiAnimeDetailsPageCompleted;

  /// No description provided for @uiAnimeDetailsPageDropped.
  ///
  /// In en, this message translates to:
  /// **'Dropped'**
  String get uiAnimeDetailsPageDropped;

  /// No description provided for @uiAnimeDetailsPageSub.
  ///
  /// In en, this message translates to:
  /// **'SUB'**
  String get uiAnimeDetailsPageSub;

  /// No description provided for @uiAnimeDetailsPageDub.
  ///
  /// In en, this message translates to:
  /// **'DUB'**
  String get uiAnimeDetailsPageDub;

  /// No description provided for @uiAnimeDetailsPageJumpToEp.
  ///
  /// In en, this message translates to:
  /// **'Jump to ep #'**
  String get uiAnimeDetailsPageJumpToEp;

  /// No description provided for @uiAnimeStreamSheetSubtitleOrDub.
  ///
  /// In en, this message translates to:
  /// **'Subtitle or dub'**
  String get uiAnimeStreamSheetSubtitleOrDub;

  /// No description provided for @uiAnimeStreamSheetAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get uiAnimeStreamSheetAll;

  /// No description provided for @uiAnimeStreamSheetSub.
  ///
  /// In en, this message translates to:
  /// **'Sub'**
  String get uiAnimeStreamSheetSub;

  /// No description provided for @uiAnimeStreamSheetDub.
  ///
  /// In en, this message translates to:
  /// **'Dub'**
  String get uiAnimeStreamSheetDub;

  /// No description provided for @uiAnimeStreamSheetSources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get uiAnimeStreamSheetSources;

  /// No description provided for @uiAnimeStreamSheetRetryScraping.
  ///
  /// In en, this message translates to:
  /// **'Retry Scraping'**
  String get uiAnimeStreamSheetRetryScraping;

  /// No description provided for @uiMyListPageRemoveFromMyList.
  ///
  /// In en, this message translates to:
  /// **'Remove from My List?'**
  String get uiMyListPageRemoveFromMyList;

  /// No description provided for @uiMyListPageCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get uiMyListPageCancel;

  /// No description provided for @uiMyListPageRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get uiMyListPageRemove;

  /// No description provided for @uiMyListPageMyList.
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get uiMyListPageMyList;

  /// No description provided for @uiMyListPageAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get uiMyListPageAll;

  /// No description provided for @uiMyListPageMovies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get uiMyListPageMovies;

  /// No description provided for @uiMyListPageTvShows.
  ///
  /// In en, this message translates to:
  /// **'TV Shows'**
  String get uiMyListPageTvShows;

  /// No description provided for @uiMyListPageFilterSavedTitles.
  ///
  /// In en, this message translates to:
  /// **'Filter saved titles'**
  String get uiMyListPageFilterSavedTitles;

  /// No description provided for @uiMyListPageRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently Added'**
  String get uiMyListPageRecentlyAdded;

  /// No description provided for @uiMyListPageAlphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get uiMyListPageAlphabetical;

  /// No description provided for @uiMyListPageReleaseYear.
  ///
  /// In en, this message translates to:
  /// **'Release Year'**
  String get uiMyListPageReleaseYear;

  /// No description provided for @uiMyListPageSearchSavedTitles.
  ///
  /// In en, this message translates to:
  /// **'Search saved titles...'**
  String get uiMyListPageSearchSavedTitles;

  /// No description provided for @uiMyListPageResetFilters.
  ///
  /// In en, this message translates to:
  /// **'Reset Filters'**
  String get uiMyListPageResetFilters;

  /// No description provided for @uiDownloadsPageFileNotFoundOnDisk.
  ///
  /// In en, this message translates to:
  /// **'File not found on disk. It may have been moved or deleted.'**
  String get uiDownloadsPageFileNotFoundOnDisk;

  /// No description provided for @uiDownloadsPageDeleteDownload.
  ///
  /// In en, this message translates to:
  /// **'Delete Download'**
  String get uiDownloadsPageDeleteDownload;

  /// No description provided for @uiDownloadsPageCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get uiDownloadsPageCancel;

  /// No description provided for @uiDownloadsPageDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get uiDownloadsPageDelete;

  /// No description provided for @uiDownloadsPageDownloadList.
  ///
  /// In en, this message translates to:
  /// **'Download list'**
  String get uiDownloadsPageDownloadList;

  /// No description provided for @uiDownloadsPageActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get uiDownloadsPageActive;

  /// No description provided for @uiDownloadsPageDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get uiDownloadsPageDownloaded;

  /// No description provided for @uiDownloadsPageDownloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get uiDownloadsPageDownloads;

  /// No description provided for @uiDownloadsPageOpenDownloadsFolder.
  ///
  /// In en, this message translates to:
  /// **'Open Downloads Folder'**
  String get uiDownloadsPageOpenDownloadsFolder;

  /// No description provided for @uiDownloadsPageNoActiveDownloads.
  ///
  /// In en, this message translates to:
  /// **'No active downloads'**
  String get uiDownloadsPageNoActiveDownloads;

  /// No description provided for @uiDownloadsPageMediaYouDownloadFromThe.
  ///
  /// In en, this message translates to:
  /// **'Media you download from the video player will show up here.'**
  String get uiDownloadsPageMediaYouDownloadFromThe;

  /// No description provided for @uiDownloadsPagePause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get uiDownloadsPagePause;

  /// No description provided for @uiDownloadsPageResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get uiDownloadsPageResume;

  /// No description provided for @uiDownloadsPageRetryReconnect.
  ///
  /// In en, this message translates to:
  /// **'Retry / Reconnect'**
  String get uiDownloadsPageRetryReconnect;

  /// No description provided for @uiDownloadsPageOpenFolderLocation.
  ///
  /// In en, this message translates to:
  /// **'Open Folder Location'**
  String get uiDownloadsPageOpenFolderLocation;

  /// No description provided for @uiDownloadsPageNoDownloadedMedia.
  ///
  /// In en, this message translates to:
  /// **'No downloaded media'**
  String get uiDownloadsPageNoDownloadedMedia;

  /// No description provided for @uiDownloadsPageCompletedDownloadsWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Completed downloads will appear here for offline playback.'**
  String get uiDownloadsPageCompletedDownloadsWillAppearHere;

  /// No description provided for @uiDiscoverPageCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get uiDiscoverPageCancel;

  /// No description provided for @uiDiscoverPageApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get uiDiscoverPageApply;

  /// No description provided for @uiVideoSettingsPageVideoUpscaling.
  ///
  /// In en, this message translates to:
  /// **'Video & Upscaling'**
  String get uiVideoSettingsPageVideoUpscaling;

  /// No description provided for @uiVideoSettingsPageGpuUpscaling.
  ///
  /// In en, this message translates to:
  /// **'GPU Upscaling'**
  String get uiVideoSettingsPageGpuUpscaling;

  /// No description provided for @uiVideoSettingsPageUpscalingPresets.
  ///
  /// In en, this message translates to:
  /// **'UPSCALING PRESETS'**
  String get uiVideoSettingsPageUpscalingPresets;

  /// No description provided for @uiVideoSettingsPageDisabledOff.
  ///
  /// In en, this message translates to:
  /// **'Disabled (Off)'**
  String get uiVideoSettingsPageDisabledOff;

  /// No description provided for @uiVideoSettingsPageStandardVideoPlaybackWithoutGlsl.
  ///
  /// In en, this message translates to:
  /// **'Standard video playback without GLSL neural filters. Lowest GPU overhead.'**
  String get uiVideoSettingsPageStandardVideoPlaybackWithoutGlsl;

  /// No description provided for @uiVideoSettingsPageModeAFastBalanced.
  ///
  /// In en, this message translates to:
  /// **'Mode A — Fast / Balanced'**
  String get uiVideoSettingsPageModeAFastBalanced;

  /// No description provided for @uiVideoSettingsPageSharpLineRestoration2xCnn.
  ///
  /// In en, this message translates to:
  /// **'Sharp line restoration & 2x CNN upscale. Best for 1080p anime and balanced GPU power.'**
  String get uiVideoSettingsPageSharpLineRestoration2xCnn;

  /// No description provided for @uiVideoSettingsPageModeAHighQualityUltra.
  ///
  /// In en, this message translates to:
  /// **'Mode A — High Quality (Ultra)'**
  String get uiVideoSettingsPageModeAHighQualityUltra;

  /// No description provided for @uiVideoSettingsPageMaximumPerceptualFidelityUsingVery.
  ///
  /// In en, this message translates to:
  /// **'Maximum perceptual fidelity using Very Large CNNs. Recommended for discrete GPUs (RTX/Radeon).'**
  String get uiVideoSettingsPageMaximumPerceptualFidelityUsingVery;

  /// No description provided for @uiVideoSettingsPageModeBSoftDenoise.
  ///
  /// In en, this message translates to:
  /// **'Mode B — Soft / Denoise'**
  String get uiVideoSettingsPageModeBSoftDenoise;

  /// No description provided for @uiVideoSettingsPageSmoothLineReconstructionAndArtifact.
  ///
  /// In en, this message translates to:
  /// **'Smooth line reconstruction and artifact reduction. Best for blurry, compressed, or older anime.'**
  String get uiVideoSettingsPageSmoothLineReconstructionAndArtifact;

  /// No description provided for @uiVideoSettingsPageModeCDeblurScale.
  ///
  /// In en, this message translates to:
  /// **'Mode C — Deblur & Scale'**
  String get uiVideoSettingsPageModeCDeblurScale;

  /// No description provided for @uiVideoSettingsPageAggressiveDeblurringAndScalingBest.
  ///
  /// In en, this message translates to:
  /// **'Aggressive deblurring and scaling. Best for 480p and 720p low-resolution anime episodes.'**
  String get uiVideoSettingsPageAggressiveDeblurringAndScalingBest;

  /// No description provided for @uiVideoSettingsPageFsr10Smooth.
  ///
  /// In en, this message translates to:
  /// **'FSR 1.0 — Smooth'**
  String get uiVideoSettingsPageFsr10Smooth;

  /// No description provided for @uiVideoSettingsPageFsr10Sharp.
  ///
  /// In en, this message translates to:
  /// **'FSR 1.0 — Sharp'**
  String get uiVideoSettingsPageFsr10Sharp;

  /// No description provided for @uiVideoSettingsPagePipelineCompatibility.
  ///
  /// In en, this message translates to:
  /// **'PIPELINE & COMPATIBILITY'**
  String get uiVideoSettingsPagePipelineCompatibility;

  /// No description provided for @uiVideoSettingsPagePlaybackStartApplication.
  ///
  /// In en, this message translates to:
  /// **'Playback Start Application'**
  String get uiVideoSettingsPagePlaybackStartApplication;

  /// No description provided for @uiVideoSettingsPageHardwareDecoderAcceleration.
  ///
  /// In en, this message translates to:
  /// **'Hardware Decoder Acceleration'**
  String get uiVideoSettingsPageHardwareDecoderAcceleration;

  /// No description provided for @uiVideoSettingsPagePlatformRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Platform Recommendation'**
  String get uiVideoSettingsPagePlatformRecommendation;

  /// No description provided for @uiVideoSettingsPageHardwareAccelerationDecoding.
  ///
  /// In en, this message translates to:
  /// **'HARDWARE ACCELERATION & DECODING'**
  String get uiVideoSettingsPageHardwareAccelerationDecoding;

  /// No description provided for @uiVideoSettingsPageAllPlatforms.
  ///
  /// In en, this message translates to:
  /// **'All Platforms'**
  String get uiVideoSettingsPageAllPlatforms;

  /// No description provided for @uiVideoSettingsPageAutoSafeRecommended.
  ///
  /// In en, this message translates to:
  /// **'Auto-Safe (Recommended)'**
  String get uiVideoSettingsPageAutoSafeRecommended;

  /// No description provided for @uiVideoSettingsPageGpuHardwareDecodingWithSafe.
  ///
  /// In en, this message translates to:
  /// **'GPU hardware decoding with safe driver fallbacks. Best efficiency for most PCs and devices.'**
  String get uiVideoSettingsPageGpuHardwareDecodingWithSafe;

  /// No description provided for @uiVideoSettingsPageSoftwareDecodingCrashProof.
  ///
  /// In en, this message translates to:
  /// **'Software Decoding (Crash-Proof)'**
  String get uiVideoSettingsPageSoftwareDecodingCrashProof;

  /// No description provided for @uiVideoSettingsPagePureCpuDecodingViaFfmpeg.
  ///
  /// In en, this message translates to:
  /// **'Pure CPU decoding via FFmpeg libavcodec. Eliminates black screens and driver lockups on older GPUs or virtual machines.'**
  String get uiVideoSettingsPagePureCpuDecodingViaFfmpeg;

  /// No description provided for @uiVideoSettingsPageDirectHardware.
  ///
  /// In en, this message translates to:
  /// **'Direct Hardware'**
  String get uiVideoSettingsPageDirectHardware;

  /// No description provided for @uiVideoSettingsPageDirectGpuDecodingDirect3d11.
  ///
  /// In en, this message translates to:
  /// **'Direct GPU decoding (Direct3D 11 / MediaCodec / VAAPI). Fastest on modern high-end graphics.'**
  String get uiVideoSettingsPageDirectGpuDecodingDirect3d11;

  /// No description provided for @uiVideoSettingsPagePlaybackEngine.
  ///
  /// In en, this message translates to:
  /// **'PLAYBACK ENGINE'**
  String get uiVideoSettingsPagePlaybackEngine;

  /// No description provided for @uiVideoSettingsPageTorrentsAndLiveTvAlways.
  ///
  /// In en, this message translates to:
  /// **'Torrents and live TV always use mpv'**
  String get uiVideoSettingsPageTorrentsAndLiveTvAlways;

  /// No description provided for @uiVideoSettingsPageAutoRecoverBlackScreens.
  ///
  /// In en, this message translates to:
  /// **'Auto-Recover Black Screens'**
  String get uiVideoSettingsPageAutoRecoverBlackScreens;

  /// No description provided for @uiVideoSettingsPageActiveWatchdog.
  ///
  /// In en, this message translates to:
  /// **'Active Watchdog'**
  String get uiVideoSettingsPageActiveWatchdog;

  /// No description provided for @uiVideoSettingsPageAndroidRenderingEngine.
  ///
  /// In en, this message translates to:
  /// **'ANDROID RENDERING ENGINE'**
  String get uiVideoSettingsPageAndroidRenderingEngine;

  /// No description provided for @uiVideoSettingsPageDirectSurfaceSurfaceview.
  ///
  /// In en, this message translates to:
  /// **'Direct Surface (SurfaceView)'**
  String get uiVideoSettingsPageDirectSurfaceSurfaceview;

  /// No description provided for @uiAppearanceSettingsPageAppearanceInterface.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Interface'**
  String get uiAppearanceSettingsPageAppearanceInterface;

  /// No description provided for @uiAppearanceSettingsPageFineTuneTheVisualAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Fine-tune the visual atmosphere, custom wallpaper background, color palettes, and interface layouts.'**
  String get uiAppearanceSettingsPageFineTuneTheVisualAtmosphere;

  /// No description provided for @uiAppearanceSettingsPageInterfaceAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'INTERFACE & ATMOSPHERE'**
  String get uiAppearanceSettingsPageInterfaceAtmosphere;

  /// No description provided for @uiAppearanceSettingsPageCustomBackgroundWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Custom Background & Wallpaper'**
  String get uiAppearanceSettingsPageCustomBackgroundWallpaper;

  /// No description provided for @uiAppearanceSettingsPageLiquidGlassSetup.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass Setup'**
  String get uiAppearanceSettingsPageLiquidGlassSetup;

  /// No description provided for @uiAppearanceSettingsPageHomePageUiThemes.
  ///
  /// In en, this message translates to:
  /// **'Home Page UI & Themes'**
  String get uiAppearanceSettingsPageHomePageUiThemes;

  /// No description provided for @uiAppearanceSettingsPageLiveTvSportsUi.
  ///
  /// In en, this message translates to:
  /// **'Live TV & Sports UI'**
  String get uiAppearanceSettingsPageLiveTvSportsUi;

  /// No description provided for @uiAppearanceSettingsPageContent.
  ///
  /// In en, this message translates to:
  /// **'CONTENT'**
  String get uiAppearanceSettingsPageContent;

  /// No description provided for @uiAppearanceSettingsPageMangaUiReaderAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Manga UI & Reader Atmosphere'**
  String get uiAppearanceSettingsPageMangaUiReaderAtmosphere;

  /// No description provided for @uiAppearanceSettingsPagePlayback.
  ///
  /// In en, this message translates to:
  /// **'PLAYBACK'**
  String get uiAppearanceSettingsPagePlayback;

  /// No description provided for @uiAppearanceSettingsPageAudiobookUiPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Audiobook UI & Player Studio'**
  String get uiAppearanceSettingsPageAudiobookUiPlayerStudio;

  /// No description provided for @uiAppearanceSettingsPageMusicUiPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Music UI & Player Studio'**
  String get uiAppearanceSettingsPageMusicUiPlayerStudio;

  /// No description provided for @uiAppearanceSettingsPageDiagnostics.
  ///
  /// In en, this message translates to:
  /// **'DIAGNOSTICS'**
  String get uiAppearanceSettingsPageDiagnostics;

  /// No description provided for @uiAppearanceSettingsPageGraphicsBackend.
  ///
  /// In en, this message translates to:
  /// **'Graphics Backend'**
  String get uiAppearanceSettingsPageGraphicsBackend;

  /// No description provided for @uiAppearanceSettingsPageRestartTheAppToApply.
  ///
  /// In en, this message translates to:
  /// **'Restart the app to apply — the backend is fixed when the engine starts.'**
  String get uiAppearanceSettingsPageRestartTheAppToApply;

  /// No description provided for @uiAboutSettingsPageAboutZplay.
  ///
  /// In en, this message translates to:
  /// **'About Kiru'**
  String get uiAboutSettingsPageAboutZplay;

  /// No description provided for @uiAboutSettingsPageUniversalEntertainmentEcosystem.
  ///
  /// In en, this message translates to:
  /// **'Universal Entertainment Ecosystem'**
  String get uiAboutSettingsPageUniversalEntertainmentEcosystem;

  /// No description provided for @uiAboutSettingsPageCoreTechnologies.
  ///
  /// In en, this message translates to:
  /// **'CORE TECHNOLOGIES'**
  String get uiAboutSettingsPageCoreTechnologies;

  /// No description provided for @uiAboutSettingsPageHighPerformanceVideoEngine.
  ///
  /// In en, this message translates to:
  /// **'High-Performance Video Engine'**
  String get uiAboutSettingsPageHighPerformanceVideoEngine;

  /// No description provided for @uiAboutSettingsPagePoweredByEmbeddedMediaKitLibmpv.
  ///
  /// In en, this message translates to:
  /// **'Powered by embedded media_kit / libmpv with hardware-accelerated decoding.'**
  String get uiAboutSettingsPagePoweredByEmbeddedMediaKitLibmpv;

  /// No description provided for @uiAboutSettingsPageCreditsLicence.
  ///
  /// In en, this message translates to:
  /// **'CREDITS & LICENCE'**
  String get uiAboutSettingsPageCreditsLicence;

  /// No description provided for @uiAboutSettingsPageIndependentForkMaintainedByTzero86.
  ///
  /// In en, this message translates to:
  /// **'Independent fork maintained by tzero86'**
  String get uiAboutSettingsPageIndependentForkMaintainedByTzero86;

  /// No description provided for @uiAboutSettingsPageBasedOnPlaytorrioV3.
  ///
  /// In en, this message translates to:
  /// **'Based on PlayTorrio V3'**
  String get uiAboutSettingsPageBasedOnPlaytorrioV3;

  /// No description provided for @uiAboutSettingsPageOriginalProjectByAymanAyman708Ux.
  ///
  /// In en, this message translates to:
  /// **'Original project by Ayman (@ayman708-UX)'**
  String get uiAboutSettingsPageOriginalProjectByAymanAyman708Ux;

  /// No description provided for @uiAboutSettingsPageThisProductUsesTheTmdbApi.
  ///
  /// In en, this message translates to:
  /// **'This product uses the TMDB API but is not endorsed or certified by TMDB.'**
  String get uiAboutSettingsPageThisProductUsesTheTmdbApi;

  /// No description provided for @uiAddonsSettingsPageShareYourDebridKey.
  ///
  /// In en, this message translates to:
  /// **'Share your Debrid key?'**
  String get uiAddonsSettingsPageShareYourDebridKey;

  /// No description provided for @uiAddonsSettingsPageCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get uiAddonsSettingsPageCancel;

  /// No description provided for @uiAddonsSettingsPageContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get uiAddonsSettingsPageContinue;

  /// No description provided for @uiAddonsSettingsPageAddStremioAddon.
  ///
  /// In en, this message translates to:
  /// **'Add Stremio Addon'**
  String get uiAddonsSettingsPageAddStremioAddon;

  /// No description provided for @uiAddonsSettingsPagePasteTheStremioAddonManifestJson.
  ///
  /// In en, this message translates to:
  /// **'Paste the Stremio addon manifest.json URL to install catalogs, metadata, streams, or subtitles.'**
  String get uiAddonsSettingsPagePasteTheStremioAddonManifestJson;

  /// No description provided for @uiAddonsSettingsPageInstall.
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get uiAddonsSettingsPageInstall;

  /// No description provided for @uiAddonsSettingsPageRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get uiAddonsSettingsPageRemove;

  /// No description provided for @uiAddonsSettingsPageRepositoryAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Repository added successfully!'**
  String get uiAddonsSettingsPageRepositoryAddedSuccessfully;

  /// No description provided for @uiAddonsSettingsPageInstallRepositoryPlugins.
  ///
  /// In en, this message translates to:
  /// **'Install Repository Plugins?'**
  String get uiAddonsSettingsPageInstallRepositoryPlugins;

  /// No description provided for @uiAddonsSettingsPageBrowseLater.
  ///
  /// In en, this message translates to:
  /// **'Browse Later'**
  String get uiAddonsSettingsPageBrowseLater;

  /// No description provided for @uiAddonsSettingsPageInstallAllNow.
  ///
  /// In en, this message translates to:
  /// **'Install All Now'**
  String get uiAddonsSettingsPageInstallAllNow;

  /// No description provided for @uiAddonsSettingsPageInstallingPlugins.
  ///
  /// In en, this message translates to:
  /// **'Installing Plugins'**
  String get uiAddonsSettingsPageInstallingPlugins;

  /// No description provided for @uiAddonsSettingsPageAddCloudstreamRepository.
  ///
  /// In en, this message translates to:
  /// **'Add CloudStream Repository'**
  String get uiAddonsSettingsPageAddCloudstreamRepository;

  /// No description provided for @uiAddonsSettingsPageBrowseMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Browse Marketplace'**
  String get uiAddonsSettingsPageBrowseMarketplace;

  /// No description provided for @uiAddonsSettingsPageAddRepository.
  ///
  /// In en, this message translates to:
  /// **'Add Repository'**
  String get uiAddonsSettingsPageAddRepository;

  /// No description provided for @uiAddonsSettingsPageAddonsExtensions.
  ///
  /// In en, this message translates to:
  /// **'Addons & Extensions'**
  String get uiAddonsSettingsPageAddonsExtensions;

  /// No description provided for @uiAddonsSettingsPageStremioAddons.
  ///
  /// In en, this message translates to:
  /// **'Stremio Addons'**
  String get uiAddonsSettingsPageStremioAddons;

  /// No description provided for @uiAddonsSettingsPageAddonsProvideMetadataCatalogsAndStreaming.
  ///
  /// In en, this message translates to:
  /// **'Addons provide metadata, catalogs, and streaming sources. Hold and drag to reorder priority. Providers higher up load and appear first in watch sources.'**
  String get uiAddonsSettingsPageAddonsProvideMetadataCatalogsAndStreaming;

  /// No description provided for @uiAddonsSettingsPageInstalledProvidersAddons.
  ///
  /// In en, this message translates to:
  /// **'INSTALLED PROVIDERS & ADDONS'**
  String get uiAddonsSettingsPageInstalledProvidersAddons;

  /// No description provided for @uiAddonsSettingsPageNoAddonsInstalled.
  ///
  /// In en, this message translates to:
  /// **'No Addons Installed'**
  String get uiAddonsSettingsPageNoAddonsInstalled;

  /// No description provided for @uiAddonsSettingsPageClickAddAddonAboveToInstall.
  ///
  /// In en, this message translates to:
  /// **'Click \"Add Addon\" above to install a Stremio manifest URL.'**
  String get uiAddonsSettingsPageClickAddAddonAboveToInstall;

  /// No description provided for @uiAddonsSettingsPageDebridAddons.
  ///
  /// In en, this message translates to:
  /// **'DEBRID ADDONS'**
  String get uiAddonsSettingsPageDebridAddons;

  /// No description provided for @uiAddonsSettingsPageRepositoryMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Repository Marketplace'**
  String get uiAddonsSettingsPageRepositoryMarketplace;

  /// No description provided for @uiAddonsSettingsPageBrowseAvailablePlugins.
  ///
  /// In en, this message translates to:
  /// **'Browse Available Plugins'**
  String get uiAddonsSettingsPageBrowseAvailablePlugins;

  /// No description provided for @uiAddonsSettingsPageInstalledExtensions.
  ///
  /// In en, this message translates to:
  /// **'INSTALLED EXTENSIONS'**
  String get uiAddonsSettingsPageInstalledExtensions;

  /// No description provided for @uiAddonsSettingsPageInstalledCloudstreamExtensions.
  ///
  /// In en, this message translates to:
  /// **'INSTALLED CLOUDSTREAM EXTENSIONS'**
  String get uiAddonsSettingsPageInstalledCloudstreamExtensions;

  /// No description provided for @uiAddonsSettingsPageNoExtensionsInstalled.
  ///
  /// In en, this message translates to:
  /// **'No Extensions Installed'**
  String get uiAddonsSettingsPageNoExtensionsInstalled;

  /// No description provided for @uiAddonsSettingsPageClickBrowseAvailablePluginsToFind.
  ///
  /// In en, this message translates to:
  /// **'Click \"Browse Available Plugins\" to find and install extensions.'**
  String get uiAddonsSettingsPageClickBrowseAvailablePluginsToFind;

  /// No description provided for @uiAddonsSettingsPageRepositories.
  ///
  /// In en, this message translates to:
  /// **'REPOSITORIES'**
  String get uiAddonsSettingsPageRepositories;

  /// No description provided for @uiAddonsSettingsPageNoCustomRepositoriesAddedClickAdd.
  ///
  /// In en, this message translates to:
  /// **'No custom repositories added. Click \"Add Repository\" to subscribe to a CloudStream repository.'**
  String get uiAddonsSettingsPageNoCustomRepositoriesAddedClickAdd;

  /// No description provided for @uiAddonsSettingsPageInstallAllPluginsFromThisRepository.
  ///
  /// In en, this message translates to:
  /// **'Install all plugins from this repository'**
  String get uiAddonsSettingsPageInstallAllPluginsFromThisRepository;

  /// No description provided for @uiAddonsSettingsPageBrowseRepositoryPlugins.
  ///
  /// In en, this message translates to:
  /// **'Browse repository plugins'**
  String get uiAddonsSettingsPageBrowseRepositoryPlugins;

  /// No description provided for @uiAddonsSettingsPageRemoveRepository.
  ///
  /// In en, this message translates to:
  /// **'Remove repository'**
  String get uiAddonsSettingsPageRemoveRepository;

  /// No description provided for @uiAddonsSettingsPageSetupEngine.
  ///
  /// In en, this message translates to:
  /// **'Setup Engine'**
  String get uiAddonsSettingsPageSetupEngine;

  /// No description provided for @uiAddonsSettingsPageMoveUpInPriority.
  ///
  /// In en, this message translates to:
  /// **'Move up in priority'**
  String get uiAddonsSettingsPageMoveUpInPriority;

  /// No description provided for @uiAddonsSettingsPageMoveDownInPriority.
  ///
  /// In en, this message translates to:
  /// **'Move down in priority'**
  String get uiAddonsSettingsPageMoveDownInPriority;

  /// No description provided for @uiAddonsSettingsPageRemoveAddon.
  ///
  /// In en, this message translates to:
  /// **'Remove addon'**
  String get uiAddonsSettingsPageRemoveAddon;

  /// No description provided for @uiAddonsSettingsPageFunctions.
  ///
  /// In en, this message translates to:
  /// **'FUNCTIONS'**
  String get uiAddonsSettingsPageFunctions;

  /// No description provided for @uiAddonsSettingsPageCatalogs.
  ///
  /// In en, this message translates to:
  /// **'Catalogs'**
  String get uiAddonsSettingsPageCatalogs;

  /// No description provided for @uiAddonsSettingsPageSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get uiAddonsSettingsPageSearch;

  /// No description provided for @uiAddonsSettingsPageSources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get uiAddonsSettingsPageSources;

  /// No description provided for @uiAddonsSettingsPageSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get uiAddonsSettingsPageSubtitles;

  /// No description provided for @uiAddonsSettingsPageDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get uiAddonsSettingsPageDisconnect;

  /// No description provided for @uiAddonsSettingsPageConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get uiAddonsSettingsPageConnected;

  /// No description provided for @uiBuiltinProvidersSettingsPageBuiltInProviders.
  ///
  /// In en, this message translates to:
  /// **'Built-in Providers'**
  String get uiBuiltinProvidersSettingsPageBuiltInProviders;

  /// No description provided for @uiBuiltinProvidersSettingsPageReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get uiBuiltinProvidersSettingsPageReset;

  /// No description provided for @uiBuiltinProvidersSettingsPageResetProvidersOrder.
  ///
  /// In en, this message translates to:
  /// **'Reset Providers Order?'**
  String get uiBuiltinProvidersSettingsPageResetProvidersOrder;

  /// No description provided for @uiBuiltinProvidersSettingsPageCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get uiBuiltinProvidersSettingsPageCancel;

  /// No description provided for @uiBuiltinProvidersSettingsPageDefaultMode.
  ///
  /// In en, this message translates to:
  /// **'Default Mode'**
  String get uiBuiltinProvidersSettingsPageDefaultMode;

  /// No description provided for @uiBuiltinProvidersSettingsPageCustomMode.
  ///
  /// In en, this message translates to:
  /// **'Custom Mode'**
  String get uiBuiltinProvidersSettingsPageCustomMode;

  /// No description provided for @uiBuiltinProvidersSettingsPageManualProviderOrderTogglesPriorityScraping.
  ///
  /// In en, this message translates to:
  /// **'Manual provider order, toggles & priority scraping'**
  String
  get uiBuiltinProvidersSettingsPageManualProviderOrderTogglesPriorityScraping;

  /// No description provided for @uiBuiltinProvidersSettingsPageDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get uiBuiltinProvidersSettingsPageDefault;

  /// No description provided for @uiBuiltinProvidersSettingsPageStandardAutoSorting.
  ///
  /// In en, this message translates to:
  /// **'Standard auto-sorting'**
  String get uiBuiltinProvidersSettingsPageStandardAutoSorting;

  /// No description provided for @uiBuiltinProvidersSettingsPageCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get uiBuiltinProvidersSettingsPageCustom;

  /// No description provided for @uiBuiltinProvidersSettingsPageManualOrderToggles.
  ///
  /// In en, this message translates to:
  /// **'Manual order & toggles'**
  String get uiBuiltinProvidersSettingsPageManualOrderToggles;

  /// No description provided for @uiBuiltinProvidersSettingsPageDefaultModeActive.
  ///
  /// In en, this message translates to:
  /// **'Default Mode Active'**
  String get uiBuiltinProvidersSettingsPageDefaultModeActive;

  /// No description provided for @uiBuiltinProvidersSettingsPageSwitchToCustomMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to Custom Mode'**
  String get uiBuiltinProvidersSettingsPageSwitchToCustomMode;

  /// No description provided for @uiBuiltinProvidersSettingsPagePriorityScrapeResultSorting.
  ///
  /// In en, this message translates to:
  /// **'Priority Scrape & Result Sorting'**
  String get uiBuiltinProvidersSettingsPagePriorityScrapeResultSorting;

  /// No description provided for @uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrc.
  ///
  /// In en, this message translates to:
  /// **'Search providers (e.g. CineSrc)...'**
  String get uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrc;

  /// No description provided for @uiBuiltinProvidersSettingsPageEnableAll.
  ///
  /// In en, this message translates to:
  /// **'Enable All'**
  String get uiBuiltinProvidersSettingsPageEnableAll;

  /// No description provided for @uiBuiltinProvidersSettingsPageDisableAll.
  ///
  /// In en, this message translates to:
  /// **'Disable All'**
  String get uiBuiltinProvidersSettingsPageDisableAll;

  /// No description provided for @uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrcDulo.
  ///
  /// In en, this message translates to:
  /// **'Search providers (e.g. CineSrc, Dulo)...'**
  String get uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrcDulo;

  /// No description provided for @uiBuiltinProvidersSettingsPageClearSearchToDragReorder.
  ///
  /// In en, this message translates to:
  /// **'Clear search to drag & reorder'**
  String get uiBuiltinProvidersSettingsPageClearSearchToDragReorder;

  /// No description provided for @uiBuiltinProvidersSettingsPageOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get uiBuiltinProvidersSettingsPageOff;

  /// No description provided for @uiBuiltinProvidersSettingsPageMoveUp.
  ///
  /// In en, this message translates to:
  /// **'Move Up'**
  String get uiBuiltinProvidersSettingsPageMoveUp;

  /// No description provided for @uiBuiltinProvidersSettingsPageMoveDown.
  ///
  /// In en, this message translates to:
  /// **'Move Down'**
  String get uiBuiltinProvidersSettingsPageMoveDown;

  /// No description provided for @uiCloudstreamMarketplaceModalLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get uiCloudstreamMarketplaceModalLater;

  /// No description provided for @uiCloudstreamMarketplaceModalInstallAllNow.
  ///
  /// In en, this message translates to:
  /// **'Install All Now'**
  String get uiCloudstreamMarketplaceModalInstallAllNow;

  /// No description provided for @uiCloudstreamMarketplaceModalInstallingRepositoryPlugins.
  ///
  /// In en, this message translates to:
  /// **'Installing Repository Plugins'**
  String get uiCloudstreamMarketplaceModalInstallingRepositoryPlugins;

  /// No description provided for @uiCloudstreamMarketplaceModalMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get uiCloudstreamMarketplaceModalMarketplace;

  /// No description provided for @uiCloudstreamMarketplaceModalRefreshListFromWeb.
  ///
  /// In en, this message translates to:
  /// **'Refresh list from web'**
  String get uiCloudstreamMarketplaceModalRefreshListFromWeb;

  /// No description provided for @uiCloudstreamMarketplaceModalSearchRepositoryOrPluginEG.
  ///
  /// In en, this message translates to:
  /// **'Search repository or plugin (e.g. Turkish, 3rabi, DiziBox, Shahid)...'**
  String get uiCloudstreamMarketplaceModalSearchRepositoryOrPluginEG;

  /// No description provided for @uiCloudstreamMarketplaceModalAdded.
  ///
  /// In en, this message translates to:
  /// **'Added'**
  String get uiCloudstreamMarketplaceModalAdded;

  /// No description provided for @uiCloudstreamMarketplaceModalInstallAllPlugins.
  ///
  /// In en, this message translates to:
  /// **'Install All Plugins'**
  String get uiCloudstreamMarketplaceModalInstallAllPlugins;

  /// No description provided for @uiCloudstreamMarketplaceModalBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get uiCloudstreamMarketplaceModalBrowse;

  /// No description provided for @uiCloudstreamRepoModalAllMatchingPluginsAreAlreadyInstalled.
  ///
  /// In en, this message translates to:
  /// **'All matching plugins are already installed!'**
  String get uiCloudstreamRepoModalAllMatchingPluginsAreAlreadyInstalled;

  /// No description provided for @uiCloudstreamRepoModalCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get uiCloudstreamRepoModalCancel;

  /// No description provided for @uiCloudstreamRepoModalAvailablePlugins.
  ///
  /// In en, this message translates to:
  /// **'Available Plugins'**
  String get uiCloudstreamRepoModalAvailablePlugins;

  /// No description provided for @uiCloudstreamRepoModalAvailableCloudstreamPlugins.
  ///
  /// In en, this message translates to:
  /// **'Available CloudStream Plugins'**
  String get uiCloudstreamRepoModalAvailableCloudstreamPlugins;

  /// No description provided for @uiCloudstreamRepoModalSearchPluginsEGSflixSuperstream.
  ///
  /// In en, this message translates to:
  /// **'Search plugins (e.g. Sflix, SuperStream)...'**
  String get uiCloudstreamRepoModalSearchPluginsEGSflixSuperstream;

  /// No description provided for @uiCloudstreamRepoModalInstalled.
  ///
  /// In en, this message translates to:
  /// **'Installed'**
  String get uiCloudstreamRepoModalInstalled;

  /// No description provided for @uiCloudstreamRepoModalUninstall.
  ///
  /// In en, this message translates to:
  /// **'Uninstall'**
  String get uiCloudstreamRepoModalUninstall;

  /// No description provided for @uiCloudstreamRepoModalInstall.
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get uiCloudstreamRepoModalInstall;

  /// No description provided for @uiDebridSettingsPageDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get uiDebridSettingsPageDismiss;

  /// No description provided for @uiDebridSettingsPageDebridCloudStreaming.
  ///
  /// In en, this message translates to:
  /// **'Debrid & Cloud Streaming'**
  String get uiDebridSettingsPageDebridCloudStreaming;

  /// No description provided for @uiDebridSettingsPageUseDebridForStreams.
  ///
  /// In en, this message translates to:
  /// **'Use Debrid for Streams'**
  String get uiDebridSettingsPageUseDebridForStreams;

  /// No description provided for @uiDebridSettingsPageRouteTorrentLinksThroughCloudServers.
  ///
  /// In en, this message translates to:
  /// **'Route torrent links through cloud servers'**
  String get uiDebridSettingsPageRouteTorrentLinksThroughCloudServers;

  /// No description provided for @uiDebridSettingsPageActiveProvider.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE PROVIDER'**
  String get uiDebridSettingsPageActiveProvider;

  /// No description provided for @uiDebridSettingsPageSelectDefaultDebridProvider.
  ///
  /// In en, this message translates to:
  /// **'Select Default Debrid Provider'**
  String get uiDebridSettingsPageSelectDefaultDebridProvider;

  /// No description provided for @uiDebridSettingsPageZplayWillSendRequestsToThis.
  ///
  /// In en, this message translates to:
  /// **'Kiru will send requests to this provider when streaming.'**
  String get uiDebridSettingsPageZplayWillSendRequestsToThis;

  /// No description provided for @uiDebridSettingsPageProviderCredentials.
  ///
  /// In en, this message translates to:
  /// **'PROVIDER CREDENTIALS'**
  String get uiDebridSettingsPageProviderCredentials;

  /// No description provided for @uiDebridSettingsPageActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get uiDebridSettingsPageActive;

  /// No description provided for @uiDebridSettingsPagePasteApiKeyToken.
  ///
  /// In en, this message translates to:
  /// **'Paste API Key / Token'**
  String get uiDebridSettingsPagePasteApiKeyToken;

  /// No description provided for @uiDebridSettingsPageClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get uiDebridSettingsPageClear;

  /// No description provided for @uiDebridSettingsPagePasteFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste from Clipboard'**
  String get uiDebridSettingsPagePasteFromClipboard;

  /// No description provided for @uiDebridSettingsPageSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get uiDebridSettingsPageSave;

  /// No description provided for @uiServiceKeysSettingsPageDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get uiServiceKeysSettingsPageDismiss;

  /// No description provided for @uiServiceKeysSettingsPageServiceApiKeys.
  ///
  /// In en, this message translates to:
  /// **'Service API Keys'**
  String get uiServiceKeysSettingsPageServiceApiKeys;

  /// No description provided for @uiServiceKeysSettingsPageKeysYouCanObtain.
  ///
  /// In en, this message translates to:
  /// **'KEYS YOU CAN OBTAIN'**
  String get uiServiceKeysSettingsPageKeysYouCanObtain;

  /// No description provided for @uiServiceKeysSettingsPageBorrowedCredentials.
  ///
  /// In en, this message translates to:
  /// **'BORROWED CREDENTIALS'**
  String get uiServiceKeysSettingsPageBorrowedCredentials;

  /// No description provided for @uiServiceKeysSettingsPageRelated.
  ///
  /// In en, this message translates to:
  /// **'RELATED'**
  String get uiServiceKeysSettingsPageRelated;

  /// No description provided for @uiServiceKeysSettingsPageSaved.
  ///
  /// In en, this message translates to:
  /// **'SAVED'**
  String get uiServiceKeysSettingsPageSaved;

  /// No description provided for @uiServiceKeysSettingsPagePasteFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste from Clipboard'**
  String get uiServiceKeysSettingsPagePasteFromClipboard;

  /// No description provided for @uiServiceKeysSettingsPageSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get uiServiceKeysSettingsPageSave;

  /// No description provided for @uiServiceKeysSettingsPageClearKey.
  ///
  /// In en, this message translates to:
  /// **'Clear key'**
  String get uiServiceKeysSettingsPageClearKey;

  /// No description provided for @uiServiceKeysSettingsPageTmdbApiKey.
  ///
  /// In en, this message translates to:
  /// **'TMDb API Key'**
  String get uiServiceKeysSettingsPageTmdbApiKey;

  /// No description provided for @uiSimklSettingsPageFailedToRequestSimklPinCode.
  ///
  /// In en, this message translates to:
  /// **'Failed to request Simkl PIN code.'**
  String get uiSimklSettingsPageFailedToRequestSimklPinCode;

  /// No description provided for @uiSimklSettingsPageSimklSynchronization.
  ///
  /// In en, this message translates to:
  /// **'Simkl Synchronization'**
  String get uiSimklSettingsPageSimklSynchronization;

  /// No description provided for @uiSimklSettingsPageDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get uiSimklSettingsPageDisconnect;

  /// No description provided for @uiSimklSettingsPageConnectSimkl.
  ///
  /// In en, this message translates to:
  /// **'Connect Simkl'**
  String get uiSimklSettingsPageConnectSimkl;

  /// No description provided for @uiSimklSettingsPageEnterThisPinCodeAtSimkl.
  ///
  /// In en, this message translates to:
  /// **'Enter this PIN code at simkl.com/pin:'**
  String get uiSimklSettingsPageEnterThisPinCodeAtSimkl;

  /// No description provided for @uiSimklSettingsPagePinCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'PIN copied to clipboard!'**
  String get uiSimklSettingsPagePinCopiedToClipboard;

  /// No description provided for @uiSimklSettingsPageOpenSimklComPin.
  ///
  /// In en, this message translates to:
  /// **'Open simkl.com/pin'**
  String get uiSimklSettingsPageOpenSimklComPin;

  /// No description provided for @uiSimklSettingsPageWaitingForPinApprovalOnSimkl.
  ///
  /// In en, this message translates to:
  /// **'Waiting for PIN approval on simkl.com...'**
  String get uiSimklSettingsPageWaitingForPinApprovalOnSimkl;

  /// No description provided for @uiSimklSettingsPageCloudSyncControls.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync Controls'**
  String get uiSimklSettingsPageCloudSyncControls;

  /// No description provided for @uiSimklSettingsPageSyncSimklWatchlistContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Sync Simkl Watchlist & Continue Watching'**
  String get uiSimklSettingsPageSyncSimklWatchlistContinueWatching;

  /// No description provided for @uiSimklSettingsPageManuallyTriggersAnImmediatePullFrom.
  ///
  /// In en, this message translates to:
  /// **'Manually triggers an immediate pull from Simkl'**
  String get uiSimklSettingsPageManuallyTriggersAnImmediatePullFrom;

  /// No description provided for @uiSimklSettingsPageSyncingWithSimkl.
  ///
  /// In en, this message translates to:
  /// **'Syncing with Simkl...'**
  String get uiSimklSettingsPageSyncingWithSimkl;

  /// No description provided for @uiSimklSettingsPageSimklSyncComplete.
  ///
  /// In en, this message translates to:
  /// **'Simkl sync complete!'**
  String get uiSimklSettingsPageSimklSyncComplete;

  /// No description provided for @uiTmdbSettingsPageDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get uiTmdbSettingsPageDismiss;

  /// No description provided for @uiTmdbSettingsPageTmdbApiKey.
  ///
  /// In en, this message translates to:
  /// **'TMDb API Key'**
  String get uiTmdbSettingsPageTmdbApiKey;

  /// No description provided for @uiTmdbSettingsPageTmdbCredential.
  ///
  /// In en, this message translates to:
  /// **'TMDB CREDENTIAL'**
  String get uiTmdbSettingsPageTmdbCredential;

  /// No description provided for @uiTmdbSettingsPageCredits.
  ///
  /// In en, this message translates to:
  /// **'CREDITS'**
  String get uiTmdbSettingsPageCredits;

  /// No description provided for @uiTmdbSettingsPageSaved.
  ///
  /// In en, this message translates to:
  /// **'SAVED'**
  String get uiTmdbSettingsPageSaved;

  /// No description provided for @uiTmdbSettingsPagePasteYourTmdbApiKey.
  ///
  /// In en, this message translates to:
  /// **'Paste your TMDb API key'**
  String get uiTmdbSettingsPagePasteYourTmdbApiKey;

  /// No description provided for @uiTmdbSettingsPagePasteFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste from Clipboard'**
  String get uiTmdbSettingsPagePasteFromClipboard;

  /// No description provided for @uiTmdbSettingsPageSaveAndTest.
  ///
  /// In en, this message translates to:
  /// **'Save and test'**
  String get uiTmdbSettingsPageSaveAndTest;

  /// No description provided for @uiTmdbSettingsPageClearKey.
  ///
  /// In en, this message translates to:
  /// **'Clear key'**
  String get uiTmdbSettingsPageClearKey;

  /// No description provided for @uiTraktSettingsPageTraktTvSynchronization.
  ///
  /// In en, this message translates to:
  /// **'Trakt.tv Synchronization'**
  String get uiTraktSettingsPageTraktTvSynchronization;

  /// No description provided for @uiTraktSettingsPageDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get uiTraktSettingsPageDisconnect;

  /// No description provided for @uiTraktSettingsPagePairAccount.
  ///
  /// In en, this message translates to:
  /// **'Pair Account'**
  String get uiTraktSettingsPagePairAccount;

  /// No description provided for @uiTraktSettingsPageEnterThisActivationCodeAtTrakt.
  ///
  /// In en, this message translates to:
  /// **'Enter this activation code at trakt.tv/activate:'**
  String get uiTraktSettingsPageEnterThisActivationCodeAtTrakt;

  /// No description provided for @uiTraktSettingsPageCodeCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Code copied to clipboard!'**
  String get uiTraktSettingsPageCodeCopiedToClipboard;

  /// No description provided for @uiTraktSettingsPageOpenTraktTvActivate.
  ///
  /// In en, this message translates to:
  /// **'Open trakt.tv/activate'**
  String get uiTraktSettingsPageOpenTraktTvActivate;

  /// No description provided for @uiTraktSettingsPageWaitingForAuthorizationOnTraktTv.
  ///
  /// In en, this message translates to:
  /// **'Waiting for authorization on trakt.tv...'**
  String get uiTraktSettingsPageWaitingForAuthorizationOnTraktTv;

  /// No description provided for @uiTraktSettingsPageCloudSyncControls.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync Controls'**
  String get uiTraktSettingsPageCloudSyncControls;

  /// No description provided for @uiTraktSettingsPageSyncWatchlistContinueWatchingNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Watchlist & Continue Watching Now'**
  String get uiTraktSettingsPageSyncWatchlistContinueWatchingNow;

  /// No description provided for @uiTraktSettingsPageManuallyTriggersAnImmediatePullFrom.
  ///
  /// In en, this message translates to:
  /// **'Manually triggers an immediate pull from Trakt'**
  String get uiTraktSettingsPageManuallyTriggersAnImmediatePullFrom;

  /// No description provided for @uiTraktSettingsPageSyncingWithTraktTv.
  ///
  /// In en, this message translates to:
  /// **'Syncing with Trakt.tv...'**
  String get uiTraktSettingsPageSyncingWithTraktTv;

  /// No description provided for @uiTraktSettingsPageTraktSyncComplete.
  ///
  /// In en, this message translates to:
  /// **'Trakt sync complete!'**
  String get uiTraktSettingsPageTraktSyncComplete;

  /// No description provided for @uiUpdatesSettingsPageZplayIsUpToDate.
  ///
  /// In en, this message translates to:
  /// **'Kiru is up to date!'**
  String get uiUpdatesSettingsPageZplayIsUpToDate;

  /// No description provided for @uiUpdatesSettingsPageAppUpdatesSystem.
  ///
  /// In en, this message translates to:
  /// **'App Updates & System'**
  String get uiUpdatesSettingsPageAppUpdatesSystem;

  /// No description provided for @uiUpdatesSettingsPageKeepZplayUpToDateWith.
  ///
  /// In en, this message translates to:
  /// **'Keep Kiru up to date with the latest features, security patches, and performance improvements.'**
  String get uiUpdatesSettingsPageKeepZplayUpToDateWith;

  /// No description provided for @uiUpdatesSettingsPageReleaseChannels.
  ///
  /// In en, this message translates to:
  /// **'RELEASE CHANNELS'**
  String get uiUpdatesSettingsPageReleaseChannels;

  /// No description provided for @uiUpdatesSettingsPageOfficialStableChannel.
  ///
  /// In en, this message translates to:
  /// **'Official Stable Channel'**
  String get uiUpdatesSettingsPageOfficialStableChannel;

  /// No description provided for @uiUpdatesSettingsPageDirectGithubReleaseDistributionWithAutomated.
  ///
  /// In en, this message translates to:
  /// **'Direct GitHub release distribution with automated checksum verification.'**
  String get uiUpdatesSettingsPageDirectGithubReleaseDistributionWithAutomated;

  /// No description provided for @uiUpdatesSettingsPageSeamlessInAppPatching.
  ///
  /// In en, this message translates to:
  /// **'Seamless In-App Patching'**
  String get uiUpdatesSettingsPageSeamlessInAppPatching;

  /// No description provided for @uiUpdatesSettingsPageDownloadsAndAppliesExecutableUpdatesDirectly.
  ///
  /// In en, this message translates to:
  /// **'Downloads and applies executable updates directly without manual file downloads.'**
  String get uiUpdatesSettingsPageDownloadsAndAppliesExecutableUpdatesDirectly;

  /// No description provided for @libraryMyList.
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get libraryMyList;

  /// No description provided for @libraryDownloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get libraryDownloads;

  /// No description provided for @librarySection.
  ///
  /// In en, this message translates to:
  /// **'Library section'**
  String get librarySection;

  /// No description provided for @mediaTypeMovie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get mediaTypeMovie;

  /// No description provided for @mediaTypeSeries.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get mediaTypeSeries;

  /// No description provided for @mediaTypeAnime.
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get mediaTypeAnime;

  /// No description provided for @mediaTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get mediaTypeOther;

  /// No description provided for @aspectFit.
  ///
  /// In en, this message translates to:
  /// **'Fit to screen (Contain)'**
  String get aspectFit;

  /// No description provided for @aspectCover.
  ///
  /// In en, this message translates to:
  /// **'Fill screen (Crop/Zoom)'**
  String get aspectCover;

  /// No description provided for @aspectStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch to fill'**
  String get aspectStretch;

  /// No description provided for @detailsPlayFirst.
  ///
  /// In en, this message translates to:
  /// **'Play First Movie'**
  String get detailsPlayFirst;

  /// No description provided for @detailsPlayEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Play Episodes'**
  String get detailsPlayEpisodes;

  /// No description provided for @detailsPlayMovie.
  ///
  /// In en, this message translates to:
  /// **'Play Movie'**
  String get detailsPlayMovie;

  /// No description provided for @detailsCollectionMovies.
  ///
  /// In en, this message translates to:
  /// **'Movies in Collection'**
  String get detailsCollectionMovies;

  /// No description provided for @detailsEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get detailsEpisodes;

  /// No description provided for @detailsSimilar.
  ///
  /// In en, this message translates to:
  /// **'Similar Content'**
  String get detailsSimilar;

  /// No description provided for @detailsCast.
  ///
  /// In en, this message translates to:
  /// **'Top Cast & Characters'**
  String get detailsCast;

  /// No description provided for @detailsRecommendations.
  ///
  /// In en, this message translates to:
  /// **'More Like This'**
  String get detailsRecommendations;

  /// No description provided for @detailsSeasonCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 Season} other{{count} Seasons}}'**
  String detailsSeasonCount(int count);

  /// No description provided for @detailsSeasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Season {season}'**
  String detailsSeasonLabel(int season);

  /// No description provided for @playerSubtitleSwitched.
  ///
  /// In en, this message translates to:
  /// **'Switched to embedded subtitle: {title}'**
  String playerSubtitleSwitched(String title);

  /// No description provided for @playerSubtitleDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading {language} subtitle...'**
  String playerSubtitleDownloading(String language);

  /// No description provided for @playerSubtitleLoaded.
  ///
  /// In en, this message translates to:
  /// **'{language} subtitle loaded ({count} lines)'**
  String playerSubtitleLoaded(String language, int count);

  /// No description provided for @playerSubtitleLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load subtitle: {error}'**
  String playerSubtitleLoadError(String error);

  /// No description provided for @playerSourceAttempt.
  ///
  /// In en, this message translates to:
  /// **'{source} • Attempt {attempt} of {total}'**
  String playerSourceAttempt(String source, int attempt, int total);

  /// No description provided for @playerDownloadError.
  ///
  /// In en, this message translates to:
  /// **'Download failed to start: {error}'**
  String playerDownloadError(String error);

  /// No description provided for @animeTotalEpisodes.
  ///
  /// In en, this message translates to:
  /// **'({count} total)'**
  String animeTotalEpisodes(int count);

  /// No description provided for @animeSearchResultCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 result} other{{count} results}}'**
  String animeSearchResultCount(int count);

  /// No description provided for @libraryRemoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{title}\" from your list?'**
  String libraryRemoveTitle(String title);

  /// No description provided for @downloadsSummary.
  ///
  /// In en, this message translates to:
  /// **'{active} active • {completed} downloaded'**
  String downloadsSummary(int active, int completed);

  /// No description provided for @downloadsFolderPath.
  ///
  /// In en, this message translates to:
  /// **'Folder path: {path}'**
  String downloadsFolderPath(String path);

  /// No description provided for @downloadsDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{title}\" and remove its file from storage?'**
  String downloadsDeleteConfirm(String title);

  /// No description provided for @auxShellBackGuardPressBackAgainToExit.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get auxShellBackGuardPressBackAgainToExit;

  /// No description provided for @auxSectionHeaderSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get auxSectionHeaderSeeAll;

  /// No description provided for @auxTrailerModalTrailerUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Trailer unavailable'**
  String get auxTrailerModalTrailerUnavailable;

  /// No description provided for @auxTrailerModalThisTrailerCouldNotBePlayedIn.
  ///
  /// In en, this message translates to:
  /// **'This trailer could not be played in the app.'**
  String get auxTrailerModalThisTrailerCouldNotBePlayedIn;

  /// No description provided for @auxTrailerModalWatchOnYoutube.
  ///
  /// In en, this message translates to:
  /// **'Watch on YouTube'**
  String get auxTrailerModalWatchOnYoutube;

  /// No description provided for @auxTrailerModalCloseTrailer.
  ///
  /// In en, this message translates to:
  /// **'Close trailer'**
  String get auxTrailerModalCloseTrailer;

  /// No description provided for @auxIptvChannelCardHdLive.
  ///
  /// In en, this message translates to:
  /// **'HD Live'**
  String get auxIptvChannelCardHdLive;

  /// No description provided for @auxIptvHeroCarouselInstantLiveMultiSourceStreamingWithReal.
  ///
  /// In en, this message translates to:
  /// **'Instant live multi-source streaming with real-time stream resolution & high-framerate playback.'**
  String get auxIptvHeroCarouselInstantLiveMultiSourceStreamingWithReal;

  /// No description provided for @auxIptvHeroCarouselWatchLive.
  ///
  /// In en, this message translates to:
  /// **'Watch Live'**
  String get auxIptvHeroCarouselWatchLive;

  /// No description provided for @auxIptvHeroCarouselStreamFeeds.
  ///
  /// In en, this message translates to:
  /// **'Stream Feeds'**
  String get auxIptvHeroCarouselStreamFeeds;

  /// No description provided for @auxMultinutzChannelSheetSearchChannels.
  ///
  /// In en, this message translates to:
  /// **'Search channels...'**
  String get auxMultinutzChannelSheetSearchChannels;

  /// No description provided for @auxMultinutzChannelSheetPortals.
  ///
  /// In en, this message translates to:
  /// **'Portals'**
  String get auxMultinutzChannelSheetPortals;

  /// No description provided for @auxMultinutzChannelSheetCopyLoginUrlUserPass.
  ///
  /// In en, this message translates to:
  /// **'Copy Login (url:user:pass)'**
  String get auxMultinutzChannelSheetCopyLoginUrlUserPass;

  /// No description provided for @auxMultinutzChannelSheetRemovePortal.
  ///
  /// In en, this message translates to:
  /// **'Remove Portal'**
  String get auxMultinutzChannelSheetRemovePortal;

  /// No description provided for @auxMultinutzChannelSheetNoLiveChannelsAvailableForThisPortal.
  ///
  /// In en, this message translates to:
  /// **'No live channels available for this portal'**
  String get auxMultinutzChannelSheetNoLiveChannelsAvailableForThisPortal;

  /// No description provided for @auxMultinutzChannelSheetPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get auxMultinutzChannelSheetPlaylists;

  /// No description provided for @auxMultinutzChannelSheetCopyPlaylistUrl.
  ///
  /// In en, this message translates to:
  /// **'Copy Playlist URL'**
  String get auxMultinutzChannelSheetCopyPlaylistUrl;

  /// No description provided for @auxMultinutzChannelSheetRemovePlaylist.
  ///
  /// In en, this message translates to:
  /// **'Remove Playlist'**
  String get auxMultinutzChannelSheetRemovePlaylist;

  /// No description provided for @auxMultinutzChannelSheetNoChannelsInThisPlaylist.
  ///
  /// In en, this message translates to:
  /// **'No channels in this playlist'**
  String get auxMultinutzChannelSheetNoChannelsInThisPlaylist;

  /// No description provided for @auxMangaCategoryDropdownMangaCategories.
  ///
  /// In en, this message translates to:
  /// **'Manga Categories'**
  String get auxMangaCategoryDropdownMangaCategories;

  /// No description provided for @auxMangaCategoryDropdownFilterCategories.
  ///
  /// In en, this message translates to:
  /// **'Filter categories...'**
  String get auxMangaCategoryDropdownFilterCategories;

  /// No description provided for @auxMangaCategoryDropdownNoMatchingCategories.
  ///
  /// In en, this message translates to:
  /// **'No matching categories'**
  String get auxMangaCategoryDropdownNoMatchingCategories;

  /// No description provided for @auxMangaCategoryDropdownResetToAllCategories.
  ///
  /// In en, this message translates to:
  /// **'Reset to All Categories'**
  String get auxMangaCategoryDropdownResetToAllCategories;

  /// No description provided for @auxMovieSliderSectionCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get auxMovieSliderSectionCalendar;

  /// No description provided for @auxP2PWarningDialogP2pTorrentStreamingNotice.
  ///
  /// In en, this message translates to:
  /// **'P2P Torrent Streaming Notice'**
  String get auxP2PWarningDialogP2pTorrentStreamingNotice;

  /// No description provided for @auxP2PWarningDialogExit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get auxP2PWarningDialogExit;

  /// No description provided for @auxP2PWarningDialogWouldYouLikeToTurnOffThe.
  ///
  /// In en, this message translates to:
  /// **'Would you like to turn off the built-in ZPlay P2P torrent source and use only direct HTTP streaming?'**
  String get auxP2PWarningDialogWouldYouLikeToTurnOffThe;

  /// No description provided for @auxP2PWarningDialogP2pPeerToPeerTorrentStreamingConnects.
  ///
  /// In en, this message translates to:
  /// **'P2P (peer-to-peer torrent) streaming connects directly to public torrent swarms to download and seed video pieces. In certain countries and regions, unencrypted torrent activity may be monitored and could result in warning letters or notices from your Internet Service Provider (ISP).'**
  String get auxP2PWarningDialogP2pPeerToPeerTorrentStreamingConnects;

  /// No description provided for @auxP2PWarningDialogZplayhttpDirectStream.
  ///
  /// In en, this message translates to:
  /// **'ZPlayHTTP (Direct Stream)'**
  String get auxP2PWarningDialogZplayhttpDirectStream;

  /// No description provided for @auxP2PWarningDialogSafeDirectHttpsWebStreamsNoTorrenting.
  ///
  /// In en, this message translates to:
  /// **'Safe direct HTTPS web streams. No torrenting or peer uploading.'**
  String get auxP2PWarningDialogSafeDirectHttpsWebStreamsNoTorrenting;

  /// No description provided for @auxP2PWarningDialogZplayTorrentEngine.
  ///
  /// In en, this message translates to:
  /// **'ZPlay (Torrent Engine)'**
  String get auxP2PWarningDialogZplayTorrentEngine;

  /// No description provided for @auxP2PWarningDialogP2pSwarmsKnabenTorrentgalaxyInvolvesPeerData.
  ///
  /// In en, this message translates to:
  /// **'P2P swarms (Knaben, TorrentGalaxy). Involves peer data sharing.'**
  String get auxP2PWarningDialogP2pSwarmsKnabenTorrentgalaxyInvolvesPeerData;

  /// No description provided for @auxP2PWarningDialogNoteYouCanEasilyToggleTheBuilt.
  ///
  /// In en, this message translates to:
  /// **'Note: You can easily toggle the built-in P2P source back on or off anytime in Settings.'**
  String get auxP2PWarningDialogNoteYouCanEasilyToggleTheBuilt;

  /// No description provided for @auxP2PWarningDialogDonTShowAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Show Again'**
  String get auxP2PWarningDialogDonTShowAgain;

  /// No description provided for @auxP2PWarningDialogP2pTorrentSourceTurnedOffZplayhttpWill.
  ///
  /// In en, this message translates to:
  /// **'P2P torrent source turned off. ZPlayHTTP will be used.'**
  String get auxP2PWarningDialogP2pTorrentSourceTurnedOffZplayhttpWill;

  /// No description provided for @auxP2PWarningDialogYesTurnOffP2p.
  ///
  /// In en, this message translates to:
  /// **'Yes, Turn Off P2P'**
  String get auxP2PWarningDialogYesTurnOffP2p;

  /// No description provided for @auxPlayerSkipButtonDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss (✕)'**
  String get auxPlayerSkipButtonDismiss;

  /// No description provided for @auxMagnetFilesViewGatheringFileListStreamMetadata.
  ///
  /// In en, this message translates to:
  /// **'Gathering file list & stream metadata'**
  String get auxMagnetFilesViewGatheringFileListStreamMetadata;

  /// No description provided for @auxMagnetFilesViewFailedToReadMagnet.
  ///
  /// In en, this message translates to:
  /// **'Failed to Read Magnet'**
  String get auxMagnetFilesViewFailedToReadMagnet;

  /// No description provided for @auxMagnetFilesViewTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get auxMagnetFilesViewTryAgain;

  /// No description provided for @auxMagnetFilesViewNoFilesMatchFilter.
  ///
  /// In en, this message translates to:
  /// **'No files match filter'**
  String get auxMagnetFilesViewNoFilesMatchFilter;

  /// No description provided for @auxMagnetFilesViewFilterFilesByName.
  ///
  /// In en, this message translates to:
  /// **'Filter files by name...'**
  String get auxMagnetFilesViewFilterFilesByName;

  /// No description provided for @auxMagnetFilesViewNonVideo.
  ///
  /// In en, this message translates to:
  /// **'Non-video'**
  String get auxMagnetFilesViewNonVideo;

  /// No description provided for @auxTvOnScreenKeyboardSpace.
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get auxTvOnScreenKeyboardSpace;

  /// No description provided for @auxUpdateDialogCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get auxUpdateDialogCurrent;

  /// No description provided for @auxUpdateDialogLatest.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get auxUpdateDialogLatest;

  /// No description provided for @auxUpdateDialogDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get auxUpdateDialogDownloading;

  /// No description provided for @auxUpdateDialogUpdateNow.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get auxUpdateDialogUpdateNow;

  /// No description provided for @auxUpdateDialogUpdateCouldNotBeVerified.
  ///
  /// In en, this message translates to:
  /// **'Update could not be verified'**
  String get auxUpdateDialogUpdateCouldNotBeVerified;

  /// No description provided for @auxUpdateDialogOpenReleasePage.
  ///
  /// In en, this message translates to:
  /// **'Open release page'**
  String get auxUpdateDialogOpenReleasePage;

  /// No description provided for @auxUpdateDialogPleaseEnableInstallUnknownAppsPermissionFor.
  ///
  /// In en, this message translates to:
  /// **'Please enable \"Install unknown apps\" permission for Kiru in Android settings.'**
  String get auxUpdateDialogPleaseEnableInstallUnknownAppsPermissionFor;

  /// No description provided for @auxUpdateDialogDownloadComplete.
  ///
  /// In en, this message translates to:
  /// **'Download Complete'**
  String get auxUpdateDialogDownloadComplete;

  /// No description provided for @auxUpdateDialogOpenFolder.
  ///
  /// In en, this message translates to:
  /// **'Open Folder'**
  String get auxUpdateDialogOpenFolder;

  /// No description provided for @auxAdultPageCouldNotLoad18Sources.
  ///
  /// In en, this message translates to:
  /// **'Could not load 18+ sources'**
  String get auxAdultPageCouldNotLoad18Sources;

  /// No description provided for @auxAdultPageTitlesFromTheAddonsMarked18Or.
  ///
  /// In en, this message translates to:
  /// **'Titles from the addons marked 18+ or hybrid.'**
  String get auxAdultPageTitlesFromTheAddonsMarked18Or;

  /// No description provided for @auxWewatchQuizPageRecommendationQuiz.
  ///
  /// In en, this message translates to:
  /// **'Recommendation Quiz'**
  String get auxWewatchQuizPageRecommendationQuiz;

  /// No description provided for @auxWewatchQuizPageRetake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get auxWewatchQuizPageRetake;

  /// No description provided for @auxWewatchQuizPageWhatDoYouLikeToWatch.
  ///
  /// In en, this message translates to:
  /// **'What do you like to watch?'**
  String get auxWewatchQuizPageWhatDoYouLikeToWatch;

  /// No description provided for @auxWewatchQuizPageRate3OrMoreMoviesOrTv.
  ///
  /// In en, this message translates to:
  /// **'Rate 3 or more movies or TV shows. Choose what you liked or disliked, and select key elements to generate pinpoint AI recommendations.'**
  String get auxWewatchQuizPageRate3OrMoreMoviesOrTv;

  /// No description provided for @auxWewatchQuizPageAddAnotherTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Another Title'**
  String get auxWewatchQuizPageAddAnotherTitle;

  /// No description provided for @auxWewatchQuizPageRemoveThisTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove this title'**
  String get auxWewatchQuizPageRemoveThisTitle;

  /// No description provided for @auxWewatchQuizPageSearchMovieOrTvSeries.
  ///
  /// In en, this message translates to:
  /// **'Search movie or TV series...'**
  String get auxWewatchQuizPageSearchMovieOrTvSeries;

  /// No description provided for @auxWewatchQuizPageNeedIdeas.
  ///
  /// In en, this message translates to:
  /// **'Need ideas?'**
  String get auxWewatchQuizPageNeedIdeas;

  /// No description provided for @auxWewatchQuizPageHowWasYourExperienceWithIt.
  ///
  /// In en, this message translates to:
  /// **'How was your experience with it?'**
  String get auxWewatchQuizPageHowWasYourExperienceWithIt;

  /// No description provided for @auxWewatchQuizPageWhatStoodOutPickKeyElementsOr.
  ///
  /// In en, this message translates to:
  /// **'What stood out? (Pick key elements or write a note):'**
  String get auxWewatchQuizPageWhatStoodOutPickKeyElementsOr;

  /// No description provided for @auxWewatchQuizPageFetchingReasonTags.
  ///
  /// In en, this message translates to:
  /// **'Fetching reason tags...'**
  String get auxWewatchQuizPageFetchingReasonTags;

  /// No description provided for @auxWewatchQuizPageAdditionalNotesOrSpecificsOptional.
  ///
  /// In en, this message translates to:
  /// **'Additional notes or specifics (optional)...'**
  String get auxWewatchQuizPageAdditionalNotesOrSpecificsOptional;

  /// No description provided for @auxWewatchQuizPageSynthesizingTasteVectorsWithMultiSignalAi.
  ///
  /// In en, this message translates to:
  /// **'Synthesizing taste vectors with multi-signal AI...'**
  String get auxWewatchQuizPageSynthesizingTasteVectorsWithMultiSignalAi;

  /// No description provided for @auxWewatchQuizPageYourPersonalizedMatches.
  ///
  /// In en, this message translates to:
  /// **'Your Personalized Matches'**
  String get auxWewatchQuizPageYourPersonalizedMatches;

  /// No description provided for @auxAnimePageAnimeCatalogue.
  ///
  /// In en, this message translates to:
  /// **'Anime catalogue'**
  String get auxAnimePageAnimeCatalogue;

  /// No description provided for @auxAnimePageWatchS1E1.
  ///
  /// In en, this message translates to:
  /// **'Watch S1:E1'**
  String get auxAnimePageWatchS1E1;

  /// No description provided for @auxAnimePageAnilistDetails.
  ///
  /// In en, this message translates to:
  /// **'AniList Details'**
  String get auxAnimePageAnilistDetails;

  /// No description provided for @auxAnimeStreamSheetExtractingMegaplayVidwishAllanimeMiruroStreams.
  ///
  /// In en, this message translates to:
  /// **'Extracting MegaPlay, VidWish, AllAnime & Miruro streams...'**
  String get auxAnimeStreamSheetExtractingMegaplayVidwishAllanimeMiruroStreams;

  /// No description provided for @auxAudiobooksPageCustomizeAudiobookSection.
  ///
  /// In en, this message translates to:
  /// **'Customize Audiobook Section'**
  String get auxAudiobooksPageCustomizeAudiobookSection;

  /// No description provided for @auxAudiobooksPagePosterCardDensity.
  ///
  /// In en, this message translates to:
  /// **'Poster Card Density'**
  String get auxAudiobooksPagePosterCardDensity;

  /// No description provided for @auxAudiobooksPageAudiobookPosterCardDensity.
  ///
  /// In en, this message translates to:
  /// **'Audiobook poster card density'**
  String get auxAudiobooksPageAudiobookPosterCardDensity;

  /// No description provided for @auxAudiobooksPageFeaturedHeroSpotlightCarousel.
  ///
  /// In en, this message translates to:
  /// **'Featured Hero Spotlight Carousel'**
  String get auxAudiobooksPageFeaturedHeroSpotlightCarousel;

  /// No description provided for @auxAudiobooksPageMovingAmbientBackgroundGlow.
  ///
  /// In en, this message translates to:
  /// **'Moving Ambient Background Glow'**
  String get auxAudiobooksPageMovingAmbientBackgroundGlow;

  /// No description provided for @auxAudiobooksPageShowContinueListeningCarousel.
  ///
  /// In en, this message translates to:
  /// **'Show \"Continue Listening\" Carousel'**
  String get auxAudiobooksPageShowContinueListeningCarousel;

  /// No description provided for @auxAudiobooksPageOpenPlayerStudioThemes.
  ///
  /// In en, this message translates to:
  /// **'Open Player Studio & Themes'**
  String get auxAudiobooksPageOpenPlayerStudioThemes;

  /// No description provided for @auxAudiobooksPageAudiobookHub.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Hub'**
  String get auxAudiobooksPageAudiobookHub;

  /// No description provided for @auxAudiobooksPageExploreStreamListenToThousandsOfStories.
  ///
  /// In en, this message translates to:
  /// **'Explore, stream & listen to thousands of stories'**
  String get auxAudiobooksPageExploreStreamListenToThousandsOfStories;

  /// No description provided for @auxAudiobooksPageAudiobookGeneratorStudio.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Generator & Studio'**
  String get auxAudiobooksPageAudiobookGeneratorStudio;

  /// No description provided for @auxAudiobooksPageAudiobookCustomizer.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Customizer'**
  String get auxAudiobooksPageAudiobookCustomizer;

  /// No description provided for @auxAudiobooksPageSearchAudiobooksByTitleAuthorOrGenre.
  ///
  /// In en, this message translates to:
  /// **'Search audiobooks by title, author, or genre...'**
  String get auxAudiobooksPageSearchAudiobooksByTitleAuthorOrGenre;

  /// No description provided for @auxAudiobooksPageAudiobookGenres.
  ///
  /// In en, this message translates to:
  /// **'Audiobook genres'**
  String get auxAudiobooksPageAudiobookGenres;

  /// No description provided for @auxAudiobooksPageScrapingHighQualityAudiobookSources.
  ///
  /// In en, this message translates to:
  /// **'Scraping high-quality audiobook sources...'**
  String get auxAudiobooksPageScrapingHighQualityAudiobookSources;

  /// No description provided for @auxAudiobooksPageCouldNotLoadAudiobooks.
  ///
  /// In en, this message translates to:
  /// **'Could not load audiobooks'**
  String get auxAudiobooksPageCouldNotLoadAudiobooks;

  /// No description provided for @auxAudiobooksPageNoAudiobooksFoundTryAnotherSearchQuery.
  ///
  /// In en, this message translates to:
  /// **'No audiobooks found. Try another search query.'**
  String get auxAudiobooksPageNoAudiobooksFoundTryAnotherSearchQuery;

  /// No description provided for @auxAudiobooksPageContinueListening.
  ///
  /// In en, this message translates to:
  /// **'Continue Listening'**
  String get auxAudiobooksPageContinueListening;

  /// No description provided for @auxAudiobooksPageAiAudiobookStudioEpubGenerator.
  ///
  /// In en, this message translates to:
  /// **'AI Audiobook Studio & EPUB Generator'**
  String get auxAudiobooksPageAiAudiobookStudioEpubGenerator;

  /// No description provided for @auxAudiobooksPageGenerateAudiobooksFromEpubsOrImportYour.
  ///
  /// In en, this message translates to:
  /// **'Generate audiobooks from EPUBs or import your own MP3/M4B audiobooks.'**
  String get auxAudiobooksPageGenerateAudiobooksFromEpubsOrImportYour;

  /// No description provided for @auxAudiobooksPageOpenStudio.
  ///
  /// In en, this message translates to:
  /// **'Open Studio'**
  String get auxAudiobooksPageOpenStudio;

  /// No description provided for @auxAudiobooksPageMyGeneratedUploadedAudiobooks.
  ///
  /// In en, this message translates to:
  /// **'My Generated & Uploaded Audiobooks'**
  String get auxAudiobooksPageMyGeneratedUploadedAudiobooks;

  /// No description provided for @auxAudiobooksPageStudio.
  ///
  /// In en, this message translates to:
  /// **'Studio'**
  String get auxAudiobooksPageStudio;

  /// No description provided for @auxAudiobookDetailPageAudiobookDetails.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Details'**
  String get auxAudiobookDetailPageAudiobookDetails;

  /// No description provided for @auxAudiobookDetailPageChaptersAudioFiles.
  ///
  /// In en, this message translates to:
  /// **'Chapters & Audio Files'**
  String get auxAudiobookDetailPageChaptersAudioFiles;

  /// No description provided for @auxAudiobookDetailPageCouldNotLoadChapters.
  ///
  /// In en, this message translates to:
  /// **'Could not load chapters'**
  String get auxAudiobookDetailPageCouldNotLoadChapters;

  /// No description provided for @auxAudiobookDetailPageNoPlayableChaptersFound.
  ///
  /// In en, this message translates to:
  /// **'No playable chapters found.'**
  String get auxAudiobookDetailPageNoPlayableChaptersFound;

  /// No description provided for @auxAudiobookDetailPagePlayFirstChapter.
  ///
  /// In en, this message translates to:
  /// **'Play First Chapter'**
  String get auxAudiobookDetailPagePlayFirstChapter;

  /// No description provided for @auxAudiobookPlayerScreenAudioPlayerStyleStudio.
  ///
  /// In en, this message translates to:
  /// **'Audio Player Style & Studio'**
  String get auxAudiobookPlayerScreenAudioPlayerStyleStudio;

  /// No description provided for @auxAudiobookPlayerScreenSelectPlayerDesignPreset.
  ///
  /// In en, this message translates to:
  /// **'Select Player Design Preset'**
  String get auxAudiobookPlayerScreenSelectPlayerDesignPreset;

  /// No description provided for @auxAudiobookPlayerScreenAudioPlayerDesignPreset.
  ///
  /// In en, this message translates to:
  /// **'Audio player design preset'**
  String get auxAudiobookPlayerScreenAudioPlayerDesignPreset;

  /// No description provided for @auxAudiobookPlayerScreenSeekBarScrubberStyle.
  ///
  /// In en, this message translates to:
  /// **'Seek Bar Scrubber Style'**
  String get auxAudiobookPlayerScreenSeekBarScrubberStyle;

  /// No description provided for @auxAudiobookPlayerScreenSeekBarScrubberStyle2.
  ///
  /// In en, this message translates to:
  /// **'Seek bar scrubber style'**
  String get auxAudiobookPlayerScreenSeekBarScrubberStyle2;

  /// No description provided for @auxAudiobookPlayerScreenPlayPauseButtonStyle.
  ///
  /// In en, this message translates to:
  /// **'Play / Pause Button Style'**
  String get auxAudiobookPlayerScreenPlayPauseButtonStyle;

  /// No description provided for @auxAudiobookPlayerScreenPlayPauseButtonStyle2.
  ///
  /// In en, this message translates to:
  /// **'Play pause button style'**
  String get auxAudiobookPlayerScreenPlayPauseButtonStyle2;

  /// No description provided for @auxAudiobookPlayerScreenOpenDragDropPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Open Drag & Drop Player Studio'**
  String get auxAudiobookPlayerScreenOpenDragDropPlayerStudio;

  /// No description provided for @auxAudiobookPlayerScreenAutoplay.
  ///
  /// In en, this message translates to:
  /// **'Autoplay'**
  String get auxAudiobookPlayerScreenAutoplay;

  /// No description provided for @auxAudiobookPlayerScreenCustomizeAudioPlayer.
  ///
  /// In en, this message translates to:
  /// **'Customize Audio Player'**
  String get auxAudiobookPlayerScreenCustomizeAudioPlayer;

  /// No description provided for @auxAudiobookPlayerScreenChaptersList.
  ///
  /// In en, this message translates to:
  /// **'Chapters List'**
  String get auxAudiobookPlayerScreenChaptersList;

  /// No description provided for @auxAudiobookPlayerScreenRetryChapter.
  ///
  /// In en, this message translates to:
  /// **'Retry Chapter'**
  String get auxAudiobookPlayerScreenRetryChapter;

  /// No description provided for @auxAudiobookPlayerScreenOpenChaptersPanel.
  ///
  /// In en, this message translates to:
  /// **'Open Chapters Panel'**
  String get auxAudiobookPlayerScreenOpenChaptersPanel;

  /// No description provided for @auxAudiobookPlayerScreenPreviousChapter.
  ///
  /// In en, this message translates to:
  /// **'Previous Chapter'**
  String get auxAudiobookPlayerScreenPreviousChapter;

  /// No description provided for @auxAudiobookPlayerScreenRewind10s.
  ///
  /// In en, this message translates to:
  /// **'Rewind 10s'**
  String get auxAudiobookPlayerScreenRewind10s;

  /// No description provided for @auxAudiobookPlayerScreenForward10s.
  ///
  /// In en, this message translates to:
  /// **'Forward 10s'**
  String get auxAudiobookPlayerScreenForward10s;

  /// No description provided for @auxAudiobookPlayerScreenNextChapter.
  ///
  /// In en, this message translates to:
  /// **'Next Chapter'**
  String get auxAudiobookPlayerScreenNextChapter;

  /// No description provided for @auxAudiobookPlayerScreenAudiobookChapters.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Chapters'**
  String get auxAudiobookPlayerScreenAudiobookChapters;

  /// No description provided for @auxAudiobookPlayerScreenFilterChaptersByName.
  ///
  /// In en, this message translates to:
  /// **'Filter chapters by name...'**
  String get auxAudiobookPlayerScreenFilterChaptersByName;

  /// No description provided for @auxGenerateAudiobookScreenEpubExceeds250kWords.
  ///
  /// In en, this message translates to:
  /// **'EPUB Exceeds 250k Words'**
  String get auxGenerateAudiobookScreenEpubExceeds250kWords;

  /// No description provided for @auxGenerateAudiobookScreenSplitGenerate.
  ///
  /// In en, this message translates to:
  /// **'Split & Generate'**
  String get auxGenerateAudiobookScreenSplitGenerate;

  /// No description provided for @auxGenerateAudiobookScreenStreamUrlCopiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Stream URL copied to clipboard!'**
  String get auxGenerateAudiobookScreenStreamUrlCopiedToClipboard;

  /// No description provided for @auxGenerateAudiobookScreenRemoveGenerationJob.
  ///
  /// In en, this message translates to:
  /// **'Remove Generation Job?'**
  String get auxGenerateAudiobookScreenRemoveGenerationJob;

  /// No description provided for @auxGenerateAudiobookScreenAddPersonalAudiobook.
  ///
  /// In en, this message translates to:
  /// **'Add Personal Audiobook'**
  String get auxGenerateAudiobookScreenAddPersonalAudiobook;

  /// No description provided for @auxGenerateAudiobookScreenImportToLibrary.
  ///
  /// In en, this message translates to:
  /// **'Import to Library'**
  String get auxGenerateAudiobookScreenImportToLibrary;

  /// No description provided for @auxGenerateAudiobookScreenAudiobookStudioGenerator.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Studio & Generator'**
  String get auxGenerateAudiobookScreenAudiobookStudioGenerator;

  /// No description provided for @auxGenerateAudiobookScreenAudiobookStudioTabs.
  ///
  /// In en, this message translates to:
  /// **'Audiobook studio tabs'**
  String get auxGenerateAudiobookScreenAudiobookStudioTabs;

  /// No description provided for @auxGenerateAudiobookScreenAiEpubGeneratorTts.
  ///
  /// In en, this message translates to:
  /// **'AI EPUB Generator (TTS)'**
  String get auxGenerateAudiobookScreenAiEpubGeneratorTts;

  /// No description provided for @auxGenerateAudiobookScreenMyUploadedAudiobooks.
  ///
  /// In en, this message translates to:
  /// **'My Uploaded Audiobooks'**
  String get auxGenerateAudiobookScreenMyUploadedAudiobooks;

  /// No description provided for @auxGenerateAudiobookScreenRefreshStatus.
  ///
  /// In en, this message translates to:
  /// **'Refresh Status'**
  String get auxGenerateAudiobookScreenRefreshStatus;

  /// No description provided for @auxGenerateAudiobookScreenNoGeneratedAudiobooksYet.
  ///
  /// In en, this message translates to:
  /// **'No generated audiobooks yet'**
  String get auxGenerateAudiobookScreenNoGeneratedAudiobooksYet;

  /// No description provided for @auxGenerateAudiobookScreenPickAnEpubAboveToSynthesizeHigh.
  ///
  /// In en, this message translates to:
  /// **'Pick an EPUB above to synthesize high-quality voice narrations.'**
  String get auxGenerateAudiobookScreenPickAnEpubAboveToSynthesizeHigh;

  /// No description provided for @auxGenerateAudiobookScreenAiNarratorVoiceKokoroEngine.
  ///
  /// In en, this message translates to:
  /// **'AI Narrator Voice (Kokoro Engine)'**
  String get auxGenerateAudiobookScreenAiNarratorVoiceKokoroEngine;

  /// No description provided for @auxGenerateAudiobookScreenRescanBooks.
  ///
  /// In en, this message translates to:
  /// **'Rescan Books'**
  String get auxGenerateAudiobookScreenRescanBooks;

  /// No description provided for @auxGenerateAudiobookScreenGenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get auxGenerateAudiobookScreenGenerate;

  /// No description provided for @auxGenerateAudiobookScreenPickAnyEpubFileFromYourDevice.
  ///
  /// In en, this message translates to:
  /// **'Pick any .epub file from your device. Large books (>250k words) are auto-split.'**
  String get auxGenerateAudiobookScreenPickAnyEpubFileFromYourDevice;

  /// No description provided for @auxGenerateAudiobookScreenPlayInApp.
  ///
  /// In en, this message translates to:
  /// **'Play in App'**
  String get auxGenerateAudiobookScreenPlayInApp;

  /// No description provided for @auxGenerateAudiobookScreenUploadPersonalAudiobookFiles.
  ///
  /// In en, this message translates to:
  /// **'Upload Personal Audiobook Files'**
  String get auxGenerateAudiobookScreenUploadPersonalAudiobookFiles;

  /// No description provided for @auxGenerateAudiobookScreenImportYourOwnMp3M4bM4aOr.
  ///
  /// In en, this message translates to:
  /// **'Import your own .mp3, .m4b, .m4a, or .flac audiobooks to listen offline.'**
  String get auxGenerateAudiobookScreenImportYourOwnMp3M4bM4aOr;

  /// No description provided for @auxGenerateAudiobookScreenNoPersonalAudiobooksAddedYet.
  ///
  /// In en, this message translates to:
  /// **'No personal audiobooks added yet'**
  String get auxGenerateAudiobookScreenNoPersonalAudiobooksAddedYet;

  /// No description provided for @auxGenerateAudiobookScreenTapTheBannerAboveToImportAudio.
  ///
  /// In en, this message translates to:
  /// **'Tap the banner above to import audio files from your device.'**
  String get auxGenerateAudiobookScreenTapTheBannerAboveToImportAudio;

  /// No description provided for @auxGenerateAudiobookScreenDeleteAudiobook.
  ///
  /// In en, this message translates to:
  /// **'Delete Audiobook?'**
  String get auxGenerateAudiobookScreenDeleteAudiobook;

  /// No description provided for @auxBooksPageCouldNotLoadBooks.
  ///
  /// In en, this message translates to:
  /// **'Could not load books'**
  String get auxBooksPageCouldNotLoadBooks;

  /// No description provided for @auxBooksPageNoBooksFound.
  ///
  /// In en, this message translates to:
  /// **'No books found'**
  String get auxBooksPageNoBooksFound;

  /// No description provided for @auxBooksPageTrySearchingForAnotherTitleAuthorOr.
  ///
  /// In en, this message translates to:
  /// **'Try searching for another title, author, or language'**
  String get auxBooksPageTrySearchingForAnotherTitleAuthorOr;

  /// No description provided for @auxBooksPageSearchMillionsOfBooksAuthors.
  ///
  /// In en, this message translates to:
  /// **'Search millions of books & authors...'**
  String get auxBooksPageSearchMillionsOfBooksAuthors;

  /// No description provided for @auxBooksPageFontEngine.
  ///
  /// In en, this message translates to:
  /// **'Font Engine:'**
  String get auxBooksPageFontEngine;

  /// No description provided for @auxBooksPageReaderFontEngine.
  ///
  /// In en, this message translates to:
  /// **'Reader font engine'**
  String get auxBooksPageReaderFontEngine;

  /// No description provided for @auxBooksPageAllFormats.
  ///
  /// In en, this message translates to:
  /// **'All Formats'**
  String get auxBooksPageAllFormats;

  /// No description provided for @auxBooksPageBookFormats.
  ///
  /// In en, this message translates to:
  /// **'Book formats'**
  String get auxBooksPageBookFormats;

  /// No description provided for @auxBookDetailSheetGenerateAiAudiobookTts.
  ///
  /// In en, this message translates to:
  /// **'Generate AI Audiobook (TTS)'**
  String get auxBookDetailSheetGenerateAiAudiobookTts;

  /// No description provided for @auxBookDetailSheetDeleteDownloadedFile.
  ///
  /// In en, this message translates to:
  /// **'Delete downloaded file'**
  String get auxBookDetailSheetDeleteDownloadedFile;

  /// No description provided for @auxBookDetailSheetInformation.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get auxBookDetailSheetInformation;

  /// No description provided for @auxBookDetailSheetOverview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get auxBookDetailSheetOverview;

  /// No description provided for @auxEpubReaderPageBackToLibrary.
  ///
  /// In en, this message translates to:
  /// **'Back to Library'**
  String get auxEpubReaderPageBackToLibrary;

  /// No description provided for @auxEpubReaderPageTableOfContentsT.
  ///
  /// In en, this message translates to:
  /// **'Table of Contents (T)'**
  String get auxEpubReaderPageTableOfContentsT;

  /// No description provided for @auxEpubReaderPageFocusModeLineByLine.
  ///
  /// In en, this message translates to:
  /// **'Focus Mode (Line-by-Line)'**
  String get auxEpubReaderPageFocusModeLineByLine;

  /// No description provided for @auxEpubReaderPageAppearanceCustomization.
  ///
  /// In en, this message translates to:
  /// **'Appearance & Customization'**
  String get auxEpubReaderPageAppearanceCustomization;

  /// No description provided for @auxEpubReaderPageToggleFullscreenF.
  ///
  /// In en, this message translates to:
  /// **'Toggle Fullscreen (F)'**
  String get auxEpubReaderPageToggleFullscreenF;

  /// No description provided for @auxEpubReaderPagePreviousChapterLeftArrow.
  ///
  /// In en, this message translates to:
  /// **'Previous Chapter (Left Arrow)'**
  String get auxEpubReaderPagePreviousChapterLeftArrow;

  /// No description provided for @auxEpubReaderPageNextChapterRightArrow.
  ///
  /// In en, this message translates to:
  /// **'Next Chapter (Right Arrow)'**
  String get auxEpubReaderPageNextChapterRightArrow;

  /// No description provided for @auxEpubReaderPageNoReadableChaptersFound.
  ///
  /// In en, this message translates to:
  /// **'No readable chapters found.'**
  String get auxEpubReaderPageNoReadableChaptersFound;

  /// No description provided for @auxEpubReaderPageTableOfContents.
  ///
  /// In en, this message translates to:
  /// **'Table of Contents'**
  String get auxEpubReaderPageTableOfContents;

  /// No description provided for @auxEpubReaderPageNoTableOfContentsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No table of contents available'**
  String get auxEpubReaderPageNoTableOfContentsAvailable;

  /// No description provided for @auxPdfReaderPageZoomIn.
  ///
  /// In en, this message translates to:
  /// **'Zoom In'**
  String get auxPdfReaderPageZoomIn;

  /// No description provided for @auxPdfReaderPageZoomOut.
  ///
  /// In en, this message translates to:
  /// **'Zoom Out'**
  String get auxPdfReaderPageZoomOut;

  /// No description provided for @auxPdfReaderPagePreviousPage.
  ///
  /// In en, this message translates to:
  /// **'Previous Page'**
  String get auxPdfReaderPagePreviousPage;

  /// No description provided for @auxPdfReaderPageNextPage.
  ///
  /// In en, this message translates to:
  /// **'Next Page'**
  String get auxPdfReaderPageNextPage;

  /// No description provided for @auxBrowsePageBrowseVerticals.
  ///
  /// In en, this message translates to:
  /// **'Browse verticals'**
  String get auxBrowsePageBrowseVerticals;

  /// No description provided for @auxTvCalendarPageTvShowsAiringCalendar.
  ///
  /// In en, this message translates to:
  /// **'TV Shows Airing Calendar'**
  String get auxTvCalendarPageTvShowsAiringCalendar;

  /// No description provided for @auxTvCalendarPageUpcomingBroadcastStreamingEpisodesWithLiveNetwork.
  ///
  /// In en, this message translates to:
  /// **'Upcoming broadcast & streaming episodes with live network filters'**
  String get auxTvCalendarPageUpcomingBroadcastStreamingEpisodesWithLiveNetwork;

  /// No description provided for @auxTvCalendarPageFilterShows.
  ///
  /// In en, this message translates to:
  /// **'Filter shows...'**
  String get auxTvCalendarPageFilterShows;

  /// No description provided for @auxTvCalendarPageNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network:'**
  String get auxTvCalendarPageNetwork;

  /// No description provided for @auxTvCalendarPageShowAllNetworks.
  ///
  /// In en, this message translates to:
  /// **'Show All Networks'**
  String get auxTvCalendarPageShowAllNetworks;

  /// No description provided for @auxCatalogPageNoItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get auxCatalogPageNoItemsFound;

  /// No description provided for @auxCatalogPageSearch.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get auxCatalogPageSearch;

  /// No description provided for @auxCollectionsPageFranchises.
  ///
  /// In en, this message translates to:
  /// **'Franchises'**
  String get auxCollectionsPageFranchises;

  /// No description provided for @auxCollectionsPageMemoryLane.
  ///
  /// In en, this message translates to:
  /// **'Memory Lane'**
  String get auxCollectionsPageMemoryLane;

  /// No description provided for @auxCollectionsPageCuratedFranchisesEras.
  ///
  /// In en, this message translates to:
  /// **'Curated Franchises & Eras'**
  String get auxCollectionsPageCuratedFranchisesEras;

  /// No description provided for @auxCollectionsPageHandPickedFilmPacksInWatchOrder.
  ///
  /// In en, this message translates to:
  /// **'Hand-picked film packs, in watch order.'**
  String get auxCollectionsPageHandPickedFilmPacksInWatchOrder;

  /// No description provided for @auxIptvChannelSheetStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get auxIptvChannelSheetStop;

  /// No description provided for @auxIptvChannelSheetScanningAllVerifiedPortalsInParallel.
  ///
  /// In en, this message translates to:
  /// **'Scanning all verified portals in parallel…'**
  String get auxIptvChannelSheetScanningAllVerifiedPortalsInParallel;

  /// No description provided for @auxIptvChannelSheetNoAliveStreamsDiscoveredYet.
  ///
  /// In en, this message translates to:
  /// **'No alive streams discovered yet.'**
  String get auxIptvChannelSheetNoAliveStreamsDiscoveredYet;

  /// No description provided for @auxIptvChannelSheetTapScanMorePortalsToDiscoverFresh.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Scan More Portals\" to discover fresh feeds.'**
  String get auxIptvChannelSheetTapScanMorePortalsToDiscoverFresh;

  /// No description provided for @auxIptvChannelSheetClearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get auxIptvChannelSheetClearSearch;

  /// No description provided for @auxIptvChannelSheetScanMore.
  ///
  /// In en, this message translates to:
  /// **'Scan More'**
  String get auxIptvChannelSheetScanMore;

  /// No description provided for @auxIptvPageChannelListAndProgrammeSchedule.
  ///
  /// In en, this message translates to:
  /// **'Channel list and programme schedule'**
  String get auxIptvPageChannelListAndProgrammeSchedule;

  /// No description provided for @auxIptvPageMultiStreamsMultiViewWindow.
  ///
  /// In en, this message translates to:
  /// **'Multi Streams (Multi-View Window)'**
  String get auxIptvPageMultiStreamsMultiViewWindow;

  /// No description provided for @auxIptvPageMultiStreams.
  ///
  /// In en, this message translates to:
  /// **'Multi Streams'**
  String get auxIptvPageMultiStreams;

  /// No description provided for @auxIptvPageManagePortalsPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Manage Portals & Playlists'**
  String get auxIptvPageManagePortalsPlaylists;

  /// No description provided for @auxIptvPageSearchChannels.
  ///
  /// In en, this message translates to:
  /// **'Search Channels'**
  String get auxIptvPageSearchChannels;

  /// No description provided for @auxIptvPageQuickChannels.
  ///
  /// In en, this message translates to:
  /// **'Quick Channels'**
  String get auxIptvPageQuickChannels;

  /// No description provided for @auxIptvPageAddQuickChannel.
  ///
  /// In en, this message translates to:
  /// **'Add Quick Channel'**
  String get auxIptvPageAddQuickChannel;

  /// No description provided for @auxIptvPageAddChannel.
  ///
  /// In en, this message translates to:
  /// **'Add Channel'**
  String get auxIptvPageAddChannel;

  /// No description provided for @auxIptvPageEGCnnNewsInternational.
  ///
  /// In en, this message translates to:
  /// **'e.g. cnn, news, international'**
  String get auxIptvPageEGCnnNewsInternational;

  /// No description provided for @auxIptvPageGradient.
  ///
  /// In en, this message translates to:
  /// **'Gradient'**
  String get auxIptvPageGradient;

  /// No description provided for @auxIptvPortalsModalPortalDisplaySettings.
  ///
  /// In en, this message translates to:
  /// **'Portal Display Settings'**
  String get auxIptvPortalsModalPortalDisplaySettings;

  /// No description provided for @auxIptvPortalsModalChoosePortalSource.
  ///
  /// In en, this message translates to:
  /// **'Choose Portal Source'**
  String get auxIptvPortalsModalChoosePortalSource;

  /// No description provided for @auxIptvPortalsModalCloudVault.
  ///
  /// In en, this message translates to:
  /// **'Cloud Vault'**
  String get auxIptvPortalsModalCloudVault;

  /// No description provided for @auxIptvPortalsModalHighSpeedCloudDatabaseWithLiveIptv.
  ///
  /// In en, this message translates to:
  /// **'High-speed cloud database with live IPTV servers'**
  String get auxIptvPortalsModalHighSpeedCloudDatabaseWithLiveIptv;

  /// No description provided for @auxIptvPortalsModalRedditCommunities.
  ///
  /// In en, this message translates to:
  /// **'Reddit Communities'**
  String get auxIptvPortalsModalRedditCommunities;

  /// No description provided for @auxIptvPortalsModalScrapesLiveSharedPastesFromSubreddits.
  ///
  /// In en, this message translates to:
  /// **'Scrapes live shared pastes from subreddits'**
  String get auxIptvPortalsModalScrapesLiveSharedPastesFromSubreddits;

  /// No description provided for @auxIptvPortalsModalDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'Delete All'**
  String get auxIptvPortalsModalDeleteAll;

  /// No description provided for @auxIptvPortalsModalAddXtreamCodesPortal.
  ///
  /// In en, this message translates to:
  /// **'Add Xtream Codes Portal'**
  String get auxIptvPortalsModalAddXtreamCodesPortal;

  /// No description provided for @auxIptvPortalsModalVerifySave.
  ///
  /// In en, this message translates to:
  /// **'Verify & Save'**
  String get auxIptvPortalsModalVerifySave;

  /// No description provided for @auxIptvPortalsModalAddM3uPlaylistSubscription.
  ///
  /// In en, this message translates to:
  /// **'Add M3U Playlist Subscription'**
  String get auxIptvPortalsModalAddM3uPlaylistSubscription;

  /// No description provided for @auxIptvPortalsModalFetchSave.
  ///
  /// In en, this message translates to:
  /// **'Fetch & Save'**
  String get auxIptvPortalsModalFetchSave;

  /// No description provided for @auxIptvPortalsModalNoM3uPlaylistsSaved.
  ///
  /// In en, this message translates to:
  /// **'No M3U playlists saved.'**
  String get auxIptvPortalsModalNoM3uPlaylistsSaved;

  /// No description provided for @auxIptvPortalBrowserPageCustomizePortalBrowser.
  ///
  /// In en, this message translates to:
  /// **'Customize Portal Browser'**
  String get auxIptvPortalBrowserPageCustomizePortalBrowser;

  /// No description provided for @auxIptvPortalBrowserPageChannelStreamLayoutMode.
  ///
  /// In en, this message translates to:
  /// **'Channel Stream Layout Mode'**
  String get auxIptvPortalBrowserPageChannelStreamLayoutMode;

  /// No description provided for @auxIptvPortalBrowserPageGridStreamColumns.
  ///
  /// In en, this message translates to:
  /// **'Grid Stream Columns'**
  String get auxIptvPortalBrowserPageGridStreamColumns;

  /// No description provided for @auxIptvPortalBrowserPageShowChannelStreamLogos.
  ///
  /// In en, this message translates to:
  /// **'Show Channel Stream Logos'**
  String get auxIptvPortalBrowserPageShowChannelStreamLogos;

  /// No description provided for @auxIptvPortalBrowserPageShowEpgNowPlayingSnippet.
  ///
  /// In en, this message translates to:
  /// **'Show EPG \"Now Playing\" Snippet'**
  String get auxIptvPortalBrowserPageShowEpgNowPlayingSnippet;

  /// No description provided for @auxIptvPortalBrowserPageShowCategoryStreamCounts.
  ///
  /// In en, this message translates to:
  /// **'Show Category Stream Counts'**
  String get auxIptvPortalBrowserPageShowCategoryStreamCounts;

  /// No description provided for @auxIptvPortalBrowserPageSelectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get auxIptvPortalBrowserPageSelectCategory;

  /// No description provided for @auxIptvPortalBrowserPageCustomizePortalBrowserLayout.
  ///
  /// In en, this message translates to:
  /// **'Customize Portal Browser Layout'**
  String get auxIptvPortalBrowserPageCustomizePortalBrowserLayout;

  /// No description provided for @auxIptvPortalBrowserPageCheckHealth.
  ///
  /// In en, this message translates to:
  /// **'Check Health'**
  String get auxIptvPortalBrowserPageCheckHealth;

  /// No description provided for @auxIptvPortalBrowserPageCustomize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get auxIptvPortalBrowserPageCustomize;

  /// No description provided for @auxIptvPortalBrowserPageCouldNotLoadThisPortal.
  ///
  /// In en, this message translates to:
  /// **'Could not load this portal'**
  String get auxIptvPortalBrowserPageCouldNotLoadThisPortal;

  /// No description provided for @auxIptvPortalBrowserPageNoFavoritedChannels.
  ///
  /// In en, this message translates to:
  /// **'No Favorited Channels'**
  String get auxIptvPortalBrowserPageNoFavoritedChannels;

  /// No description provided for @auxIptvPortalBrowserPageTapTheStarIconOnAnyChannel.
  ///
  /// In en, this message translates to:
  /// **'Tap the star icon on any channel to save it to your Favorites.'**
  String get auxIptvPortalBrowserPageTapTheStarIconOnAnyChannel;

  /// No description provided for @auxIptvPortalBrowserPageLiveStreamFeed.
  ///
  /// In en, this message translates to:
  /// **'Live Stream Feed'**
  String get auxIptvPortalBrowserPageLiveStreamFeed;

  /// No description provided for @auxIptvPortalBrowserPageCouldNotLoadEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Could not load episodes'**
  String get auxIptvPortalBrowserPageCouldNotLoadEpisodes;

  /// No description provided for @auxIptvSearchPageSearch60LiveChannelsLeaguesNetworks.
  ///
  /// In en, this message translates to:
  /// **'Search 60+ live channels, leagues, networks…'**
  String get auxIptvSearchPageSearch60LiveChannelsLeaguesNetworks;

  /// No description provided for @auxIptvSearchPageChannelCategories.
  ///
  /// In en, this message translates to:
  /// **'Channel categories'**
  String get auxIptvSearchPageChannelCategories;

  /// No description provided for @auxIptvSearchPageNoChannelsMatchYourSearch.
  ///
  /// In en, this message translates to:
  /// **'No channels match your search.'**
  String get auxIptvSearchPageNoChannelsMatchYourSearch;

  /// No description provided for @auxMangaDetailsPageSynopsis.
  ///
  /// In en, this message translates to:
  /// **'Synopsis'**
  String get auxMangaDetailsPageSynopsis;

  /// No description provided for @auxMangaDetailsPageChapters.
  ///
  /// In en, this message translates to:
  /// **'Chapters'**
  String get auxMangaDetailsPageChapters;

  /// No description provided for @auxMangaDetailsPageSearchChapters.
  ///
  /// In en, this message translates to:
  /// **'Search chapters...'**
  String get auxMangaDetailsPageSearchChapters;

  /// No description provided for @auxMangaDetailsPageStartReading.
  ///
  /// In en, this message translates to:
  /// **'Start Reading'**
  String get auxMangaDetailsPageStartReading;

  /// No description provided for @auxMangaPageCustomizeMangaSection.
  ///
  /// In en, this message translates to:
  /// **'Customize Manga Section'**
  String get auxMangaPageCustomizeMangaSection;

  /// No description provided for @auxMangaPageMangaPosterCardDensity.
  ///
  /// In en, this message translates to:
  /// **'Manga poster card density'**
  String get auxMangaPageMangaPosterCardDensity;

  /// No description provided for @auxMangaPageShowContinueReadingSlider.
  ///
  /// In en, this message translates to:
  /// **'Show \"Continue Reading\" Slider'**
  String get auxMangaPageShowContinueReadingSlider;

  /// No description provided for @auxMangaPageShowContentTypeBadgeOnPosters.
  ///
  /// In en, this message translates to:
  /// **'Show Content Type Badge on Posters'**
  String get auxMangaPageShowContentTypeBadgeOnPosters;

  /// No description provided for @auxMangaPageMoreAppearanceReaderSettings.
  ///
  /// In en, this message translates to:
  /// **'More Appearance & Reader Settings'**
  String get auxMangaPageMoreAppearanceReaderSettings;

  /// No description provided for @auxMangaPageContinueReading.
  ///
  /// In en, this message translates to:
  /// **'Continue Reading'**
  String get auxMangaPageContinueReading;

  /// No description provided for @auxMangaPageNoMangaFound.
  ///
  /// In en, this message translates to:
  /// **'No manga found'**
  String get auxMangaPageNoMangaFound;

  /// No description provided for @auxMangaPageSearchMangaManhwaManhua.
  ///
  /// In en, this message translates to:
  /// **'Search Manga, Manhwa, Manhua...'**
  String get auxMangaPageSearchMangaManhwaManhua;

  /// No description provided for @auxMangaPageRemoveFromContinueReading.
  ///
  /// In en, this message translates to:
  /// **'Remove from Continue Reading'**
  String get auxMangaPageRemoveFromContinueReading;

  /// No description provided for @auxMangaReaderPageReaderSettingsLayout.
  ///
  /// In en, this message translates to:
  /// **'Reader Settings & Layout'**
  String get auxMangaReaderPageReaderSettingsLayout;

  /// No description provided for @auxMangaReaderPageReadingOrientationMode.
  ///
  /// In en, this message translates to:
  /// **'Reading Orientation Mode'**
  String get auxMangaReaderPageReadingOrientationMode;

  /// No description provided for @auxMangaReaderPageReadingOrientationMode2.
  ///
  /// In en, this message translates to:
  /// **'Reading orientation mode'**
  String get auxMangaReaderPageReadingOrientationMode2;

  /// No description provided for @auxMangaReaderPagePageReadingWidthConstraint.
  ///
  /// In en, this message translates to:
  /// **'Page Reading Width Constraint'**
  String get auxMangaReaderPagePageReadingWidthConstraint;

  /// No description provided for @auxMangaReaderPagePageReadingWidthConstraint2.
  ///
  /// In en, this message translates to:
  /// **'Page reading width constraint'**
  String get auxMangaReaderPagePageReadingWidthConstraint2;

  /// No description provided for @auxMangaReaderPageReaderBackgroundAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Reader Background Atmosphere'**
  String get auxMangaReaderPageReaderBackgroundAtmosphere;

  /// No description provided for @auxMangaReaderPageShowPageDeckPreviewsDrawer.
  ///
  /// In en, this message translates to:
  /// **'Show Page Deck Previews Drawer'**
  String get auxMangaReaderPageShowPageDeckPreviewsDrawer;

  /// No description provided for @auxMangaReaderPageShowNextChapterDeckCard.
  ///
  /// In en, this message translates to:
  /// **'Show Next Chapter Deck Card'**
  String get auxMangaReaderPageShowNextChapterDeckCard;

  /// No description provided for @auxMangaReaderPageNoPagesFoundForThisChapter.
  ///
  /// In en, this message translates to:
  /// **'No pages found for this chapter.'**
  String get auxMangaReaderPageNoPagesFoundForThisChapter;

  /// No description provided for @auxMangaReaderPageReadNextChapter.
  ///
  /// In en, this message translates to:
  /// **'Read Next Chapter'**
  String get auxMangaReaderPageReadNextChapter;

  /// No description provided for @auxMangaReaderPageBackToMangaDetails.
  ///
  /// In en, this message translates to:
  /// **'Back to Manga Details'**
  String get auxMangaReaderPageBackToMangaDetails;

  /// No description provided for @auxMangaReaderPagePageDeckPreview.
  ///
  /// In en, this message translates to:
  /// **'Page Deck Preview'**
  String get auxMangaReaderPagePageDeckPreview;

  /// No description provided for @auxMultinutzPageSelectChannel.
  ///
  /// In en, this message translates to:
  /// **'Select Channel'**
  String get auxMultinutzPageSelectChannel;

  /// No description provided for @auxMultinutzPageStreamDetails.
  ///
  /// In en, this message translates to:
  /// **'Stream Details'**
  String get auxMultinutzPageStreamDetails;

  /// No description provided for @auxMultinutzPageAddLiveStreamFeed.
  ///
  /// In en, this message translates to:
  /// **'Add Live Stream Feed'**
  String get auxMultinutzPageAddLiveStreamFeed;

  /// No description provided for @auxMultinutzPageBackToLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Back to Live TV'**
  String get auxMultinutzPageBackToLiveTv;

  /// No description provided for @auxMultinutzPagePreviousLayout.
  ///
  /// In en, this message translates to:
  /// **'Previous Layout'**
  String get auxMultinutzPagePreviousLayout;

  /// No description provided for @auxMultinutzPageNextLayout.
  ///
  /// In en, this message translates to:
  /// **'Next Layout'**
  String get auxMultinutzPageNextLayout;

  /// No description provided for @auxMultinutzPageMuteAll.
  ///
  /// In en, this message translates to:
  /// **'Mute All'**
  String get auxMultinutzPageMuteAll;

  /// No description provided for @auxMultinutzPageClearAllWindows.
  ///
  /// In en, this message translates to:
  /// **'Clear All Windows'**
  String get auxMultinutzPageClearAllWindows;

  /// No description provided for @auxMusicPageNewPlaylist.
  ///
  /// In en, this message translates to:
  /// **'New Playlist'**
  String get auxMusicPageNewPlaylist;

  /// No description provided for @auxMusicPageEnterPlaylistTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter playlist title...'**
  String get auxMusicPageEnterPlaylistTitle;

  /// No description provided for @auxMusicPageCreate.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get auxMusicPageCreate;

  /// No description provided for @auxMusicPageSaveToPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Save to Playlist'**
  String get auxMusicPageSaveToPlaylist;

  /// No description provided for @auxMusicPageNoCustomPlaylistsYet.
  ///
  /// In en, this message translates to:
  /// **'No custom playlists yet'**
  String get auxMusicPageNoCustomPlaylistsYet;

  /// No description provided for @auxMusicPageCreateFirstPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Create First Playlist'**
  String get auxMusicPageCreateFirstPlaylist;

  /// No description provided for @auxMusicPageNewAlbumReleases.
  ///
  /// In en, this message translates to:
  /// **'New Album Releases'**
  String get auxMusicPageNewAlbumReleases;

  /// No description provided for @auxMusicPageCuratedChartsMixes.
  ///
  /// In en, this message translates to:
  /// **'Curated Charts & Mixes'**
  String get auxMusicPageCuratedChartsMixes;

  /// No description provided for @auxMusicPageSearchResults.
  ///
  /// In en, this message translates to:
  /// **'Search results'**
  String get auxMusicPageSearchResults;

  /// No description provided for @auxMusicPageSongs.
  ///
  /// In en, this message translates to:
  /// **'Songs'**
  String get auxMusicPageSongs;

  /// No description provided for @auxMusicPageArtists.
  ///
  /// In en, this message translates to:
  /// **'Artists'**
  String get auxMusicPageArtists;

  /// No description provided for @auxMusicPageAlbums.
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get auxMusicPageAlbums;

  /// No description provided for @auxMusicPageBrowseMoodsGenres.
  ///
  /// In en, this message translates to:
  /// **'Browse Moods & Genres'**
  String get auxMusicPageBrowseMoodsGenres;

  /// No description provided for @auxMusicPageRadioStationsLiveStreams.
  ///
  /// In en, this message translates to:
  /// **'Radio Stations & Live Streams'**
  String get auxMusicPageRadioStationsLiveStreams;

  /// No description provided for @auxMusicPageContinuousMusicChannelsTunedToYourMood.
  ///
  /// In en, this message translates to:
  /// **'Continuous music channels tuned to your mood.'**
  String get auxMusicPageContinuousMusicChannelsTunedToYourMood;

  /// No description provided for @auxMusicPageYourLibrary.
  ///
  /// In en, this message translates to:
  /// **'Your Library'**
  String get auxMusicPageYourLibrary;

  /// No description provided for @auxMusicPageLikedSongs.
  ///
  /// In en, this message translates to:
  /// **'Liked Songs'**
  String get auxMusicPageLikedSongs;

  /// No description provided for @auxMusicPageDownloadedSongs.
  ///
  /// In en, this message translates to:
  /// **'Downloaded Songs'**
  String get auxMusicPageDownloadedSongs;

  /// No description provided for @auxMusicPageCustomPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Custom Playlists'**
  String get auxMusicPageCustomPlaylists;

  /// No description provided for @auxMusicPageRecentlyPlayed.
  ///
  /// In en, this message translates to:
  /// **'Recently Played'**
  String get auxMusicPageRecentlyPlayed;

  /// No description provided for @auxMusicPageMusicPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Music Player Studio'**
  String get auxMusicPageMusicPlayerStudio;

  /// No description provided for @auxMusicPageMusicAtmosphereSettings.
  ///
  /// In en, this message translates to:
  /// **'Music Atmosphere Settings'**
  String get auxMusicPageMusicAtmosphereSettings;

  /// No description provided for @auxMusicPageAppSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get auxMusicPageAppSettings;

  /// No description provided for @auxMusicPageMusicView.
  ///
  /// In en, this message translates to:
  /// **'Music view'**
  String get auxMusicPageMusicView;

  /// No description provided for @auxMusicPageAudioSourceQuality.
  ///
  /// In en, this message translates to:
  /// **'Audio Source & Quality'**
  String get auxMusicPageAudioSourceQuality;

  /// No description provided for @auxMusicPageChooseYourPreferredMusicExtractionEngine.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred music extraction engine'**
  String get auxMusicPageChooseYourPreferredMusicExtractionEngine;

  /// No description provided for @auxMusicPageFlacLosslessQobuzHiRes.
  ///
  /// In en, this message translates to:
  /// **'FLAC Lossless (Qobuz Hi-Res)'**
  String get auxMusicPageFlacLosslessQobuzHiRes;

  /// No description provided for @auxMusicPageStudioMasterQualityUpTo24Bit.
  ///
  /// In en, this message translates to:
  /// **'Studio master quality up to 24-bit/192kHz with zero compression'**
  String get auxMusicPageStudioMasterQualityUpTo24Bit;

  /// No description provided for @auxMusicPageYoutubeAudio.
  ///
  /// In en, this message translates to:
  /// **'YouTube Audio'**
  String get auxMusicPageYoutubeAudio;

  /// No description provided for @auxMusicPageHighSpeedAudioExtractionWithIntelligentTrack.
  ///
  /// In en, this message translates to:
  /// **'High-speed audio extraction with intelligent track & duration matching'**
  String get auxMusicPageHighSpeedAudioExtractionWithIntelligentTrack;

  /// No description provided for @auxMusicPagePlayNow.
  ///
  /// In en, this message translates to:
  /// **'Play Now'**
  String get auxMusicPagePlayNow;

  /// No description provided for @auxMusicPageTrendingArtists.
  ///
  /// In en, this message translates to:
  /// **'Trending Artists'**
  String get auxMusicPageTrendingArtists;

  /// No description provided for @auxMusicPageDownloadedOffline.
  ///
  /// In en, this message translates to:
  /// **'Downloaded (Offline)'**
  String get auxMusicPageDownloadedOffline;

  /// No description provided for @auxMusicPageQueuedForDownload.
  ///
  /// In en, this message translates to:
  /// **'Queued for download'**
  String get auxMusicPageQueuedForDownload;

  /// No description provided for @auxMusicPageDownloadTrack.
  ///
  /// In en, this message translates to:
  /// **'Download Track'**
  String get auxMusicPageDownloadTrack;

  /// No description provided for @auxMusicPageSyncedLyrics.
  ///
  /// In en, this message translates to:
  /// **'Synced Lyrics'**
  String get auxMusicPageSyncedLyrics;

  /// No description provided for @auxMusicPageNoLyricsFoundForThisTrack.
  ///
  /// In en, this message translates to:
  /// **'No lyrics found for this track.'**
  String get auxMusicPageNoLyricsFoundForThisTrack;

  /// No description provided for @auxMusicPageQueueIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Queue is empty'**
  String get auxMusicPageQueueIsEmpty;

  /// No description provided for @auxMusicPagePlayAll.
  ///
  /// In en, this message translates to:
  /// **'Play All'**
  String get auxMusicPagePlayAll;

  /// No description provided for @auxMusicPageTopSongs.
  ///
  /// In en, this message translates to:
  /// **'Top Songs'**
  String get auxMusicPageTopSongs;

  /// No description provided for @auxMusicPageAlbumsDiscography.
  ///
  /// In en, this message translates to:
  /// **'Albums & Discography'**
  String get auxMusicPageAlbumsDiscography;

  /// No description provided for @auxMusicPagePlayAlbum.
  ///
  /// In en, this message translates to:
  /// **'Play Album'**
  String get auxMusicPagePlayAlbum;

  /// No description provided for @auxMusicPageDownloadAlbum.
  ///
  /// In en, this message translates to:
  /// **'Download Album'**
  String get auxMusicPageDownloadAlbum;

  /// No description provided for @auxMusicPagePlayPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Play Playlist'**
  String get auxMusicPagePlayPlaylist;

  /// No description provided for @auxMusicPageDownloadPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Download Playlist'**
  String get auxMusicPageDownloadPlaylist;

  /// No description provided for @auxMusicPageDownloadAll.
  ///
  /// In en, this message translates to:
  /// **'Download All'**
  String get auxMusicPageDownloadAll;

  /// No description provided for @auxMusicPageNoTracksInThisPlaylistYet.
  ///
  /// In en, this message translates to:
  /// **'No tracks in this playlist yet'**
  String get auxMusicPageNoTracksInThisPlaylistYet;

  /// No description provided for @auxMusicPagePlayingQueue.
  ///
  /// In en, this message translates to:
  /// **'Playing Queue'**
  String get auxMusicPagePlayingQueue;

  /// No description provided for @auxMusicPageKeyboardShortcuts.
  ///
  /// In en, this message translates to:
  /// **'Keyboard Shortcuts'**
  String get auxMusicPageKeyboardShortcuts;

  /// No description provided for @auxMusicPageShuffle.
  ///
  /// In en, this message translates to:
  /// **'Shuffle'**
  String get auxMusicPageShuffle;

  /// No description provided for @auxMusicPageSearchOffline.
  ///
  /// In en, this message translates to:
  /// **'Search offline...'**
  String get auxMusicPageSearchOffline;

  /// No description provided for @auxMusicPageDeleteFromDownloads.
  ///
  /// In en, this message translates to:
  /// **'Delete from downloads'**
  String get auxMusicPageDeleteFromDownloads;

  /// No description provided for @auxMusicPageDeleteDownloadedSong.
  ///
  /// In en, this message translates to:
  /// **'Delete Downloaded Song'**
  String get auxMusicPageDeleteDownloadedSong;

  /// No description provided for @auxAboutSettingsPageZplayIsAnAllInOneEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Kiru is an all-in-one entertainment client bringing together movies, TV series, anime, live IPTV, music, manga, and audiobooks into a unified, high-performance interface with custom Liquid Glass visuals.'**
  String get auxAboutSettingsPageZplayIsAnAllInOneEntertainment;

  /// No description provided for @auxAboutSettingsPageDebridMultiSourceScrapers.
  ///
  /// In en, this message translates to:
  /// **'Debrid & Multi-Source Scrapers'**
  String get auxAboutSettingsPageDebridMultiSourceScrapers;

  /// No description provided for @auxAboutSettingsPageDirectHighSpeedCloudPlaybackViaReal.
  ///
  /// In en, this message translates to:
  /// **'Direct high-speed cloud playback via Real-Debrid, TorBox, and Stremio addons.'**
  String get auxAboutSettingsPageDirectHighSpeedCloudPlaybackViaReal;

  /// No description provided for @auxAboutSettingsPageLiquidGlassGlslShaders.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass GLSL Shaders'**
  String get auxAboutSettingsPageLiquidGlassGlslShaders;

  /// No description provided for @auxAboutSettingsPageCustomRealTimeOpticalRefractionLensesAnd.
  ///
  /// In en, this message translates to:
  /// **'Custom real-time optical refraction, lenses, and fluid physics.'**
  String get auxAboutSettingsPageCustomRealTimeOpticalRefractionLensesAnd;

  /// No description provided for @auxAboutSettingsPageTraktCloudSynchronization.
  ///
  /// In en, this message translates to:
  /// **'Trakt & Cloud Synchronization'**
  String get auxAboutSettingsPageTraktCloudSynchronization;

  /// No description provided for @auxAboutSettingsPageCrossPlatformWatchlistEpisodeTrackingAndPlayback.
  ///
  /// In en, this message translates to:
  /// **'Cross-platform watchlist, episode tracking, and playback scrobbling.'**
  String
  get auxAboutSettingsPageCrossPlatformWatchlistEpisodeTrackingAndPlayback;

  /// No description provided for @auxAboutSettingsPagePoppinsIsBundledUnderTheSilOpen.
  ///
  /// In en, this message translates to:
  /// **'Poppins is bundled under the SIL Open Font License 1.1.'**
  String get auxAboutSettingsPagePoppinsIsBundledUnderTheSilOpen;

  /// No description provided for @auxAddonsSettingsPageItsCatalogsAndMetadataWillBeRemoved.
  ///
  /// In en, this message translates to:
  /// **'Its catalogs and metadata will be removed from your home page.'**
  String get auxAddonsSettingsPageItsCatalogsAndMetadataWillBeRemoved;

  /// No description provided for @auxAddonsSettingsPageWouldYouLikeToInstallAllPlugins.
  ///
  /// In en, this message translates to:
  /// **'Would you like to install all plugins from this repository now so their streaming sources become available immediately on the watch screen?'**
  String get auxAddonsSettingsPageWouldYouLikeToInstallAllPlugins;

  /// No description provided for @auxAddonsSettingsPagePasteTheRepositoryUrlSupportsCloudstreamrepoRepo.
  ///
  /// In en, this message translates to:
  /// **'Paste the repository URL (supports cloudstreamrepo://, repo.json, or plugins.json).'**
  String
  get auxAddonsSettingsPagePasteTheRepositoryUrlSupportsCloudstreamrepoRepo;

  /// No description provided for @auxAddonsSettingsPageThisCloudstreamExtensionWillBeUninstalled.
  ///
  /// In en, this message translates to:
  /// **'This CloudStream extension will be uninstalled.'**
  String get auxAddonsSettingsPageThisCloudstreamExtensionWillBeUninstalled;

  /// No description provided for @auxAddonsSettingsPagePluginsFromThisRepositoryWillNotBe.
  ///
  /// In en, this message translates to:
  /// **'Plugins from this repository will not be deleted, but repository updates will no longer be fetched.'**
  String get auxAddonsSettingsPagePluginsFromThisRepositoryWillNotBe;

  /// No description provided for @auxAddonsSettingsPageInstallsTheAddonForTheDebridProvider.
  ///
  /// In en, this message translates to:
  /// **'Installs the addon for the Debrid provider selected in Settings and fills your saved key in at request time, so the key is never stored twice.'**
  String get auxAddonsSettingsPageInstallsTheAddonForTheDebridProvider;

  /// No description provided for @auxAddonsSettingsPageCloudstreamCs3ExtensionsProvideStreamProvidersDirectly.
  ///
  /// In en, this message translates to:
  /// **'CloudStream (.cs3) extensions provide stream providers directly from popular media sites. Extensions run locally in a sandboxed sidecar or native ART engine.'**
  String
  get auxAddonsSettingsPageCloudstreamCs3ExtensionsProvideStreamProvidersDirectly;

  /// No description provided for @auxAddonsSettingsPage45Repos.
  ///
  /// In en, this message translates to:
  /// **'45+ Repos'**
  String get auxAddonsSettingsPage45Repos;

  /// No description provided for @auxAddonsSettingsPageBrowseCuratedTurkish3rabiEnglishHindiGlobal.
  ///
  /// In en, this message translates to:
  /// **'Browse curated Turkish, 3rabi, English, Hindi & global repos with direct install links.'**
  String get auxAddonsSettingsPageBrowseCuratedTurkish3rabiEnglishHindiGlobal;

  /// No description provided for @auxAddonsSettingsPageSetUpADebridProviderInSettings.
  ///
  /// In en, this message translates to:
  /// **'Set up a Debrid provider in Settings first, then come back to connect it.'**
  String get auxAddonsSettingsPageSetUpADebridProviderInSettings;

  /// No description provided for @auxAppearanceSettingsPageUploadCustomPhotosChooseCuratedDarkWallpapers.
  ///
  /// In en, this message translates to:
  /// **'Upload custom photos, choose curated dark wallpapers, and blend theme ambient lighting'**
  String
  get auxAppearanceSettingsPageUploadCustomPhotosChooseCuratedDarkWallpapers;

  /// No description provided for @auxAppearanceSettingsPageAdjustHoverImpactWobbleSpringPhysicsLens.
  ///
  /// In en, this message translates to:
  /// **'Adjust hover impact, wobble spring physics, lens refraction, and chromatic aberration'**
  String get auxAppearanceSettingsPageAdjustHoverImpactWobbleSpringPhysicsLens;

  /// No description provided for @auxAppearanceSettingsPageColorSchemesBecauseYouHaveOnYour.
  ///
  /// In en, this message translates to:
  /// **'Color schemes, \"Because you have on your list\" smart slider, hero spotlight, and card density'**
  String get auxAppearanceSettingsPageColorSchemesBecauseYouHaveOnYour;

  /// No description provided for @auxAppearanceSettingsPageBroadcastHeroSpotlightChannelCardDensityCategory.
  ///
  /// In en, this message translates to:
  /// **'Broadcast hero spotlight, channel card density, category ordering, and live badge styling'**
  String
  get auxAppearanceSettingsPageBroadcastHeroSpotlightChannelCardDensityCategory;

  /// No description provided for @auxAppearanceSettingsPageAmbientMovingLightingCardDensityReadingLayout.
  ///
  /// In en, this message translates to:
  /// **'Ambient moving lighting, card density, reading layout widths, webtoon/horizontal modes, and page deck preview'**
  String
  get auxAppearanceSettingsPageAmbientMovingLightingCardDensityReadingLayout;

  /// No description provided for @auxAppearanceSettingsPageHeroSpotlight5DistinctPlayerDesignsDrag.
  ///
  /// In en, this message translates to:
  /// **'Hero spotlight, 5 distinct player designs, drag & drop modular studio, waveform canvas scrubber, and custom controls'**
  String get auxAppearanceSettingsPageHeroSpotlight5DistinctPlayerDesignsDrag;

  /// No description provided for @auxAppearanceSettingsPageHeroSpotlightLosslessBadgesAndFullscreenPlayer.
  ///
  /// In en, this message translates to:
  /// **'Hero spotlight, lossless badges, and fullscreen player studio for layout, seekbar, physics & turntable styling'**
  String
  get auxAppearanceSettingsPageHeroSpotlightLosslessBadgesAndFullscreenPlayer;

  /// No description provided for @auxBuiltinProvidersSettingsPageThisWillRestoreAll45ZplayhttpProviders.
  ///
  /// In en, this message translates to:
  /// **'This will restore all 45 ZPlayHTTP providers to their default order and re-enable any disabled providers.'**
  String
  get auxBuiltinProvidersSettingsPageThisWillRestoreAll45ZplayhttpProviders;

  /// No description provided for @auxBuiltinProvidersSettingsPageStandardAutoSortingAcrossAll45Providers.
  ///
  /// In en, this message translates to:
  /// **'Standard auto-sorting across all 45 providers'**
  String
  get auxBuiltinProvidersSettingsPageStandardAutoSortingAcrossAll45Providers;

  /// No description provided for @auxBuiltinProvidersSettingsPageInDefaultModeZplayUsesItsNative.
  ///
  /// In en, this message translates to:
  /// **'In Default mode, ZPlay uses its native multi-source streaming engine. All providers run simultaneously, and results are smartly sorted by video resolution (4K, 1080p, 720p) and file size.'**
  String get auxBuiltinProvidersSettingsPageInDefaultModeZplayUsesItsNative;

  /// No description provided for @auxBuiltinProvidersSettingsPageProvidersAtTheTopScrapeFirstAnd.
  ///
  /// In en, this message translates to:
  /// **'Providers at the top scrape first, and their results strictly display at the top of stream results, no matter the file size or quality.'**
  String get auxBuiltinProvidersSettingsPageProvidersAtTheTopScrapeFirstAnd;

  /// No description provided for @auxDebridSettingsPageStreamTorrentsAndMagnetLinksInstantlyThrough.
  ///
  /// In en, this message translates to:
  /// **'Stream torrents and magnet links instantly through high-speed cloud debrid providers without local peer-to-peer downloading.'**
  String get auxDebridSettingsPageStreamTorrentsAndMagnetLinksInstantlyThrough;

  /// No description provided for @auxDebridSettingsPageWhenEnabledAllTorrentsFromZplayAnd.
  ///
  /// In en, this message translates to:
  /// **'When enabled, all torrents from Kiru and Stremio addons are resolved exclusively through your active Debrid provider without touching the local torrent engine.'**
  String get auxDebridSettingsPageWhenEnabledAllTorrentsFromZplayAnd;

  /// No description provided for @auxServiceKeysSettingsPageRanksThe1990sRailsAndCoversThe.
  ///
  /// In en, this message translates to:
  /// **'Ranks the 1990s rails and covers the scraper metadata lookups.'**
  String get auxServiceKeysSettingsPageRanksThe1990sRailsAndCoversThe;

  /// No description provided for @auxSimklSettingsPageConnectYourSimklAccountToSynchronizeMovies.
  ///
  /// In en, this message translates to:
  /// **'Connect your Simkl account to synchronize Movies, TV Shows, and Anime watchlists, continue watching progress, and custom lists.'**
  String get auxSimklSettingsPageConnectYourSimklAccountToSynchronizeMovies;

  /// No description provided for @auxTraktSettingsPageConnectYourTraktTvAccountToSeamlessly.
  ///
  /// In en, this message translates to:
  /// **'Connect your Trakt.tv account to seamlessly synchronize your watch history, watchlist, continue watching progress, and ratings across all your devices.'**
  String get auxTraktSettingsPageConnectYourTraktTvAccountToSeamlessly;

  /// No description provided for @auxVideoSettingsPageAndroidSExoplayerFastestAt4k.
  ///
  /// In en, this message translates to:
  /// **'Android\'s ExoPlayer (Fastest at 4K)'**
  String get auxVideoSettingsPageAndroidSExoplayerFastestAt4k;

  /// No description provided for @auxVideoSettingsPageMpvFullSubtitleControl.
  ///
  /// In en, this message translates to:
  /// **'mpv (Full subtitle control)'**
  String get auxVideoSettingsPageMpvFullSubtitleControl;

  /// No description provided for @auxVideoSettingsPageUsesFlutterSurfaceproducerToRenderFramesDirectly.
  ///
  /// In en, this message translates to:
  /// **'Uses Flutter SurfaceProducer to render frames directly to hardware surface without texture blitting. Significantly boosts 4K/60fps playback and reduces battery usage on Android. (Keep disabled if your device experiences display glitches).'**
  String
  get auxVideoSettingsPageUsesFlutterSurfaceproducerToRenderFramesDirectly;

  /// No description provided for @auxAudiobookPlayerStudioPagePlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Player Studio'**
  String get auxAudiobookPlayerStudioPagePlayerStudio;

  /// No description provided for @auxAudiobookPlayerStudioPageCustomAudiobookPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Custom Audiobook Player Studio'**
  String get auxAudiobookPlayerStudioPageCustomAudiobookPlayerStudio;

  /// No description provided for @auxAudiobookPlayerStudioPageDragComponentsTransformSeekbarsCustomizeButtonPhysics.
  ///
  /// In en, this message translates to:
  /// **'Drag components, transform seekbars, customize button physics'**
  String
  get auxAudiobookPlayerStudioPageDragComponentsTransformSeekbarsCustomizeButtonPhysics;

  /// No description provided for @auxAudiobookPlayerStudioPageApplyAsActivePlayer.
  ///
  /// In en, this message translates to:
  /// **'Apply As Active Player'**
  String get auxAudiobookPlayerStudioPageApplyAsActivePlayer;

  /// No description provided for @auxAudiobookPlayerStudioPageCustomPlayerStudioLayoutAppliedSetAs.
  ///
  /// In en, this message translates to:
  /// **'Custom Player Studio layout applied & set as active player!'**
  String get auxAudiobookPlayerStudioPageCustomPlayerStudioLayoutAppliedSetAs;

  /// No description provided for @auxAudiobookPlayerStudioPageStudioDesigner.
  ///
  /// In en, this message translates to:
  /// **'Studio Designer'**
  String get auxAudiobookPlayerStudioPageStudioDesigner;

  /// No description provided for @auxAudiobookPlayerStudioPageLivePreviewCanvas.
  ///
  /// In en, this message translates to:
  /// **'Live Preview Canvas'**
  String get auxAudiobookPlayerStudioPageLivePreviewCanvas;

  /// No description provided for @auxAudiobookPlayerStudioPageTestLiveCanvas.
  ///
  /// In en, this message translates to:
  /// **'Test Live Canvas'**
  String get auxAudiobookPlayerStudioPageTestLiveCanvas;

  /// No description provided for @auxAudiobookPlayerStudioPageBackToCustomizer.
  ///
  /// In en, this message translates to:
  /// **'Back to Customizer'**
  String get auxAudiobookPlayerStudioPageBackToCustomizer;

  /// No description provided for @auxAudiobookPlayerStudioPageLiveInteractiveCanvas.
  ///
  /// In en, this message translates to:
  /// **'LIVE INTERACTIVE CANVAS'**
  String get auxAudiobookPlayerStudioPageLiveInteractiveCanvas;

  /// No description provided for @auxAudiobookPlayerStudioPageCustomStudio.
  ///
  /// In en, this message translates to:
  /// **'CUSTOM STUDIO'**
  String get auxAudiobookPlayerStudioPageCustomStudio;

  /// No description provided for @auxAudiobookPlayerStudioPagePremadeChaptersPanel.
  ///
  /// In en, this message translates to:
  /// **'Premade Chapters Panel'**
  String get auxAudiobookPlayerStudioPagePremadeChaptersPanel;

  /// No description provided for @auxAudiobookPlayerStudioPagePremadeChaptersPanelPreview.
  ///
  /// In en, this message translates to:
  /// **'Premade Chapters Panel Preview'**
  String get auxAudiobookPlayerStudioPagePremadeChaptersPanelPreview;

  /// No description provided for @auxAudiobookPlayerStudioPageDragDropComponentArranger.
  ///
  /// In en, this message translates to:
  /// **'Drag & Drop Component Arranger'**
  String get auxAudiobookPlayerStudioPageDragDropComponentArranger;

  /// No description provided for @auxAudiobookPlayerStudioPageHoldAndDragAnyBlockToReorder.
  ///
  /// In en, this message translates to:
  /// **'Hold and drag any block to reorder the vertical layout of your audio player in real-time.'**
  String get auxAudiobookPlayerStudioPageHoldAndDragAnyBlockToReorder;

  /// No description provided for @auxAudiobookPlayerStudioPageSeekBarCanvasScrubberStyles.
  ///
  /// In en, this message translates to:
  /// **'Seek Bar Canvas & Scrubber Styles'**
  String get auxAudiobookPlayerStudioPageSeekBarCanvasScrubberStyles;

  /// No description provided for @auxAudiobookPlayerStudioPageSelectHowYourProgressBarAndScrubber.
  ///
  /// In en, this message translates to:
  /// **'Select how your progress bar and scrubber render inside your custom player canvas.'**
  String get auxAudiobookPlayerStudioPageSelectHowYourProgressBarAndScrubber;

  /// No description provided for @auxAudiobookPlayerStudioPageHoverTouchPhysics.
  ///
  /// In en, this message translates to:
  /// **'Hover & Touch Physics'**
  String get auxAudiobookPlayerStudioPageHoverTouchPhysics;

  /// No description provided for @auxAudiobookPlayerStudioPageLiveTouchHoverPhysicsPlayground.
  ///
  /// In en, this message translates to:
  /// **'Live Touch & Hover Physics Playground'**
  String get auxAudiobookPlayerStudioPageLiveTouchHoverPhysicsPlayground;

  /// No description provided for @auxAudiobookPlayerStudioPageArtworkDisplayMode.
  ///
  /// In en, this message translates to:
  /// **'Artwork Display Mode'**
  String get auxAudiobookPlayerStudioPageArtworkDisplayMode;

  /// No description provided for @auxAudiobookSettingsPageEnableMovingAmbientAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Enable Moving Ambient Atmosphere'**
  String get auxAudiobookSettingsPageEnableMovingAmbientAtmosphere;

  /// No description provided for @auxAudiobookSettingsPageLightingFlowPattern.
  ///
  /// In en, this message translates to:
  /// **'Lighting Flow Pattern'**
  String get auxAudiobookSettingsPageLightingFlowPattern;

  /// No description provided for @auxAudiobookSettingsPageGlowStrengthOpacity.
  ///
  /// In en, this message translates to:
  /// **'Glow Strength / Opacity'**
  String get auxAudiobookSettingsPageGlowStrengthOpacity;

  /// No description provided for @auxAudiobookSettingsPageMotionDriftSpeed.
  ///
  /// In en, this message translates to:
  /// **'Motion Drift Speed'**
  String get auxAudiobookSettingsPageMotionDriftSpeed;

  /// No description provided for @auxAudiobookSettingsPageLiveAtmospherePreview.
  ///
  /// In en, this message translates to:
  /// **'Live Atmosphere Preview'**
  String get auxAudiobookSettingsPageLiveAtmospherePreview;

  /// No description provided for @auxAudiobookSettingsPageShowHeroSpotlightCarousel.
  ///
  /// In en, this message translates to:
  /// **'Show Hero Spotlight Carousel'**
  String get auxAudiobookSettingsPageShowHeroSpotlightCarousel;

  /// No description provided for @auxAudiobookSettingsPageFeaturedBestsellingAudiobookShowcaseAtTheTop.
  ///
  /// In en, this message translates to:
  /// **'Featured bestselling audiobook showcase at the top of the hub'**
  String
  get auxAudiobookSettingsPageFeaturedBestsellingAudiobookShowcaseAtTheTop;

  /// No description provided for @auxAudiobookSettingsPageQuickResumeCardsWithChapterProgressBar.
  ///
  /// In en, this message translates to:
  /// **'Quick resume cards with chapter progress bar and direct play'**
  String get auxAudiobookSettingsPageQuickResumeCardsWithChapterProgressBar;

  /// No description provided for @auxAudiobookSettingsPageAudiobookPosterCardDensity.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Poster Card Density'**
  String get auxAudiobookSettingsPageAudiobookPosterCardDensity;

  /// No description provided for @auxAudiobookSettingsPageShowQuickGenreCategoryBadges.
  ///
  /// In en, this message translates to:
  /// **'Show Quick Genre & Category Badges'**
  String get auxAudiobookSettingsPageShowQuickGenreCategoryBadges;

  /// No description provided for @auxAudiobookSettingsPageShowAudiobookRuntimeTotalDuration.
  ///
  /// In en, this message translates to:
  /// **'Show Audiobook Runtime / Total Duration'**
  String get auxAudiobookSettingsPageShowAudiobookRuntimeTotalDuration;

  /// No description provided for @auxAudiobookSettingsPagePosterCardHoverGlowElevation.
  ///
  /// In en, this message translates to:
  /// **'Poster Card Hover Glow & Elevation'**
  String get auxAudiobookSettingsPagePosterCardHoverGlowElevation;

  /// No description provided for @auxAudiobookSettingsPageVisualCustomPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Visual Custom Player Studio'**
  String get auxAudiobookSettingsPageVisualCustomPlayerStudio;

  /// No description provided for @auxAudiobookSettingsPageFullStudio.
  ///
  /// In en, this message translates to:
  /// **'FULL STUDIO'**
  String get auxAudiobookSettingsPageFullStudio;

  /// No description provided for @auxAudiobookSettingsPageDragDropLayoutElementsProceduralWaveformCanvases.
  ///
  /// In en, this message translates to:
  /// **'Drag & drop layout elements, procedural waveform canvases, liquid glass buttons, and premade chapters panel in real-time.'**
  String
  get auxAudiobookSettingsPageDragDropLayoutElementsProceduralWaveformCanvases;

  /// No description provided for @auxAudiobookSettingsPageEnterCustomPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Enter Custom Player Studio'**
  String get auxAudiobookSettingsPageEnterCustomPlayerStudio;

  /// No description provided for @auxAudiobookSettingsPageInteractiveStudioPreview.
  ///
  /// In en, this message translates to:
  /// **'Interactive Studio Preview'**
  String get auxAudiobookSettingsPageInteractiveStudioPreview;

  /// No description provided for @auxAudiobookSettingsPageSeekBarScrubberStyle.
  ///
  /// In en, this message translates to:
  /// **'Seek Bar / Scrubber Style'**
  String get auxAudiobookSettingsPageSeekBarScrubberStyle;

  /// No description provided for @auxAudiobookSettingsPagePlayPauseButtonStyling.
  ///
  /// In en, this message translates to:
  /// **'Play / Pause Button Styling'**
  String get auxAudiobookSettingsPagePlayPauseButtonStyling;

  /// No description provided for @auxAudiobookSettingsPageArtworkDisplayStyle.
  ///
  /// In en, this message translates to:
  /// **'Artwork Display Style'**
  String get auxAudiobookSettingsPageArtworkDisplayStyle;

  /// No description provided for @auxAudiobookSettingsPageButtonHoverTouchPhysics.
  ///
  /// In en, this message translates to:
  /// **'Button Hover & Touch Physics'**
  String get auxAudiobookSettingsPageButtonHoverTouchPhysics;

  /// No description provided for @auxAudiobookSettingsPagePlayerLayoutComponentsDragToArrange.
  ///
  /// In en, this message translates to:
  /// **'Player Layout Components (Drag to Arrange)'**
  String get auxAudiobookSettingsPagePlayerLayoutComponentsDragToArrange;

  /// No description provided for @auxAudiobookSettingsPageHoldAndDragAnyBlockToReorder.
  ///
  /// In en, this message translates to:
  /// **'Hold and drag any block to reorder how controls appear inside your player'**
  String get auxAudiobookSettingsPageHoldAndDragAnyBlockToReorder;

  /// No description provided for @auxAudiobookSettingsPageLiquidGlassPlayerBlurRefraction.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass Player Blur & Refraction'**
  String get auxAudiobookSettingsPageLiquidGlassPlayerBlurRefraction;

  /// No description provided for @auxAudiobookSettingsPageShowPlaybackSpeedSelector05x2.
  ///
  /// In en, this message translates to:
  /// **'Show Playback Speed Selector (0.5x - 2.5x)'**
  String get auxAudiobookSettingsPageShowPlaybackSpeedSelector05x2;

  /// No description provided for @auxAudiobookSettingsPageShowSkipForwardRewindButtons10s.
  ///
  /// In en, this message translates to:
  /// **'Show Skip Forward/Rewind Buttons (±10s)'**
  String get auxAudiobookSettingsPageShowSkipForwardRewindButtons10s;

  /// No description provided for @auxAudiobookSettingsPageShowQuickChaptersSlidingDrawerButton.
  ///
  /// In en, this message translates to:
  /// **'Show Quick Chapters Sliding Drawer Button'**
  String get auxAudiobookSettingsPageShowQuickChaptersSlidingDrawerButton;

  /// No description provided for @auxAudiobookSettingsPageLaunchFullCustomPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Launch Full Custom Player Studio'**
  String get auxAudiobookSettingsPageLaunchFullCustomPlayerStudio;

  /// No description provided for @auxCustomBackgroundSettingsPageUploadYourOwnPhotoOrChooseA.
  ///
  /// In en, this message translates to:
  /// **'Upload your own photo or choose a curated wallpaper. Theme colors and moving ambient lights softly blend into the background for a unified look.'**
  String get auxCustomBackgroundSettingsPageUploadYourOwnPhotoOrChooseA;

  /// No description provided for @auxCustomBackgroundSettingsPageResetToDefaultBackground.
  ///
  /// In en, this message translates to:
  /// **'Reset to Default Background'**
  String get auxCustomBackgroundSettingsPageResetToDefaultBackground;

  /// No description provided for @auxCustomBackgroundSettingsPageOrPasteImageUrlHttps.
  ///
  /// In en, this message translates to:
  /// **'Or paste image URL (https://...)'**
  String get auxCustomBackgroundSettingsPageOrPasteImageUrlHttps;

  /// No description provided for @auxCustomBackgroundSettingsPageCuratedDarkWallpapers.
  ///
  /// In en, this message translates to:
  /// **'CURATED DARK WALLPAPERS'**
  String get auxCustomBackgroundSettingsPageCuratedDarkWallpapers;

  /// No description provided for @auxCustomBackgroundSettingsPageWallpaperLightBlendingControls.
  ///
  /// In en, this message translates to:
  /// **'WALLPAPER & LIGHT BLENDING CONTROLS'**
  String get auxCustomBackgroundSettingsPageWallpaperLightBlendingControls;

  /// No description provided for @auxCustomBackgroundSettingsPagePhotoVisibilityDarkness.
  ///
  /// In en, this message translates to:
  /// **'Photo Visibility / Darkness'**
  String get auxCustomBackgroundSettingsPagePhotoVisibilityDarkness;

  /// No description provided for @auxCustomBackgroundSettingsPagePhotoSoftBlur.
  ///
  /// In en, this message translates to:
  /// **'Photo Soft Blur'**
  String get auxCustomBackgroundSettingsPagePhotoSoftBlur;

  /// No description provided for @auxCustomBackgroundSettingsPageThemeColorTintOverlay.
  ///
  /// In en, this message translates to:
  /// **'Theme Color Tint Overlay'**
  String get auxCustomBackgroundSettingsPageThemeColorTintOverlay;

  /// No description provided for @auxCustomBackgroundSettingsPageBlendMovingAmbientLights.
  ///
  /// In en, this message translates to:
  /// **'Blend Moving Ambient Lights'**
  String get auxCustomBackgroundSettingsPageBlendMovingAmbientLights;

  /// No description provided for @auxCustomBackgroundSettingsPageSoftlyIlluminatesAndAnimatesThemeLightsOver.
  ///
  /// In en, this message translates to:
  /// **'Softly illuminates and animates theme lights over your wallpaper'**
  String
  get auxCustomBackgroundSettingsPageSoftlyIlluminatesAndAnimatesThemeLightsOver;

  /// No description provided for @auxHomeUiSettingsPageColorThemesAccents.
  ///
  /// In en, this message translates to:
  /// **'COLOR THEMES & ACCENTS'**
  String get auxHomeUiSettingsPageColorThemesAccents;

  /// No description provided for @auxHomeUiSettingsPageAmbientBackgroundLightingMovingGlows.
  ///
  /// In en, this message translates to:
  /// **'AMBIENT BACKGROUND LIGHTING & MOVING GLOWS'**
  String get auxHomeUiSettingsPageAmbientBackgroundLightingMovingGlows;

  /// No description provided for @auxHomeUiSettingsPageCustomBackgroundWallpaper.
  ///
  /// In en, this message translates to:
  /// **'CUSTOM BACKGROUND & WALLPAPER'**
  String get auxHomeUiSettingsPageCustomBackgroundWallpaper;

  /// No description provided for @auxHomeUiSettingsPageCustomWallpaperLightingBlend.
  ///
  /// In en, this message translates to:
  /// **'Custom Wallpaper & Lighting Blend'**
  String get auxHomeUiSettingsPageCustomWallpaperLightingBlend;

  /// No description provided for @auxHomeUiSettingsPageSmartRecommendationsBecauseYouHaveOnYour.
  ///
  /// In en, this message translates to:
  /// **'SMART RECOMMENDATIONS (\"BECAUSE YOU HAVE ON YOUR LIST\")'**
  String get auxHomeUiSettingsPageSmartRecommendationsBecauseYouHaveOnYour;

  /// No description provided for @auxHomeUiSettingsPageCuratedCollections.
  ///
  /// In en, this message translates to:
  /// **'CURATED COLLECTIONS'**
  String get auxHomeUiSettingsPageCuratedCollections;

  /// No description provided for @auxHomeUiSettingsPageHeroBannerSpotlight.
  ///
  /// In en, this message translates to:
  /// **'HERO BANNER & SPOTLIGHT'**
  String get auxHomeUiSettingsPageHeroBannerSpotlight;

  /// No description provided for @auxHomeUiSettingsPagePosterCardsDensity.
  ///
  /// In en, this message translates to:
  /// **'POSTER CARDS & DENSITY'**
  String get auxHomeUiSettingsPagePosterCardsDensity;

  /// No description provided for @auxHomeUiSettingsPageHeaderShortcutsButtons.
  ///
  /// In en, this message translates to:
  /// **'HEADER SHORTCUTS & BUTTONS'**
  String get auxHomeUiSettingsPageHeaderShortcutsButtons;

  /// No description provided for @auxHomeUiSettingsPageLiveLightingEnginePreview.
  ///
  /// In en, this message translates to:
  /// **'LIVE LIGHTING ENGINE PREVIEW'**
  String get auxHomeUiSettingsPageLiveLightingEnginePreview;

  /// No description provided for @auxHomeUiSettingsPageMovingAmbientLightsGlows.
  ///
  /// In en, this message translates to:
  /// **'Moving Ambient Lights & Glows'**
  String get auxHomeUiSettingsPageMovingAmbientLightsGlows;

  /// No description provided for @auxHomeUiSettingsPageDriftingFadedLightWavesFloatingColorOrbs.
  ///
  /// In en, this message translates to:
  /// **'Drifting faded light waves & floating color orbs in background'**
  String get auxHomeUiSettingsPageDriftingFadedLightWavesFloatingColorOrbs;

  /// No description provided for @auxHomeUiSettingsPageLightingPatternPosition.
  ///
  /// In en, this message translates to:
  /// **'Lighting Pattern & Position'**
  String get auxHomeUiSettingsPageLightingPatternPosition;

  /// No description provided for @auxHomeUiSettingsPageGlowStrengthIntensity.
  ///
  /// In en, this message translates to:
  /// **'Glow Strength / Intensity'**
  String get auxHomeUiSettingsPageGlowStrengthIntensity;

  /// No description provided for @auxHomeUiSettingsPageMotionFlowSpeed.
  ///
  /// In en, this message translates to:
  /// **'Motion Flow Speed'**
  String get auxHomeUiSettingsPageMotionFlowSpeed;

  /// No description provided for @auxHomeUiSettingsPageSmartRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Smart Recommendations'**
  String get auxHomeUiSettingsPageSmartRecommendations;

  /// No description provided for @auxHomeUiSettingsPageConfigurePersonalizedAlgorithmicRecommendationSliders.
  ///
  /// In en, this message translates to:
  /// **'Configure personalized & algorithmic recommendation sliders'**
  String
  get auxHomeUiSettingsPageConfigurePersonalizedAlgorithmicRecommendationSliders;

  /// No description provided for @auxHomeUiSettingsPageBecauseYouHaveMyList.
  ///
  /// In en, this message translates to:
  /// **'\"Because You Have...\" (My List)'**
  String get auxHomeUiSettingsPageBecauseYouHaveMyList;

  /// No description provided for @auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnTitlesSavedIn.
  ///
  /// In en, this message translates to:
  /// **'BestSimilar recommendations based on titles saved in My List'**
  String
  get auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnTitlesSavedIn;

  /// No description provided for @auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnActiveContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'BestSimilar recommendations based on active Continue Watching titles'**
  String
  get auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnActiveContinueWatching;

  /// No description provided for @auxHomeUiSettingsPageHideRailsWithNoArtwork.
  ///
  /// In en, this message translates to:
  /// **'Hide Rails With No Artwork'**
  String get auxHomeUiSettingsPageHideRailsWithNoArtwork;

  /// No description provided for @auxHomeUiSettingsPageTraktRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Trakt Recommendations'**
  String get auxHomeUiSettingsPageTraktRecommendations;

  /// No description provided for @auxHomeUiSettingsPageSimklRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Simkl Recommendations'**
  String get auxHomeUiSettingsPageSimklRecommendations;

  /// No description provided for @auxHomeUiSettingsPageRecommendationSlidersPositionOnHomePage.
  ///
  /// In en, this message translates to:
  /// **'Recommendation Sliders Position on Home Page'**
  String get auxHomeUiSettingsPageRecommendationSlidersPositionOnHomePage;

  /// No description provided for @auxHomeUiSettingsPageShowCuratedCollectionRailsOnTheHome.
  ///
  /// In en, this message translates to:
  /// **'Show curated collection rails on the Home page'**
  String get auxHomeUiSettingsPageShowCuratedCollectionRailsOnTheHome;

  /// No description provided for @auxHomeUiSettingsPageShowHeroSpotlightBanner.
  ///
  /// In en, this message translates to:
  /// **'Show Hero Spotlight Banner'**
  String get auxHomeUiSettingsPageShowHeroSpotlightBanner;

  /// No description provided for @auxHomeUiSettingsPageFeaturedRotationBannerAtTheTopOf.
  ///
  /// In en, this message translates to:
  /// **'Featured rotation banner at the top of the home page'**
  String get auxHomeUiSettingsPageFeaturedRotationBannerAtTheTopOf;

  /// No description provided for @auxHomeUiSettingsPageSpotlightStyle.
  ///
  /// In en, this message translates to:
  /// **'Spotlight Style'**
  String get auxHomeUiSettingsPageSpotlightStyle;

  /// No description provided for @auxHomeUiSettingsPageAutoRotateSpotlight.
  ///
  /// In en, this message translates to:
  /// **'Auto-Rotate Spotlight'**
  String get auxHomeUiSettingsPageAutoRotateSpotlight;

  /// No description provided for @auxHomeUiSettingsPageCyclesThroughFeaturedTitlesAutomatically.
  ///
  /// In en, this message translates to:
  /// **'Cycles through featured titles automatically'**
  String get auxHomeUiSettingsPageCyclesThroughFeaturedTitlesAutomatically;

  /// No description provided for @auxHomeUiSettingsPageAmbientBackdropLighting.
  ///
  /// In en, this message translates to:
  /// **'Ambient Backdrop Lighting'**
  String get auxHomeUiSettingsPageAmbientBackdropLighting;

  /// No description provided for @auxHomeUiSettingsPageSoftDiffusedColorGlowBehindActiveHero.
  ///
  /// In en, this message translates to:
  /// **'Soft diffused color glow behind active hero poster'**
  String get auxHomeUiSettingsPageSoftDiffusedColorGlowBehindActiveHero;

  /// No description provided for @auxHomeUiSettingsPagePosterSizeGridDensity.
  ///
  /// In en, this message translates to:
  /// **'Poster Size & Grid Density'**
  String get auxHomeUiSettingsPagePosterSizeGridDensity;

  /// No description provided for @auxHomeUiSettingsPageShowImdbRatingBadges.
  ///
  /// In en, this message translates to:
  /// **'Show IMDB Rating Badges'**
  String get auxHomeUiSettingsPageShowImdbRatingBadges;

  /// No description provided for @auxHomeUiSettingsPageDisplayRatingStarPillOnPosterCorners.
  ///
  /// In en, this message translates to:
  /// **'Display rating star pill on poster corners'**
  String get auxHomeUiSettingsPageDisplayRatingStarPillOnPosterCorners;

  /// No description provided for @auxHomeUiSettingsPagePosterHoverZoomScale.
  ///
  /// In en, this message translates to:
  /// **'Poster Hover Zoom Scale'**
  String get auxHomeUiSettingsPagePosterHoverZoomScale;

  /// No description provided for @auxHomeUiSettingsPageShowTvCalendarButtonsOnHomeBar.
  ///
  /// In en, this message translates to:
  /// **'Show TV Calendar buttons on Home bar & sliders'**
  String get auxHomeUiSettingsPageShowTvCalendarButtonsOnHomeBar;

  /// No description provided for @auxHomeUiSettingsPageAiRecommendationQuiz.
  ///
  /// In en, this message translates to:
  /// **'AI Recommendation Quiz'**
  String get auxHomeUiSettingsPageAiRecommendationQuiz;

  /// No description provided for @auxHomeUiSettingsPageShowAiQuizButtonOnHomeSearch.
  ///
  /// In en, this message translates to:
  /// **'Show AI Quiz button on Home & Search bars'**
  String get auxHomeUiSettingsPageShowAiQuizButtonOnHomeSearch;

  /// No description provided for @auxLiquidGlassSettingsPageLiquidGlassSettingsResetToDefaults.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass settings reset to defaults.'**
  String get auxLiquidGlassSettingsPageLiquidGlassSettingsResetToDefaults;

  /// No description provided for @auxLiquidGlassSettingsPageEnableLiquidGlass.
  ///
  /// In en, this message translates to:
  /// **'Enable Liquid Glass'**
  String get auxLiquidGlassSettingsPageEnableLiquidGlass;

  /// No description provided for @auxLiquidGlassSettingsPageRealTimeRefractionShadersJellySpringsAnd.
  ///
  /// In en, this message translates to:
  /// **'Real-time refraction shaders, jelly springs, and lenses'**
  String get auxLiquidGlassSettingsPageRealTimeRefractionShadersJellySpringsAnd;

  /// No description provided for @auxLiquidGlassSettingsPagePresets.
  ///
  /// In en, this message translates to:
  /// **'PRESETS'**
  String get auxLiquidGlassSettingsPagePresets;

  /// No description provided for @auxLiquidGlassSettingsPagePhysicsOpticalParameters.
  ///
  /// In en, this message translates to:
  /// **'PHYSICS & OPTICAL PARAMETERS'**
  String get auxLiquidGlassSettingsPagePhysicsOpticalParameters;

  /// No description provided for @auxLiquidGlassSettingsPageHoverScaleImpact.
  ///
  /// In en, this message translates to:
  /// **'Hover Scale Impact'**
  String get auxLiquidGlassSettingsPageHoverScaleImpact;

  /// No description provided for @auxLiquidGlassSettingsPageMagnificationAmountAppliedToThePlayerGlass.
  ///
  /// In en, this message translates to:
  /// **'Magnification amount applied to the player glass controls on hover'**
  String
  get auxLiquidGlassSettingsPageMagnificationAmountAppliedToThePlayerGlass;

  /// No description provided for @auxLiquidGlassSettingsPageWobbleFluidElasticity.
  ///
  /// In en, this message translates to:
  /// **'Wobble & Fluid Elasticity'**
  String get auxLiquidGlassSettingsPageWobbleFluidElasticity;

  /// No description provided for @auxLiquidGlassSettingsPageSpringBounceIntensityAndDeformationResponsiveness.
  ///
  /// In en, this message translates to:
  /// **'Spring bounce intensity and deformation responsiveness'**
  String
  get auxLiquidGlassSettingsPageSpringBounceIntensityAndDeformationResponsiveness;

  /// No description provided for @auxLiquidGlassSettingsPageOpticalRefractionIndex.
  ///
  /// In en, this message translates to:
  /// **'Optical Refraction Index'**
  String get auxLiquidGlassSettingsPageOpticalRefractionIndex;

  /// No description provided for @auxLiquidGlassSettingsPageLightBendingAndBackgroundWarpIndexInside.
  ///
  /// In en, this message translates to:
  /// **'Light bending and background warp index inside glass lenses'**
  String get auxLiquidGlassSettingsPageLightBendingAndBackgroundWarpIndexInside;

  /// No description provided for @auxLiquidGlassSettingsPageLensMagnification.
  ///
  /// In en, this message translates to:
  /// **'Lens Magnification'**
  String get auxLiquidGlassSettingsPageLensMagnification;

  /// No description provided for @auxLiquidGlassSettingsPageUnderlyingZoomFactorSeenThroughTheGlass.
  ///
  /// In en, this message translates to:
  /// **'Underlying zoom factor seen through the glass volume'**
  String get auxLiquidGlassSettingsPageUnderlyingZoomFactorSeenThroughTheGlass;

  /// No description provided for @auxLiquidGlassSettingsPageChromaticAberrationPrismSplit.
  ///
  /// In en, this message translates to:
  /// **'Chromatic Aberration (Prism Split)'**
  String get auxLiquidGlassSettingsPageChromaticAberrationPrismSplit;

  /// No description provided for @auxLiquidGlassSettingsPageSeparatesRgbSpectrumColorsAlongOpticalGlass.
  ///
  /// In en, this message translates to:
  /// **'Separates RGB spectrum colors along optical glass bevels'**
  String
  get auxLiquidGlassSettingsPageSeparatesRgbSpectrumColorsAlongOpticalGlass;

  /// No description provided for @auxLiquidGlassSettingsPageFrostedGlassBlur.
  ///
  /// In en, this message translates to:
  /// **'Frosted Glass Blur'**
  String get auxLiquidGlassSettingsPageFrostedGlassBlur;

  /// No description provided for @auxLiquidGlassSettingsPageGaussianBlurDiffusionAppliedBehindGlassComponents.
  ///
  /// In en, this message translates to:
  /// **'Gaussian blur diffusion applied behind glass components'**
  String
  get auxLiquidGlassSettingsPageGaussianBlurDiffusionAppliedBehindGlassComponents;

  /// No description provided for @auxLiquidGlassSettingsPageSpecularLightShimmer.
  ///
  /// In en, this message translates to:
  /// **'Specular Light & Shimmer'**
  String get auxLiquidGlassSettingsPageSpecularLightShimmer;

  /// No description provided for @auxLiquidGlassSettingsPageGlossySpecularReflectionAndBorderIlluminationIntensity.
  ///
  /// In en, this message translates to:
  /// **'Glossy specular reflection and border illumination intensity'**
  String
  get auxLiquidGlassSettingsPageGlossySpecularReflectionAndBorderIlluminationIntensity;

  /// No description provided for @auxLiquidGlassSettingsPageBorderWidth.
  ///
  /// In en, this message translates to:
  /// **'Border Width'**
  String get auxLiquidGlassSettingsPageBorderWidth;

  /// No description provided for @auxLiquidGlassSettingsPageThicknessOfTheRefractiveOuterBoundaryEdge.
  ///
  /// In en, this message translates to:
  /// **'Thickness of the refractive outer boundary edge'**
  String
  get auxLiquidGlassSettingsPageThicknessOfTheRefractiveOuterBoundaryEdge;

  /// No description provided for @auxLiquidGlassSettingsPageHoverOrTapTheIconsToPreview.
  ///
  /// In en, this message translates to:
  /// **'Hover or tap the icons to preview spring wobble & scale'**
  String get auxLiquidGlassSettingsPageHoverOrTapTheIconsToPreview;

  /// No description provided for @auxLiveTvSettingsPageLiveSpotlightHeroBanner.
  ///
  /// In en, this message translates to:
  /// **'LIVE SPOTLIGHT & HERO BANNER'**
  String get auxLiveTvSettingsPageLiveSpotlightHeroBanner;

  /// No description provided for @auxLiveTvSettingsPageChannelCardsPosterDensity.
  ///
  /// In en, this message translates to:
  /// **'CHANNEL CARDS & POSTER DENSITY'**
  String get auxLiveTvSettingsPageChannelCardsPosterDensity;

  /// No description provided for @auxLiveTvSettingsPageSectionsCategoryManager.
  ///
  /// In en, this message translates to:
  /// **'SECTIONS & CATEGORY MANAGER'**
  String get auxLiveTvSettingsPageSectionsCategoryManager;

  /// No description provided for @auxLiveTvSettingsPagePortalsPlaylistsModal.
  ///
  /// In en, this message translates to:
  /// **'PORTALS & PLAYLISTS MODAL'**
  String get auxLiveTvSettingsPagePortalsPlaylistsModal;

  /// No description provided for @auxLiveTvSettingsPagePortalBrowserChannelGuide.
  ///
  /// In en, this message translates to:
  /// **'PORTAL BROWSER & CHANNEL GUIDE'**
  String get auxLiveTvSettingsPagePortalBrowserChannelGuide;

  /// No description provided for @auxLiveTvSettingsPageStreamSources.
  ///
  /// In en, this message translates to:
  /// **'STREAM SOURCES'**
  String get auxLiveTvSettingsPageStreamSources;

  /// No description provided for @auxLiveTvSettingsPageShowLiveSpotlightBanner.
  ///
  /// In en, this message translates to:
  /// **'Show Live Spotlight Banner'**
  String get auxLiveTvSettingsPageShowLiveSpotlightBanner;

  /// No description provided for @auxLiveTvSettingsPageFeaturedChampionshipMatchesAndTopBroadcastChannels.
  ///
  /// In en, this message translates to:
  /// **'Featured championship matches and top broadcast channels at the top'**
  String
  get auxLiveTvSettingsPageFeaturedChampionshipMatchesAndTopBroadcastChannels;

  /// No description provided for @auxLiveTvSettingsPageHeroBannerStyle.
  ///
  /// In en, this message translates to:
  /// **'Hero Banner Style'**
  String get auxLiveTvSettingsPageHeroBannerStyle;

  /// No description provided for @auxLiveTvSettingsPageAutoRotateChannels.
  ///
  /// In en, this message translates to:
  /// **'Auto-Rotate Channels'**
  String get auxLiveTvSettingsPageAutoRotateChannels;

  /// No description provided for @auxLiveTvSettingsPageAutomaticallyCycleThroughFeaturedLiveEvents.
  ///
  /// In en, this message translates to:
  /// **'Automatically cycle through featured live events'**
  String get auxLiveTvSettingsPageAutomaticallyCycleThroughFeaturedLiveEvents;

  /// No description provided for @auxLiveTvSettingsPageRotationInterval.
  ///
  /// In en, this message translates to:
  /// **'Rotation Interval'**
  String get auxLiveTvSettingsPageRotationInterval;

  /// No description provided for @auxLiveTvSettingsPageChannelCardSize.
  ///
  /// In en, this message translates to:
  /// **'Channel Card Size'**
  String get auxLiveTvSettingsPageChannelCardSize;

  /// No description provided for @auxLiveTvSettingsPageCardHoverScaleZoom.
  ///
  /// In en, this message translates to:
  /// **'Card Hover Scale Zoom'**
  String get auxLiveTvSettingsPageCardHoverScaleZoom;

  /// No description provided for @auxLiveTvSettingsPageShowLiveHdStreamBadge.
  ///
  /// In en, this message translates to:
  /// **'Show LIVE / HD Stream Badge'**
  String get auxLiveTvSettingsPageShowLiveHdStreamBadge;

  /// No description provided for @auxLiveTvSettingsPageDisplayRadiantLiveBroadcastBadgeOnChannel.
  ///
  /// In en, this message translates to:
  /// **'Display radiant live broadcast badge on channel corners'**
  String get auxLiveTvSettingsPageDisplayRadiantLiveBroadcastBadgeOnChannel;

  /// No description provided for @auxLiveTvSettingsPageShowChannelCategoryTag.
  ///
  /// In en, this message translates to:
  /// **'Show Channel Category Tag'**
  String get auxLiveTvSettingsPageShowChannelCategoryTag;

  /// No description provided for @auxLiveTvSettingsPageShowCategoryLabelBelowChannelName.
  ///
  /// In en, this message translates to:
  /// **'Show category label below channel name'**
  String get auxLiveTvSettingsPageShowCategoryLabelBelowChannelName;

  /// No description provided for @auxLiveTvSettingsPageShowFeedHealthBadge.
  ///
  /// In en, this message translates to:
  /// **'Show Feed Health Badge'**
  String get auxLiveTvSettingsPageShowFeedHealthBadge;

  /// No description provided for @auxLiveTvSettingsPageMarkAChannelAsAliveUncheckedOr.
  ///
  /// In en, this message translates to:
  /// **'Mark a channel as alive, unchecked or dead on the Boxing row'**
  String get auxLiveTvSettingsPageMarkAChannelAsAliveUncheckedOr;

  /// No description provided for @auxLiveTvSettingsPageChannelCategoriesSections.
  ///
  /// In en, this message translates to:
  /// **'Channel Categories & Sections'**
  String get auxLiveTvSettingsPageChannelCategoriesSections;

  /// No description provided for @auxLiveTvSettingsPageToggleVisibilityOfLiveTvRows.
  ///
  /// In en, this message translates to:
  /// **'Toggle visibility of Live TV rows'**
  String get auxLiveTvSettingsPageToggleVisibilityOfLiveTvRows;

  /// No description provided for @auxLiveTvSettingsPageResetAll.
  ///
  /// In en, this message translates to:
  /// **'Reset All'**
  String get auxLiveTvSettingsPageResetAll;

  /// No description provided for @auxLiveTvSettingsPagePortalCardDisplayStyle.
  ///
  /// In en, this message translates to:
  /// **'Portal Card Display Style'**
  String get auxLiveTvSettingsPagePortalCardDisplayStyle;

  /// No description provided for @auxLiveTvSettingsPageShowPortalExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Show Portal Expiry Date'**
  String get auxLiveTvSettingsPageShowPortalExpiryDate;

  /// No description provided for @auxLiveTvSettingsPageDisplaySubscriptionExpirationTagOnPortalCards.
  ///
  /// In en, this message translates to:
  /// **'Display subscription expiration tag on portal cards'**
  String get auxLiveTvSettingsPageDisplaySubscriptionExpirationTagOnPortalCards;

  /// No description provided for @auxLiveTvSettingsPageShowMaxActiveConnectionsTag.
  ///
  /// In en, this message translates to:
  /// **'Show Max Active Connections Tag'**
  String get auxLiveTvSettingsPageShowMaxActiveConnectionsTag;

  /// No description provided for @auxLiveTvSettingsPageDisplayCurrentAndMaxConcurrentStreamingConnections.
  ///
  /// In en, this message translates to:
  /// **'Display current and max concurrent streaming connections'**
  String
  get auxLiveTvSettingsPageDisplayCurrentAndMaxConcurrentStreamingConnections;

  /// No description provided for @auxLiveTvSettingsPageDefaultStartingTab.
  ///
  /// In en, this message translates to:
  /// **'Default Starting Tab'**
  String get auxLiveTvSettingsPageDefaultStartingTab;

  /// No description provided for @auxLiveTvSettingsPageXtreamPanels.
  ///
  /// In en, this message translates to:
  /// **'Xtream Panels'**
  String get auxLiveTvSettingsPageXtreamPanels;

  /// No description provided for @auxLiveTvSettingsPageM3uPlaylists.
  ///
  /// In en, this message translates to:
  /// **'M3U Playlists'**
  String get auxLiveTvSettingsPageM3uPlaylists;

  /// No description provided for @auxLiveTvSettingsPageCategorySidebarWidth.
  ///
  /// In en, this message translates to:
  /// **'Category Sidebar Width'**
  String get auxLiveTvSettingsPageCategorySidebarWidth;

  /// No description provided for @auxLiveTvSettingsPageDisplayChannelPosterAndLogosInStream.
  ///
  /// In en, this message translates to:
  /// **'Display channel poster and logos in stream rows'**
  String get auxLiveTvSettingsPageDisplayChannelPosterAndLogosInStream;

  /// No description provided for @auxLiveTvSettingsPageDisplayCurrentTelevisionGuideTitleBelowChannel.
  ///
  /// In en, this message translates to:
  /// **'Display current television guide title below channel'**
  String
  get auxLiveTvSettingsPageDisplayCurrentTelevisionGuideTitleBelowChannel;

  /// No description provided for @auxLiveTvSettingsPageShowNumberOfAvailableStreamsNextTo.
  ///
  /// In en, this message translates to:
  /// **'Show number of available streams next to category names'**
  String get auxLiveTvSettingsPageShowNumberOfAvailableStreamsNextTo;

  /// No description provided for @auxLiveTvSettingsPageIncludeFreePublicSources.
  ///
  /// In en, this message translates to:
  /// **'Include Free Public Sources'**
  String get auxLiveTvSettingsPageIncludeFreePublicSources;

  /// No description provided for @auxMangaSettingsPageEnableMovingAmbientLighting.
  ///
  /// In en, this message translates to:
  /// **'Enable Moving Ambient Lighting'**
  String get auxMangaSettingsPageEnableMovingAmbientLighting;

  /// No description provided for @auxMangaSettingsPageDisplayYourActiveReadingHistoryAtThe.
  ///
  /// In en, this message translates to:
  /// **'Display your active reading history at the top of the Manga page'**
  String get auxMangaSettingsPageDisplayYourActiveReadingHistoryAtThe;

  /// No description provided for @auxMangaSettingsPageMangaPosterCardDensity.
  ///
  /// In en, this message translates to:
  /// **'Manga Poster Card Density'**
  String get auxMangaSettingsPageMangaPosterCardDensity;

  /// No description provided for @auxMangaSettingsPageShowContentTypeBadgeMangaManhwa.
  ///
  /// In en, this message translates to:
  /// **'Show Content Type Badge (Manga/Manhwa)'**
  String get auxMangaSettingsPageShowContentTypeBadgeMangaManhwa;

  /// No description provided for @auxMangaSettingsPageShowPublicationYearOnCards.
  ///
  /// In en, this message translates to:
  /// **'Show Publication Year on Cards'**
  String get auxMangaSettingsPageShowPublicationYearOnCards;

  /// No description provided for @auxMangaSettingsPagePosterCardHoverGlowEffect.
  ///
  /// In en, this message translates to:
  /// **'Poster Card Hover Glow Effect'**
  String get auxMangaSettingsPagePosterCardHoverGlowEffect;

  /// No description provided for @auxMangaSettingsPageShowDesktopScrollTrack.
  ///
  /// In en, this message translates to:
  /// **'Show Desktop Scroll Track'**
  String get auxMangaSettingsPageShowDesktopScrollTrack;

  /// No description provided for @auxMangaSettingsPageDefaultReadingMode.
  ///
  /// In en, this message translates to:
  /// **'Default Reading Mode'**
  String get auxMangaSettingsPageDefaultReadingMode;

  /// No description provided for @auxMangaSettingsPageControlToolbarStyle.
  ///
  /// In en, this message translates to:
  /// **'Control Toolbar Style'**
  String get auxMangaSettingsPageControlToolbarStyle;

  /// No description provided for @auxMangaSettingsPageVerticalPageGap.
  ///
  /// In en, this message translates to:
  /// **'Vertical Page Gap'**
  String get auxMangaSettingsPageVerticalPageGap;

  /// No description provided for @auxMangaSettingsPageShowPageDeckThumbnailPreviews.
  ///
  /// In en, this message translates to:
  /// **'Show Page Deck / Thumbnail Previews'**
  String get auxMangaSettingsPageShowPageDeckThumbnailPreviews;

  /// No description provided for @auxMangaSettingsPageInteractiveVisualTrayOfThumbnailPreviewsFor.
  ///
  /// In en, this message translates to:
  /// **'Interactive visual tray of thumbnail previews for instant page jumping'**
  String get auxMangaSettingsPageInteractiveVisualTrayOfThumbnailPreviewsFor;

  /// No description provided for @auxMangaSettingsPageShowPageScrubberSlider.
  ///
  /// In en, this message translates to:
  /// **'Show Page Scrubber Slider'**
  String get auxMangaSettingsPageShowPageScrubberSlider;

  /// No description provided for @auxMangaSettingsPageEnableNextChapterPreviewCardDeck.
  ///
  /// In en, this message translates to:
  /// **'Enable Next Chapter Preview Card Deck'**
  String get auxMangaSettingsPageEnableNextChapterPreviewCardDeck;

  /// No description provided for @auxMangaSettingsPageRichGlassDeckCardAtTheEnd.
  ///
  /// In en, this message translates to:
  /// **'Rich glass deck card at the end of each chapter with chapter art and direct launch'**
  String get auxMangaSettingsPageRichGlassDeckCardAtTheEnd;

  /// No description provided for @auxMusicPlayerStudioPageCustomMusicPlayerStudio.
  ///
  /// In en, this message translates to:
  /// **'Custom Music Player Studio'**
  String get auxMusicPlayerStudioPageCustomMusicPlayerStudio;

  /// No description provided for @auxMusicPlayerStudioPageDesignTheFullscreenPlayerDragComponentsCustomize.
  ///
  /// In en, this message translates to:
  /// **'Design the fullscreen player, drag components, customize physics & liquid glass'**
  String
  get auxMusicPlayerStudioPageDesignTheFullscreenPlayerDragComponentsCustomize;

  /// No description provided for @auxMusicPlayerStudioPageApplyActive.
  ///
  /// In en, this message translates to:
  /// **'Apply Active'**
  String get auxMusicPlayerStudioPageApplyActive;

  /// No description provided for @auxMusicPlayerStudioPageCustomFullscreenPlayerStudioLayoutSetAs.
  ///
  /// In en, this message translates to:
  /// **'Custom Fullscreen Player Studio layout set as active player!'**
  String get auxMusicPlayerStudioPageCustomFullscreenPlayerStudioLayoutSetAs;

  /// No description provided for @auxMusicPlayerStudioPageFullscreenLiveStudio.
  ///
  /// In en, this message translates to:
  /// **'FULLSCREEN LIVE STUDIO'**
  String get auxMusicPlayerStudioPageFullscreenLiveStudio;

  /// No description provided for @auxMusicPlayerStudioPageFlac24Bit96khzLossless.
  ///
  /// In en, this message translates to:
  /// **'FLAC 24-BIT / 96KHZ LOSSLESS'**
  String get auxMusicPlayerStudioPageFlac24Bit96khzLossless;

  /// No description provided for @auxMusicPlayerStudioPageSyncedLyricsSandbox.
  ///
  /// In en, this message translates to:
  /// **'Synced Lyrics Sandbox'**
  String get auxMusicPlayerStudioPageSyncedLyricsSandbox;

  /// No description provided for @auxMusicPlayerStudioPagePlayingQueueSandbox4Tracks.
  ///
  /// In en, this message translates to:
  /// **'Playing Queue Sandbox (4 Tracks)'**
  String get auxMusicPlayerStudioPagePlayingQueueSandbox4Tracks;

  /// No description provided for @auxMusicPlayerStudioPageFullscreenPlayerDragDropArranger.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen Player Drag & Drop Arranger'**
  String get auxMusicPlayerStudioPageFullscreenPlayerDragDropArranger;

  /// No description provided for @auxMusicPlayerStudioPageHoldAndDragAnyBlockToReorder.
  ///
  /// In en, this message translates to:
  /// **'Hold and drag any block to reorder the layout of your fullscreen player in real-time.'**
  String get auxMusicPlayerStudioPageHoldAndDragAnyBlockToReorder;

  /// No description provided for @auxMusicPlayerStudioPageSeekBarCanvasScrubberEngine.
  ///
  /// In en, this message translates to:
  /// **'Seek Bar Canvas Scrubber Engine'**
  String get auxMusicPlayerStudioPageSeekBarCanvasScrubberEngine;

  /// No description provided for @auxMusicPlayerStudioPageSelectHowAudioWaveformsAndScrubbingTracks.
  ///
  /// In en, this message translates to:
  /// **'Select how audio waveforms and scrubbing tracks render across your music player.'**
  String get auxMusicPlayerStudioPageSelectHowAudioWaveformsAndScrubbingTracks;

  /// No description provided for @auxMusicPlayerStudioPagePlayButtonAestheticStyle.
  ///
  /// In en, this message translates to:
  /// **'Play Button Aesthetic & Style'**
  String get auxMusicPlayerStudioPagePlayButtonAestheticStyle;

  /// No description provided for @auxMusicPlayerStudioPageHoverTouchPhysicsEngine.
  ///
  /// In en, this message translates to:
  /// **'Hover & Touch Physics Engine'**
  String get auxMusicPlayerStudioPageHoverTouchPhysicsEngine;

  /// No description provided for @auxMusicPlayerStudioPageSelectTheInteractivePhysicsFeedbackAppliedWhen.
  ///
  /// In en, this message translates to:
  /// **'Select the interactive physics feedback applied when hovering or pressing controls.'**
  String
  get auxMusicPlayerStudioPageSelectTheInteractivePhysicsFeedbackAppliedWhen;

  /// No description provided for @auxMusicPlayerStudioPageLivePhysicsTestingPad.
  ///
  /// In en, this message translates to:
  /// **'Live Physics Testing Pad'**
  String get auxMusicPlayerStudioPageLivePhysicsTestingPad;

  /// No description provided for @auxMusicPlayerStudioPageArtworkTurntablePresentation.
  ///
  /// In en, this message translates to:
  /// **'Artwork & Turntable Presentation'**
  String get auxMusicPlayerStudioPageArtworkTurntablePresentation;

  /// No description provided for @auxMusicPlayerStudioPageSelectHowAlbumCoversVinylTurntableAnimations.
  ///
  /// In en, this message translates to:
  /// **'Select how album covers, vinyl turntable animations, and cards display in the player.'**
  String
  get auxMusicPlayerStudioPageSelectHowAlbumCoversVinylTurntableAnimations;

  /// No description provided for @auxMusicSettingsPageMusicUiPlayerAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Music UI & Player Atmosphere'**
  String get auxMusicSettingsPageMusicUiPlayerAtmosphere;

  /// No description provided for @auxMusicSettingsPageMovingBackgroundAmbientLighting.
  ///
  /// In en, this message translates to:
  /// **'Moving Background Ambient Lighting'**
  String get auxMusicSettingsPageMovingBackgroundAmbientLighting;

  /// No description provided for @auxMusicSettingsPageDynamicMovingGlowingOrbsReactingWithYour.
  ///
  /// In en, this message translates to:
  /// **'Dynamic moving glowing orbs reacting with your theme accent colors'**
  String get auxMusicSettingsPageDynamicMovingGlowingOrbsReactingWithYour;

  /// No description provided for @auxMusicSettingsPageAmbientLightPattern.
  ///
  /// In en, this message translates to:
  /// **'Ambient Light Pattern'**
  String get auxMusicSettingsPageAmbientLightPattern;

  /// No description provided for @auxMusicSettingsPageShowHeroSpotlightShowcase.
  ///
  /// In en, this message translates to:
  /// **'Show Hero Spotlight Showcase'**
  String get auxMusicSettingsPageShowHeroSpotlightShowcase;

  /// No description provided for @auxMusicSettingsPageFeaturedBestsellingAlbumTrackShowcaseAtThe.
  ///
  /// In en, this message translates to:
  /// **'Featured bestselling album & track showcase at the top of the music page'**
  String get auxMusicSettingsPageFeaturedBestsellingAlbumTrackShowcaseAtThe;

  /// No description provided for @auxMusicSettingsPageShowLosslessHiResAudioBadges.
  ///
  /// In en, this message translates to:
  /// **'Show Lossless Hi-Res Audio Badges'**
  String get auxMusicSettingsPageShowLosslessHiResAudioBadges;

  /// No description provided for @auxMusicSettingsPageDisplaysFlacHiResLosslessStreamIndicators.
  ///
  /// In en, this message translates to:
  /// **'Displays FLAC / Hi-Res lossless stream indicators on music cards and player'**
  String get auxMusicSettingsPageDisplaysFlacHiResLosslessStreamIndicators;

  /// No description provided for @auxMusicSettingsPageMusicCardGridDensity.
  ///
  /// In en, this message translates to:
  /// **'Music Card & Grid Density'**
  String get auxMusicSettingsPageMusicCardGridDensity;

  /// No description provided for @auxMusicSettingsPageFullPlayerEngine.
  ///
  /// In en, this message translates to:
  /// **'FULL PLAYER ENGINE'**
  String get auxMusicSettingsPageFullPlayerEngine;

  /// No description provided for @auxMusicSettingsPageCustomizeTheFullscreenPlayerDragDropBlocks.
  ///
  /// In en, this message translates to:
  /// **'Customize the Fullscreen Player. Drag & drop blocks, waveform equalizers, vinyl turntable & liquid glass buttons.'**
  String get auxMusicSettingsPageCustomizeTheFullscreenPlayerDragDropBlocks;

  /// No description provided for @auxMusicSettingsPageLiveWaveformControlsPreview.
  ///
  /// In en, this message translates to:
  /// **'Live Waveform & Controls Preview'**
  String get auxMusicSettingsPageLiveWaveformControlsPreview;

  /// No description provided for @auxMusicSettingsPageOpenFullStudio.
  ///
  /// In en, this message translates to:
  /// **'Open Full Studio ➔'**
  String get auxMusicSettingsPageOpenFullStudio;

  /// No description provided for @auxMangaReaderControlsReaderAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Reader Atmosphere:'**
  String get auxMangaReaderControlsReaderAtmosphere;

  /// No description provided for @auxLiveGuideBandUpcomingOnThisChannel.
  ///
  /// In en, this message translates to:
  /// **'Upcoming On This Channel'**
  String get auxLiveGuideBandUpcomingOnThisChannel;

  /// No description provided for @auxLiveGuideBandNothingElseListedForThisChannel.
  ///
  /// In en, this message translates to:
  /// **'Nothing else listed for this channel.'**
  String get auxLiveGuideBandNothingElseListedForThisChannel;

  /// No description provided for @auxLiveGuideBandNoProgrammeGuideForThisChannelYet.
  ///
  /// In en, this message translates to:
  /// **'No programme guide for this channel yet.'**
  String get auxLiveGuideBandNoProgrammeGuideForThisChannelYet;

  /// No description provided for @auxLiveGuideBandFindLiveStreams.
  ///
  /// In en, this message translates to:
  /// **'Find Live Streams'**
  String get auxLiveGuideBandFindLiveStreams;

  /// No description provided for @auxLiveGuideBandWatchLiveStream.
  ///
  /// In en, this message translates to:
  /// **'Watch Live Stream'**
  String get auxLiveGuideBandWatchLiveStream;

  /// No description provided for @auxComicReaderViewZoomOutCtrl.
  ///
  /// In en, this message translates to:
  /// **'Zoom Out (Ctrl -)'**
  String get auxComicReaderViewZoomOutCtrl;

  /// No description provided for @auxComicReaderViewZoomInCtrl.
  ///
  /// In en, this message translates to:
  /// **'Zoom In (Ctrl +)'**
  String get auxComicReaderViewZoomInCtrl;

  /// No description provided for @auxComicReaderViewResetZoom100.
  ///
  /// In en, this message translates to:
  /// **'Reset Zoom (100%)'**
  String get auxComicReaderViewResetZoom100;

  /// No description provided for @auxFocusModeViewFocusModeActive.
  ///
  /// In en, this message translates to:
  /// **'Focus Mode Active'**
  String get auxFocusModeViewFocusModeActive;

  /// No description provided for @auxFocusModeViewExitFocusMode.
  ///
  /// In en, this message translates to:
  /// **'Exit Focus Mode'**
  String get auxFocusModeViewExitFocusMode;

  /// No description provided for @auxFocusModeViewExitEsc.
  ///
  /// In en, this message translates to:
  /// **'Exit (Esc)'**
  String get auxFocusModeViewExitEsc;

  /// No description provided for @auxFocusModeViewTapAboveBelowToMoveKeysTo.
  ///
  /// In en, this message translates to:
  /// **'Tap above/below to move · ↑ ↓ keys to navigate'**
  String get auxFocusModeViewTapAboveBelowToMoveKeysTo;

  /// No description provided for @auxFocusModeViewPreviousLineUpArrow.
  ///
  /// In en, this message translates to:
  /// **'Previous Line (Up Arrow)'**
  String get auxFocusModeViewPreviousLineUpArrow;

  /// No description provided for @auxFocusModeViewNextLineDownArrowSpace.
  ///
  /// In en, this message translates to:
  /// **'Next Line (Down Arrow / Space)'**
  String get auxFocusModeViewNextLineDownArrowSpace;

  /// No description provided for @auxReaderCustomizationSheetAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get auxReaderCustomizationSheetAppearance;

  /// No description provided for @auxReaderCustomizationSheetLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get auxReaderCustomizationSheetLight;

  /// No description provided for @auxReaderCustomizationSheetSepia.
  ///
  /// In en, this message translates to:
  /// **'Sepia'**
  String get auxReaderCustomizationSheetSepia;

  /// No description provided for @auxReaderCustomizationSheetDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get auxReaderCustomizationSheetDark;

  /// No description provided for @auxReaderCustomizationSheetContinuousScroll.
  ///
  /// In en, this message translates to:
  /// **'Continuous Scroll'**
  String get auxReaderCustomizationSheetContinuousScroll;

  /// No description provided for @auxReaderCustomizationSheetPaginatedTurns.
  ///
  /// In en, this message translates to:
  /// **'Paginated Turns'**
  String get auxReaderCustomizationSheetPaginatedTurns;

  /// No description provided for @dynamicAnimeCardEps.
  ///
  /// In en, this message translates to:
  /// **'{v1} EPS'**
  String dynamicAnimeCardEps(String v1);

  /// No description provided for @dynamicMultinutzChannelSheetCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied: {v1}'**
  String dynamicMultinutzChannelSheetCopied(String v1);

  /// No description provided for @dynamicMultinutzChannelSheetExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires: {v1}'**
  String dynamicMultinutzChannelSheetExpires(String v1);

  /// No description provided for @dynamicMultinutzChannelSheetConnections.
  ///
  /// In en, this message translates to:
  /// **'Connections: {v1}/{v2}'**
  String dynamicMultinutzChannelSheetConnections(String v1, String v2);

  /// No description provided for @dynamicMultinutzChannelSheetLiveChannels.
  ///
  /// In en, this message translates to:
  /// **'{v1} live channels'**
  String dynamicMultinutzChannelSheetLiveChannels(String v1);

  /// No description provided for @dynamicMultinutzChannelSheetChannels.
  ///
  /// In en, this message translates to:
  /// **'{v1} channels'**
  String dynamicMultinutzChannelSheetChannels(String v1);

  /// No description provided for @dynamicPlayerEpisodesPanelEpisodes.
  ///
  /// In en, this message translates to:
  /// **'{v1} • {v2} Episodes'**
  String dynamicPlayerEpisodesPanelEpisodes(String v1, String v2);

  /// No description provided for @dynamicPlayerEpisodesPanelEp.
  ///
  /// In en, this message translates to:
  /// **'EP {v1}'**
  String dynamicPlayerEpisodesPanelEp(String v1);

  /// No description provided for @dynamicPlayerSourcesPanelEpisode.
  ///
  /// In en, this message translates to:
  /// **'Episode {v1}'**
  String dynamicPlayerSourcesPanelEpisode(String v1);

  /// No description provided for @dynamicPlayerSourcesPanelSE.
  ///
  /// In en, this message translates to:
  /// **'S{v1} : E{v2}'**
  String dynamicPlayerSourcesPanelSE(String v1, String v2);

  /// No description provided for @dynamicPlayerSourcesPanelAllProvidersWatchingVia.
  ///
  /// In en, this message translates to:
  /// **'All providers · watching via {v1}'**
  String dynamicPlayerSourcesPanelAllProvidersWatchingVia(String v1);

  /// No description provided for @dynamicTextSyncOverlayErrorSavingSync.
  ///
  /// In en, this message translates to:
  /// **'Error saving sync: {v1}'**
  String dynamicTextSyncOverlayErrorSavingSync(String v1);

  /// No description provided for @dynamicMagnetFilesView.
  ///
  /// In en, this message translates to:
  /// **'{v1} {v2}'**
  String dynamicMagnetFilesView(String v1, String v2);

  /// No description provided for @dynamicMagnetFilesView2.
  ///
  /// In en, this message translates to:
  /// **'{v1} {v2}'**
  String dynamicMagnetFilesView2(String v1, String v2);

  /// No description provided for @dynamicUpdateDialogVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {v1}'**
  String dynamicUpdateDialogVersion(String v1);

  /// No description provided for @dynamicUpdateDialogDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Download failed: {v1}'**
  String dynamicUpdateDialogDownloadFailed(String v1);

  /// No description provided for @dynamicWewatchQuizPage3Rated.
  ///
  /// In en, this message translates to:
  /// **'{v1}/3 rated'**
  String dynamicWewatchQuizPage3Rated(String v1);

  /// No description provided for @dynamicWewatchQuizPageCinemaPicksTailoredToYourTaste.
  ///
  /// In en, this message translates to:
  /// **'{v1} cinema picks tailored to your taste profile'**
  String dynamicWewatchQuizPageCinemaPicksTailoredToYourTaste(String v1);

  /// No description provided for @dynamicWewatchQuizPageMatch.
  ///
  /// In en, this message translates to:
  /// **'{v1}% match'**
  String dynamicWewatchQuizPageMatch(String v1);

  /// No description provided for @dynamicAnimeDetailsPageEp.
  ///
  /// In en, this message translates to:
  /// **'{v1} Ep{v2}'**
  String dynamicAnimeDetailsPageEp(String v1, String v2);

  /// No description provided for @dynamicAnimePageEpisode.
  ///
  /// In en, this message translates to:
  /// **'Episode {v1}'**
  String dynamicAnimePageEpisode(String v1);

  /// No description provided for @dynamicAnimePageCurrentlyAiringHits.
  ///
  /// In en, this message translates to:
  /// **'Currently airing hits · {v1}'**
  String dynamicAnimePageCurrentlyAiringHits(String v1);

  /// No description provided for @dynamicAnimeSearchPageSort.
  ///
  /// In en, this message translates to:
  /// **'Sort: {v1}'**
  String dynamicAnimeSearchPageSort(String v1);

  /// No description provided for @dynamicAnimeStreamSheetEpisode.
  ///
  /// In en, this message translates to:
  /// **'{v1} - Episode {v2}'**
  String dynamicAnimeStreamSheetEpisode(String v1, String v2);

  /// No description provided for @dynamicAnimeStreamSheetEp.
  ///
  /// In en, this message translates to:
  /// **'{v1} • Ep {v2}'**
  String dynamicAnimeStreamSheetEp(String v1, String v2);

  /// No description provided for @dynamicAnimeStreamSheetNoSourcesFound.
  ///
  /// In en, this message translates to:
  /// **'No {v1} sources found.'**
  String dynamicAnimeStreamSheetNoSourcesFound(String v1);

  /// No description provided for @dynamicAnimeArabicDetailsPageWatchEpisode.
  ///
  /// In en, this message translates to:
  /// **'Watch episode {v1}'**
  String dynamicAnimeArabicDetailsPageWatchEpisode(String v1);

  /// No description provided for @dynamicAnimeArabicDetailsPageEp.
  ///
  /// In en, this message translates to:
  /// **'EP {v1}'**
  String dynamicAnimeArabicDetailsPageEp(String v1);

  /// No description provided for @dynamicAnimeArabicStreamSheetEpisode.
  ///
  /// In en, this message translates to:
  /// **'{v1} - Episode {v2}'**
  String dynamicAnimeArabicStreamSheetEpisode(String v1, String v2);

  /// No description provided for @dynamicAudiobooksPageLeft.
  ///
  /// In en, this message translates to:
  /// **'{v1} left'**
  String dynamicAudiobooksPageLeft(String v1);

  /// No description provided for @dynamicAudiobooksPageLocal.
  ///
  /// In en, this message translates to:
  /// **'{v1} • Local'**
  String dynamicAudiobooksPageLocal(String v1);

  /// No description provided for @dynamicAudiobooksPageCompleted.
  ///
  /// In en, this message translates to:
  /// **'{v1}% completed'**
  String dynamicAudiobooksPageCompleted(String v1);

  /// No description provided for @dynamicAudiobookPlayerScreenChapterOf.
  ///
  /// In en, this message translates to:
  /// **'Chapter {v1} of {v2} • {v3}'**
  String dynamicAudiobookPlayerScreenChapterOf(String v1, String v2, String v3);

  /// No description provided for @dynamicAudiobookPlayerScreenChapters.
  ///
  /// In en, this message translates to:
  /// **'{v1} CHAPTERS'**
  String dynamicAudiobookPlayerScreenChapters(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenGenerationFailed.
  ///
  /// In en, this message translates to:
  /// **'Generation failed: {v1}'**
  String dynamicGenerateAudiobookScreenGenerationFailed(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenRemoveFromTheGenerationList.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{v1}\" from the generation list?'**
  String dynamicGenerateAudiobookScreenRemoveFromTheGenerationList(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenSelectedAudioFileS.
  ///
  /// In en, this message translates to:
  /// **'Selected {v1} audio file(s):'**
  String dynamicGenerateAudiobookScreenSelectedAudioFileS(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenGenerationQueueCompleted.
  ///
  /// In en, this message translates to:
  /// **'GENERATION QUEUE & COMPLETED ({v1})'**
  String dynamicGenerateAudiobookScreenGenerationQueueCompleted(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenDownloadedBooksFromLibrary.
  ///
  /// In en, this message translates to:
  /// **'DOWNLOADED BOOKS FROM LIBRARY ({v1})'**
  String dynamicGenerateAudiobookScreenDownloadedBooksFromLibrary(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenSizeMb.
  ///
  /// In en, this message translates to:
  /// **'Size: {v1} MB'**
  String dynamicGenerateAudiobookScreenSizeMb(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenVoice.
  ///
  /// In en, this message translates to:
  /// **'Voice: {v1}'**
  String dynamicGenerateAudiobookScreenVoice(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenImportedAudiobooks.
  ///
  /// In en, this message translates to:
  /// **'IMPORTED AUDIOBOOKS ({v1})'**
  String dynamicGenerateAudiobookScreenImportedAudiobooks(String v1);

  /// No description provided for @dynamicGenerateAudiobookScreenPartSMb.
  ///
  /// In en, this message translates to:
  /// **'{v1} • {v2} part(s) ({v3} MB)'**
  String dynamicGenerateAudiobookScreenPartSMb(String v1, String v2, String v3);

  /// No description provided for @dynamicGenerateAudiobookScreenDeleteFromYourLibrary.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{v1}\" from your library?'**
  String dynamicGenerateAudiobookScreenDeleteFromYourLibrary(String v1);

  /// No description provided for @dynamicBookDetailSheetFailedToDownloadBook.
  ///
  /// In en, this message translates to:
  /// **'Failed to download book: {v1}'**
  String dynamicBookDetailSheetFailedToDownloadBook(String v1);

  /// No description provided for @dynamicBookDetailSheetCompleted.
  ///
  /// In en, this message translates to:
  /// **'{v1}% Completed'**
  String dynamicBookDetailSheetCompleted(String v1);

  /// No description provided for @dynamicEpubReaderPageChOf.
  ///
  /// In en, this message translates to:
  /// **'Ch. {v1} of {v2}'**
  String dynamicEpubReaderPageChOf(String v1, String v2);

  /// No description provided for @dynamicEpubReaderPageMinLeft.
  ///
  /// In en, this message translates to:
  /// **'{v1}% · ~{v2} min left'**
  String dynamicEpubReaderPageMinLeft(String v1, String v2);

  /// No description provided for @dynamicPdfReaderPagePageOf.
  ///
  /// In en, this message translates to:
  /// **'Page {v1} of {v2}'**
  String dynamicPdfReaderPagePageOf(String v1, String v2);

  /// No description provided for @dynamicDiscoverPageSelect.
  ///
  /// In en, this message translates to:
  /// **'Select {v1}{v2}'**
  String dynamicDiscoverPageSelect(String v1, String v2);

  /// No description provided for @dynamicDiscoverPageEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter {v1}'**
  String dynamicDiscoverPageEnter(String v1);

  /// No description provided for @dynamicDiscoverPageTypeHere.
  ///
  /// In en, this message translates to:
  /// **'Type {v1} here...'**
  String dynamicDiscoverPageTypeHere(String v1);

  /// No description provided for @dynamicDiscoverPageAll.
  ///
  /// In en, this message translates to:
  /// **'All {v1}'**
  String dynamicDiscoverPageAll(String v1);

  /// No description provided for @dynamicDiscoverPageBy.
  ///
  /// In en, this message translates to:
  /// **'by {v1}'**
  String dynamicDiscoverPageBy(String v1);

  /// No description provided for @dynamicDiscoverPageNoResultsFoundFor.
  ///
  /// In en, this message translates to:
  /// **'No results found for \"{v1}\"'**
  String dynamicDiscoverPageNoResultsFoundFor(String v1);

  /// No description provided for @dynamicDownloadsPagePeers.
  ///
  /// In en, this message translates to:
  /// **'{v1} peers'**
  String dynamicDownloadsPagePeers(String v1);

  /// No description provided for @dynamicDownloadsPageFolder.
  ///
  /// In en, this message translates to:
  /// **'Folder: {v1}'**
  String dynamicDownloadsPageFolder(String v1);

  /// No description provided for @dynamicDownloadsPagePath.
  ///
  /// In en, this message translates to:
  /// **'Path: {v1}'**
  String dynamicDownloadsPagePath(String v1);

  /// No description provided for @dynamicDownloadsPageDeviceStorageUsedOf.
  ///
  /// In en, this message translates to:
  /// **'Device Storage: {v1} Used of {v2}'**
  String dynamicDownloadsPageDeviceStorageUsedOf(String v1, String v2);

  /// No description provided for @dynamicDownloadsPageFree.
  ///
  /// In en, this message translates to:
  /// **'{v1} Free'**
  String dynamicDownloadsPageFree(String v1);

  /// No description provided for @dynamicIptvChannelSheetRemovedStreamFeed.
  ///
  /// In en, this message translates to:
  /// **'Removed {v1} stream feed{v2}'**
  String dynamicIptvChannelSheetRemovedStreamFeed(String v1, String v2);

  /// No description provided for @dynamicIptvChannelSheetSearchChannelsEG1080p4k.
  ///
  /// In en, this message translates to:
  /// **'Search {v1} channels (e.g. 1080p, 4K, feed name)...'**
  String dynamicIptvChannelSheetSearchChannelsEG1080p4k(String v1);

  /// No description provided for @dynamicIptvChannelSheetDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete ({v1})'**
  String dynamicIptvChannelSheetDelete(String v1);

  /// No description provided for @dynamicIptvChannelSheetNoFeedsMatch.
  ///
  /// In en, this message translates to:
  /// **'No feeds match \"{v1}\"'**
  String dynamicIptvChannelSheetNoFeedsMatch(String v1);

  /// No description provided for @dynamicIptvPageChannels.
  ///
  /// In en, this message translates to:
  /// **'{v1} CHANNELS'**
  String dynamicIptvPageChannels(String v1);

  /// No description provided for @dynamicIptvPortalsModalRemovedPortal.
  ///
  /// In en, this message translates to:
  /// **'Removed {v1} portal{v2}'**
  String dynamicIptvPortalsModalRemovedPortal(String v1, String v2);

  /// No description provided for @dynamicIptvPortalsModalRemovedAllPortals.
  ///
  /// In en, this message translates to:
  /// **'Removed all {v1} portals'**
  String dynamicIptvPortalsModalRemovedAllPortals(String v1);

  /// No description provided for @dynamicIptvPortalsModalRemovedPlaylist.
  ///
  /// In en, this message translates to:
  /// **'Removed {v1} playlist{v2}'**
  String dynamicIptvPortalsModalRemovedPlaylist(String v1, String v2);

  /// No description provided for @dynamicIptvPortalsModalRemovedAllPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Removed all {v1} playlists'**
  String dynamicIptvPortalsModalRemovedAllPlaylists(String v1);

  /// No description provided for @dynamicIptvPortalsModalDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete ({v1})'**
  String dynamicIptvPortalsModalDelete(String v1);

  /// No description provided for @dynamicIptvPortalsModalCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied: {v1}'**
  String dynamicIptvPortalsModalCopied(String v1);

  /// No description provided for @dynamicIptvPortalsModalExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires: {v1}'**
  String dynamicIptvPortalsModalExpires(String v1);

  /// No description provided for @dynamicIptvPortalsModalConnections.
  ///
  /// In en, this message translates to:
  /// **'Connections: {v1}/{v2}'**
  String dynamicIptvPortalsModalConnections(String v1, String v2);

  /// No description provided for @dynamicIptvPortalsModalCh.
  ///
  /// In en, this message translates to:
  /// **'{v1} ch'**
  String dynamicIptvPortalsModalCh(String v1);

  /// No description provided for @dynamicIptvPortalBrowserPageCols.
  ///
  /// In en, this message translates to:
  /// **'{v1} Cols'**
  String dynamicIptvPortalBrowserPageCols(String v1);

  /// No description provided for @dynamicIptvPortalBrowserPageTotal.
  ///
  /// In en, this message translates to:
  /// **'{v1} total'**
  String dynamicIptvPortalBrowserPageTotal(String v1);

  /// No description provided for @dynamicIptvPortalBrowserPageExpiry.
  ///
  /// In en, this message translates to:
  /// **'Expiry: {v1}'**
  String dynamicIptvPortalBrowserPageExpiry(String v1);

  /// No description provided for @dynamicIptvPortalBrowserPageConnections.
  ///
  /// In en, this message translates to:
  /// **'Connections: {v1}/{v2}'**
  String dynamicIptvPortalBrowserPageConnections(String v1, String v2);

  /// No description provided for @dynamicIptvPortalBrowserPageConn.
  ///
  /// In en, this message translates to:
  /// **'Conn: {v1}/{v2} • {v3}'**
  String dynamicIptvPortalBrowserPageConn(String v1, String v2, String v3);

  /// No description provided for @dynamicMangaDetailsPagePageOf.
  ///
  /// In en, this message translates to:
  /// **'Page {v1} of {v2}'**
  String dynamicMangaDetailsPagePageOf(String v1, String v2);

  /// No description provided for @dynamicMangaReaderPagePageOf.
  ///
  /// In en, this message translates to:
  /// **'Page {v1} of {v2}'**
  String dynamicMangaReaderPagePageOf(String v1, String v2);

  /// No description provided for @dynamicMangaReaderPagePage.
  ///
  /// In en, this message translates to:
  /// **'Page {v1} / {v2}'**
  String dynamicMangaReaderPagePage(String v1, String v2);

  /// No description provided for @dynamicMultinutzPageStreamUrlFor.
  ///
  /// In en, this message translates to:
  /// **'Stream URL for {v1}'**
  String dynamicMultinutzPageStreamUrlFor(String v1);

  /// No description provided for @dynamicMultinutzPageStream.
  ///
  /// In en, this message translates to:
  /// **'{v1} Stream{v2}'**
  String dynamicMultinutzPageStream(String v1, String v2);

  /// No description provided for @dynamicMusicPageTracks.
  ///
  /// In en, this message translates to:
  /// **'{v1} tracks'**
  String dynamicMusicPageTracks(String v1);

  /// No description provided for @dynamicMusicPageTracks2.
  ///
  /// In en, this message translates to:
  /// **'Tracks ({v1})'**
  String dynamicMusicPageTracks2(String v1);

  /// No description provided for @dynamicMusicPageArtists.
  ///
  /// In en, this message translates to:
  /// **'Artists ({v1})'**
  String dynamicMusicPageArtists(String v1);

  /// No description provided for @dynamicMusicPageAlbums.
  ///
  /// In en, this message translates to:
  /// **'Albums ({v1})'**
  String dynamicMusicPageAlbums(String v1);

  /// No description provided for @dynamicMusicPagePlaylists.
  ///
  /// In en, this message translates to:
  /// **'Playlists ({v1})'**
  String dynamicMusicPagePlaylists(String v1);

  /// No description provided for @dynamicMusicPageFavouriteTracks.
  ///
  /// In en, this message translates to:
  /// **'{v1} favourite tracks'**
  String dynamicMusicPageFavouriteTracks(String v1);

  /// No description provided for @dynamicMusicPageQueue.
  ///
  /// In en, this message translates to:
  /// **'Queue ({v1})'**
  String dynamicMusicPageQueue(String v1);

  /// No description provided for @dynamicMusicPageOfflineTracksMb.
  ///
  /// In en, this message translates to:
  /// **'{v1} offline tracks • {v2} MB'**
  String dynamicMusicPageOfflineTracksMb(String v1, String v2);

  /// No description provided for @dynamicMusicPageDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading {v1}%'**
  String dynamicMusicPageDownloading(String v1);

  /// No description provided for @dynamicMusicPageAddedToDownloadQueue.
  ///
  /// In en, this message translates to:
  /// **'Added \"{v1}\" to download queue'**
  String dynamicMusicPageAddedToDownloadQueue(String v1);

  /// No description provided for @dynamicMusicPageAddedTracksFromToDownloadQueue.
  ///
  /// In en, this message translates to:
  /// **'Added {v1} tracks from \"{v2}\" to download queue'**
  String dynamicMusicPageAddedTracksFromToDownloadQueue(String v1, String v2);

  /// No description provided for @dynamicMusicPageCuratedByTracks.
  ///
  /// In en, this message translates to:
  /// **'Curated by {v1} • {v2} tracks'**
  String dynamicMusicPageCuratedByTracks(String v1, String v2);

  /// No description provided for @dynamicMusicPageAddedTracksFromToDownloadQueue2.
  ///
  /// In en, this message translates to:
  /// **'Added {v1} tracks from \"{v2}\" to download queue'**
  String dynamicMusicPageAddedTracksFromToDownloadQueue2(String v1, String v2);

  /// No description provided for @dynamicMusicPageCustomPlaylistTracks.
  ///
  /// In en, this message translates to:
  /// **'Custom Playlist • {v1} tracks'**
  String dynamicMusicPageCustomPlaylistTracks(String v1);

  /// No description provided for @dynamicMusicPageOfflineTracksMbStorage.
  ///
  /// In en, this message translates to:
  /// **'{v1} offline tracks • {v2} MB storage'**
  String dynamicMusicPageOfflineTracksMbStorage(String v1, String v2);

  /// No description provided for @dynamicMusicPageDeleteFromOfflineStorage.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{v1}\" from offline storage?'**
  String dynamicMusicPageDeleteFromOfflineStorage(String v1);

  /// No description provided for @dynamicMusicPageInQueue.
  ///
  /// In en, this message translates to:
  /// **'{v1} in queue'**
  String dynamicMusicPageInQueue(String v1);

  /// No description provided for @dynamicPlayerScreenAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio {v1}'**
  String dynamicPlayerScreenAudio(String v1);

  /// No description provided for @dynamicAboutSettingsPageVersionNextGenStreamingHub.
  ///
  /// In en, this message translates to:
  /// **'Version {v1} • Next-Gen Streaming Hub'**
  String dynamicAboutSettingsPageVersionNextGenStreamingHub(String v1);

  /// No description provided for @dynamicAddonsSettingsPageConnectedTo.
  ///
  /// In en, this message translates to:
  /// **'{v1} connected to {v2}'**
  String dynamicAddonsSettingsPageConnectedTo(String v1, String v2);

  /// No description provided for @dynamicAddonsSettingsPageInstalledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{v1} installed successfully!'**
  String dynamicAddonsSettingsPageInstalledSuccessfully(String v1);

  /// No description provided for @dynamicAddonsSettingsPageRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove {v1}?'**
  String dynamicAddonsSettingsPageRemove(String v1);

  /// No description provided for @dynamicAddonsSettingsPageSuccessfullyInstalledPluginsFromRepository.
  ///
  /// In en, this message translates to:
  /// **'Successfully installed {v1} plugins from repository!'**
  String dynamicAddonsSettingsPageSuccessfullyInstalledPluginsFromRepository(
    String v1,
  );

  /// No description provided for @dynamicAddonsSettingsPageInstallationError.
  ///
  /// In en, this message translates to:
  /// **'Installation error: {v1}'**
  String dynamicAddonsSettingsPageInstallationError(String v1);

  /// No description provided for @dynamicAddonsSettingsPageRemove2.
  ///
  /// In en, this message translates to:
  /// **'Remove ({v1})'**
  String dynamicAddonsSettingsPageRemove2(String v1);

  /// No description provided for @dynamicAddonsSettingsPageTotal.
  ///
  /// In en, this message translates to:
  /// **'{v1} Total'**
  String dynamicAddonsSettingsPageTotal(String v1);

  /// No description provided for @dynamicAddonsSettingsPageRepos.
  ///
  /// In en, this message translates to:
  /// **'{v1} Repos'**
  String dynamicAddonsSettingsPageRepos(String v1);

  /// No description provided for @dynamicAddonsSettingsPageRuntimeSetupError.
  ///
  /// In en, this message translates to:
  /// **'Runtime setup error: {v1}'**
  String dynamicAddonsSettingsPageRuntimeSetupError(String v1);

  /// No description provided for @dynamicBuiltinProvidersSettingsPageNoProvidersFoundMatching.
  ///
  /// In en, this message translates to:
  /// **'No providers found matching \"{v1}\"'**
  String dynamicBuiltinProvidersSettingsPageNoProvidersFoundMatching(String v1);

  /// No description provided for @dynamicBuiltinProvidersSettingsPageAllZplayhttpProvidersAreActiveAnd.
  ///
  /// In en, this message translates to:
  /// **'All {v1} ZPlayHTTP providers are active and queried concurrently.'**
  String dynamicBuiltinProvidersSettingsPageAllZplayhttpProvidersAreActiveAnd(
    String v1,
  );

  /// No description provided for @dynamicBuiltinProvidersSettingsPageActive.
  ///
  /// In en, this message translates to:
  /// **'{v1} / {v2} Active'**
  String dynamicBuiltinProvidersSettingsPageActive(String v1, String v2);

  /// No description provided for @dynamicCloudstreamMarketplaceModalAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{v1} added successfully!'**
  String dynamicCloudstreamMarketplaceModalAddedSuccessfully(String v1);

  /// No description provided for @dynamicCloudstreamMarketplaceModalInstallPlugins.
  ///
  /// In en, this message translates to:
  /// **'Install {v1} Plugins?'**
  String dynamicCloudstreamMarketplaceModalInstallPlugins(String v1);

  /// No description provided for @dynamicCloudstreamMarketplaceModalPluginsInstalledAndReady.
  ///
  /// In en, this message translates to:
  /// **'{v1} plugins installed and ready!'**
  String dynamicCloudstreamMarketplaceModalPluginsInstalledAndReady(String v1);

  /// No description provided for @dynamicCloudstreamMarketplaceModalInstallationError.
  ///
  /// In en, this message translates to:
  /// **'Installation error: {v1}'**
  String dynamicCloudstreamMarketplaceModalInstallationError(String v1);

  /// No description provided for @dynamicCloudstreamMarketplaceModalReposDirectInstallLinksVerifiedProviders.
  ///
  /// In en, this message translates to:
  /// **'{v1} repos · Direct install links & verified providers'**
  String
  dynamicCloudstreamMarketplaceModalReposDirectInstallLinksVerifiedProviders(
    String v1,
  );

  /// No description provided for @dynamicCloudstreamMarketplaceModalNoRepositoriesFoundFor.
  ///
  /// In en, this message translates to:
  /// **'No repositories found for \"{v1}\"'**
  String dynamicCloudstreamMarketplaceModalNoRepositoriesFoundFor(String v1);

  /// No description provided for @dynamicCloudstreamMarketplaceModalPlugins.
  ///
  /// In en, this message translates to:
  /// **'{v1} Plugins'**
  String dynamicCloudstreamMarketplaceModalPlugins(String v1);

  /// No description provided for @dynamicCloudstreamMarketplaceModalCopiedLink.
  ///
  /// In en, this message translates to:
  /// **'Copied link: {v1}'**
  String dynamicCloudstreamMarketplaceModalCopiedLink(String v1);

  /// No description provided for @dynamicCloudstreamRepoModalInstalledSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{v1} installed successfully!'**
  String dynamicCloudstreamRepoModalInstalledSuccessfully(String v1);

  /// No description provided for @dynamicCloudstreamRepoModalUninstalled.
  ///
  /// In en, this message translates to:
  /// **'{v1} uninstalled.'**
  String dynamicCloudstreamRepoModalUninstalled(String v1);

  /// No description provided for @dynamicCloudstreamRepoModalSuccessfullyInstalledPlugins.
  ///
  /// In en, this message translates to:
  /// **'Successfully installed {v1} plugins!'**
  String dynamicCloudstreamRepoModalSuccessfullyInstalledPlugins(String v1);

  /// No description provided for @dynamicCloudstreamRepoModalInstallationError.
  ///
  /// In en, this message translates to:
  /// **'Installation error: {v1}'**
  String dynamicCloudstreamRepoModalInstallationError(String v1);

  /// No description provided for @dynamicCloudstreamRepoModalUninstallAllInstalledPluginsFromThis.
  ///
  /// In en, this message translates to:
  /// **'Uninstall all {v1} installed plugins from this list? Their downloaded files will be removed.'**
  String dynamicCloudstreamRepoModalUninstallAllInstalledPluginsFromThis(
    String v1,
  );

  /// No description provided for @dynamicCloudstreamRepoModalRemoveAll.
  ///
  /// In en, this message translates to:
  /// **'Remove All ({v1})'**
  String dynamicCloudstreamRepoModalRemoveAll(String v1);

  /// No description provided for @dynamicCloudstreamRepoModalSuccessfullyUninstalledPlugins.
  ///
  /// In en, this message translates to:
  /// **'Successfully uninstalled {v1} plugins.'**
  String dynamicCloudstreamRepoModalSuccessfullyUninstalledPlugins(String v1);

  /// No description provided for @dynamicCloudstreamRepoModalInstallAll.
  ///
  /// In en, this message translates to:
  /// **'Install All ({v1})'**
  String dynamicCloudstreamRepoModalInstallAll(String v1);

  /// No description provided for @dynamicServiceKeysSettingsPagePasteYourKey.
  ///
  /// In en, this message translates to:
  /// **'Paste your {v1} key'**
  String dynamicServiceKeysSettingsPagePasteYourKey(String v1);

  /// No description provided for @dynamicUpdatesSettingsPageErrorCheckingUpdates.
  ///
  /// In en, this message translates to:
  /// **'Error checking updates: {v1}'**
  String dynamicUpdatesSettingsPageErrorCheckingUpdates(String v1);

  /// No description provided for @dynamicUpdatesSettingsPageInstalledVersionVBuild.
  ///
  /// In en, this message translates to:
  /// **'Installed Version: v{v1} (Build {v2})'**
  String dynamicUpdatesSettingsPageInstalledVersionVBuild(String v1, String v2);

  /// No description provided for @dynamicAudiobookPlayerStudioPageXSpeed.
  ///
  /// In en, this message translates to:
  /// **'{v1}x Speed'**
  String dynamicAudiobookPlayerStudioPageXSpeed(String v1);

  /// No description provided for @dynamicAudiobookPlayerStudioPagePosition.
  ///
  /// In en, this message translates to:
  /// **'Position #{v1}'**
  String dynamicAudiobookPlayerStudioPagePosition(String v1);

  /// No description provided for @dynamicAudiobookPlayerStudioPageHoverOrTapBelowToPreview.
  ///
  /// In en, this message translates to:
  /// **'Hover or tap below to preview \"{v1}\":'**
  String dynamicAudiobookPlayerStudioPageHoverOrTapBelowToPreview(String v1);

  /// No description provided for @dynamicAudiobookPlayerStudioPageTest.
  ///
  /// In en, this message translates to:
  /// **'Test \"{v1}\"'**
  String dynamicAudiobookPlayerStudioPageTest(String v1);

  /// No description provided for @dynamicAudiobookSettingsPageSoftFlowingGlowingOrbsAndAurora.
  ///
  /// In en, this message translates to:
  /// **'Soft flowing glowing orbs and aurora waves themed to {v1}'**
  String dynamicAudiobookSettingsPageSoftFlowingGlowingOrbsAndAurora(String v1);

  /// No description provided for @dynamicHomeUiSettingsPageIntervalS.
  ///
  /// In en, this message translates to:
  /// **'Interval: {v1}s'**
  String dynamicHomeUiSettingsPageIntervalS(String v1);

  /// No description provided for @dynamicLiveTvSettingsPageSeconds.
  ///
  /// In en, this message translates to:
  /// **'{v1} seconds'**
  String dynamicLiveTvSettingsPageSeconds(String v1);

  /// No description provided for @dynamicLiveTvSettingsPageColumns.
  ///
  /// In en, this message translates to:
  /// **'{v1} Columns'**
  String dynamicLiveTvSettingsPageColumns(String v1);

  /// No description provided for @dynamicMangaSettingsPageSoftFlowingGlowingOrbsAndAurora.
  ///
  /// In en, this message translates to:
  /// **'Soft flowing glowing orbs and aurora waves themed to {v1}'**
  String dynamicMangaSettingsPageSoftFlowingGlowingOrbsAndAurora(String v1);

  /// No description provided for @dynamicMangaReaderControlsPageMode.
  ///
  /// In en, this message translates to:
  /// **'Page Mode: {v1}'**
  String dynamicMangaReaderControlsPageMode(String v1);

  /// No description provided for @dynamicMangaReaderControlsAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Atmosphere: {v1}'**
  String dynamicMangaReaderControlsAtmosphere(String v1);

  /// No description provided for @dynamicLiveGuideBandNowAiringOn.
  ///
  /// In en, this message translates to:
  /// **'Now Airing on {v1}'**
  String dynamicLiveGuideBandNowAiringOn(String v1);

  /// No description provided for @mediaLabelAction.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get mediaLabelAction;

  /// No description provided for @mediaLabelAdventure.
  ///
  /// In en, this message translates to:
  /// **'Adventure'**
  String get mediaLabelAdventure;

  /// No description provided for @mediaLabelComedy.
  ///
  /// In en, this message translates to:
  /// **'Comedy'**
  String get mediaLabelComedy;

  /// No description provided for @mediaLabelDrama.
  ///
  /// In en, this message translates to:
  /// **'Drama'**
  String get mediaLabelDrama;

  /// No description provided for @mediaLabelEcchi.
  ///
  /// In en, this message translates to:
  /// **'Ecchi'**
  String get mediaLabelEcchi;

  /// No description provided for @mediaLabelFantasy.
  ///
  /// In en, this message translates to:
  /// **'Fantasy'**
  String get mediaLabelFantasy;

  /// No description provided for @mediaLabelHentai.
  ///
  /// In en, this message translates to:
  /// **'Hentai'**
  String get mediaLabelHentai;

  /// No description provided for @mediaLabelHorror.
  ///
  /// In en, this message translates to:
  /// **'Horror'**
  String get mediaLabelHorror;

  /// No description provided for @mediaLabelMahouShoujo.
  ///
  /// In en, this message translates to:
  /// **'Mahou Shoujo'**
  String get mediaLabelMahouShoujo;

  /// No description provided for @mediaLabelMecha.
  ///
  /// In en, this message translates to:
  /// **'Mecha'**
  String get mediaLabelMecha;

  /// No description provided for @mediaLabelMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get mediaLabelMusic;

  /// No description provided for @mediaLabelMystery.
  ///
  /// In en, this message translates to:
  /// **'Mystery'**
  String get mediaLabelMystery;

  /// No description provided for @mediaLabelPsychological.
  ///
  /// In en, this message translates to:
  /// **'Psychological'**
  String get mediaLabelPsychological;

  /// No description provided for @mediaLabelRomance.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get mediaLabelRomance;

  /// No description provided for @mediaLabelSciFi.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi'**
  String get mediaLabelSciFi;

  /// No description provided for @mediaLabelScienceFiction.
  ///
  /// In en, this message translates to:
  /// **'Science Fiction'**
  String get mediaLabelScienceFiction;

  /// No description provided for @mediaLabelSliceOfLife.
  ///
  /// In en, this message translates to:
  /// **'Slice of Life'**
  String get mediaLabelSliceOfLife;

  /// No description provided for @mediaLabelSports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get mediaLabelSports;

  /// No description provided for @mediaLabelSupernatural.
  ///
  /// In en, this message translates to:
  /// **'Supernatural'**
  String get mediaLabelSupernatural;

  /// No description provided for @mediaLabelThriller.
  ///
  /// In en, this message translates to:
  /// **'Thriller'**
  String get mediaLabelThriller;

  /// No description provided for @mediaLabelAnimation.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get mediaLabelAnimation;

  /// No description provided for @mediaLabelDocumentary.
  ///
  /// In en, this message translates to:
  /// **'Documentary'**
  String get mediaLabelDocumentary;

  /// No description provided for @mediaLabelCrime.
  ///
  /// In en, this message translates to:
  /// **'Crime'**
  String get mediaLabelCrime;

  /// No description provided for @mediaLabelFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get mediaLabelFamily;

  /// No description provided for @mediaLabelHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get mediaLabelHistory;

  /// No description provided for @mediaLabelWar.
  ///
  /// In en, this message translates to:
  /// **'War'**
  String get mediaLabelWar;

  /// No description provided for @mediaLabelWestern.
  ///
  /// In en, this message translates to:
  /// **'Western'**
  String get mediaLabelWestern;

  /// No description provided for @mediaLabelBiography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get mediaLabelBiography;

  /// No description provided for @mediaLabelSport.
  ///
  /// In en, this message translates to:
  /// **'Sport'**
  String get mediaLabelSport;

  /// No description provided for @mediaLabelMusical.
  ///
  /// In en, this message translates to:
  /// **'Musical'**
  String get mediaLabelMusical;

  /// No description provided for @mediaLabelFilmNoir.
  ///
  /// In en, this message translates to:
  /// **'Film-Noir'**
  String get mediaLabelFilmNoir;

  /// No description provided for @mediaLabelActionAdventure.
  ///
  /// In en, this message translates to:
  /// **'Action & Adventure'**
  String get mediaLabelActionAdventure;

  /// No description provided for @mediaLabelSciFiFantasy.
  ///
  /// In en, this message translates to:
  /// **'Sci-Fi & Fantasy'**
  String get mediaLabelSciFiFantasy;

  /// No description provided for @mediaLabelWarPolitics.
  ///
  /// In en, this message translates to:
  /// **'War & Politics'**
  String get mediaLabelWarPolitics;

  /// No description provided for @mediaLabelKids.
  ///
  /// In en, this message translates to:
  /// **'Kids'**
  String get mediaLabelKids;

  /// No description provided for @mediaLabelReality.
  ///
  /// In en, this message translates to:
  /// **'Reality'**
  String get mediaLabelReality;

  /// No description provided for @mediaLabelTalk.
  ///
  /// In en, this message translates to:
  /// **'Talk'**
  String get mediaLabelTalk;

  /// No description provided for @mediaLabelNews.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get mediaLabelNews;

  /// No description provided for @mediaLabelSoap.
  ///
  /// In en, this message translates to:
  /// **'Soap'**
  String get mediaLabelSoap;

  /// No description provided for @mediaLabelTvMovie.
  ///
  /// In en, this message translates to:
  /// **'TV Movie'**
  String get mediaLabelTvMovie;

  /// No description provided for @mediaLabelWinter.
  ///
  /// In en, this message translates to:
  /// **'WINTER'**
  String get mediaLabelWinter;

  /// No description provided for @mediaLabelSpring.
  ///
  /// In en, this message translates to:
  /// **'SPRING'**
  String get mediaLabelSpring;

  /// No description provided for @mediaLabelSummer.
  ///
  /// In en, this message translates to:
  /// **'SUMMER'**
  String get mediaLabelSummer;

  /// No description provided for @mediaLabelFall.
  ///
  /// In en, this message translates to:
  /// **'FALL'**
  String get mediaLabelFall;

  /// No description provided for @mediaLabelTv.
  ///
  /// In en, this message translates to:
  /// **'TV'**
  String get mediaLabelTv;

  /// No description provided for @mediaLabelTvShort.
  ///
  /// In en, this message translates to:
  /// **'TV_SHORT'**
  String get mediaLabelTvShort;

  /// No description provided for @mediaLabelMovie.
  ///
  /// In en, this message translates to:
  /// **'MOVIE'**
  String get mediaLabelMovie;

  /// No description provided for @mediaLabelOva.
  ///
  /// In en, this message translates to:
  /// **'OVA'**
  String get mediaLabelOva;

  /// No description provided for @mediaLabelOna.
  ///
  /// In en, this message translates to:
  /// **'ONA'**
  String get mediaLabelOna;

  /// No description provided for @mediaLabelSpecial.
  ///
  /// In en, this message translates to:
  /// **'SPECIAL'**
  String get mediaLabelSpecial;

  /// No description provided for @mediaLabelMusic50.
  ///
  /// In en, this message translates to:
  /// **'MUSIC'**
  String get mediaLabelMusic50;

  /// No description provided for @mediaLabelReleasing.
  ///
  /// In en, this message translates to:
  /// **'RELEASING'**
  String get mediaLabelReleasing;

  /// No description provided for @mediaLabelFinished.
  ///
  /// In en, this message translates to:
  /// **'FINISHED'**
  String get mediaLabelFinished;

  /// No description provided for @mediaLabelNotYetReleased.
  ///
  /// In en, this message translates to:
  /// **'NOT_YET_RELEASED'**
  String get mediaLabelNotYetReleased;

  /// No description provided for @mediaLabelCancelled.
  ///
  /// In en, this message translates to:
  /// **'CANCELLED'**
  String get mediaLabelCancelled;

  /// No description provided for @mediaLabelHiatus.
  ///
  /// In en, this message translates to:
  /// **'HIATUS'**
  String get mediaLabelHiatus;

  /// No description provided for @mediaLabelTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get mediaLabelTrending;

  /// No description provided for @mediaLabelMostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mediaLabelMostPopular;

  /// No description provided for @mediaLabelTopRated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get mediaLabelTopRated;

  /// No description provided for @mediaLabelMostFavorited.
  ///
  /// In en, this message translates to:
  /// **'Most Favorited'**
  String get mediaLabelMostFavorited;

  /// No description provided for @mediaLabelNewest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get mediaLabelNewest;

  /// No description provided for @mediaLabelOldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get mediaLabelOldest;

  /// No description provided for @mediaLabelTitleAZ.
  ///
  /// In en, this message translates to:
  /// **'Title (A-Z)'**
  String get mediaLabelTitleAZ;

  /// No description provided for @mediaLabelNewSeason.
  ///
  /// In en, this message translates to:
  /// **'New season'**
  String get mediaLabelNewSeason;

  /// No description provided for @mediaLabelNewEpisode.
  ///
  /// In en, this message translates to:
  /// **'New episode'**
  String get mediaLabelNewEpisode;

  /// No description provided for @mediaLabelNewRelease.
  ///
  /// In en, this message translates to:
  /// **'New release'**
  String get mediaLabelNewRelease;

  /// No description provided for @mediaLabelMovie66.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get mediaLabelMovie66;

  /// No description provided for @mediaLabelSeries.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get mediaLabelSeries;

  /// No description provided for @mediaLabelAnime.
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get mediaLabelAnime;

  /// No description provided for @mediaLabelInLibrary.
  ///
  /// In en, this message translates to:
  /// **'In Library'**
  String get mediaLabelInLibrary;

  /// No description provided for @mediaLabelLibrary.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get mediaLabelLibrary;

  /// No description provided for @mediaLabelShowLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get mediaLabelShowLess;

  /// No description provided for @mediaLabelReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get mediaLabelReadMore;

  /// No description provided for @mediaLabelYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get mediaLabelYear;

  /// No description provided for @mediaLabelMuted.
  ///
  /// In en, this message translates to:
  /// **'Muted'**
  String get mediaLabelMuted;

  /// No description provided for @mediaLabelDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading...'**
  String get mediaLabelDownloading;

  /// No description provided for @mediaLabelDownloadMedia.
  ///
  /// In en, this message translates to:
  /// **'Download Media'**
  String get mediaLabelDownloadMedia;

  /// No description provided for @mediaLabelLiveAction.
  ///
  /// In en, this message translates to:
  /// **'Live action'**
  String get mediaLabelLiveAction;

  /// No description provided for @mediaLabelUseWithCare.
  ///
  /// In en, this message translates to:
  /// **'Use with care'**
  String get mediaLabelUseWithCare;

  /// No description provided for @mediaLabelFasterAt4k.
  ///
  /// In en, this message translates to:
  /// **'Faster at 4K'**
  String get mediaLabelFasterAt4k;

  /// No description provided for @mediaLabelMostFeatures.
  ///
  /// In en, this message translates to:
  /// **'Most features'**
  String get mediaLabelMostFeatures;

  /// No description provided for @mediaLabelSortBy.
  ///
  /// In en, this message translates to:
  /// **'Sort by'**
  String get mediaLabelSortBy;

  /// No description provided for @mediaLabelRequired.
  ///
  /// In en, this message translates to:
  /// **'Required *'**
  String get mediaLabelRequired;

  /// No description provided for @mediaLabelEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get mediaLabelEnter;

  /// No description provided for @mediaLabelAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get mediaLabelAll;

  /// No description provided for @mediaLabelGenre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get mediaLabelGenre;

  /// No description provided for @mediaLabelSeason.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get mediaLabelSeason;

  /// No description provided for @mediaLabelFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get mediaLabelFormat;

  /// No description provided for @mediaLabelStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get mediaLabelStatus;

  /// No description provided for @mediaLabelClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get mediaLabelClear;

  /// No description provided for @mediaLabelRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get mediaLabelRetry;

  /// No description provided for @mediaLabelPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get mediaLabelPlay;

  /// No description provided for @mediaLabelAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get mediaLabelAdd;

  /// No description provided for @mediaLabelCopyStreamUrl.
  ///
  /// In en, this message translates to:
  /// **'Copy Stream URL'**
  String get mediaLabelCopyStreamUrl;

  /// No description provided for @mediaLabelCustomBackgroundWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Custom Background & Wallpaper'**
  String get mediaLabelCustomBackgroundWallpaper;

  /// No description provided for @mediaLabelHomePageUiThemes.
  ///
  /// In en, this message translates to:
  /// **'Home Page UI & Themes'**
  String get mediaLabelHomePageUiThemes;

  /// No description provided for @mediaLabelTvAiringCalendar.
  ///
  /// In en, this message translates to:
  /// **'TV Airing Calendar'**
  String get mediaLabelTvAiringCalendar;

  /// No description provided for @mediaLabelLiveTvSportsUi.
  ///
  /// In en, this message translates to:
  /// **'Live TV & Sports UI'**
  String get mediaLabelLiveTvSportsUi;

  /// No description provided for @mediaLabelMangaUiReaderAtmosphere.
  ///
  /// In en, this message translates to:
  /// **'Manga UI & Reader Atmosphere'**
  String get mediaLabelMangaUiReaderAtmosphere;

  /// No description provided for @mediaLabelPasteFromClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste from Clipboard'**
  String get mediaLabelPasteFromClipboard;

  /// No description provided for @videoUpscalingExplanation.
  ///
  /// In en, this message translates to:
  /// **'Real-time GLSL upscaling on the video engine. Anime4K reconstructs line art; AMD FSR upscales live action and film. Pick one family — they are never combined.'**
  String get videoUpscalingExplanation;

  /// No description provided for @videoFsrSmoothExplanation.
  ///
  /// In en, this message translates to:
  /// **'AMD FidelityFX edge-adaptive upscaling, for live action and film. Upscales without sharpening, so it is the safe FSR option. Runs on any GPU, unlike NVIDIA RTX Video.'**
  String get videoFsrSmoothExplanation;

  /// No description provided for @videoFsrSharpExplanation.
  ///
  /// In en, this message translates to:
  /// **'FSR with contrast-adaptive sharpening. Adds bite to soft or low-bitrate video. On a 2K or 4K source this can look worse than no upscaling at all.'**
  String get videoFsrSharpExplanation;

  /// No description provided for @videoMedia3Explanation.
  ///
  /// In en, this message translates to:
  /// **'Decodes straight into a surface, so 4K arrives without being copied out of the decoder first. On a 2 GB television that is the difference between 904 ms and over 1,900 ms of delay, and between no dropped frames and one and a half a second. Subtitles are rendered by Android, so the styling options below do not apply here.'**
  String get videoMedia3Explanation;

  /// No description provided for @videoMpvExplanation.
  ///
  /// In en, this message translates to:
  /// **'The bundled engine. Plays torrents and live streams, offers the complete subtitle styling surface below, and supports the upscaling presets. Decoded frames are copied through a texture, which is what makes 4K stutter on small televisions.'**
  String get videoMpvExplanation;

  /// No description provided for @videoWatchdogExplanation.
  ///
  /// In en, this message translates to:
  /// **'Monitors stream startup. If audio plays for 2.5s without video frames, or a GPU decoder error occurs, the player recovers automatically. On Android it switches to software decoding only up to 1080p and re-syncs the hardware decoder above that, because a software 4K decoder needs more memory than the device has. A source that is merely not delivering data yet is waited on rather than treated as a decoder fault.'**
  String get videoWatchdogExplanation;

  /// No description provided for @catalogLabelMovies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get catalogLabelMovies;

  /// No description provided for @catalogLabelSeries.
  ///
  /// In en, this message translates to:
  /// **'SERIES'**
  String get catalogLabelSeries;

  /// No description provided for @catalogLabelAnime.
  ///
  /// In en, this message translates to:
  /// **'ANIME'**
  String get catalogLabelAnime;

  /// No description provided for @catalogLabelChannels.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get catalogLabelChannels;

  /// No description provided for @catalogLabelCollections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get catalogLabelCollections;

  /// No description provided for @catalogLabelAdult.
  ///
  /// In en, this message translates to:
  /// **'Adult'**
  String get catalogLabelAdult;

  /// No description provided for @catalogLabelBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get catalogLabelBrowse;

  /// No description provided for @catalogLabelPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get catalogLabelPopular;

  /// No description provided for @catalogLabelTop.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get catalogLabelTop;

  /// No description provided for @catalogLabelTrendingMovies.
  ///
  /// In en, this message translates to:
  /// **'Trending Movies'**
  String get catalogLabelTrendingMovies;

  /// No description provided for @catalogLabelTrendingSeries.
  ///
  /// In en, this message translates to:
  /// **'Trending Series'**
  String get catalogLabelTrendingSeries;

  /// No description provided for @catalogLabelTrendingAnime.
  ///
  /// In en, this message translates to:
  /// **'Trending Anime'**
  String get catalogLabelTrendingAnime;

  /// No description provided for @catalogLabelPopularMovies.
  ///
  /// In en, this message translates to:
  /// **'Popular Movies'**
  String get catalogLabelPopularMovies;

  /// No description provided for @catalogLabelPopularSeries.
  ///
  /// In en, this message translates to:
  /// **'Popular Series'**
  String get catalogLabelPopularSeries;

  /// No description provided for @catalogLabelPopularAnime.
  ///
  /// In en, this message translates to:
  /// **'Popular Anime'**
  String get catalogLabelPopularAnime;

  /// No description provided for @catalogLabelPopularTvShows.
  ///
  /// In en, this message translates to:
  /// **'Popular TV Shows'**
  String get catalogLabelPopularTvShows;

  /// No description provided for @catalogLabelNewMovies.
  ///
  /// In en, this message translates to:
  /// **'New Movies'**
  String get catalogLabelNewMovies;

  /// No description provided for @catalogLabelNewSeries.
  ///
  /// In en, this message translates to:
  /// **'New Series'**
  String get catalogLabelNewSeries;

  /// No description provided for @catalogLabelNewAnime.
  ///
  /// In en, this message translates to:
  /// **'New Anime'**
  String get catalogLabelNewAnime;

  /// No description provided for @catalogLabelTopRatedMovies.
  ///
  /// In en, this message translates to:
  /// **'Top Rated Movies'**
  String get catalogLabelTopRatedMovies;

  /// No description provided for @catalogLabelTopRatedSeries.
  ///
  /// In en, this message translates to:
  /// **'Top Rated Series'**
  String get catalogLabelTopRatedSeries;

  /// No description provided for @catalogLabelTopRatedAnime.
  ///
  /// In en, this message translates to:
  /// **'Top Rated Anime'**
  String get catalogLabelTopRatedAnime;

  /// No description provided for @catalogLabelFeatured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get catalogLabelFeatured;

  /// No description provided for @catalogLabelLatest.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get catalogLabelLatest;

  /// No description provided for @catalogLabelLatestMovies.
  ///
  /// In en, this message translates to:
  /// **'Latest Movies'**
  String get catalogLabelLatestMovies;

  /// No description provided for @catalogLabelLatestSeries.
  ///
  /// In en, this message translates to:
  /// **'Latest Series'**
  String get catalogLabelLatestSeries;

  /// No description provided for @catalogLabelRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently Added'**
  String get catalogLabelRecentlyAdded;

  /// No description provided for @catalogLabelNewReleases.
  ///
  /// In en, this message translates to:
  /// **'New Releases'**
  String get catalogLabelNewReleases;

  /// No description provided for @catalogLabelContinueWatching.
  ///
  /// In en, this message translates to:
  /// **'Continue Watching'**
  String get catalogLabelContinueWatching;

  /// No description provided for @catalogLabelGenres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get catalogLabelGenres;

  /// No description provided for @catalogLabelYears.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get catalogLabelYears;

  /// No description provided for @catalogLabelLanguages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get catalogLabelLanguages;

  /// No description provided for @catalogLabelCountries.
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get catalogLabelCountries;

  /// No description provided for @catalogLabelRegions.
  ///
  /// In en, this message translates to:
  /// **'Regions'**
  String get catalogLabelRegions;

  /// No description provided for @catalogLabelGenre.
  ///
  /// In en, this message translates to:
  /// **'genre'**
  String get catalogLabelGenre;

  /// No description provided for @catalogLabelYear.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get catalogLabelYear;

  /// No description provided for @catalogLabelLanguage.
  ///
  /// In en, this message translates to:
  /// **'language'**
  String get catalogLabelLanguage;

  /// No description provided for @catalogLabelCountry.
  ///
  /// In en, this message translates to:
  /// **'country'**
  String get catalogLabelCountry;

  /// No description provided for @catalogLabelRegion.
  ///
  /// In en, this message translates to:
  /// **'region'**
  String get catalogLabelRegion;

  /// No description provided for @catalogLabelSearch.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get catalogLabelSearch;

  /// No description provided for @catalogLabelSort.
  ///
  /// In en, this message translates to:
  /// **'sort'**
  String get catalogLabelSort;

  /// No description provided for @catalogLabelSortby.
  ///
  /// In en, this message translates to:
  /// **'sortBy'**
  String get catalogLabelSortby;

  /// No description provided for @catalogLabelRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get catalogLabelRequired;

  /// No description provided for @catalogLabelCustom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get catalogLabelCustom;

  /// No description provided for @catalogLabelSearch44.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get catalogLabelSearch44;

  /// No description provided for @catalogLabelDiscoverTheLatestAndGreatestFilms.
  ///
  /// In en, this message translates to:
  /// **'Discover the latest and greatest films'**
  String get catalogLabelDiscoverTheLatestAndGreatestFilms;

  /// No description provided for @catalogLabelBingeWorthyShowsAndTheNewestSeasons.
  ///
  /// In en, this message translates to:
  /// **'Binge-worthy shows and the newest seasons'**
  String get catalogLabelBingeWorthyShowsAndTheNewestSeasons;

  /// No description provided for @catalogLabelSimulcastsClassicsAndEverythingInBetween.
  ///
  /// In en, this message translates to:
  /// **'Simulcasts, classics and everything in between'**
  String get catalogLabelSimulcastsClassicsAndEverythingInBetween;

  /// No description provided for @catalogLabelLiveChannelsFromYourAddons.
  ///
  /// In en, this message translates to:
  /// **'Live channels from your addons'**
  String get catalogLabelLiveChannelsFromYourAddons;

  /// No description provided for @catalogLabelEverythingYourAddonsHaveToOffer.
  ///
  /// In en, this message translates to:
  /// **'Everything your addons have to offer'**
  String get catalogLabelEverythingYourAddonsHaveToOffer;

  /// No description provided for @catalogLabelAddToList.
  ///
  /// In en, this message translates to:
  /// **'ADD TO LIST'**
  String get catalogLabelAddToList;

  /// No description provided for @catalogLabelWatching.
  ///
  /// In en, this message translates to:
  /// **'WATCHING'**
  String get catalogLabelWatching;

  /// No description provided for @catalogLabelPlantowatch.
  ///
  /// In en, this message translates to:
  /// **'PLANTOWATCH'**
  String get catalogLabelPlantowatch;

  /// No description provided for @catalogLabelPlanToWatch.
  ///
  /// In en, this message translates to:
  /// **'PLAN_TO_WATCH'**
  String get catalogLabelPlanToWatch;

  /// No description provided for @catalogLabelCompleted.
  ///
  /// In en, this message translates to:
  /// **'COMPLETED'**
  String get catalogLabelCompleted;

  /// No description provided for @catalogLabelDropped.
  ///
  /// In en, this message translates to:
  /// **'DROPPED'**
  String get catalogLabelDropped;

  /// No description provided for @catalogLabelFindingAWorkingSource.
  ///
  /// In en, this message translates to:
  /// **'Finding a working source…'**
  String get catalogLabelFindingAWorkingSource;

  /// No description provided for @catalogLabelFindBestSource.
  ///
  /// In en, this message translates to:
  /// **'Find best source'**
  String get catalogLabelFindBestSource;

  /// No description provided for @catalogLabelChooseAnotherSource.
  ///
  /// In en, this message translates to:
  /// **'Choose another source'**
  String get catalogLabelChooseAnotherSource;

  /// No description provided for @catalogLabelSub.
  ///
  /// In en, this message translates to:
  /// **'Sub'**
  String get catalogLabelSub;

  /// No description provided for @catalogLabelDub.
  ///
  /// In en, this message translates to:
  /// **'Dub'**
  String get catalogLabelDub;

  /// No description provided for @catalogLabelSub61.
  ///
  /// In en, this message translates to:
  /// **'SUB'**
  String get catalogLabelSub61;

  /// No description provided for @catalogLabelDub62.
  ///
  /// In en, this message translates to:
  /// **'DUB'**
  String get catalogLabelDub62;

  /// No description provided for @catalogLabelAll.
  ///
  /// In en, this message translates to:
  /// **'ALL'**
  String get catalogLabelAll;

  /// No description provided for @discoverSortCatalog.
  ///
  /// In en, this message translates to:
  /// **'Sort by: {name}'**
  String discoverSortCatalog(String name);

  /// No description provided for @discoverSearchWithin.
  ///
  /// In en, this message translates to:
  /// **'Search within {catalog}...'**
  String discoverSearchWithin(String catalog);

  /// No description provided for @discoverRequiredFields.
  ///
  /// In en, this message translates to:
  /// **'This catalog requires selecting {fields} before loading titles.'**
  String discoverRequiredFields(String fields);

  /// No description provided for @discoverDefaultCatalog.
  ///
  /// In en, this message translates to:
  /// **'catalog'**
  String get discoverDefaultCatalog;

  /// No description provided for @updateChecksumWarning.
  ///
  /// In en, this message translates to:
  /// **'This release does not publish a SHA-256 checksum, so Kiru will not install it automatically. Open the release page and verify the download yourself before installing it.'**
  String get updateChecksumWarning;

  /// No description provided for @playerExternalSubtitleEngine.
  ///
  /// In en, this message translates to:
  /// **'External subtitle files need the mpv engine. Pick an embedded track instead.'**
  String get playerExternalSubtitleEngine;

  /// No description provided for @aboutUpstreamLicense.
  ///
  /// In en, this message translates to:
  /// **'ZPlay is a modified version of PlayTorrio V3, distributed under the GNU General Public License v3.0. Tap to read the licence.'**
  String get aboutUpstreamLicense;

  /// No description provided for @addonCredentialSharingWarning.
  ///
  /// In en, this message translates to:
  /// **'This addon URL contains a Debrid placeholder. Kiru will fill it with your saved key, so the addon server receives that key in the request URL. Only continue if you trust this addon.'**
  String get addonCredentialSharingWarning;

  /// No description provided for @addonCredentialPlaceholderHelp.
  ///
  /// In en, this message translates to:
  /// **'Addons that take the key as a plain URL parameter accept a {example} style placeholder. Addons that hide it inside a base64 config blob have to be pasted fully configured instead.'**
  String addonCredentialPlaceholderHelp(String example);

  /// No description provided for @appearanceSkiaRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Skia is recommended on Windows here — Impeller coincided with an NVIDIA driver crash.'**
  String get appearanceSkiaRecommendation;

  /// No description provided for @serviceKeysIntroduction.
  ///
  /// In en, this message translates to:
  /// **'Kiru talks to several third-party services. Any key you save here replaces the one this build uses and takes effect immediately, with no restart.'**
  String get serviceKeysIntroduction;

  /// No description provided for @serviceKeysExternalCredentials.
  ///
  /// In en, this message translates to:
  /// **'These cannot be obtained: each is a credential for a third-party service that did not issue it to ZPlay, so leave its field blank unless you have your own. A private build can supply its own with --dart-define, and blanking the registry entry in the source disables only that one source.'**
  String get serviceKeysExternalCredentials;

  /// No description provided for @serviceKeysStorageNotice.
  ///
  /// In en, this message translates to:
  /// **'Every value is stored only on this device and is never shown back in these fields.'**
  String get serviceKeysStorageNotice;

  /// No description provided for @tmdbKeyIntroduction.
  ///
  /// In en, this message translates to:
  /// **'Add your own free TMDb key to rank the six \"The 90s\" rails by TMDb vote counts, and to cover the TMDb lookups the built-in scrapers make. Get a key at themoviedb.org.'**
  String get tmdbKeyIntroduction;

  /// No description provided for @tmdbKeyStorageNotice.
  ///
  /// In en, this message translates to:
  /// **'The key is stored only on this device. This app ships with no key, and a built-in fallback keeps the scraper lookups working without one. Clearing your key restores the built-in 1990s picks.'**
  String get tmdbKeyStorageNotice;

  /// No description provided for @traktPairingRejected.
  ///
  /// In en, this message translates to:
  /// **'Trakt rejected the pairing request. Check the Client ID in Settings > Service API Keys - and add the Client Secret if Trakt requires one for your app.'**
  String get traktPairingRejected;

  /// No description provided for @homeHideArtlessRailsHelp.
  ///
  /// In en, this message translates to:
  /// **'Drops a Home rail when none of its titles can show a picture. A landscape tile has no name under it, so such a rail is a row of blank rectangles.'**
  String get homeHideArtlessRailsHelp;

  /// No description provided for @p2pPrivacyHeading.
  ///
  /// In en, this message translates to:
  /// **'PRIVACY & NETWORK ADVISORY'**
  String get p2pPrivacyHeading;

  /// No description provided for @updateAvailableHeading.
  ///
  /// In en, this message translates to:
  /// **'UPDATE AVAILABLE'**
  String get updateAvailableHeading;

  /// No description provided for @updateWhatsNewHeading.
  ///
  /// In en, this message translates to:
  /// **'WHAT\'S NEW'**
  String get updateWhatsNewHeading;

  /// No description provided for @cardTopRank.
  ///
  /// In en, this message translates to:
  /// **'TOP'**
  String get cardTopRank;

  /// No description provided for @channelLiveBadge.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get channelLiveBadge;

  /// No description provided for @channelLiveBroadcast.
  ///
  /// In en, this message translates to:
  /// **'LIVE BROADCAST'**
  String get channelLiveBroadcast;

  /// No description provided for @channelFreeBadge.
  ///
  /// In en, this message translates to:
  /// **'FREE'**
  String get channelFreeBadge;

  /// No description provided for @multiStreamsHeading.
  ///
  /// In en, this message translates to:
  /// **'MULTI STREAMS'**
  String get multiStreamsHeading;

  /// No description provided for @copyPlaybackUrl.
  ///
  /// In en, this message translates to:
  /// **'Copy Stream URL'**
  String get copyPlaybackUrl;

  /// No description provided for @commonAddAction.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get commonAddAction;

  /// No description provided for @appearanceCustomWallpaper.
  ///
  /// In en, this message translates to:
  /// **'Custom Background & Wallpaper'**
  String get appearanceCustomWallpaper;

  /// No description provided for @commonPasteClipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste from Clipboard'**
  String get commonPasteClipboard;

  /// No description provided for @appearanceHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home Page UI & Themes'**
  String get appearanceHomeTitle;

  /// No description provided for @homeBecauseWatching.
  ///
  /// In en, this message translates to:
  /// **'\"Because You\'re Watching...\"'**
  String get homeBecauseWatching;

  /// No description provided for @homeAiringCalendar.
  ///
  /// In en, this message translates to:
  /// **'TV Airing Calendar'**
  String get homeAiringCalendar;

  /// No description provided for @appearanceLiveTvTitle.
  ///
  /// In en, this message translates to:
  /// **'Live TV & Sports UI'**
  String get appearanceLiveTvTitle;

  /// No description provided for @appearancePublicPlaylistHelp.
  ///
  /// In en, this message translates to:
  /// **'Add public M3U playlists (e.g. iptv-org) to a channel\'s stream list'**
  String get appearancePublicPlaylistHelp;

  /// No description provided for @appearanceMangaTitle.
  ///
  /// In en, this message translates to:
  /// **'Manga UI & Reader Atmosphere'**
  String get appearanceMangaTitle;

  /// No description provided for @traktPairingClientIdRequired.
  ///
  /// In en, this message translates to:
  /// **'Trakt needs a Client ID before it can pair. Create an app at {url}, then paste its Client ID in Settings > Service API Keys. The Client Secret is optional.'**
  String traktPairingClientIdRequired(String url);

  /// No description provided for @playerSourceRetrySemantics.
  ///
  /// In en, this message translates to:
  /// **'Testing other sources. Trying {source}. Attempt {attempt} of {total}.'**
  String playerSourceRetrySemantics(String source, int attempt, int total);

  /// No description provided for @animeEpisodeCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 episode} other{{count} episodes}}'**
  String animeEpisodeCount(int count);

  /// No description provided for @animeTitleDataAttribution.
  ///
  /// In en, this message translates to:
  /// **'Chinese anime titles · bangumi-data v0.3.237 · CC BY 4.0'**
  String get animeTitleDataAttribution;

  /// No description provided for @animeCastHeading.
  ///
  /// In en, this message translates to:
  /// **'Characters & Cast'**
  String get animeCastHeading;

  /// No description provided for @animeRelationsHeading.
  ///
  /// In en, this message translates to:
  /// **'Franchise & Relations'**
  String get animeRelationsHeading;

  /// No description provided for @animeRecommendationsHeading.
  ///
  /// In en, this message translates to:
  /// **'You May Also Like'**
  String get animeRecommendationsHeading;

  /// No description provided for @channelGuideWaiting.
  ///
  /// In en, this message translates to:
  /// **'Programme data appears once a verified live feed for {channel} is available.'**
  String channelGuideWaiting(String channel);

  /// No description provided for @finalPlayerSubStyleModalTypography.
  ///
  /// In en, this message translates to:
  /// **'Typography'**
  String get finalPlayerSubStyleModalTypography;

  /// No description provided for @finalPlayerSubStyleModalColorsBox.
  ///
  /// In en, this message translates to:
  /// **'Colors & Box'**
  String get finalPlayerSubStyleModalColorsBox;

  /// No description provided for @finalPlayerSubStyleModalOutlineShadow.
  ///
  /// In en, this message translates to:
  /// **'Outline & Shadow'**
  String get finalPlayerSubStyleModalOutlineShadow;

  /// No description provided for @finalPlayerSubStyleModalPosition.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get finalPlayerSubStyleModalPosition;

  /// No description provided for @finalPlayerSubStyleModalAdvancedAss.
  ///
  /// In en, this message translates to:
  /// **'Advanced / ASS'**
  String get finalPlayerSubStyleModalAdvancedAss;

  /// No description provided for @finalPlayerSubStyleModalFontFamily.
  ///
  /// In en, this message translates to:
  /// **'FONT FAMILY'**
  String get finalPlayerSubStyleModalFontFamily;

  /// No description provided for @finalPlayerSubStyleModalSubtitleTextColor.
  ///
  /// In en, this message translates to:
  /// **'SUBTITLE TEXT COLOR'**
  String get finalPlayerSubStyleModalSubtitleTextColor;

  /// No description provided for @finalPlayerSubStyleModalBackgroundBoxAccessibilityReadability.
  ///
  /// In en, this message translates to:
  /// **'BACKGROUND BOX (ACCESSIBILITY & READABILITY)'**
  String get finalPlayerSubStyleModalBackgroundBoxAccessibilityReadability;

  /// No description provided for @finalPlayerSubStyleModalOutlineBorderColor.
  ///
  /// In en, this message translates to:
  /// **'OUTLINE / BORDER COLOR'**
  String get finalPlayerSubStyleModalOutlineBorderColor;

  /// No description provided for @finalPlayerSubStyleModalHorizontalAlignment.
  ///
  /// In en, this message translates to:
  /// **'HORIZONTAL ALIGNMENT'**
  String get finalPlayerSubStyleModalHorizontalAlignment;

  /// No description provided for @finalPlayerSubStyleModalSubtitleRenderingEngine.
  ///
  /// In en, this message translates to:
  /// **'SUBTITLE RENDERING ENGINE'**
  String get finalPlayerSubStyleModalSubtitleRenderingEngine;

  /// No description provided for @finalPlayerSubStyleModalSsaAssFansubScriptOverrideMode.
  ///
  /// In en, this message translates to:
  /// **'SSA / ASS FANSUB SCRIPT OVERRIDE MODE'**
  String get finalPlayerSubStyleModalSsaAssFansubScriptOverrideMode;

  /// No description provided for @finalReaderCustomizationSheetTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get finalReaderCustomizationSheetTheme;

  /// No description provided for @finalReaderCustomizationSheetLayout.
  ///
  /// In en, this message translates to:
  /// **'Layout'**
  String get finalReaderCustomizationSheetLayout;

  /// No description provided for @finalReaderCustomizationSheetReset.
  ///
  /// In en, this message translates to:
  /// **'Reset ✓'**
  String get finalReaderCustomizationSheetReset;

  /// No description provided for @finalReaderCustomizationSheetFontFamily.
  ///
  /// In en, this message translates to:
  /// **'Font Family'**
  String get finalReaderCustomizationSheetFontFamily;

  /// No description provided for @finalReaderCustomizationSheetFontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get finalReaderCustomizationSheetFontSize;

  /// No description provided for @finalReaderCustomizationSheetLineHeight.
  ///
  /// In en, this message translates to:
  /// **'Line Height'**
  String get finalReaderCustomizationSheetLineHeight;

  /// No description provided for @finalReaderCustomizationSheetAlignment.
  ///
  /// In en, this message translates to:
  /// **'Alignment'**
  String get finalReaderCustomizationSheetAlignment;

  /// No description provided for @finalReaderCustomizationSheetFirstLineIndent.
  ///
  /// In en, this message translates to:
  /// **'First-Line Indent'**
  String get finalReaderCustomizationSheetFirstLineIndent;

  /// No description provided for @finalReaderCustomizationSheetReadingThemes.
  ///
  /// In en, this message translates to:
  /// **'Reading Themes'**
  String get finalReaderCustomizationSheetReadingThemes;

  /// No description provided for @finalReaderCustomizationSheetReaderBrightness.
  ///
  /// In en, this message translates to:
  /// **'Reader Brightness'**
  String get finalReaderCustomizationSheetReaderBrightness;

  /// No description provided for @finalReaderCustomizationSheetPageMargins.
  ///
  /// In en, this message translates to:
  /// **'Page Margins'**
  String get finalReaderCustomizationSheetPageMargins;

  /// No description provided for @finalReaderCustomizationSheetReadingMode.
  ///
  /// In en, this message translates to:
  /// **'Reading Mode'**
  String get finalReaderCustomizationSheetReadingMode;

  /// No description provided for @finalTrailerMuteButtonUnmuteTrailer.
  ///
  /// In en, this message translates to:
  /// **'Unmute trailer'**
  String get finalTrailerMuteButtonUnmuteTrailer;

  /// No description provided for @finalTrailerMuteButtonMuteTrailer.
  ///
  /// In en, this message translates to:
  /// **'Mute trailer'**
  String get finalTrailerMuteButtonMuteTrailer;

  /// No description provided for @finalMultinutzChannelSheetRemoveFavorite.
  ///
  /// In en, this message translates to:
  /// **'Remove Favorite'**
  String get finalMultinutzChannelSheetRemoveFavorite;

  /// No description provided for @finalTextSyncOverlaySelecting.
  ///
  /// In en, this message translates to:
  /// **'Selecting'**
  String get finalTextSyncOverlaySelecting;

  /// No description provided for @finalTextSyncOverlaySaving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get finalTextSyncOverlaySaving;

  /// No description provided for @finalAnimePageGeneral.
  ///
  /// In en, this message translates to:
  /// **'🇯🇵 General'**
  String get finalAnimePageGeneral;

  /// No description provided for @finalAnimePageArabicAnime.
  ///
  /// In en, this message translates to:
  /// **'🇸🇦 Arabic Anime'**
  String get finalAnimePageArabicAnime;

  /// No description provided for @finalAnimePageSearchAnime.
  ///
  /// In en, this message translates to:
  /// **'Search anime'**
  String get finalAnimePageSearchAnime;

  /// No description provided for @finalAnimeSearchPageArabic.
  ///
  /// In en, this message translates to:
  /// **'🇸🇦 Arabic'**
  String get finalAnimeSearchPageArabic;

  /// No description provided for @finalAnimeStreamSheetCascadingNativeAnimeExtractors.
  ///
  /// In en, this message translates to:
  /// **'Cascading native anime extractors…'**
  String get finalAnimeStreamSheetCascadingNativeAnimeExtractors;

  /// No description provided for @finalAudiobookPlayerScreenPause.
  ///
  /// In en, this message translates to:
  /// **'PAUSE'**
  String get finalAudiobookPlayerScreenPause;

  /// No description provided for @finalGenerateAudiobookScreenUnknownAuthor.
  ///
  /// In en, this message translates to:
  /// **'Unknown Author'**
  String get finalGenerateAudiobookScreenUnknownAuthor;

  /// No description provided for @finalGenerateAudiobookScreenAnalyzingUploadingBook.
  ///
  /// In en, this message translates to:
  /// **'Analyzing & Uploading Book...'**
  String get finalGenerateAudiobookScreenAnalyzingUploadingBook;

  /// No description provided for @finalIptvChannelSheetCancelSelection.
  ///
  /// In en, this message translates to:
  /// **'Cancel Selection'**
  String get finalIptvChannelSheetCancelSelection;

  /// No description provided for @finalIptvChannelSheetDeselectAll.
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get finalIptvChannelSheetDeselectAll;

  /// No description provided for @finalIptvPlayerPageMuted.
  ///
  /// In en, this message translates to:
  /// **'MUTED'**
  String get finalIptvPlayerPageMuted;

  /// No description provided for @finalIptvPortalsModalShowPassword.
  ///
  /// In en, this message translates to:
  /// **'Show Password'**
  String get finalIptvPortalsModalShowPassword;

  /// No description provided for @finalIptvPortalsModalAddM3u.
  ///
  /// In en, this message translates to:
  /// **'Add M3U'**
  String get finalIptvPortalsModalAddM3u;

  /// No description provided for @finalMangaReaderPageUpNext.
  ///
  /// In en, this message translates to:
  /// **'UP NEXT'**
  String get finalMangaReaderPageUpNext;

  /// No description provided for @finalMultinutzPageCustomUrl.
  ///
  /// In en, this message translates to:
  /// **'Custom URL'**
  String get finalMultinutzPageCustomUrl;

  /// No description provided for @finalMultinutzPageDoneRearranging.
  ///
  /// In en, this message translates to:
  /// **'Done Rearranging'**
  String get finalMultinutzPageDoneRearranging;

  /// No description provided for @finalMusicPageSearch.
  ///
  /// In en, this message translates to:
  /// **'Search…'**
  String get finalMusicPageSearch;

  /// No description provided for @finalMyListPageSyncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get finalMyListPageSyncing;

  /// No description provided for @finalMyListPageYourListIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your list is empty'**
  String get finalMyListPageYourListIsEmpty;

  /// No description provided for @finalWatchScreenCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get finalWatchScreenCopied;

  /// No description provided for @finalAddonsSettingsPageBuiltInTorrent.
  ///
  /// In en, this message translates to:
  /// **'BUILT-IN TORRENT'**
  String get finalAddonsSettingsPageBuiltInTorrent;

  /// No description provided for @finalAddonsSettingsPageInstalling.
  ///
  /// In en, this message translates to:
  /// **'Installing...'**
  String get finalAddonsSettingsPageInstalling;

  /// No description provided for @finalAddonsSettingsPageConnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting...'**
  String get finalAddonsSettingsPageConnecting;

  /// No description provided for @finalCloudstreamMarketplaceModalHidePlugins.
  ///
  /// In en, this message translates to:
  /// **'Hide plugins'**
  String get finalCloudstreamMarketplaceModalHidePlugins;

  /// No description provided for @finalCloudstreamMarketplaceModalAddingRepository.
  ///
  /// In en, this message translates to:
  /// **'Adding Repository...'**
  String get finalCloudstreamMarketplaceModalAddingRepository;

  /// No description provided for @finalDebridSettingsPageShowKey.
  ///
  /// In en, this message translates to:
  /// **'Show Key'**
  String get finalDebridSettingsPageShowKey;

  /// No description provided for @finalDebridSettingsPageHideKey.
  ///
  /// In en, this message translates to:
  /// **'Hide Key'**
  String get finalDebridSettingsPageHideKey;

  /// No description provided for @finalSimklSettingsPageConnected.
  ///
  /// In en, this message translates to:
  /// **'CONNECTED'**
  String get finalSimklSettingsPageConnected;

  /// No description provided for @finalUpdatesSettingsPageCheckingForUpdates.
  ///
  /// In en, this message translates to:
  /// **'Checking for updates...'**
  String get finalUpdatesSettingsPageCheckingForUpdates;

  /// No description provided for @finalAudiobookSettingsPageAmbientBackgroundLightingMovingGlows.
  ///
  /// In en, this message translates to:
  /// **'AMBIENT BACKGROUND LIGHTING & MOVING GLOWS'**
  String get finalAudiobookSettingsPageAmbientBackgroundLightingMovingGlows;

  /// No description provided for @finalAudiobookSettingsPageDiscoveryAudiobookPosters.
  ///
  /// In en, this message translates to:
  /// **'DISCOVERY & AUDIOBOOK POSTERS'**
  String get finalAudiobookSettingsPageDiscoveryAudiobookPosters;

  /// No description provided for @finalAudiobookSettingsPageChooseAudioPlayerPreset.
  ///
  /// In en, this message translates to:
  /// **'CHOOSE AUDIO PLAYER PRESET'**
  String get finalAudiobookSettingsPageChooseAudioPlayerPreset;

  /// No description provided for @finalAudiobookSettingsPageMakeYourCustomAudiobookPlayerDragDrop.
  ///
  /// In en, this message translates to:
  /// **'MAKE YOUR CUSTOM AUDIOBOOK PLAYER (DRAG & DROP STUDIO)'**
  String get finalAudiobookSettingsPageMakeYourCustomAudiobookPlayerDragDrop;

  /// No description provided for @finalCustomBackgroundSettingsPageUploading.
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get finalCustomBackgroundSettingsPageUploading;

  /// No description provided for @finalHomeUiSettingsPagePersonalizedRecommendationsComputedByTrakt.
  ///
  /// In en, this message translates to:
  /// **'Personalized recommendations computed by Trakt'**
  String get finalHomeUiSettingsPagePersonalizedRecommendationsComputedByTrakt;

  /// No description provided for @finalHomeUiSettingsPageTopRatedPersonalizedSuggestionsFromSimkl.
  ///
  /// In en, this message translates to:
  /// **'Top-rated & personalized suggestions from Simkl'**
  String get finalHomeUiSettingsPageTopRatedPersonalizedSuggestionsFromSimkl;

  /// No description provided for @finalLiquidGlassSettingsPageLiveInteractivePreview.
  ///
  /// In en, this message translates to:
  /// **'LIVE INTERACTIVE PREVIEW'**
  String get finalLiquidGlassSettingsPageLiveInteractivePreview;

  /// No description provided for @finalMangaSettingsPageDiscoveryPosterCards.
  ///
  /// In en, this message translates to:
  /// **'DISCOVERY & POSTER CARDS'**
  String get finalMangaSettingsPageDiscoveryPosterCards;

  /// No description provided for @finalMangaSettingsPageMangaReaderChapterViewer.
  ///
  /// In en, this message translates to:
  /// **'MANGA READER & CHAPTER VIEWER'**
  String get finalMangaSettingsPageMangaReaderChapterViewer;

  /// No description provided for @finalMusicSettingsPageVisualThemePalette.
  ///
  /// In en, this message translates to:
  /// **'VISUAL THEME PALETTE'**
  String get finalMusicSettingsPageVisualThemePalette;

  /// No description provided for @finalMusicSettingsPageAmbientAtmosphereGlow.
  ///
  /// In en, this message translates to:
  /// **'AMBIENT ATMOSPHERE & GLOW'**
  String get finalMusicSettingsPageAmbientAtmosphereGlow;

  /// No description provided for @finalMusicSettingsPageDiscoveryCatalogConfiguration.
  ///
  /// In en, this message translates to:
  /// **'DISCOVERY & CATALOG CONFIGURATION'**
  String get finalMusicSettingsPageDiscoveryCatalogConfiguration;

  /// No description provided for @finalMusicSettingsPageFullscreenPlayerPresets.
  ///
  /// In en, this message translates to:
  /// **'FULLSCREEN PLAYER PRESETS'**
  String get finalMusicSettingsPageFullscreenPlayerPresets;

  /// No description provided for @finalMusicSettingsPageCustomPlayerEngineDesigner.
  ///
  /// In en, this message translates to:
  /// **'CUSTOM PLAYER ENGINE DESIGNER'**
  String get finalMusicSettingsPageCustomPlayerEngineDesigner;

  /// No description provided for @arabicSectionContinueWatching0.
  ///
  /// In en, this message translates to:
  /// **'Continue watching'**
  String get arabicSectionContinueWatching0;

  /// No description provided for @arabicSectionLatestEpisodes1.
  ///
  /// In en, this message translates to:
  /// **'⚡ Latest episodes'**
  String get arabicSectionLatestEpisodes1;

  /// No description provided for @arabicSectionLatestEpisodesWithArabicSubtitles2.
  ///
  /// In en, this message translates to:
  /// **'Latest episodes with Arabic subtitles'**
  String get arabicSectionLatestEpisodesWithArabicSubtitles2;

  /// No description provided for @arabicSectionTrending3.
  ///
  /// In en, this message translates to:
  /// **'🔥 Trending'**
  String get arabicSectionTrending3;

  /// No description provided for @arabicSectionMostWatchedAnimeRightNow4.
  ///
  /// In en, this message translates to:
  /// **'Most watched anime right now'**
  String get arabicSectionMostWatchedAnimeRightNow4;

  /// No description provided for @arabicSectionPopularFilms5.
  ///
  /// In en, this message translates to:
  /// **'🎬 Popular films'**
  String get arabicSectionPopularFilms5;

  /// No description provided for @arabicSectionFeaturedAnimeFilms6.
  ///
  /// In en, this message translates to:
  /// **'Featured anime films'**
  String get arabicSectionFeaturedAnimeFilms6;

  /// No description provided for @arabicSectionTopRatedAnime7.
  ///
  /// In en, this message translates to:
  /// **'👑 Top rated anime'**
  String get arabicSectionTopRatedAnime7;

  /// No description provided for @arabicSectionHighlyRatedAnime8.
  ///
  /// In en, this message translates to:
  /// **'Highly rated anime'**
  String get arabicSectionHighlyRatedAnime8;

  /// No description provided for @arabicSectionSeasonalAnime9.
  ///
  /// In en, this message translates to:
  /// **'🌟 Seasonal anime'**
  String get arabicSectionSeasonalAnime9;

  /// No description provided for @arabicSectionCurrentSeasonShows10.
  ///
  /// In en, this message translates to:
  /// **'Current season shows'**
  String get arabicSectionCurrentSeasonShows10;

  /// No description provided for @arabicSectionClassicAnime11.
  ///
  /// In en, this message translates to:
  /// **'⚔️ Classic anime'**
  String get arabicSectionClassicAnime11;

  /// No description provided for @arabicSectionTimelessAnimeClassics12.
  ///
  /// In en, this message translates to:
  /// **'Timeless anime classics'**
  String get arabicSectionTimelessAnimeClassics12;

  /// No description provided for @arabicSectionComingSoon13.
  ///
  /// In en, this message translates to:
  /// **'🚀 Coming soon'**
  String get arabicSectionComingSoon13;

  /// No description provided for @arabicSectionUpcomingAnime14.
  ///
  /// In en, this message translates to:
  /// **'Upcoming anime'**
  String get arabicSectionUpcomingAnime14;

  /// No description provided for @arabicSectionAiringNow15.
  ///
  /// In en, this message translates to:
  /// **'Airing now'**
  String get arabicSectionAiringNow15;

  /// No description provided for @arabicSectionShowLess16.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get arabicSectionShowLess16;

  /// No description provided for @arabicSectionShowMore17.
  ///
  /// In en, this message translates to:
  /// **'Show more'**
  String get arabicSectionShowMore17;

  /// No description provided for @arabicSectionEpisodes18.
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get arabicSectionEpisodes18;

  /// No description provided for @arabicSectionJumpToEpisode19.
  ///
  /// In en, this message translates to:
  /// **'Jump to episode...'**
  String get arabicSectionJumpToEpisode19;

  /// No description provided for @arabicSectionRelatedAnime20.
  ///
  /// In en, this message translates to:
  /// **'Related anime'**
  String get arabicSectionRelatedAnime20;

  /// No description provided for @arabicSectionCheckingServers21.
  ///
  /// In en, this message translates to:
  /// **'Checking servers...'**
  String get arabicSectionCheckingServers21;

  /// No description provided for @arabicSectionServers22.
  ///
  /// In en, this message translates to:
  /// **'Servers'**
  String get arabicSectionServers22;

  /// No description provided for @arabicSectionRetry23.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get arabicSectionRetry23;

  /// No description provided for @arabicSectionPlaybackServer24.
  ///
  /// In en, this message translates to:
  /// **'Playback server'**
  String get arabicSectionPlaybackServer24;

  /// No description provided for @arabicSectionDirectStreamingHighQuality25.
  ///
  /// In en, this message translates to:
  /// **'Direct streaming • High quality'**
  String get arabicSectionDirectStreamingHighQuality25;

  /// No description provided for @subtitleBaseFontSize.
  ///
  /// In en, this message translates to:
  /// **'BASE FONT SIZE ({value}pt)'**
  String subtitleBaseFontSize(String value);

  /// No description provided for @subtitleScaleMultiplier.
  ///
  /// In en, this message translates to:
  /// **'SCALE MULTIPLIER ({value}%)'**
  String subtitleScaleMultiplier(String value);

  /// No description provided for @subtitleOutlineThickness.
  ///
  /// In en, this message translates to:
  /// **'OUTLINE THICKNESS ({value}px)'**
  String subtitleOutlineThickness(String value);

  /// No description provided for @subtitleShadowOffset.
  ///
  /// In en, this message translates to:
  /// **'DROP SHADOW OFFSET ({value}px)'**
  String subtitleShadowOffset(String value);

  /// No description provided for @subtitleBottomMargin.
  ///
  /// In en, this message translates to:
  /// **'BOTTOM MARGIN / OFFSET ({value}px)'**
  String subtitleBottomMargin(String value);

  /// No description provided for @subtitleVerticalPosition.
  ///
  /// In en, this message translates to:
  /// **'VERTICAL POSITION ({value}%)'**
  String subtitleVerticalPosition(String value);

  /// No description provided for @arabicEpisodeNumber.
  ///
  /// In en, this message translates to:
  /// **'Episode {number}'**
  String arabicEpisodeNumber(String number);

  /// No description provided for @downloadFailedDetail.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String downloadFailedDetail(String error);

  /// No description provided for @downloadUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get downloadUnknownError;

  /// No description provided for @downloadPausedProgress.
  ///
  /// In en, this message translates to:
  /// **'Paused ({progress}%)'**
  String downloadPausedProgress(String progress);

  /// No description provided for @downloadEtaProgress.
  ///
  /// In en, this message translates to:
  /// **'{progress}% · {speed} · ETA: {eta}'**
  String downloadEtaProgress(String progress, String speed, String eta);

  /// No description provided for @subtitleOptionWhite0.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get subtitleOptionWhite0;

  /// No description provided for @subtitleOptionCinemaYellow1.
  ///
  /// In en, this message translates to:
  /// **'Cinema Yellow'**
  String get subtitleOptionCinemaYellow1;

  /// No description provided for @subtitleOptionAmberGold2.
  ///
  /// In en, this message translates to:
  /// **'Amber Gold'**
  String get subtitleOptionAmberGold2;

  /// No description provided for @subtitleOptionElectricCyan3.
  ///
  /// In en, this message translates to:
  /// **'Electric Cyan'**
  String get subtitleOptionElectricCyan3;

  /// No description provided for @subtitleOptionNeonGreen4.
  ///
  /// In en, this message translates to:
  /// **'Neon Green'**
  String get subtitleOptionNeonGreen4;

  /// No description provided for @subtitleOptionVibrantOrange5.
  ///
  /// In en, this message translates to:
  /// **'Vibrant Orange'**
  String get subtitleOptionVibrantOrange5;

  /// No description provided for @subtitleOptionSoftRose6.
  ///
  /// In en, this message translates to:
  /// **'Soft Rose'**
  String get subtitleOptionSoftRose6;

  /// No description provided for @subtitleOptionLightGray7.
  ///
  /// In en, this message translates to:
  /// **'Light Gray'**
  String get subtitleOptionLightGray7;

  /// No description provided for @subtitleOptionNone8.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get subtitleOptionNone8;

  /// No description provided for @subtitleOption25Dark9.
  ///
  /// In en, this message translates to:
  /// **'25% Dark'**
  String get subtitleOption25Dark9;

  /// No description provided for @subtitleOption50Dark10.
  ///
  /// In en, this message translates to:
  /// **'50% Dark'**
  String get subtitleOption50Dark10;

  /// No description provided for @subtitleOption75Dark11.
  ///
  /// In en, this message translates to:
  /// **'75% Dark'**
  String get subtitleOption75Dark11;

  /// No description provided for @subtitleOption100Solid12.
  ///
  /// In en, this message translates to:
  /// **'100% Solid'**
  String get subtitleOption100Solid12;

  /// No description provided for @subtitleOption50Indigo13.
  ///
  /// In en, this message translates to:
  /// **'50% Indigo'**
  String get subtitleOption50Indigo13;

  /// No description provided for @subtitleOptionTransparent14.
  ///
  /// In en, this message translates to:
  /// **'Transparent'**
  String get subtitleOptionTransparent14;

  /// No description provided for @subtitleOptionSubtle15.
  ///
  /// In en, this message translates to:
  /// **'Subtle'**
  String get subtitleOptionSubtle15;

  /// No description provided for @subtitleOptionStandardBox16.
  ///
  /// In en, this message translates to:
  /// **'Standard Box'**
  String get subtitleOptionStandardBox16;

  /// No description provided for @subtitleOptionHighContrast17.
  ///
  /// In en, this message translates to:
  /// **'High Contrast'**
  String get subtitleOptionHighContrast17;

  /// No description provided for @subtitleOptionOpaqueBlack18.
  ///
  /// In en, this message translates to:
  /// **'Opaque Black'**
  String get subtitleOptionOpaqueBlack18;

  /// No description provided for @subtitleOptionSlateTint19.
  ///
  /// In en, this message translates to:
  /// **'Slate Tint'**
  String get subtitleOptionSlateTint19;

  /// No description provided for @subtitleOptionBlack20.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get subtitleOptionBlack20;

  /// No description provided for @subtitleOptionDarkSlate21.
  ///
  /// In en, this message translates to:
  /// **'Dark Slate'**
  String get subtitleOptionDarkSlate21;

  /// No description provided for @subtitleOptionGold22.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get subtitleOptionGold22;

  /// No description provided for @subtitleOptionCrimson23.
  ///
  /// In en, this message translates to:
  /// **'Crimson'**
  String get subtitleOptionCrimson23;

  /// No description provided for @subtitleOptionNeonCyan24.
  ///
  /// In en, this message translates to:
  /// **'Neon Cyan'**
  String get subtitleOptionNeonCyan24;

  /// No description provided for @subtitleOptionPreserveAnimeSsaAssStylingRecommended25.
  ///
  /// In en, this message translates to:
  /// **'Preserve Anime & SSA/ASS Styling (Recommended)'**
  String get subtitleOptionPreserveAnimeSsaAssStylingRecommended25;

  /// No description provided for @subtitleOptionLeavesSsaAssAnimeSubtitlesUntouched26.
  ///
  /// In en, this message translates to:
  /// **'Leaves SSA/ASS anime subtitles untouched to preserve custom karaoke, styling & positions. Plain SRT/VTT are styled with your custom theme.'**
  String get subtitleOptionLeavesSsaAssAnimeSubtitlesUntouched26;

  /// No description provided for @subtitleOptionScaleOnly27.
  ///
  /// In en, this message translates to:
  /// **'Scale Only'**
  String get subtitleOptionScaleOnly27;

  /// No description provided for @subtitleOptionAppliesSizeScalingToSsaAss28.
  ///
  /// In en, this message translates to:
  /// **'Applies size scaling to SSA/ASS scripts while preserving their fonts, colors, and author typography.'**
  String get subtitleOptionAppliesSizeScalingToSsaAss28;

  /// No description provided for @subtitleOptionOverrideColorsOutlines29.
  ///
  /// In en, this message translates to:
  /// **'Override Colors & Outlines'**
  String get subtitleOptionOverrideColorsOutlines29;

  /// No description provided for @subtitleOptionAppliesYourCustomColorsAndOutlines30.
  ///
  /// In en, this message translates to:
  /// **'Applies your custom colors and outlines on top of SSA/ASS subtitle scripts.'**
  String get subtitleOptionAppliesYourCustomColorsAndOutlines30;

  /// No description provided for @uiFinalTextSyncOverlayFixSection.
  ///
  /// In en, this message translates to:
  /// **'FIX SECTION'**
  String get uiFinalTextSyncOverlayFixSection;

  /// No description provided for @uiFinalTextSyncOverlaySubtitleTiming.
  ///
  /// In en, this message translates to:
  /// **'SUBTITLE TIMING'**
  String get uiFinalTextSyncOverlaySubtitleTiming;

  /// No description provided for @uiFinalTextSyncOverlaySelectRangeSync.
  ///
  /// In en, this message translates to:
  /// **'Select Range & Sync'**
  String get uiFinalTextSyncOverlaySelectRangeSync;

  /// No description provided for @uiFinalTextSyncOverlaySpeechDialogueSync.
  ///
  /// In en, this message translates to:
  /// **'Speech Dialogue Sync'**
  String get uiFinalTextSyncOverlaySpeechDialogueSync;

  /// No description provided for @uiFinalAdultPageNo18SourcesYet.
  ///
  /// In en, this message translates to:
  /// **'No 18+ sources yet.'**
  String get uiFinalAdultPageNo18SourcesYet;

  /// No description provided for @uiFinalAdultPage18SourcesFoundNothingToShow.
  ///
  /// In en, this message translates to:
  /// **'18+ sources found nothing to show.'**
  String get uiFinalAdultPage18SourcesFoundNothingToShow;

  /// No description provided for @uiFinalAdultPageMarkAnAddonAs18Or.
  ///
  /// In en, this message translates to:
  /// **'Mark an addon as 18+ or hybrid in Settings → Addons, or install one.'**
  String get uiFinalAdultPageMarkAnAddonAs18Or;

  /// No description provided for @uiFinalAdultPageTheAddonsThisPageListsAnswered.
  ///
  /// In en, this message translates to:
  /// **'The addons this page lists answered with no titles. Try again in a moment.'**
  String get uiFinalAdultPageTheAddonsThisPageListsAnswered;

  /// No description provided for @uiFinalMyListPageSaveYourFavoriteMoviesAndTv.
  ///
  /// In en, this message translates to:
  /// **'Save your favorite movies and TV shows to watch anytime'**
  String get uiFinalMyListPageSaveYourFavoriteMoviesAndTv;

  /// No description provided for @uiFinalMyListPageTryAdjustingYourSearchQueryOr.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search query or filter settings'**
  String get uiFinalMyListPageTryAdjustingYourSearchQueryOr;

  /// No description provided for @uiFinalAddonsSettingsPageCloudstreamEngineReady.
  ///
  /// In en, this message translates to:
  /// **'CloudStream Engine Ready'**
  String get uiFinalAddonsSettingsPageCloudstreamEngineReady;

  /// No description provided for @uiFinalAddonsSettingsPageRuntimeSetupRequired.
  ///
  /// In en, this message translates to:
  /// **'Runtime Setup Required'**
  String get uiFinalAddonsSettingsPageRuntimeSetupRequired;

  /// No description provided for @uiFinalAddonsSettingsPageNativeEngineActiveAndListeningFor.
  ///
  /// In en, this message translates to:
  /// **'Native engine active and listening for queries.'**
  String get uiFinalAddonsSettingsPageNativeEngineActiveAndListeningFor;

  /// No description provided for @uiFinalAddonsSettingsPageDeselectAll.
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get uiFinalAddonsSettingsPageDeselectAll;

  /// No description provided for @uiFinalAddonsSettingsPageSelectAll.
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get uiFinalAddonsSettingsPageSelectAll;

  /// No description provided for @uiFinalAddonsSettingsPageNoDebridProviderIsSetUp.
  ///
  /// In en, this message translates to:
  /// **'No Debrid provider is set up yet'**
  String get uiFinalAddonsSettingsPageNoDebridProviderIsSetUp;

  /// No description provided for @uiFinalIptvPortalsModalPortalsPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Portals & Playlists'**
  String get uiFinalIptvPortalsModalPortalsPlaylists;

  /// No description provided for @uiFinalIptvPortalsModalIptvPortalsPlaylists.
  ///
  /// In en, this message translates to:
  /// **'IPTV Portals & Playlists'**
  String get uiFinalIptvPortalsModalIptvPortalsPlaylists;

  /// No description provided for @uiFinalIptvPortalBrowserPageCheckHealth.
  ///
  /// In en, this message translates to:
  /// **'Check Health'**
  String get uiFinalIptvPortalBrowserPageCheckHealth;

  /// No description provided for @uiFinalIptvPortalBrowserPageNow.
  ///
  /// In en, this message translates to:
  /// **'NOW: '**
  String get uiFinalIptvPortalBrowserPageNow;

  /// No description provided for @uiFinalIptvPortalBrowserPageNext.
  ///
  /// In en, this message translates to:
  /// **'   NEXT: '**
  String get uiFinalIptvPortalBrowserPageNext;

  /// No description provided for @uiFinalTvCalendarPageNoEpisodesFoundForThisDay.
  ///
  /// In en, this message translates to:
  /// **'No episodes found for this day'**
  String get uiFinalTvCalendarPageNoEpisodesFoundForThisDay;

  /// No description provided for @uiFinalTvCalendarPageTrySelectingAllOrADifferent.
  ///
  /// In en, this message translates to:
  /// **'Try selecting \"All\" or a different network above'**
  String get uiFinalTvCalendarPageTrySelectingAllOrADifferent;

  /// No description provided for @uiFinalTvCalendarPageSelectAnotherDayFromTheTimeline.
  ///
  /// In en, this message translates to:
  /// **'Select another day from the timeline above'**
  String get uiFinalTvCalendarPageSelectAnotherDayFromTheTimeline;

  /// No description provided for @uiFinalMusicPageDownloadedOfflineTapToRemove.
  ///
  /// In en, this message translates to:
  /// **'Downloaded Offline (Tap to Remove)'**
  String get uiFinalMusicPageDownloadedOfflineTapToRemove;

  /// No description provided for @uiFinalMusicPageDownloadingQueued.
  ///
  /// In en, this message translates to:
  /// **'Downloading / Queued...'**
  String get uiFinalMusicPageDownloadingQueued;

  /// No description provided for @uiFinalMusicPageDownloadTrackOffline.
  ///
  /// In en, this message translates to:
  /// **'Download Track Offline'**
  String get uiFinalMusicPageDownloadTrackOffline;

  /// No description provided for @uiFinalTmdbSettingsPageSavedOnThisDeviceEnterA.
  ///
  /// In en, this message translates to:
  /// **'Saved on this device. Enter a new key to replace it.'**
  String get uiFinalTmdbSettingsPageSavedOnThisDeviceEnterA;

  /// No description provided for @uiFinalTmdbSettingsPageFreeKeyFromThemoviedbOrg.
  ///
  /// In en, this message translates to:
  /// **'Free key from themoviedb.org'**
  String get uiFinalTmdbSettingsPageFreeKeyFromThemoviedbOrg;

  /// No description provided for @uiFinalTraktSettingsPageCheckingCredentials.
  ///
  /// In en, this message translates to:
  /// **'Checking credentials...'**
  String get uiFinalTraktSettingsPageCheckingCredentials;

  /// No description provided for @uiFinalTraktSettingsPageSignInToActivateTwoWay.
  ///
  /// In en, this message translates to:
  /// **'Sign in to activate two-way cloud sync'**
  String get uiFinalTraktSettingsPageSignInToActivateTwoWay;

  /// No description provided for @uiFinalSimklSettingsPageCheckingCredentials.
  ///
  /// In en, this message translates to:
  /// **'Checking credentials...'**
  String get uiFinalSimklSettingsPageCheckingCredentials;

  /// No description provided for @uiFinalSimklSettingsPageSignInWithPinToActivate.
  ///
  /// In en, this message translates to:
  /// **'Sign in with PIN to activate Simkl cloud sync'**
  String get uiFinalSimklSettingsPageSignInWithPinToActivate;

  /// No description provided for @uiFinalHomeUiSettingsPageCustomBackgroundActiveWithAmbientLight.
  ///
  /// In en, this message translates to:
  /// **'Custom background active with ambient light blending'**
  String get uiFinalHomeUiSettingsPageCustomBackgroundActiveWithAmbientLight;

  /// No description provided for @uiFinalHomeUiSettingsPageUploadPhotosOrChooseCuratedDark.
  ///
  /// In en, this message translates to:
  /// **'Upload photos or choose curated dark wallpapers'**
  String get uiFinalHomeUiSettingsPageUploadPhotosOrChooseCuratedDark;

  /// No description provided for @uiFinalBookDetailSheetResumeReading.
  ///
  /// In en, this message translates to:
  /// **'Resume Reading'**
  String get uiFinalBookDetailSheetResumeReading;

  /// No description provided for @uiFinalBookDetailSheetReadNow.
  ///
  /// In en, this message translates to:
  /// **'Read Now'**
  String get uiFinalBookDetailSheetReadNow;

  /// No description provided for @uiFinalMagnetFilesViewConnectingToSwarmPeers.
  ///
  /// In en, this message translates to:
  /// **'Connecting to swarm peers...'**
  String get uiFinalMagnetFilesViewConnectingToSwarmPeers;

  /// No description provided for @uiFinalMagnetFilesViewP2pSwarm.
  ///
  /// In en, this message translates to:
  /// **'P2P Swarm'**
  String get uiFinalMagnetFilesViewP2pSwarm;

  /// No description provided for @uiFinalWewatchQuizPageRate3TitlesToUnlockRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Rate 3 Titles to Unlock Recommendations'**
  String get uiFinalWewatchQuizPageRate3TitlesToUnlockRecommendations;

  /// No description provided for @addonsRemoveCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Remove 1 plugin?} other{Remove {count} plugins?}}'**
  String addonsRemoveCount(int count);

  /// No description provided for @addonsRemovedCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Removed 1 plugin.} other{Removed {count} plugins.}}'**
  String addonsRemovedCount(int count);

  /// No description provided for @addonsUsesServiceKey.
  ///
  /// In en, this message translates to:
  /// **'Uses your {value} key'**
  String addonsUsesServiceKey(String value);

  /// No description provided for @addonsContainsPlugins.
  ///
  /// In en, this message translates to:
  /// **'Contains: {value}'**
  String addonsContainsPlugins(String value);

  /// No description provided for @iptvCurrentChannel.
  ///
  /// In en, this message translates to:
  /// **'Channel {index}/{total} · {name}'**
  String iptvCurrentChannel(int index, int total, String name);

  /// No description provided for @iptvCurrentSource.
  ///
  /// In en, this message translates to:
  /// **'Source {index}/{total} · {name}'**
  String iptvCurrentSource(int index, int total, String name);

  /// No description provided for @iptvNoPlayableStream.
  ///
  /// In en, this message translates to:
  /// **'No playable stream for \"{name}\". Reconnect the portal or remove it and add another.'**
  String iptvNoPlayableStream(String name);

  /// No description provided for @iptvStopHealthCheck.
  ///
  /// In en, this message translates to:
  /// **'Stop ({checked}/{total})'**
  String iptvStopHealthCheck(int checked, int total);

  /// No description provided for @calendarNoNetworkEpisodes.
  ///
  /// In en, this message translates to:
  /// **'No episodes on {value} for this day'**
  String calendarNoNetworkEpisodes(String value);

  /// No description provided for @musicLosslessQuality.
  ///
  /// In en, this message translates to:
  /// **'{value} • HI-RES LOSSLESS AUDIO'**
  String musicLosslessQuality(String value);

  /// No description provided for @musicExtractingTrack.
  ///
  /// In en, this message translates to:
  /// **'Extracting stream for \"{value}\"...'**
  String musicExtractingTrack(String value);

  /// No description provided for @musicDownloadingTrack.
  ///
  /// In en, this message translates to:
  /// **'Downloading \"{title}\" ({progress}%)'**
  String musicDownloadingTrack(String title, int progress);

  /// No description provided for @accountLoggedInTrakt.
  ///
  /// In en, this message translates to:
  /// **'Logged in as {value}'**
  String accountLoggedInTrakt(String value);

  /// No description provided for @accountLoggedInSimkl.
  ///
  /// In en, this message translates to:
  /// **'Logged in as {value}'**
  String accountLoggedInSimkl(String value);

  /// No description provided for @wallpaperActivePalette.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper active with {value} ambient lighting'**
  String wallpaperActivePalette(String value);

  /// No description provided for @wallpaperDefaultPalette.
  ///
  /// In en, this message translates to:
  /// **'Default {value} theme background'**
  String wallpaperDefaultPalette(String value);

  /// No description provided for @bookDownloadingProgress.
  ///
  /// In en, this message translates to:
  /// **'Downloading {progress}%...'**
  String bookDownloadingProgress(int progress);

  /// No description provided for @mediaCollectionPart.
  ///
  /// In en, this message translates to:
  /// **'PART {value}'**
  String mediaCollectionPart(String value);

  /// No description provided for @magnetUsingProvider.
  ///
  /// In en, this message translates to:
  /// **'Using {value} for files...'**
  String magnetUsingProvider(String value);

  /// No description provided for @magnetProviderCloud.
  ///
  /// In en, this message translates to:
  /// **'{value} Cloud'**
  String magnetProviderCloud(String value);

  /// No description provided for @aiDiscoverRated.
  ///
  /// In en, this message translates to:
  /// **'Discover Recommendations ({count} Titles)'**
  String aiDiscoverRated(int count);

  /// No description provided for @iptvChannelsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 channel} other{{count} channels}}'**
  String iptvChannelsCount(int count);

  /// No description provided for @audiobookVoiceName.
  ///
  /// In en, this message translates to:
  /// **'Voice: {value}'**
  String audiobookVoiceName(String value);

  /// No description provided for @audiobookGeneratingProgress.
  ///
  /// In en, this message translates to:
  /// **'Generating {progress}%'**
  String audiobookGeneratingProgress(int progress);

  /// No description provided for @updateExecutableInstructions.
  ///
  /// In en, this message translates to:
  /// **'Make the file executable and run it:\nchmod +x \"{file}\"\n./{file}'**
  String updateExecutableInstructions(String file);

  /// No description provided for @videoZeroCopy.
  ///
  /// In en, this message translates to:
  /// **'Zero-Copy'**
  String get videoZeroCopy;

  /// No description provided for @videoTextureViewOff.
  ///
  /// In en, this message translates to:
  /// **'Off (TextureView)'**
  String get videoTextureViewOff;

  /// No description provided for @aiRecMediaSeries.
  ///
  /// In en, this message translates to:
  /// **'TV Series'**
  String get aiRecMediaSeries;

  /// No description provided for @audiobookSplitNotice.
  ///
  /// In en, this message translates to:
  /// **'This book has approximately {words} words. It will be split into {parts} parts along chapter boundaries and queued:'**
  String audiobookSplitNotice(String words, int parts);

  /// No description provided for @audiobookSplitPart.
  ///
  /// In en, this message translates to:
  /// **'{name} (approximately {words} words)'**
  String audiobookSplitPart(String name, String words);

  /// No description provided for @configCopyModernGlassIsland.
  ///
  /// In en, this message translates to:
  /// **'Modern Glass Island'**
  String get configCopyModernGlassIsland;

  /// No description provided for @configCopySleekFloatingGlassmorphismPlayerWithWaveformScrubber.
  ///
  /// In en, this message translates to:
  /// **'Sleek floating glassmorphism player with waveform scrubber & ambient glow'**
  String get configCopySleekFloatingGlassmorphismPlayerWithWaveformScrubber;

  /// No description provided for @configCopyVinylTurntableStudio.
  ///
  /// In en, this message translates to:
  /// **'Vinyl Turntable Studio'**
  String get configCopyVinylTurntableStudio;

  /// No description provided for @configCopyRotatingVinylDiscTonearmAnimationAnalogVintage.
  ///
  /// In en, this message translates to:
  /// **'Rotating vinyl disc, tonearm animation & analog vintage VU styling'**
  String get configCopyRotatingVinylDiscTonearmAnimationAnalogVintage;

  /// No description provided for @configCopyMinimalistFocusCapsule.
  ///
  /// In en, this message translates to:
  /// **'Minimalist Focus Capsule'**
  String get configCopyMinimalistFocusCapsule;

  /// No description provided for @configCopyCompactDistractionFreeFloatingCapsuleWithEssential.
  ///
  /// In en, this message translates to:
  /// **'Compact distraction-free floating capsule with essential controls'**
  String get configCopyCompactDistractionFreeFloatingCapsuleWithEssential;

  /// No description provided for @configCopyImmersiveCanvasStudio.
  ///
  /// In en, this message translates to:
  /// **'Immersive Canvas Studio'**
  String get configCopyImmersiveCanvasStudio;

  /// No description provided for @configCopyFullScreenCinematicAmbientBlurCanvasWith.
  ///
  /// In en, this message translates to:
  /// **'Full-screen cinematic ambient blur canvas with oversized artwork'**
  String get configCopyFullScreenCinematicAmbientBlurCanvasWith;

  /// No description provided for @configCopyCustomDragDropStudio.
  ///
  /// In en, this message translates to:
  /// **'Custom Drag & Drop Studio'**
  String get configCopyCustomDragDropStudio;

  /// No description provided for @configCopyYourFullyCustomizedArrangedAndStyledAudio.
  ///
  /// In en, this message translates to:
  /// **'Your fully customized, arranged and styled audio player'**
  String get configCopyYourFullyCustomizedArrangedAndStyledAudio;

  /// No description provided for @configCopyDynamicAudioWaveformCanvas.
  ///
  /// In en, this message translates to:
  /// **'Dynamic Audio Waveform Canvas'**
  String get configCopyDynamicAudioWaveformCanvas;

  /// No description provided for @configCopyProceduralAnimatedWaveformBarsWithLiveEqualizer.
  ///
  /// In en, this message translates to:
  /// **'Procedural animated waveform bars with live equalizer scrubbing'**
  String get configCopyProceduralAnimatedWaveformBarsWithLiveEqualizer;

  /// No description provided for @configCopyNeonGradientProgressBar.
  ///
  /// In en, this message translates to:
  /// **'Neon Gradient Progress Bar'**
  String get configCopyNeonGradientProgressBar;

  /// No description provided for @configCopyMultiColorVibrantLinearGradientScrubberWith.
  ///
  /// In en, this message translates to:
  /// **'Multi-color vibrant linear gradient scrubber with glowing tip'**
  String get configCopyMultiColorVibrantLinearGradientScrubberWith;

  /// No description provided for @configCopyPrecisionGlassSlider.
  ///
  /// In en, this message translates to:
  /// **'Precision Glass Slider'**
  String get configCopyPrecisionGlassSlider;

  /// No description provided for @configCopyTactileInteractiveGlassTrackWithTimecodeReadouts.
  ///
  /// In en, this message translates to:
  /// **'Tactile interactive glass track with timecode readouts'**
  String get configCopyTactileInteractiveGlassTrackWithTimecodeReadouts;

  /// No description provided for @configCopyRadialCircularRingScrubber.
  ///
  /// In en, this message translates to:
  /// **'Radial Circular Ring Scrubber'**
  String get configCopyRadialCircularRingScrubber;

  /// No description provided for @configCopyRadialCircularDialScrubberForCompactModern.
  ///
  /// In en, this message translates to:
  /// **'Radial circular dial scrubber for compact modern interfaces'**
  String get configCopyRadialCircularDialScrubberForCompactModern;

  /// No description provided for @configCopyCircleAuraGlow.
  ///
  /// In en, this message translates to:
  /// **'Circle Aura Glow'**
  String get configCopyCircleAuraGlow;

  /// No description provided for @configCopyLiquidGlassNeomorphic.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass Neomorphic'**
  String get configCopyLiquidGlassNeomorphic;

  /// No description provided for @configCopyRoundedGlassSquare.
  ///
  /// In en, this message translates to:
  /// **'Rounded Glass Square'**
  String get configCopyRoundedGlassSquare;

  /// No description provided for @configCopyWideAccentPill.
  ///
  /// In en, this message translates to:
  /// **'Wide Accent Pill'**
  String get configCopyWideAccentPill;

  /// No description provided for @configCopyScaleSpringBounce.
  ///
  /// In en, this message translates to:
  /// **'Scale & Spring Bounce'**
  String get configCopyScaleSpringBounce;

  /// No description provided for @configCopyThemeAccentGlowAura.
  ///
  /// In en, this message translates to:
  /// **'Theme Accent Glow Aura'**
  String get configCopyThemeAccentGlowAura;

  /// No description provided for @configCopyLiquidGlassRipple.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass Ripple'**
  String get configCopyLiquidGlassRipple;

  /// No description provided for @configCopy3dSubtleTiltPerspective.
  ///
  /// In en, this message translates to:
  /// **'3D Subtle Tilt Perspective'**
  String get configCopy3dSubtleTiltPerspective;

  /// No description provided for @configCopy3dRoundedSquareWithGlow.
  ///
  /// In en, this message translates to:
  /// **'3D Rounded Square with Glow'**
  String get configCopy3dRoundedSquareWithGlow;

  /// No description provided for @configCopySpinningVinylDisc.
  ///
  /// In en, this message translates to:
  /// **'Spinning Vinyl Disc'**
  String get configCopySpinningVinylDisc;

  /// No description provided for @configCopyFloatingGlassCard.
  ///
  /// In en, this message translates to:
  /// **'Floating Glass Card'**
  String get configCopyFloatingGlassCard;

  /// No description provided for @configCopyHiddenFocusMode.
  ///
  /// In en, this message translates to:
  /// **'Hidden / Focus Mode'**
  String get configCopyHiddenFocusMode;

  /// No description provided for @configCopyCompactDenseGrid.
  ///
  /// In en, this message translates to:
  /// **'Compact (Dense Grid)'**
  String get configCopyCompactDenseGrid;

  /// No description provided for @configCopyStandardBalanced.
  ///
  /// In en, this message translates to:
  /// **'Standard (Balanced)'**
  String get configCopyStandardBalanced;

  /// No description provided for @configCopySpaciousLargeCovers.
  ///
  /// In en, this message translates to:
  /// **'Spacious (Large Covers)'**
  String get configCopySpaciousLargeCovers;

  /// No description provided for @configCopyRecommendedOnWindowsFasterInPracticeHere.
  ///
  /// In en, this message translates to:
  /// **'Recommended on Windows — faster in practice here and avoids the NVIDIA driver crash seen with Impeller.'**
  String get configCopyRecommendedOnWindowsFasterInPracticeHere;

  /// No description provided for @configCopyEngineDefaultKeptSelectableForTestingCoincided.
  ///
  /// In en, this message translates to:
  /// **'Engine default — kept selectable for testing. Coincided with an NVIDIA driver crash notice on this machine.'**
  String get configCopyEngineDefaultKeptSelectableForTestingCoincided;

  /// No description provided for @configCopyTopBelowHeroBanner.
  ///
  /// In en, this message translates to:
  /// **'Top (Below Hero Banner)'**
  String get configCopyTopBelowHeroBanner;

  /// No description provided for @configCopyUnderCinemetaAddon.
  ///
  /// In en, this message translates to:
  /// **'Under Cinemeta Addon'**
  String get configCopyUnderCinemetaAddon;

  /// No description provided for @configCopyMiddleOfCatalog.
  ///
  /// In en, this message translates to:
  /// **'Middle of Catalog'**
  String get configCopyMiddleOfCatalog;

  /// No description provided for @configCopyBottomOfPage.
  ///
  /// In en, this message translates to:
  /// **'Bottom of Page'**
  String get configCopyBottomOfPage;

  /// No description provided for @configCopyImmersiveCinematicCarousel.
  ///
  /// In en, this message translates to:
  /// **'Immersive Cinematic Carousel'**
  String get configCopyImmersiveCinematicCarousel;

  /// No description provided for @configCopyCompactSpotlight.
  ///
  /// In en, this message translates to:
  /// **'Compact Spotlight'**
  String get configCopyCompactSpotlight;

  /// No description provided for @configCopyMinimalistHeader.
  ///
  /// In en, this message translates to:
  /// **'Minimalist Header'**
  String get configCopyMinimalistHeader;

  /// No description provided for @configCopyDualFloatingOrbs.
  ///
  /// In en, this message translates to:
  /// **'Dual Floating Orbs'**
  String get configCopyDualFloatingOrbs;

  /// No description provided for @configCopyTopAuroraHorizon.
  ///
  /// In en, this message translates to:
  /// **'Top Aurora Horizon'**
  String get configCopyTopAuroraHorizon;

  /// No description provided for @configCopyFullDeepAmbientMesh.
  ///
  /// In en, this message translates to:
  /// **'Full Deep Ambient Mesh'**
  String get configCopyFullDeepAmbientMesh;

  /// No description provided for @configCopyPulsingCore.
  ///
  /// In en, this message translates to:
  /// **'Pulsing Core'**
  String get configCopyPulsingCore;

  /// No description provided for @configCopyStandardBalanced2.
  ///
  /// In en, this message translates to:
  /// **'Standard Balanced'**
  String get configCopyStandardBalanced2;

  /// No description provided for @configCopyCinematicLargePosters.
  ///
  /// In en, this message translates to:
  /// **'Cinematic (Large Posters)'**
  String get configCopyCinematicLargePosters;

  /// No description provided for @configCopyCloudVault.
  ///
  /// In en, this message translates to:
  /// **'Cloud Vault'**
  String get configCopyCloudVault;

  /// No description provided for @configCopyHighSpeedCloudDatabaseWith9000.
  ///
  /// In en, this message translates to:
  /// **'High-speed cloud database with 9,000+ live IPTV servers'**
  String get configCopyHighSpeedCloudDatabaseWith9000;

  /// No description provided for @configCopyLiveScrapersFromRedditIptvSubreddits.
  ///
  /// In en, this message translates to:
  /// **'Live scrapers from Reddit IPTV subreddits'**
  String get configCopyLiveScrapersFromRedditIptvSubreddits;

  /// No description provided for @configCopyRichCardWithBadges.
  ///
  /// In en, this message translates to:
  /// **'Rich Card with Badges'**
  String get configCopyRichCardWithBadges;

  /// No description provided for @configCopyCompactRow.
  ///
  /// In en, this message translates to:
  /// **'Compact Row'**
  String get configCopyCompactRow;

  /// No description provided for @configCopyGridCards.
  ///
  /// In en, this message translates to:
  /// **'Grid Cards'**
  String get configCopyGridCards;

  /// No description provided for @configCopyDetailedListWithEpg.
  ///
  /// In en, this message translates to:
  /// **'Detailed List with EPG'**
  String get configCopyDetailedListWithEpg;

  /// No description provided for @configCopyCompactChannelList.
  ///
  /// In en, this message translates to:
  /// **'Compact Channel List'**
  String get configCopyCompactChannelList;

  /// No description provided for @configCopySpaciousLargePosters.
  ///
  /// In en, this message translates to:
  /// **'Spacious (Large Posters)'**
  String get configCopySpaciousLargePosters;

  /// No description provided for @configCopyVerticalContinuousWebtoon.
  ///
  /// In en, this message translates to:
  /// **'Vertical Continuous (Webtoon)'**
  String get configCopyVerticalContinuousWebtoon;

  /// No description provided for @configCopyHorizontalLeftToRight.
  ///
  /// In en, this message translates to:
  /// **'Horizontal (Left to Right)'**
  String get configCopyHorizontalLeftToRight;

  /// No description provided for @configCopyHorizontalRightToLeftManga.
  ///
  /// In en, this message translates to:
  /// **'Horizontal (Right to Left / Manga)'**
  String get configCopyHorizontalRightToLeftManga;

  /// No description provided for @configCopyFullScreen100.
  ///
  /// In en, this message translates to:
  /// **'Full Screen (100%)'**
  String get configCopyFullScreen100;

  /// No description provided for @configCopyCompact720px.
  ///
  /// In en, this message translates to:
  /// **'Compact (720px)'**
  String get configCopyCompact720px;

  /// No description provided for @configCopyStandard900px.
  ///
  /// In en, this message translates to:
  /// **'Standard (900px)'**
  String get configCopyStandard900px;

  /// No description provided for @configCopyWide1150px.
  ///
  /// In en, this message translates to:
  /// **'Wide (1150px)'**
  String get configCopyWide1150px;

  /// No description provided for @configCopyPitchBlack.
  ///
  /// In en, this message translates to:
  /// **'Pitch Black'**
  String get configCopyPitchBlack;

  /// No description provided for @configCopyDeepCharcoal.
  ///
  /// In en, this message translates to:
  /// **'Deep Charcoal'**
  String get configCopyDeepCharcoal;

  /// No description provided for @configCopySepiaDark.
  ///
  /// In en, this message translates to:
  /// **'Sepia Dark'**
  String get configCopySepiaDark;

  /// No description provided for @configCopyFloatingGlassIsland.
  ///
  /// In en, this message translates to:
  /// **'Floating Glass Island'**
  String get configCopyFloatingGlassIsland;

  /// No description provided for @configCopyDockedBottomBar.
  ///
  /// In en, this message translates to:
  /// **'Docked Bottom Bar'**
  String get configCopyDockedBottomBar;

  /// No description provided for @configCopyMinimalistFloatingPill.
  ///
  /// In en, this message translates to:
  /// **'Minimalist Floating Pill'**
  String get configCopyMinimalistFloatingPill;

  /// No description provided for @configCopyRotating33rpmVinylDiscWithTonearmAnd.
  ///
  /// In en, this message translates to:
  /// **'Rotating 33rpm vinyl disc with tonearm and warm studio atmosphere'**
  String get configCopyRotating33rpmVinylDiscWithTonearmAnd;

  /// No description provided for @configCopyCyberpunkWaveVisualizer.
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk Wave Visualizer'**
  String get configCopyCyberpunkWaveVisualizer;

  /// No description provided for @configCopyRealTimeAnimatedAudioVisualizerCanvasWith.
  ///
  /// In en, this message translates to:
  /// **'Real-time animated audio visualizer canvas with neon glow'**
  String get configCopyRealTimeAnimatedAudioVisualizerCanvasWith;

  /// No description provided for @configCopyLiquidGlassSanctuary.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass Sanctuary'**
  String get configCopyLiquidGlassSanctuary;

  /// No description provided for @configCopyDeepOpticalRefractionGlassSheetsPoweredBy.
  ///
  /// In en, this message translates to:
  /// **'Frosted panels with Gaussian backdrop blur'**
  String get configCopyDeepOpticalRefractionGlassSheetsPoweredBy;

  /// No description provided for @configCopyCinematicPosterFocus.
  ///
  /// In en, this message translates to:
  /// **'Cinematic Poster Focus'**
  String get configCopyCinematicPosterFocus;

  /// No description provided for @configCopyMassiveEdgeToEdgeImmersiveAlbumArt.
  ///
  /// In en, this message translates to:
  /// **'Massive edge-to-edge immersive album art with blurred atmosphere'**
  String get configCopyMassiveEdgeToEdgeImmersiveAlbumArt;

  /// No description provided for @configCopyCustomDragDropFullPlayer.
  ///
  /// In en, this message translates to:
  /// **'Custom Drag & Drop Full Player'**
  String get configCopyCustomDragDropFullPlayer;

  /// No description provided for @configCopyYourFullyCustomizedArrangedAndStyledFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Your fully customized, arranged and styled fullscreen player'**
  String get configCopyYourFullyCustomizedArrangedAndStyledFullscreen;

  /// No description provided for @configCopyLiquidGlassTrackSlider.
  ///
  /// In en, this message translates to:
  /// **'Liquid Glass Track Slider'**
  String get configCopyLiquidGlassTrackSlider;

  /// No description provided for @configCopyRefractiveFrostedGlassSliderTrackWithSmooth.
  ///
  /// In en, this message translates to:
  /// **'Refractive frosted glass slider track with smooth thumb'**
  String get configCopyRefractiveFrostedGlassSliderTrackWithSmooth;

  /// No description provided for @configCopyPrecisionTactileSlider.
  ///
  /// In en, this message translates to:
  /// **'Precision Tactile Slider'**
  String get configCopyPrecisionTactileSlider;

  /// No description provided for @configCopyRadialCircularRingDial.
  ///
  /// In en, this message translates to:
  /// **'Radial Circular Ring Dial'**
  String get configCopyRadialCircularRingDial;

  /// No description provided for @configCopyAuraGlowCircle.
  ///
  /// In en, this message translates to:
  /// **'Aura Glow Circle'**
  String get configCopyAuraGlowCircle;

  /// No description provided for @configCopyNeonGlassSquare.
  ///
  /// In en, this message translates to:
  /// **'Neon Glass Square'**
  String get configCopyNeonGlassSquare;

  /// No description provided for @configCopySpinningVinylDiscWithCenterLabel.
  ///
  /// In en, this message translates to:
  /// **'Spinning Vinyl Disc with Center Label'**
  String get configCopySpinningVinylDiscWithCenterLabel;

  /// No description provided for @configCopy3dFloatingGlassCardWithElevation.
  ///
  /// In en, this message translates to:
  /// **'3D Floating Glass Card with Elevation'**
  String get configCopy3dFloatingGlassCardWithElevation;

  /// No description provided for @configCopyRoundedNeomorphicSquareWithGlow.
  ///
  /// In en, this message translates to:
  /// **'Rounded Neomorphic Square with Glow'**
  String get configCopyRoundedNeomorphicSquareWithGlow;

  /// No description provided for @configCopyAtmosphericGlowOrb.
  ///
  /// In en, this message translates to:
  /// **'Atmospheric Glow Orb'**
  String get configCopyAtmosphericGlowOrb;

  /// No description provided for @configCopyClassicWhite.
  ///
  /// In en, this message translates to:
  /// **'Classic White'**
  String get configCopyClassicWhite;

  /// No description provided for @configCopyCrispWhiteTextWithBlackOutline.
  ///
  /// In en, this message translates to:
  /// **'Crisp white text with black outline'**
  String get configCopyCrispWhiteTextWithBlackOutline;

  /// No description provided for @configCopyWarmYellowTextWithSubtleShadowAnd.
  ///
  /// In en, this message translates to:
  /// **'Warm yellow text with subtle shadow and border'**
  String get configCopyWarmYellowTextWithSubtleShadowAnd;

  /// No description provided for @configCopyStreamingBox.
  ///
  /// In en, this message translates to:
  /// **'Streaming Box'**
  String get configCopyStreamingBox;

  /// No description provided for @configCopyWhiteTextInsideA50TranslucentBlack.
  ///
  /// In en, this message translates to:
  /// **'White text inside a 50% translucent black box'**
  String get configCopyWhiteTextInsideA50TranslucentBlack;

  /// No description provided for @configCopyBoldYellowTextWithSolidOpaqueBlack.
  ///
  /// In en, this message translates to:
  /// **'Bold yellow text with solid opaque black box'**
  String get configCopyBoldYellowTextWithSolidOpaqueBlack;

  /// No description provided for @configCopyAnimeClean.
  ///
  /// In en, this message translates to:
  /// **'Anime Clean'**
  String get configCopyAnimeClean;

  /// No description provided for @configCopyBoldWhiteTextWithDeepOutlineShadow.
  ///
  /// In en, this message translates to:
  /// **'Bold white text with deep outline & shadow'**
  String get configCopyBoldWhiteTextWithDeepOutlineShadow;

  /// No description provided for @configCopyCyberpunkCyan.
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk Cyan'**
  String get configCopyCyberpunkCyan;

  /// No description provided for @configCopyVibrantCyanTextWithDarkBorder.
  ///
  /// In en, this message translates to:
  /// **'Vibrant cyan text with dark border'**
  String get configCopyVibrantCyanTextWithDarkBorder;

  /// No description provided for @configCopyNightModeWarm.
  ///
  /// In en, this message translates to:
  /// **'Night Mode Warm'**
  String get configCopyNightModeWarm;

  /// No description provided for @configCopySoftCreamTextWith40TranslucentBackground.
  ///
  /// In en, this message translates to:
  /// **'Soft cream text with 40% translucent background'**
  String get configCopySoftCreamTextWith40TranslucentBackground;

  /// No description provided for @configCopyUserConfiguredCustomSubtitleStyles.
  ///
  /// In en, this message translates to:
  /// **'User configured custom subtitle styles'**
  String get configCopyUserConfiguredCustomSubtitleStyles;

  /// No description provided for @configCopyStandardVideoPlaybackWithoutNeuralUpscalingShaders.
  ///
  /// In en, this message translates to:
  /// **'Standard video playback without neural upscaling shaders'**
  String get configCopyStandardVideoPlaybackWithoutNeuralUpscalingShaders;

  /// No description provided for @configCopyModeAFastBalanced.
  ///
  /// In en, this message translates to:
  /// **'Mode A (Fast / Balanced)'**
  String get configCopyModeAFastBalanced;

  /// No description provided for @configCopyRestoresLineArtAndUpscalesCleanlyBalanced.
  ///
  /// In en, this message translates to:
  /// **'Restores line art and upscales cleanly. Balanced GPU load, ideal for 1080p anime and mobile/integrated GPUs.'**
  String get configCopyRestoresLineArtAndUpscalesCleanlyBalanced;

  /// No description provided for @configCopyModeAHighQualityHq.
  ///
  /// In en, this message translates to:
  /// **'Mode A (High Quality / HQ)'**
  String get configCopyModeAHighQualityHq;

  /// No description provided for @configCopyUltraCrispPerceptualLineReconstructionAndUpscale.
  ///
  /// In en, this message translates to:
  /// **'Ultra-crisp perceptual line reconstruction and upscale using Very Large CNNs. Best for discrete desktop GPUs.'**
  String get configCopyUltraCrispPerceptualLineReconstructionAndUpscale;

  /// No description provided for @configCopyModeBSoftDenoise.
  ///
  /// In en, this message translates to:
  /// **'Mode B (Soft / Denoise)'**
  String get configCopyModeBSoftDenoise;

  /// No description provided for @configCopySoftLineReconstructionAndArtifactReductionBest.
  ///
  /// In en, this message translates to:
  /// **'Soft line reconstruction and artifact reduction. Best for blurry, compressed, or older anime.'**
  String get configCopySoftLineReconstructionAndArtifactReductionBest;

  /// No description provided for @configCopyModeCDeblurUpscale.
  ///
  /// In en, this message translates to:
  /// **'Mode C (Deblur / Upscale)'**
  String get configCopyModeCDeblurUpscale;

  /// No description provided for @configCopyAggressiveDeblurringAndScalingBestFor720p.
  ///
  /// In en, this message translates to:
  /// **'Aggressive deblurring and scaling. Best for 720p / 480p low-resolution anime streams.'**
  String get configCopyAggressiveDeblurringAndScalingBestFor720p;

  /// No description provided for @configCopyFsr10Smooth.
  ///
  /// In en, this message translates to:
  /// **'FSR 1.0 (Smooth)'**
  String get configCopyFsr10Smooth;

  /// No description provided for @configCopyEdgeAdaptiveUpscalingForLiveActionAnd.
  ///
  /// In en, this message translates to:
  /// **'Edge-adaptive upscaling for live action and older sources. Upscales rather than sharpens, so it is the safer of the two FSR modes. Not useful on a source already at display resolution.'**
  String get configCopyEdgeAdaptiveUpscalingForLiveActionAnd;

  /// No description provided for @configCopyFsr10Sharp.
  ///
  /// In en, this message translates to:
  /// **'FSR 1.0 (Sharp)'**
  String get configCopyFsr10Sharp;

  /// No description provided for @configCopyFsrWithContrastAdaptiveSharpeningAddsBite.
  ///
  /// In en, this message translates to:
  /// **'FSR with contrast-adaptive sharpening. Adds bite to soft or low-bitrate sources. On a 2K or 4K source this can look worse than no upscaling, so use it deliberately.'**
  String get configCopyFsrWithContrastAdaptiveSharpeningAddsBite;

  /// No description provided for @configCopyAutoSafeHardwareAccelerated.
  ///
  /// In en, this message translates to:
  /// **'Auto-Safe (Hardware Accelerated)'**
  String get configCopyAutoSafeHardwareAccelerated;

  /// No description provided for @configCopyGpuHardwareDecodingWithSafeDriverFallbacks.
  ///
  /// In en, this message translates to:
  /// **'GPU hardware decoding with safe driver fallbacks (recommended)'**
  String get configCopyGpuHardwareDecodingWithSafeDriverFallbacks;

  /// No description provided for @configCopyPureCpuDecodingUsingFfmpegLibavcodecGuarantees.
  ///
  /// In en, this message translates to:
  /// **'Pure CPU decoding using FFmpeg libavcodec. Guarantees frame rendering and eliminates black screens.'**
  String get configCopyPureCpuDecodingUsingFfmpegLibavcodecGuarantees;

  /// No description provided for @configCopyDirectGpuHardwareDecodingDirect3d11Mediacodec.
  ///
  /// In en, this message translates to:
  /// **'Direct GPU hardware decoding (Direct3D 11 / MediaCodec / VAAPI).'**
  String get configCopyDirectGpuHardwareDecodingDirect3d11Mediacodec;

  /// No description provided for @configCopySubtleGlass.
  ///
  /// In en, this message translates to:
  /// **'Subtle Glass'**
  String get configCopySubtleGlass;

  /// No description provided for @configCopyBalancedLiquid.
  ///
  /// In en, this message translates to:
  /// **'Balanced Liquid'**
  String get configCopyBalancedLiquid;

  /// No description provided for @configCopyHyperJelly.
  ///
  /// In en, this message translates to:
  /// **'Hyper Jelly'**
  String get configCopyHyperJelly;

  /// No description provided for @configCopyCrystalPrism.
  ///
  /// In en, this message translates to:
  /// **'Crystal Prism'**
  String get configCopyCrystalPrism;

  /// No description provided for @configCopyFrostedCyber.
  ///
  /// In en, this message translates to:
  /// **'Frosted Cyber'**
  String get configCopyFrostedCyber;

  /// No description provided for @configCopySignalTeal.
  ///
  /// In en, this message translates to:
  /// **'Signal Teal'**
  String get configCopySignalTeal;

  /// No description provided for @configCopyAmethystViolet.
  ///
  /// In en, this message translates to:
  /// **'Amethyst Violet'**
  String get configCopyAmethystViolet;

  /// No description provided for @configCopyCyberpunkNeon.
  ///
  /// In en, this message translates to:
  /// **'Cyberpunk Neon'**
  String get configCopyCyberpunkNeon;

  /// No description provided for @configCopyEmeraldAurora.
  ///
  /// In en, this message translates to:
  /// **'Emerald Aurora'**
  String get configCopyEmeraldAurora;

  /// No description provided for @configCopySunsetCrimson.
  ///
  /// In en, this message translates to:
  /// **'Sunset Crimson'**
  String get configCopySunsetCrimson;

  /// No description provided for @configCopyMidnightSapphire.
  ///
  /// In en, this message translates to:
  /// **'Midnight Sapphire'**
  String get configCopyMidnightSapphire;

  /// No description provided for @configCopyGoldenAmber.
  ///
  /// In en, this message translates to:
  /// **'Golden Amber'**
  String get configCopyGoldenAmber;

  /// No description provided for @configCopyVampireRed.
  ///
  /// In en, this message translates to:
  /// **'Vampire Red'**
  String get configCopyVampireRed;

  /// No description provided for @configCopyPinkBarbie.
  ///
  /// In en, this message translates to:
  /// **'Pink Barbie'**
  String get configCopyPinkBarbie;

  /// No description provided for @configCopyEmberCrimson.
  ///
  /// In en, this message translates to:
  /// **'Ember Crimson'**
  String get configCopyEmberCrimson;

  /// No description provided for @configCopyStudioBone.
  ///
  /// In en, this message translates to:
  /// **'Studio Bone'**
  String get configCopyStudioBone;

  /// No description provided for @configCopyCyberNeonCity.
  ///
  /// In en, this message translates to:
  /// **'Cyber Neon City'**
  String get configCopyCyberNeonCity;

  /// No description provided for @configCopyCosmicNebula.
  ///
  /// In en, this message translates to:
  /// **'Cosmic Nebula'**
  String get configCopyCosmicNebula;

  /// No description provided for @configCopyDarkLiquidSilk.
  ///
  /// In en, this message translates to:
  /// **'Dark Liquid Silk'**
  String get configCopyDarkLiquidSilk;

  /// No description provided for @configCopySynthwaveHorizon.
  ///
  /// In en, this message translates to:
  /// **'Synthwave Horizon'**
  String get configCopySynthwaveHorizon;

  /// No description provided for @configCopyMoodyForestMist.
  ///
  /// In en, this message translates to:
  /// **'Moody Forest Mist'**
  String get configCopyMoodyForestMist;

  /// No description provided for @configCopyAbstractDarkNeon.
  ///
  /// In en, this message translates to:
  /// **'Abstract Dark Neon'**
  String get configCopyAbstractDarkNeon;

  /// No description provided for @configCopyRecommendedForYouTrakt.
  ///
  /// In en, this message translates to:
  /// **'Recommended for You (Trakt)'**
  String get configCopyRecommendedForYouTrakt;

  /// No description provided for @configCopyPersonalizedBasedOnYourTraktWatchHistory.
  ///
  /// In en, this message translates to:
  /// **'Personalized based on your Trakt watch history'**
  String get configCopyPersonalizedBasedOnYourTraktWatchHistory;

  /// No description provided for @configCopyTrendingThisWeek.
  ///
  /// In en, this message translates to:
  /// **'Trending This Week'**
  String get configCopyTrendingThisWeek;

  /// No description provided for @configCopyWhatTraktViewersAreWatchingRightNow.
  ///
  /// In en, this message translates to:
  /// **'What Trakt viewers are watching right now'**
  String get configCopyWhatTraktViewersAreWatchingRightNow;

  /// No description provided for @configCopyPopularNow.
  ///
  /// In en, this message translates to:
  /// **'Popular Now'**
  String get configCopyPopularNow;

  /// No description provided for @configCopyMostWatchedTitlesAcrossTrakt.
  ///
  /// In en, this message translates to:
  /// **'Most-watched titles across Trakt'**
  String get configCopyMostWatchedTitlesAcrossTrakt;

  /// No description provided for @configCopyComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get configCopyComingSoon;

  /// No description provided for @configCopyMostAnticipatedUpcomingReleases.
  ///
  /// In en, this message translates to:
  /// **'Most anticipated upcoming releases'**
  String get configCopyMostAnticipatedUpcomingReleases;

  /// No description provided for @configCopyFromTrakt.
  ///
  /// In en, this message translates to:
  /// **'From Trakt'**
  String get configCopyFromTrakt;

  /// No description provided for @configCopyRecommendedForYouSimkl.
  ///
  /// In en, this message translates to:
  /// **'Recommended for You (Simkl)'**
  String get configCopyRecommendedForYouSimkl;

  /// No description provided for @configCopyThe1970s.
  ///
  /// In en, this message translates to:
  /// **'The 1970s'**
  String get configCopyThe1970s;

  /// No description provided for @configCopyThe1980s.
  ///
  /// In en, this message translates to:
  /// **'The 1980s'**
  String get configCopyThe1980s;

  /// No description provided for @configCopyThe2000s.
  ///
  /// In en, this message translates to:
  /// **'The 2000s'**
  String get configCopyThe2000s;

  /// No description provided for @configCopyThe2010s.
  ///
  /// In en, this message translates to:
  /// **'The 2010s'**
  String get configCopyThe2010s;

  /// No description provided for @configCopyThe90sAction.
  ///
  /// In en, this message translates to:
  /// **'The 90s: Action'**
  String get configCopyThe90sAction;

  /// No description provided for @configCopyThe90sComedy.
  ///
  /// In en, this message translates to:
  /// **'The 90s: Comedy'**
  String get configCopyThe90sComedy;

  /// No description provided for @configCopyThe90sHorror.
  ///
  /// In en, this message translates to:
  /// **'The 90s: Horror'**
  String get configCopyThe90sHorror;

  /// No description provided for @configCopyThe90sSciFi.
  ///
  /// In en, this message translates to:
  /// **'The 90s: Sci-Fi'**
  String get configCopyThe90sSciFi;

  /// No description provided for @configCopyThe90sAnimation.
  ///
  /// In en, this message translates to:
  /// **'The 90s: Animation'**
  String get configCopyThe90sAnimation;

  /// No description provided for @configCopyThe90sThriller.
  ///
  /// In en, this message translates to:
  /// **'The 90s: Thriller'**
  String get configCopyThe90sThriller;

  /// No description provided for @configCopyGodfatherCollection.
  ///
  /// In en, this message translates to:
  /// **'Godfather Collection'**
  String get configCopyGodfatherCollection;

  /// No description provided for @configCopyRockyAndCreed.
  ///
  /// In en, this message translates to:
  /// **'Rocky and Creed'**
  String get configCopyRockyAndCreed;

  /// No description provided for @configCopyBackToTheFuture.
  ///
  /// In en, this message translates to:
  /// **'Back to the Future'**
  String get configCopyBackToTheFuture;

  /// No description provided for @configCopyAlien.
  ///
  /// In en, this message translates to:
  /// **'Alien'**
  String get configCopyAlien;

  /// No description provided for @configCopyDieHard.
  ///
  /// In en, this message translates to:
  /// **'Die Hard'**
  String get configCopyDieHard;

  /// No description provided for @configCopyLethalWeapon.
  ///
  /// In en, this message translates to:
  /// **'Lethal Weapon'**
  String get configCopyLethalWeapon;

  /// No description provided for @configCopyTheTerminator.
  ///
  /// In en, this message translates to:
  /// **'The Terminator'**
  String get configCopyTheTerminator;

  /// No description provided for @configCopyPredator.
  ///
  /// In en, this message translates to:
  /// **'Predator'**
  String get configCopyPredator;

  /// No description provided for @configCopyJurassicPark.
  ///
  /// In en, this message translates to:
  /// **'Jurassic Park'**
  String get configCopyJurassicPark;

  /// No description provided for @configCopyRambo.
  ///
  /// In en, this message translates to:
  /// **'Rambo'**
  String get configCopyRambo;

  /// No description provided for @configCopyIndianaJones.
  ///
  /// In en, this message translates to:
  /// **'Indiana Jones'**
  String get configCopyIndianaJones;

  /// No description provided for @configCopyTheMarxBrothers.
  ///
  /// In en, this message translates to:
  /// **'The Marx Brothers'**
  String get configCopyTheMarxBrothers;

  /// No description provided for @configCopyGrouchoAndHisBrothers13Films1929.
  ///
  /// In en, this message translates to:
  /// **'Groucho and his brothers, 13 films, 1929 to 1949'**
  String get configCopyGrouchoAndHisBrothers13Films1929;

  /// No description provided for @configCopyOnHold.
  ///
  /// In en, this message translates to:
  /// **'On Hold'**
  String get configCopyOnHold;

  /// No description provided for @configCopyDropped.
  ///
  /// In en, this message translates to:
  /// **'Dropped'**
  String get configCopyDropped;

  /// No description provided for @configCopyRatings.
  ///
  /// In en, this message translates to:
  /// **'Ratings'**
  String get configCopyRatings;

  /// No description provided for @configCopyTrending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get configCopyTrending;

  /// No description provided for @configCopyTopRated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get configCopyTopRated;

  /// No description provided for @configCopyNewUpcoming.
  ///
  /// In en, this message translates to:
  /// **'New & Upcoming'**
  String get configCopyNewUpcoming;

  /// No description provided for @configCopyWatchlist.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get configCopyWatchlist;

  /// No description provided for @configCopyHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get configCopyHistory;

  /// No description provided for @configCopyCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get configCopyCollection;

  /// No description provided for @configCopyRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get configCopyRecommendations;

  /// No description provided for @configCopyAnticipated.
  ///
  /// In en, this message translates to:
  /// **'Anticipated'**
  String get configCopyAnticipated;

  /// No description provided for @configCopyUntitledList.
  ///
  /// In en, this message translates to:
  /// **'Untitled list'**
  String get configCopyUntitledList;

  /// No description provided for @configCopyStreamSource.
  ///
  /// In en, this message translates to:
  /// **'Stream Source'**
  String get configCopyStreamSource;

  /// No description provided for @configCopyAllLanguages.
  ///
  /// In en, this message translates to:
  /// **'All Languages'**
  String get configCopyAllLanguages;

  /// No description provided for @configCopyDefaultZplaySubfont.
  ///
  /// In en, this message translates to:
  /// **'Default (ZPlay Subfont)'**
  String get configCopyDefaultZplaySubfont;

  /// No description provided for @configCopyAddToFavorites.
  ///
  /// In en, this message translates to:
  /// **'Add to Favorites'**
  String get configCopyAddToFavorites;

  /// No description provided for @configCopyHidePassword.
  ///
  /// In en, this message translates to:
  /// **'Hide Password'**
  String get configCopyHidePassword;

  /// No description provided for @configCopyAspectFitContain.
  ///
  /// In en, this message translates to:
  /// **'ASPECT: FIT (CONTAIN)'**
  String get configCopyAspectFitContain;

  /// No description provided for @configCopyAspectFillZoomCrop.
  ///
  /// In en, this message translates to:
  /// **'ASPECT: FILL (ZOOM / CROP)'**
  String get configCopyAspectFillZoomCrop;

  /// No description provided for @configCopyAspectStretchFill.
  ///
  /// In en, this message translates to:
  /// **'ASPECT: STRETCH (FILL)'**
  String get configCopyAspectStretchFill;

  /// No description provided for @configCopyPreviousChapterPage.
  ///
  /// In en, this message translates to:
  /// **'Previous chapter page'**
  String get configCopyPreviousChapterPage;

  /// No description provided for @configCopyNextChapterPage.
  ///
  /// In en, this message translates to:
  /// **'Next chapter page'**
  String get configCopyNextChapterPage;

  /// No description provided for @configCopyClearChapterSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear chapter search'**
  String get configCopyClearChapterSearch;

  /// No description provided for @configCopyClearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get configCopyClearSearch;

  /// No description provided for @configCopyReaderCustomization.
  ///
  /// In en, this message translates to:
  /// **'Reader Customization'**
  String get configCopyReaderCustomization;

  /// No description provided for @configCopyZoomOut.
  ///
  /// In en, this message translates to:
  /// **'Zoom Out (-)'**
  String get configCopyZoomOut;

  /// No description provided for @configCopyZoomIn.
  ///
  /// In en, this message translates to:
  /// **'Zoom In (+)'**
  String get configCopyZoomIn;

  /// No description provided for @configCopyTogglePageDeck.
  ///
  /// In en, this message translates to:
  /// **'Toggle Page Deck'**
  String get configCopyTogglePageDeck;

  /// No description provided for @configCopyRearrangeStreams.
  ///
  /// In en, this message translates to:
  /// **'Rearrange Streams'**
  String get configCopyRearrangeStreams;

  /// No description provided for @configCopyAllCategories.
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get configCopyAllCategories;

  /// No description provided for @configCopyFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get configCopyFavorites;

  /// No description provided for @configCopyUnknownSource.
  ///
  /// In en, this message translates to:
  /// **'Unknown source'**
  String get configCopyUnknownSource;

  /// No description provided for @configCopyUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get configCopyUnknown;

  /// No description provided for @configCopyUnknownTitle.
  ///
  /// In en, this message translates to:
  /// **'Unknown Title'**
  String get configCopyUnknownTitle;

  /// No description provided for @configCopyUnknownTrack.
  ///
  /// In en, this message translates to:
  /// **'Unknown Track'**
  String get configCopyUnknownTrack;

  /// No description provided for @configCopyUntitledBook.
  ///
  /// In en, this message translates to:
  /// **'Untitled Book'**
  String get configCopyUntitledBook;

  /// No description provided for @configCopyUntitledAudiobook.
  ///
  /// In en, this message translates to:
  /// **'Untitled Audiobook'**
  String get configCopyUntitledAudiobook;

  /// No description provided for @configCopyUnknownAddon.
  ///
  /// In en, this message translates to:
  /// **'Unknown Addon'**
  String get configCopyUnknownAddon;

  /// No description provided for @configCopyUnknownPlugin.
  ///
  /// In en, this message translates to:
  /// **'Unknown Plugin'**
  String get configCopyUnknownPlugin;

  /// No description provided for @configCopyTitles.
  ///
  /// In en, this message translates to:
  /// **'Titles'**
  String get configCopyTitles;

  /// No description provided for @configCopySkipIntro.
  ///
  /// In en, this message translates to:
  /// **'Skip Intro'**
  String get configCopySkipIntro;

  /// No description provided for @configCopySkipRecap.
  ///
  /// In en, this message translates to:
  /// **'Skip Recap'**
  String get configCopySkipRecap;

  /// No description provided for @configCopySkipCredits.
  ///
  /// In en, this message translates to:
  /// **'Skip Credits'**
  String get configCopySkipCredits;

  /// No description provided for @configCopySkipPreview.
  ///
  /// In en, this message translates to:
  /// **'Skip Preview'**
  String get configCopySkipPreview;

  /// No description provided for @configCopySegment.
  ///
  /// In en, this message translates to:
  /// **'Segment'**
  String get configCopySegment;

  /// No description provided for @configCopyPublisher.
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get configCopyPublisher;

  /// No description provided for @configCopySize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get configCopySize;

  /// No description provided for @configCopyTvShort.
  ///
  /// In en, this message translates to:
  /// **'TV Short'**
  String get configCopyTvShort;

  /// No description provided for @configCopySpecial.
  ///
  /// In en, this message translates to:
  /// **'Special'**
  String get configCopySpecial;

  /// No description provided for @configCopyAiring.
  ///
  /// In en, this message translates to:
  /// **'Airing'**
  String get configCopyAiring;

  /// No description provided for @configCopyUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get configCopyUpcoming;

  /// No description provided for @configCopyCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get configCopyCancelled;

  /// No description provided for @configCopyOnHiatus.
  ///
  /// In en, this message translates to:
  /// **'On Hiatus'**
  String get configCopyOnHiatus;

  /// No description provided for @configCopyAiringSoon.
  ///
  /// In en, this message translates to:
  /// **'Airing soon'**
  String get configCopyAiringSoon;

  /// No description provided for @configCopySearchesTheWyzieSubtitleCatalogueForMovies.
  ///
  /// In en, this message translates to:
  /// **'Searches the Wyzie subtitle catalogue for movies and episodes.'**
  String get configCopySearchesTheWyzieSubtitleCatalogueForMovies;

  /// No description provided for @configCopyMintsTheAnonymousTokenTheAudionestAudiobook.
  ///
  /// In en, this message translates to:
  /// **'Mints the anonymous token the Audionest audiobook search API requires.'**
  String get configCopyMintsTheAnonymousTokenTheAudionestAudiobook;

  /// No description provided for @configCopyBearerForTheAudionestAudiobookSearchEndpoint.
  ///
  /// In en, this message translates to:
  /// **'Bearer for the Audionest audiobook search endpoint.'**
  String get configCopyBearerForTheAudionestAudiobookSearchEndpoint;

  /// No description provided for @configCopyFirebaseKeyForThePaper2audioPdfTo.
  ///
  /// In en, this message translates to:
  /// **'Firebase key for the paper2audio PDF to audiobook backend.'**
  String get configCopyFirebaseKeyForThePaper2audioPdfTo;

  /// No description provided for @configCopyBearerForTheVidgodCloudCacheBehind.
  ///
  /// In en, this message translates to:
  /// **'Bearer for the VidGod cloud cache behind ZPlayHTTP streams.'**
  String get configCopyBearerForTheVidgodCloudCacheBehind;

  /// No description provided for @configCopyBearerForTheFilms365DirectStreamApi.
  ///
  /// In en, this message translates to:
  /// **'Bearer for the Films365 direct stream API.'**
  String get configCopyBearerForTheFilms365DirectStreamApi;

  /// No description provided for @configCopyIdentifiesTheTraktApplicationThePairingFlow.
  ///
  /// In en, this message translates to:
  /// **'Identifies the Trakt application the pairing flow asks for a device code on, and stamps every Trakt API call.'**
  String get configCopyIdentifiesTheTraktApplicationThePairingFlow;

  /// No description provided for @configCopyExchangesTheDeviceCodeForATrakt.
  ///
  /// In en, this message translates to:
  /// **'Exchanges the device code for a Trakt access token.'**
  String get configCopyExchangesTheDeviceCodeForATrakt;

  /// No description provided for @configCopyYourKeyIsInUse.
  ///
  /// In en, this message translates to:
  /// **'Your key is in use.'**
  String get configCopyYourKeyIsInUse;

  /// No description provided for @configCopySuppliedAtBuildTimeForThisBuild.
  ///
  /// In en, this message translates to:
  /// **'Supplied at build time for this build.'**
  String get configCopySuppliedAtBuildTimeForThisBuild;

  /// No description provided for @configCopyRunningOnTheValueThisAppShips.
  ///
  /// In en, this message translates to:
  /// **'Running on the value this app ships with.'**
  String get configCopyRunningOnTheValueThisAppShips;

  /// No description provided for @configCopyNoKeyAvailableSoThisSourceStays.
  ///
  /// In en, this message translates to:
  /// **'No key available, so this source stays off.'**
  String get configCopyNoKeyAvailableSoThisSourceStays;

  /// No description provided for @configCopyThatKeyWasRejectedByTmdb.
  ///
  /// In en, this message translates to:
  /// **'That key was rejected by TMDb'**
  String get configCopyThatKeyWasRejectedByTmdb;

  /// No description provided for @configCopyCouldNotReachTmdb.
  ///
  /// In en, this message translates to:
  /// **'Could not reach TMDb'**
  String get configCopyCouldNotReachTmdb;

  /// No description provided for @configCopy10PicksFrom1970To1979.
  ///
  /// In en, this message translates to:
  /// **'10 picks from 1970 to 1979'**
  String get configCopy10PicksFrom1970To1979;

  /// No description provided for @configCopy10PicksFrom1980To1989.
  ///
  /// In en, this message translates to:
  /// **'10 picks from 1980 to 1989'**
  String get configCopy10PicksFrom1980To1989;

  /// No description provided for @configCopy10PicksFrom2000To2009.
  ///
  /// In en, this message translates to:
  /// **'10 picks from 2000 to 2009'**
  String get configCopy10PicksFrom2000To2009;

  /// No description provided for @configCopy10PicksFrom2010To2019.
  ///
  /// In en, this message translates to:
  /// **'10 picks from 2010 to 2019'**
  String get configCopy10PicksFrom2010To2019;

  /// No description provided for @configCopy10PicksFrom1990To1999.
  ///
  /// In en, this message translates to:
  /// **'10 picks from 1990 to 1999'**
  String get configCopy10PicksFrom1990To1999;

  /// No description provided for @configCopy3Films1972To1990.
  ///
  /// In en, this message translates to:
  /// **'3 films, 1972 to 1990'**
  String get configCopy3Films1972To1990;

  /// No description provided for @configCopy9Films1976To2023.
  ///
  /// In en, this message translates to:
  /// **'9 films, 1976 to 2023'**
  String get configCopy9Films1976To2023;

  /// No description provided for @configCopy3Films1985To1990.
  ///
  /// In en, this message translates to:
  /// **'3 films, 1985 to 1990'**
  String get configCopy3Films1985To1990;

  /// No description provided for @configCopy7Films1979To2024.
  ///
  /// In en, this message translates to:
  /// **'7 films, 1979 to 2024'**
  String get configCopy7Films1979To2024;

  /// No description provided for @configCopy5Films1988To2013.
  ///
  /// In en, this message translates to:
  /// **'5 films, 1988 to 2013'**
  String get configCopy5Films1988To2013;

  /// No description provided for @configCopy4Films1987To1998.
  ///
  /// In en, this message translates to:
  /// **'4 films, 1987 to 1998'**
  String get configCopy4Films1987To1998;

  /// No description provided for @configCopy6Films1984To2019.
  ///
  /// In en, this message translates to:
  /// **'6 films, 1984 to 2019'**
  String get configCopy6Films1984To2019;

  /// No description provided for @configCopy5Films1987To2022.
  ///
  /// In en, this message translates to:
  /// **'5 films, 1987 to 2022'**
  String get configCopy5Films1987To2022;

  /// No description provided for @configCopy6Films1993To2022.
  ///
  /// In en, this message translates to:
  /// **'6 films, 1993 to 2022'**
  String get configCopy6Films1993To2022;

  /// No description provided for @configCopy5Films1982To2019.
  ///
  /// In en, this message translates to:
  /// **'5 films, 1982 to 2019'**
  String get configCopy5Films1982To2019;

  /// No description provided for @configCopy5Films1981To2023.
  ///
  /// In en, this message translates to:
  /// **'5 films, 1981 to 2023'**
  String get configCopy5Films1981To2023;

  /// No description provided for @configCopyStremioBasedMultiResolutionHttpStreamScraper.
  ///
  /// In en, this message translates to:
  /// **'Stremio-based multi-resolution HTTP stream scraper'**
  String get configCopyStremioBasedMultiResolutionHttpStreamScraper;

  /// No description provided for @configCopyDirectHighSpeedHttpMediaStorageScraper.
  ///
  /// In en, this message translates to:
  /// **'Direct high-speed HTTP media storage scraper'**
  String get configCopyDirectHighSpeedHttpMediaStorageScraper;

  /// No description provided for @configCopy4kHdDirectStreamExtractor.
  ///
  /// In en, this message translates to:
  /// **'4K & HD direct stream extractor'**
  String get configCopy4kHdDirectStreamExtractor;

  /// No description provided for @configCopyFastMultiSourceStreamDownloader.
  ///
  /// In en, this message translates to:
  /// **'Fast multi-source stream downloader'**
  String get configCopyFastMultiSourceStreamDownloader;

  /// No description provided for @configCopyVideasyMultiCdnEncryptedHlsScraper.
  ///
  /// In en, this message translates to:
  /// **'Videasy multi-CDN encrypted HLS scraper'**
  String get configCopyVideasyMultiCdnEncryptedHlsScraper;

  /// No description provided for @configCopyVidsrcStreamingNetworkResolver.
  ///
  /// In en, this message translates to:
  /// **'VidSrc streaming network resolver'**
  String get configCopyVidsrcStreamingNetworkResolver;

  /// No description provided for @configCopy2embedMultiHostStreamAggregator.
  ///
  /// In en, this message translates to:
  /// **'2Embed multi-host stream aggregator'**
  String get configCopy2embedMultiHostStreamAggregator;

  /// No description provided for @configCopyMultiSourceHdVideoCoreExtractor.
  ///
  /// In en, this message translates to:
  /// **'Multi-source HD video core extractor'**
  String get configCopyMultiSourceHdVideoCoreExtractor;

  /// No description provided for @configCopyUltraFastHlsStreamingNetwork.
  ///
  /// In en, this message translates to:
  /// **'Ultra-fast HLS streaming network'**
  String get configCopyUltraFastHlsStreamingNetwork;

  /// No description provided for @configCopyMovienightMultiServerHlsStreams.
  ///
  /// In en, this message translates to:
  /// **'MovieNight multi-server HLS streams'**
  String get configCopyMovienightMultiServerHlsStreams;

  /// No description provided for @configCopyDirectMediaDownloadStreamExtractor.
  ///
  /// In en, this message translates to:
  /// **'Direct media download & stream extractor'**
  String get configCopyDirectMediaDownloadStreamExtractor;

  /// No description provided for @configCopyDirectEncryptedMp4HlsSourceProvider.
  ///
  /// In en, this message translates to:
  /// **'Direct encrypted MP4/HLS source provider'**
  String get configCopyDirectEncryptedMp4HlsSourceProvider;

  /// No description provided for @configCopyFastCloudHlsStreamResolver.
  ///
  /// In en, this message translates to:
  /// **'Fast cloud HLS stream resolver'**
  String get configCopyFastCloudHlsStreamResolver;

  /// No description provided for @configCopyRiveMultiServerDirectStreamProvider.
  ///
  /// In en, this message translates to:
  /// **'Rive multi-server direct stream provider'**
  String get configCopyRiveMultiServerDirectStreamProvider;

  /// No description provided for @configCopyCinejoyMultiCdnVideoSourceProvider.
  ///
  /// In en, this message translates to:
  /// **'Cinejoy multi-CDN video source provider'**
  String get configCopyCinejoyMultiCdnVideoSourceProvider;

  /// No description provided for @configCopyDuloHighSpeedDirectStreamNetwork.
  ///
  /// In en, this message translates to:
  /// **'Dulo high-speed direct stream network'**
  String get configCopyDuloHighSpeedDirectStreamNetwork;

  /// No description provided for @configCopyVidupCloudVideoHostingScraper.
  ///
  /// In en, this message translates to:
  /// **'VidUp cloud video hosting scraper'**
  String get configCopyVidupCloudVideoHostingScraper;

  /// No description provided for @configCopyFlaxmoviesMultiCdnDirectStreams.
  ///
  /// In en, this message translates to:
  /// **'FlaxMovies multi-CDN direct streams'**
  String get configCopyFlaxmoviesMultiCdnDirectStreams;

  /// No description provided for @configCopyMultiServerCloudVideoStreams.
  ///
  /// In en, this message translates to:
  /// **'Multi-server cloud video streams'**
  String get configCopyMultiServerCloudVideoStreams;

  /// No description provided for @configCopyLowLatencyDirectStreamingProvider.
  ///
  /// In en, this message translates to:
  /// **'Low-latency direct streaming provider'**
  String get configCopyLowLatencyDirectStreamingProvider;

  /// No description provided for @configCopyFastCloudVideoSourceProvider.
  ///
  /// In en, this message translates to:
  /// **'Fast cloud video source provider'**
  String get configCopyFastCloudVideoSourceProvider;

  /// No description provided for @configCopyLookmovieDirectMultiQualityStreams.
  ///
  /// In en, this message translates to:
  /// **'LookMovie direct multi-quality streams'**
  String get configCopyLookmovieDirectMultiQualityStreams;

  /// No description provided for @configCopyHexaMultiHostVideoExtractor.
  ///
  /// In en, this message translates to:
  /// **'Hexa multi-host video extractor'**
  String get configCopyHexaMultiHostVideoExtractor;

  /// No description provided for @configCopyBcineDirectMasterHlsProvider.
  ///
  /// In en, this message translates to:
  /// **'Bcine direct master HLS provider'**
  String get configCopyBcineDirectMasterHlsProvider;

  /// No description provided for @configCopyMappleFastStreamingProvider.
  ///
  /// In en, this message translates to:
  /// **'Mapple fast streaming provider'**
  String get configCopyMappleFastStreamingProvider;

  /// No description provided for @configCopyNovaMultiServerStreamExtractor.
  ///
  /// In en, this message translates to:
  /// **'Nova multi-server stream extractor'**
  String get configCopyNovaMultiServerStreamExtractor;

  /// No description provided for @configCopyMegasourceMultiCdnVideoNetwork.
  ///
  /// In en, this message translates to:
  /// **'MegaSource multi-CDN video network'**
  String get configCopyMegasourceMultiCdnVideoNetwork;

  /// No description provided for @configCopyPurstreamDirectVideoStreamResolver.
  ///
  /// In en, this message translates to:
  /// **'Purstream direct video stream resolver'**
  String get configCopyPurstreamDirectVideoStreamResolver;

  /// No description provided for @configCopyVidapiDirectVideoSourceExtractor.
  ///
  /// In en, this message translates to:
  /// **'VidApi direct video source extractor'**
  String get configCopyVidapiDirectVideoSourceExtractor;

  /// No description provided for @configCopyVidrockCloudVideoProvider.
  ///
  /// In en, this message translates to:
  /// **'VidRock cloud video provider'**
  String get configCopyVidrockCloudVideoProvider;

  /// No description provided for @configCopyVidvaultSecureStreamingNetwork.
  ///
  /// In en, this message translates to:
  /// **'VidVault secure streaming network'**
  String get configCopyVidvaultSecureStreamingNetwork;

  /// No description provided for @configCopyVidzeeHighSpeedVideoProvider.
  ///
  /// In en, this message translates to:
  /// **'VidZee high-speed video provider'**
  String get configCopyVidzeeHighSpeedVideoProvider;

  /// No description provided for @configCopyCinesrcDirectMasterHlsWithBright67Subtitles.
  ///
  /// In en, this message translates to:
  /// **'CineSrc direct master HLS with bright67 subtitles'**
  String get configCopyCinesrcDirectMasterHlsWithBright67Subtitles;

  /// No description provided for @configCopyCinesuDirectVideoStreamExtractor.
  ///
  /// In en, this message translates to:
  /// **'CineSu direct video stream extractor'**
  String get configCopyCinesuDirectVideoStreamExtractor;

  /// No description provided for @configCopyFrameMultiResolutionStreamProvider.
  ///
  /// In en, this message translates to:
  /// **'Frame multi-resolution stream provider'**
  String get configCopyFrameMultiResolutionStreamProvider;

  /// No description provided for @configCopyFsharetvCloudStreamingNetwork.
  ///
  /// In en, this message translates to:
  /// **'FshareTV cloud streaming network'**
  String get configCopyFsharetvCloudStreamingNetwork;

  /// No description provided for @configCopyFsonicDirectCloudVideoScraper.
  ///
  /// In en, this message translates to:
  /// **'FSonic direct cloud video scraper'**
  String get configCopyFsonicDirectCloudVideoScraper;

  /// No description provided for @configCopyFsonlineMultiHostStreamResolver.
  ///
  /// In en, this message translates to:
  /// **'FSOnline multi-host stream resolver'**
  String get configCopyFsonlineMultiHostStreamResolver;

  /// No description provided for @configCopyKisskhAsianDramaAnimeStreamingProvider.
  ///
  /// In en, this message translates to:
  /// **'KissKH Asian drama & anime streaming provider'**
  String get configCopyKisskhAsianDramaAnimeStreamingProvider;

  /// No description provided for @configCopyLmscriptVideoSourceExtractor.
  ///
  /// In en, this message translates to:
  /// **'LMScript video source extractor'**
  String get configCopyLmscriptVideoSourceExtractor;

  /// No description provided for @configCopyMeowtvDirectStreamingNetwork.
  ///
  /// In en, this message translates to:
  /// **'MeowTV direct streaming network'**
  String get configCopyMeowtvDirectStreamingNetwork;

  /// No description provided for @configCopyVidlinkFastMultiCdnStreamProvider.
  ///
  /// In en, this message translates to:
  /// **'VidLink fast multi-CDN stream provider'**
  String get configCopyVidlinkFastMultiCdnStreamProvider;

  /// No description provided for @configCopyVixsrcDirectMasterStreamingExtractor.
  ///
  /// In en, this message translates to:
  /// **'VixSrc direct master streaming extractor'**
  String get configCopyVixsrcDirectMasterStreamingExtractor;

  /// No description provided for @configCopyXpassMultiServerVideoScraper.
  ///
  /// In en, this message translates to:
  /// **'XPass multi-server video scraper'**
  String get configCopyXpassMultiServerVideoScraper;

  /// No description provided for @configCopyZxcstreamMultiSourceDirectProvider.
  ///
  /// In en, this message translates to:
  /// **'ZxcStream multi-source direct provider'**
  String get configCopyZxcstreamMultiSourceDirectProvider;

  /// No description provided for @configCopyBollywoodHindiDualAudioHollywoodDirectStreams.
  ///
  /// In en, this message translates to:
  /// **'Bollywood, Hindi Dual-Audio & Hollywood direct streams'**
  String get configCopyBollywoodHindiDualAudioHollywoodDirectStreams;

  /// No description provided for @configExtraStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get configExtraStandard;

  /// No description provided for @configExtraRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get configExtraRecommended;

  /// No description provided for @configExtraUltraQuality.
  ///
  /// In en, this message translates to:
  /// **'Ultra Quality'**
  String get configExtraUltraQuality;

  /// No description provided for @configExtraDenoise.
  ///
  /// In en, this message translates to:
  /// **'Denoise'**
  String get configExtraDenoise;

  /// No description provided for @configExtraDeblur.
  ///
  /// In en, this message translates to:
  /// **'Deblur'**
  String get configExtraDeblur;

  /// No description provided for @configExtraDefault.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get configExtraDefault;

  /// No description provided for @configExtra100Reliable.
  ///
  /// In en, this message translates to:
  /// **'100% Reliable'**
  String get configExtra100Reliable;

  /// No description provided for @configExtraMaxGpu.
  ///
  /// In en, this message translates to:
  /// **'Max GPU'**
  String get configExtraMaxGpu;

  /// No description provided for @configExtraSimilarTo.
  ///
  /// In en, this message translates to:
  /// **'Similar to'**
  String get configExtraSimilarTo;

  /// No description provided for @configExtraMoviesTv.
  ///
  /// In en, this message translates to:
  /// **'Movies & TV'**
  String get configExtraMoviesTv;

  /// No description provided for @configExtraLiveTv.
  ///
  /// In en, this message translates to:
  /// **'Live TV'**
  String get configExtraLiveTv;

  /// No description provided for @configExtraMyList.
  ///
  /// In en, this message translates to:
  /// **'My List'**
  String get configExtraMyList;

  /// No description provided for @configExtraDownloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get configExtraDownloads;

  /// No description provided for @configExtraManga.
  ///
  /// In en, this message translates to:
  /// **'Manga'**
  String get configExtraManga;

  /// No description provided for @configExtraBooks.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get configExtraBooks;

  /// No description provided for @configExtraAudiobooks.
  ///
  /// In en, this message translates to:
  /// **'Audiobooks'**
  String get configExtraAudiobooks;

  /// No description provided for @configExtraMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get configExtraMusic;

  /// No description provided for @configExtraCollections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get configExtraCollections;

  /// No description provided for @configExtraAnime.
  ///
  /// In en, this message translates to:
  /// **'Anime'**
  String get configExtraAnime;

  /// No description provided for @configExtraAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get configExtraAll;

  /// No description provided for @configExtraNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get configExtraNone;

  /// No description provided for @configExtraSeries.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get configExtraSeries;

  /// No description provided for @configExtraMovie.
  ///
  /// In en, this message translates to:
  /// **'Movie'**
  String get configExtraMovie;

  /// No description provided for @configExtraCustomStream.
  ///
  /// In en, this message translates to:
  /// **'Custom Stream'**
  String get configExtraCustomStream;

  /// No description provided for @configExtraLiveStream.
  ///
  /// In en, this message translates to:
  /// **'Live Stream'**
  String get configExtraLiveStream;

  /// No description provided for @configExtraTorrentEngine.
  ///
  /// In en, this message translates to:
  /// **'Torrent Engine'**
  String get configExtraTorrentEngine;

  /// No description provided for @configExtraRefusedByProvider.
  ///
  /// In en, this message translates to:
  /// **'Refused by provider'**
  String get configExtraRefusedByProvider;

  /// No description provided for @configExtraAccountRejected.
  ///
  /// In en, this message translates to:
  /// **'Account rejected'**
  String get configExtraAccountRejected;

  /// No description provided for @appearanceDetailCustomActive.
  ///
  /// In en, this message translates to:
  /// **'Custom Active'**
  String get appearanceDetailCustomActive;

  /// No description provided for @appearanceDetailDefaultTheme.
  ///
  /// In en, this message translates to:
  /// **'Default Theme'**
  String get appearanceDetailDefaultTheme;

  /// No description provided for @appearanceDetailSpotlightOn.
  ///
  /// In en, this message translates to:
  /// **'Spotlight ON'**
  String get appearanceDetailSpotlightOn;

  /// No description provided for @appearanceDetailCompact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get appearanceDetailCompact;

  /// No description provided for @appearanceDetailWebtoon.
  ///
  /// In en, this message translates to:
  /// **'Webtoon'**
  String get appearanceDetailWebtoon;

  /// No description provided for @appearanceDetailHorizontal.
  ///
  /// In en, this message translates to:
  /// **'Horizontal'**
  String get appearanceDetailHorizontal;

  /// No description provided for @appearanceDetailSkiaRecommended.
  ///
  /// In en, this message translates to:
  /// **'Skia (Recommended)'**
  String get appearanceDetailSkiaRecommended;

  /// No description provided for @appearanceDetailDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get appearanceDetailDisabled;

  /// No description provided for @appearanceDetailBackgroundImageUploadedAndAppliedAcrossAllUi.
  ///
  /// In en, this message translates to:
  /// **'Background image uploaded and applied across all UI!'**
  String get appearanceDetailBackgroundImageUploadedAndAppliedAcrossAllUi;

  /// No description provided for @appearanceDetailPleaseEnterAValidHttpOrHttpsImage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid HTTP or HTTPS image URL.'**
  String get appearanceDetailPleaseEnterAValidHttpOrHttpsImage;

  /// No description provided for @appearanceDetailCustomBackgroundUrlApplied.
  ///
  /// In en, this message translates to:
  /// **'Custom background URL applied!'**
  String get appearanceDetailCustomBackgroundUrlApplied;

  /// No description provided for @appearanceDetailUploadPhotoFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Upload Photo from Device'**
  String get appearanceDetailUploadPhotoFromDevice;

  /// No description provided for @appearanceDetailBackgroundResetToDefaultTheme.
  ///
  /// In en, this message translates to:
  /// **'Background reset to default theme.'**
  String get appearanceDetailBackgroundResetToDefaultTheme;

  /// No description provided for @appearanceDetailAppliedWallpaperName.
  ///
  /// In en, this message translates to:
  /// **'Applied wallpaper: {name}'**
  String appearanceDetailAppliedWallpaperName(String name);

  /// No description provided for @appearanceDetailRequiresTraktLoginInSettingsTrakt.
  ///
  /// In en, this message translates to:
  /// **'Requires Trakt login in Settings -> Trakt'**
  String get appearanceDetailRequiresTraktLoginInSettingsTrakt;

  /// No description provided for @appearanceDetailRequiresSimklLoginInSettingsSimkl.
  ///
  /// In en, this message translates to:
  /// **'Requires Simkl login in Settings -> Simkl'**
  String get appearanceDetailRequiresSimklLoginInSettingsSimkl;

  /// No description provided for @appearanceDetailDisconnected.
  ///
  /// In en, this message translates to:
  /// **'DISCONNECTED'**
  String get appearanceDetailDisconnected;

  /// No description provided for @appearanceDetailPreviewEnableGlassAbove.
  ///
  /// In en, this message translates to:
  /// **'PREVIEW (ENABLE GLASS ABOVE)'**
  String get appearanceDetailPreviewEnableGlassAbove;

  /// No description provided for @appearanceDetailDragDropLayout.
  ///
  /// In en, this message translates to:
  /// **'Drag & Drop Layout'**
  String get appearanceDetailDragDropLayout;

  /// No description provided for @appearanceDetailSeekBarCanvas.
  ///
  /// In en, this message translates to:
  /// **'Seek Bar Canvas'**
  String get appearanceDetailSeekBarCanvas;

  /// No description provided for @appearanceDetailPlayButtonPhysics.
  ///
  /// In en, this message translates to:
  /// **'Play Button & Physics'**
  String get appearanceDetailPlayButtonPhysics;

  /// No description provided for @appearanceDetailArtworkFrame.
  ///
  /// In en, this message translates to:
  /// **'Artwork & Frame'**
  String get appearanceDetailArtworkFrame;

  /// No description provided for @appearanceDetailArtworkVinylFrame.
  ///
  /// In en, this message translates to:
  /// **'Artwork & Vinyl Frame'**
  String get appearanceDetailArtworkVinylFrame;

  /// No description provided for @appearanceDetailChapterBookTitles.
  ///
  /// In en, this message translates to:
  /// **'Chapter & Book Titles'**
  String get appearanceDetailChapterBookTitles;

  /// No description provided for @appearanceDetailSeekBarScrubberCanvas.
  ///
  /// In en, this message translates to:
  /// **'Seek Bar Scrubber Canvas'**
  String get appearanceDetailSeekBarScrubberCanvas;

  /// No description provided for @appearanceDetailPrimaryControlsPlayPauseSkip10s.
  ///
  /// In en, this message translates to:
  /// **'Primary Controls (Play, Pause, Skip ±10s)'**
  String get appearanceDetailPrimaryControlsPlayPauseSkip10s;

  /// No description provided for @appearanceDetailSecondaryControlsSpeedPillVolume.
  ///
  /// In en, this message translates to:
  /// **'Secondary Controls (Speed Pill & Volume)'**
  String get appearanceDetailSecondaryControlsSpeedPillVolume;

  /// No description provided for @appearanceDetailPremadeChaptersPanelButton.
  ///
  /// In en, this message translates to:
  /// **'Premade Chapters Panel Button'**
  String get appearanceDetailPremadeChaptersPanelButton;

  /// No description provided for @appearanceDetailPlay.
  ///
  /// In en, this message translates to:
  /// **'PLAY'**
  String get appearanceDetailPlay;

  /// No description provided for @appearanceDetailChapter4TheSecretsOfTheNight.
  ///
  /// In en, this message translates to:
  /// **'Chapter 4: The Secrets of the Night'**
  String get appearanceDetailChapter4TheSecretsOfTheNight;

  /// No description provided for @appearanceDetailChapter4Of24HarryPotterTheSorcerer.
  ///
  /// In en, this message translates to:
  /// **'Chapter 4 of 24 • Harry Potter & The Sorcerer\'s Stone'**
  String get appearanceDetailChapter4Of24HarryPotterTheSorcerer;

  /// No description provided for @appearanceDetailChapter1TheBoyWhoLived.
  ///
  /// In en, this message translates to:
  /// **'Chapter 1: The Boy Who Lived'**
  String get appearanceDetailChapter1TheBoyWhoLived;

  /// No description provided for @appearanceDetailChapter2TheVanishingGlass.
  ///
  /// In en, this message translates to:
  /// **'Chapter 2: The Vanishing Glass'**
  String get appearanceDetailChapter2TheVanishingGlass;

  /// No description provided for @appearanceDetailChapter3TheLettersFromNoOne.
  ///
  /// In en, this message translates to:
  /// **'Chapter 3: The Letters from No One'**
  String get appearanceDetailChapter3TheLettersFromNoOne;

  /// No description provided for @appearanceDetailChapter4TheKeeperOfTheKeys.
  ///
  /// In en, this message translates to:
  /// **'Chapter 4: The Keeper of the Keys'**
  String get appearanceDetailChapter4TheKeeperOfTheKeys;

  /// No description provided for @appearanceDetailChapter5DiagonAlley.
  ///
  /// In en, this message translates to:
  /// **'Chapter 5: Diagon Alley'**
  String get appearanceDetailChapter5DiagonAlley;

  /// No description provided for @appearanceDetailArtworkTurntable.
  ///
  /// In en, this message translates to:
  /// **'Artwork & Turntable'**
  String get appearanceDetailArtworkTurntable;

  /// No description provided for @appearanceDetailAlbumArtVinylTurntable.
  ///
  /// In en, this message translates to:
  /// **'Album Art & Vinyl Turntable'**
  String get appearanceDetailAlbumArtVinylTurntable;

  /// No description provided for @appearanceDetailTrackArtistAlbumTitles.
  ///
  /// In en, this message translates to:
  /// **'Track, Artist & Album Titles'**
  String get appearanceDetailTrackArtistAlbumTitles;

  /// No description provided for @appearanceDetailTrackTitleQualityBadge.
  ///
  /// In en, this message translates to:
  /// **'Track Title & Quality Badge'**
  String get appearanceDetailTrackTitleQualityBadge;

  /// No description provided for @appearanceDetailLosslessHiResAudioQualityBadge.
  ///
  /// In en, this message translates to:
  /// **'Lossless Hi-Res Audio Quality Badge'**
  String get appearanceDetailLosslessHiResAudioQualityBadge;

  /// No description provided for @appearanceDetailPrimaryControlsPlayPauseSkipShuffleRepeat.
  ///
  /// In en, this message translates to:
  /// **'Primary Controls (Play, Pause, Skip, Shuffle, Repeat)'**
  String get appearanceDetailPrimaryControlsPlayPauseSkipShuffleRepeat;

  /// No description provided for @appearanceDetailSecondaryControlsVolumeSlider.
  ///
  /// In en, this message translates to:
  /// **'Secondary Controls (Volume Slider)'**
  String get appearanceDetailSecondaryControlsVolumeSlider;

  /// No description provided for @appearanceDetailSyncedLyricsQueueQuickButtons.
  ///
  /// In en, this message translates to:
  /// **'Synced Lyrics & Queue Quick Buttons'**
  String get appearanceDetailSyncedLyricsQueueQuickButtons;

  /// No description provided for @appearanceDetailAudiobookCoverArtworkDeck.
  ///
  /// In en, this message translates to:
  /// **'Audiobook Cover Artwork Deck'**
  String get appearanceDetailAudiobookCoverArtworkDeck;

  /// No description provided for @appearanceDetailTitleAuthorChapterLabel.
  ///
  /// In en, this message translates to:
  /// **'Title, Author & Chapter Label'**
  String get appearanceDetailTitleAuthorChapterLabel;

  /// No description provided for @appearanceDetailSeekBarWaveformCanvasScrubber.
  ///
  /// In en, this message translates to:
  /// **'Seek Bar & Waveform Canvas Scrubber'**
  String get appearanceDetailSeekBarWaveformCanvasScrubber;

  /// No description provided for @appearanceDetailMainPlayPauseSkip10sCluster.
  ///
  /// In en, this message translates to:
  /// **'Main Play / Pause / Skip (±10s) Cluster'**
  String get appearanceDetailMainPlayPauseSkip10sCluster;

  /// No description provided for @appearanceDetailSpeedSelectorVolumeControls.
  ///
  /// In en, this message translates to:
  /// **'Speed Selector & Volume Controls'**
  String get appearanceDetailSpeedSelectorVolumeControls;

  /// No description provided for @appearanceDetailPremadeSlidingChaptersPanelTrigger.
  ///
  /// In en, this message translates to:
  /// **'Premade Sliding Chapters Panel Trigger'**
  String get appearanceDetailPremadeSlidingChaptersPanelTrigger;

  /// No description provided for @appearanceDetailTheWayOfKings.
  ///
  /// In en, this message translates to:
  /// **'The Way of Kings'**
  String get appearanceDetailTheWayOfKings;

  /// No description provided for @appearanceDetailBrandonSandersonChapter1Stormblessed.
  ///
  /// In en, this message translates to:
  /// **'Brandon Sanderson • Chapter 1: Stormblessed'**
  String get appearanceDetailBrandonSandersonChapter1Stormblessed;

  /// No description provided for @animeSourceSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Anime metadata sources'**
  String get animeSourceSettingsTitle;

  /// No description provided for @animeSourceSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Switch catalog, search and detail providers; playback sources are unchanged.'**
  String get animeSourceSettingsSubtitle;

  /// No description provided for @animeSourceAniList.
  ///
  /// In en, this message translates to:
  /// **'AniList'**
  String get animeSourceAniList;

  /// No description provided for @animeSourceBangumi.
  ///
  /// In en, this message translates to:
  /// **'Bangumi (Chinese metadata)'**
  String get animeSourceBangumi;

  /// No description provided for @animeSourceFallback.
  ///
  /// In en, this message translates to:
  /// **'Fallback and supplemental data'**
  String get animeSourceFallback;

  /// No description provided for @animeSourceFallbackHelp.
  ///
  /// In en, this message translates to:
  /// **'When Bangumi fails or does not support a filter, use AniList. Also supplement cast and playback identity fields.'**
  String get animeSourceFallbackHelp;

  /// No description provided for @animeSourceMirror.
  ///
  /// In en, this message translates to:
  /// **'Optional HTTPS mirror'**
  String get animeSourceMirror;

  /// No description provided for @animeSourceMirrorHelp.
  ///
  /// In en, this message translates to:
  /// **'Leave blank to use official API. Only enter a trusted, authorized Bangumi-compatible mirror origin. Public search queries will be sent to it.'**
  String get animeSourceMirrorHelp;

  /// No description provided for @animeSourceProxy.
  ///
  /// In en, this message translates to:
  /// **'Optional HTTP proxy'**
  String get animeSourceProxy;

  /// No description provided for @animeSourceProxyHelp.
  ///
  /// In en, this message translates to:
  /// **'Example: http://127.0.0.1:7890. Blank uses process proxy environment, then Windows system proxy.'**
  String get animeSourceProxyHelp;

  /// No description provided for @animeSourceSave.
  ///
  /// In en, this message translates to:
  /// **'Save network settings'**
  String get animeSourceSave;

  /// No description provided for @animeSourceSaved.
  ///
  /// In en, this message translates to:
  /// **'Network settings saved'**
  String get animeSourceSaved;

  /// No description provided for @animeSourceInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid origin or proxy. Use HTTPS mirror and HTTP proxy with a port.'**
  String get animeSourceInvalid;

  /// No description provided for @animeSourceIdentityHelp.
  ///
  /// In en, this message translates to:
  /// **'Only subjects with a verified AniList mapping are shown in Bangumi catalogs for now. Existing history and library IDs stay unchanged.'**
  String get animeSourceIdentityHelp;

  /// No description provided for @animeSourceCheck.
  ///
  /// In en, this message translates to:
  /// **'Test Bangumi connection'**
  String get animeSourceCheck;

  /// No description provided for @animeSourceCheckOk.
  ///
  /// In en, this message translates to:
  /// **'Bangumi connection succeeded'**
  String get animeSourceCheckOk;

  /// No description provided for @animeSourceCheckFail.
  ///
  /// In en, this message translates to:
  /// **'Bangumi connection failed; check network settings.'**
  String get animeSourceCheckFail;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
