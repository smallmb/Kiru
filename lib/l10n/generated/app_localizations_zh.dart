// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Kiru';

  @override
  String get navHome => '首页';

  @override
  String get navBrowse => '浏览';

  @override
  String get navSearch => '搜索';

  @override
  String get navLibrary => '媒体库';

  @override
  String get navSettings => '设置';

  @override
  String get navLiveTv => '电视直播';

  @override
  String get actionCancel => '取消';

  @override
  String get actionClose => '关闭';

  @override
  String get actionRetry => '重试';

  @override
  String get actionTryAgain => '再试一次';

  @override
  String get actionCopy => '复制';

  @override
  String get actionSave => '保存';

  @override
  String get actionCopyReport => '复制报告';

  @override
  String get actionSaveReport => '保存报告';

  @override
  String get actionCopyDiagnostic => '复制诊断信息';

  @override
  String get shellFullscreen => '全屏';

  @override
  String get shellExitFullscreen => '退出全屏';

  @override
  String get shellFullscreenTooltip => '全屏（F11）';

  @override
  String get shellExitFullscreenTooltip => '退出全屏（F11）';

  @override
  String get shellMinimizeWindowTooltip => '最小化窗口';

  @override
  String get shellMaximizeWindowTooltip => '最大化窗口';

  @override
  String get shellRestoreWindowTooltip => '还原窗口';

  @override
  String get shellCloseWindowTooltip => '关闭窗口';

  @override
  String get errorLoadFailed => '无法加载影片';

  @override
  String get errorUnknown => '未知错误';

  @override
  String get listSeparator => '、';

  @override
  String get shortcutsTitle => '键盘快捷键';

  @override
  String get shortcutsClose => '关闭键盘快捷键';

  @override
  String get shortcutsGroupAnywhere => '任意位置';

  @override
  String get shortcutsGroupMoving => '浏览操作';

  @override
  String get shortcutsGroupPlaying => '播放时';

  @override
  String get shortcutsGroupReading => '阅读时';

  @override
  String get shortcutsShowSheet => '显示此快捷键列表';

  @override
  String get shortcutsShowSheetNote => '也可按 Shift + /';

  @override
  String get shortcutsToggleFullscreen => '切换全屏';

  @override
  String get shortcutsLeaveFullscreen => '退出全屏或关闭当前窗口';

  @override
  String get shortcutsLeaveFullscreenNote => '不会自行离开当前页面';

  @override
  String get shortcutsMyList => '我的片单和下载';

  @override
  String get shortcutsSearchMacNote => 'macOS 上按 Cmd + K';

  @override
  String get shortcutsSettingsMacNote => 'macOS 上按 Cmd + ,';

  @override
  String get shortcutsPlayPause => '播放或暂停';

  @override
  String get shortcutsPlayPauseNote => '按 K 也可操作';

  @override
  String get shortcutsSeek => '快退或快进 10 秒';

  @override
  String get shortcutsSeekNote => '视频获得焦点时也可使用方向键';

  @override
  String get shortcutsMute => '静音或取消静音';

  @override
  String get shortcutsAspect => '切换视频画面的填充方式';

  @override
  String get shortcutsPage => '上一页或下一页、上一章或下一章';

  @override
  String get shortcutsLine => '焦点模式下向下或向上移动一行';

  @override
  String nowPlayingSemantics(String title, String subtitle) {
    return '正在播放：$title，$subtitle';
  }

  @override
  String get nowPlayingOpenHint => '打开完整播放器';

  @override
  String get playerPrevious => '上一项';

  @override
  String get playerNext => '下一项';

  @override
  String get settingsTitle => '设置';

  @override
  String get settingsSectionPlayback => '播放';

  @override
  String get settingsSectionSources => '内容来源';

  @override
  String get settingsSectionIntegrations => '服务集成';

  @override
  String get settingsSectionAppearance => '外观';

  @override
  String get settingsSectionContent => '内容';

  @override
  String get settingsSectionApp => '应用';

  @override
  String get stateEnabled => '已启用';

  @override
  String get stateDisabled => '已停用';

  @override
  String get stateActive => '运行中';

  @override
  String get stateOffline => '离线';

  @override
  String get stateConnected => '已连接';

  @override
  String get stateNotSet => '未设置';

  @override
  String get stateOn => '开启';

  @override
  String get stateOff => '关闭';

  @override
  String get settingsVideoTitle => '视频与画质增强';

  @override
  String get settingsVideoSubtitle => 'Anime4K 神经着色器预设与 GPU 渲染管线';

  @override
  String get settingsP2pTitle => '内置 P2P 种子源';

  @override
  String get settingsP2pActiveSubtitle =>
      'ZPlay P2P 种子源（Knaben、TorrentGalaxy）已启用';

  @override
  String get settingsP2pDisabledSubtitle => 'P2P 已关闭，仅使用 HTTP 直连播放（ZPlayHTTP）';

  @override
  String get settingsP2pActiveValue => 'P2P 已启用';

  @override
  String get settingsP2pHttpValue => '仅使用 HTTP';

  @override
  String get settingsP2pInfoTooltip => 'P2P 使用说明';

  @override
  String get settingsAddonsTitle => '插件';

  @override
  String get settingsAddonsSubtitle => 'Stremio 目录和内容提供方';

  @override
  String settingsAddonsInstalled(int count) {
    return '已安装 $count 个';
  }

  @override
  String get settingsBuiltinTitle => '内置提供方';

  @override
  String get settingsBuiltinSubtitle => 'ZPlayHTTP 播放源、优先级和启用开关';

  @override
  String get settingsBuiltinCustom => '自定义';

  @override
  String get settingsBuiltinDefault => '默认';

  @override
  String get settingsDebridTitle => '解锁服务与云端播放';

  @override
  String get settingsDebridSubtitle =>
      'Real-Debrid、TorBox、AllDebrid、Premiumize 和 Debrid-Link';

  @override
  String get settingsTraktTitle => 'Trakt.tv 同步';

  @override
  String get settingsTraktSubtitle => '跨设备同步片单、观看记录和播放进度';

  @override
  String get settingsSimklTitle => 'Simkl 同步';

  @override
  String get settingsSimklSubtitle => '跨设备同步电影、电视节目和动漫记录';

  @override
  String get settingsTmdbTitle => 'TMDb API 密钥';

  @override
  String get settingsTmdbSubtitle => '用于 90 年代精选内容排序和刮削器元数据的个人密钥';

  @override
  String get settingsTmdbYourKey => '你的密钥';

  @override
  String get settingsServiceKeysTitle => '服务 API 密钥';

  @override
  String get settingsServiceKeysSubtitle => '字幕、有声书和刮削器所需的个人密钥';

  @override
  String settingsServiceKeysCount(int provided, int total) {
    return '已设置 $provided/$total 项';
  }

  @override
  String get settingsDiscordTitle => 'Discord 状态展示';

  @override
  String get settingsDiscordEnabledSubtitle => '向 Discord 展示正在观看的影片、节目、音乐和直播';

  @override
  String get settingsDiscordDisabledSubtitle => '已停用，Discord 不会显示活动状态';

  @override
  String get settingsAppearanceTitle => '外观与界面';

  @override
  String get settingsAppearanceSubtitle => 'Liquid Glass、配色主题和首页界面设置';

  @override
  String get settingsGlassOn => '玻璃效果已开启';

  @override
  String get settingsCalendarTitle => '电视播出日历';

  @override
  String get settingsCalendarOnSubtitle => '首页顶部栏和版块标题中显示日历按钮';

  @override
  String get settingsCalendarOffSubtitle => '日历已停用，并在所有页面隐藏';

  @override
  String get settingsAiQuizTitle => 'AI 推荐问答';

  @override
  String get settingsAiQuizOnSubtitle => '首页和搜索栏中显示 AI 口味测试';

  @override
  String get settingsAiQuizOffSubtitle => 'AI 问答已停用，并在所有页面隐藏';

  @override
  String get settingsAdultTitle => '成人内容';

  @override
  String get settingsAdultOnSubtitle => '已启用 18+ 目录、搜索结果和播放来源';

  @override
  String get settingsAdultOffSubtitle => '已隐藏，不会获取 18+ 目录、搜索结果或播放来源';

  @override
  String get settingsBackupTitle => '备份与恢复';

  @override
  String get settingsBackupSubtitle => '导出或导入设置、主题、媒体库和观看进度（JSON）';

  @override
  String get settingsBackupDialogSubtitle => '用于跨设备迁移的 JSON 配置';

  @override
  String get settingsBackupDescription =>
      '导出设置、主题、片单和进度。密码留空时会导出脱敏配置，凭据、IPTV 门户和插件网址会保留在此设备上。设置密码后则会加密并导出完整配置。';

  @override
  String get settingsPassphraseOptional => '密码（可选）';

  @override
  String get settingsPassphraseHelper => '至少输入 8 个字符，以加密完整配置。';

  @override
  String get settingsExportProfile => '导出配置';

  @override
  String get settingsPassphraseTooShort => '密码至少需要 8 个字符。';

  @override
  String get settingsRedactedProfileCopied => '已复制脱敏配置。凭据、门户和插件信息仍保留在此设备上。';

  @override
  String get settingsEncryptedProfileCopied => '已复制加密的完整配置。请妥善保管密码，密码无法找回。';

  @override
  String get settingsImportJson => '导入 JSON';

  @override
  String get settingsPasteJsonTitle => '粘贴配置 JSON';

  @override
  String get settingsPasteJsonHint => '在此粘贴备份 JSON……';

  @override
  String get settingsPassphraseEncrypted => '密码（用于加密配置）';

  @override
  String get settingsPassphraseEncryptedHelper => '脱敏配置无需密码；加密配置需要输入导出时使用的密码。';

  @override
  String get settingsPasteFromClipboard => '从剪贴板粘贴';

  @override
  String get settingsFromFile => '从文件导入';

  @override
  String get settingsRestoreNow => '立即恢复';

  @override
  String settingsImportFailed(String error) {
    return '导入失败：$error';
  }

  @override
  String get settingsChooseProfile => '选择一个 Kiru 配置';

  @override
  String get settingsClearCacheTitle => '清除缓存';

  @override
  String get settingsClearCacheSubtitle => '清除缓存的图片和元数据；登录状态、插件、片单和历史记录会保留';

  @override
  String get settingsClearCacheConfirmTitle => '清除缓存？';

  @override
  String get settingsClearCacheConfirmBody =>
      '这将删除缓存的图片和元数据，之后会重新获取。你不会退出登录，插件、个人配置、片单、观看记录和设置都不会改变。';

  @override
  String get settingsClear => '清除';

  @override
  String settingsCacheArtwork(String error) {
    return '图片缓存（$error）';
  }

  @override
  String settingsCacheMetadata(String error) {
    return '元数据缓存（$error）';
  }

  @override
  String settingsCacheHero(String error) {
    return '首页横幅图片缓存（$error）';
  }

  @override
  String get settingsCacheCleared => '缓存已清除。';

  @override
  String settingsCacheClearedExcept(String failures) {
    return '缓存已清除，但以下项目未能清除：$failures。';
  }

  @override
  String get settingsCacheClearedSuffix => '你仍保持登录；插件、片单、观看记录和设置均未更改。';

  @override
  String get settingsUpdatesTitle => '应用更新';

  @override
  String get settingsUpdatesSubtitle => '检查最新版本和补丁';

  @override
  String get settingsUpdatesCheck => '检查更新';

  @override
  String get settingsDiagnosticsSubtitle => '可复制或保存的应用、设备和播放器状态（已脱敏）';

  @override
  String get settingsLanguageSubtitle => '简体中文、英语、阿拉伯语，或跟随设备系统语言';

  @override
  String get settingsAboutTitle => '关于 Kiru';

  @override
  String get settingsAboutSubtitle => '软件架构、视频引擎和致谢';

  @override
  String get diagnosticsTitle => '诊断信息';

  @override
  String get diagnosticsSubtitle => '本地应用、设备和播放器报告（无遥测）';

  @override
  String get diagnosticsDescription =>
      '仅在本机生成当前安装状态快照，包括应用和设备信息、播放器设置、播放引擎状态以及近期崩溃记录。不会包含凭据、插件网址、IPTV 门户或播放列表链接，也不会上传任何内容。只有在你复制或保存后，报告才会生成。';

  @override
  String get diagnosticsSectionDevice => '设备';

  @override
  String get diagnosticsSectionPlayerEngine => '播放器与引擎';

  @override
  String get diagnosticsSectionBreadcrumbs => '崩溃记录';

  @override
  String get diagnosticsSummary => '摘要';

  @override
  String get diagnosticsNotAvailable => '不可用';

  @override
  String diagnosticsBreadcrumbCount(int count, int shown) {
    return '共记录 $count 条，显示最近 $shown 条';
  }

  @override
  String get diagnosticsBreadcrumbs => '近期活动';

  @override
  String get diagnosticsEmpty => '暂无活动记录。';

  @override
  String get diagnosticsCopied => '诊断报告已复制。';

  @override
  String get diagnosticsCopiedToClipboard => '诊断报告已复制到剪贴板';

  @override
  String get diagnosticsCopyFailed => '无法复制报告';

  @override
  String get diagnosticsSaveFailed => '无法保存报告';

  @override
  String diagnosticsSaved(String path) {
    return '诊断信息已保存到 $path';
  }

  @override
  String get searchHintTv => '搜索电影或剧集';

  @override
  String get searchHint => '搜索电影、剧集，或粘贴链接';

  @override
  String get searchVoice => '语音搜索';

  @override
  String get searchVoiceDenied => '麦克风权限已关闭。请允许 Kiru 使用麦克风进行语音搜索。';

  @override
  String get searchAiQuiz => 'AI 口味测试';

  @override
  String get searchPaste => '从剪贴板粘贴';

  @override
  String get searchFailureTitle => '无法连接搜索来源';

  @override
  String searchFailureBody(int failed, int total) {
    return '$failed/$total 个来源未响应';
  }

  @override
  String get searchFailureAdvice => '失效的插件或过期的提供方运行环境可在“插件”设置中修复。';

  @override
  String searchNoResults(String query) {
    return '没有找到“$query”的结果';
  }

  @override
  String get searchingMoreSources => '正在搜索更多来源……';

  @override
  String searchPartialFailure(String sources) {
    return '部分来源不可用：$sources 未响应。其他来源已正常返回，因此下方结果有效，但可能不完整。';
  }

  @override
  String get searchRecent => '最近搜索';

  @override
  String get searchClearAll => '全部清除';

  @override
  String get searchTrending => '热门与推荐';

  @override
  String get searchNothingToSuggest => '暂无推荐内容';

  @override
  String get searchNothingToSuggestBody => '先搜索一个标题，或在设置中连接插件以添加可搜索的内容来源。';

  @override
  String get searchPinnedSpine => '置顶栏';

  @override
  String searchCloudstreamSection(String provider) {
    return 'CloudStream · $provider';
  }

  @override
  String get searchCloudstreamExtension => 'CloudStream 扩展';

  @override
  String get searchTitlesSection => '标题';

  @override
  String get searchImdbSuggestions => 'IMDb 推荐';

  @override
  String get searchDirectStream => '直连播放';

  @override
  String get searchSourceTitleLookup => '标题查询';

  @override
  String get playerSeekBack => '快退 10 秒';

  @override
  String get playerSeekForward => '快进 10 秒';

  @override
  String get playerPlay => '播放';

  @override
  String get playerPause => '暂停';

  @override
  String get playerMute => '静音';

  @override
  String get playerUnmute => '取消静音';

  @override
  String get playerPreviousEpisode => '上一集';

  @override
  String get playerNextEpisode => '下一集';

  @override
  String get playerEpisodes => '剧集';

  @override
  String get playerAspectRatio => '画面比例（C）';

  @override
  String get playerPlaybackSpeed => '播放速度';

  @override
  String get playerAudioTracks => '音轨';

  @override
  String get playerSubtitles => '字幕';

  @override
  String get playerSubtitleSync => '字幕同步';

  @override
  String get playerFullscreen => '全屏（F）';

  @override
  String get playerExitFullscreen => '退出全屏（F）';

  @override
  String playerVolume(int percent) {
    return '音量 $percent%';
  }

  @override
  String playerSeekPosition(String position, String duration) {
    return '$position / $duration';
  }

  @override
  String get a11yOpenDetails => '打开详情';

  @override
  String a11yResume(String title, int percent) {
    return '继续观看 $title，已观看 $percent%';
  }

  @override
  String get emptyMyList => '片单还是空的';

  @override
  String get emptyMyListBody => '收藏喜欢的电影和剧集，随时观看';

  @override
  String get languageTitle => '语言';

  @override
  String get languageSubtitle => '应用语言；选择“跟随系统”时使用设备语言。';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageArabic => 'العربية';

  @override
  String get languageChinese => '简体中文';

  @override
  String get a11yResumePlayback => '继续播放';

  @override
  String get playerPlaybackPosition => '播放进度';

  @override
  String get playerVolumeLabel => '音量';

  @override
  String get browseVerticalMoviesAndTv => '电影与剧集';

  @override
  String get browseVerticalCollections => '影视合集';

  @override
  String get browseVerticalLiveTv => '电视直播';

  @override
  String get browseVerticalAnime => '动漫';

  @override
  String get browseVerticalManga => '漫画';

  @override
  String get browseVerticalBooks => '电子书';

  @override
  String get browseVerticalAudiobooks => '有声书';

  @override
  String get browseVerticalMusic => '音乐';

  @override
  String get browseVerticalAdult => '18+';

  @override
  String get homeAiTasteQuiz => 'AI 观影偏好';

  @override
  String get homeTvCalendar => '剧集播出日历';

  @override
  String get homeContinueWatching => '继续观看';

  @override
  String get homeTopTenMovies => '热门电影 Top 10';

  @override
  String get homeSkipIntro => '跳过开场';

  @override
  String get homeCinemaUniverse => '你的专属影音空间';

  @override
  String get discoverNoTitles => '该分类暂无内容';

  @override
  String get discoverRequiredFilter => '请选择筛选条件';

  @override
  String get discoverSearchCatalog => '搜索当前目录';

  @override
  String get discoverPageTitle => '发现';

  @override
  String get detailsUnavailable => '暂无影片详情';

  @override
  String get detailsGoBack => '返回';

  @override
  String get animeLoadFailed => '无法加载动漫';

  @override
  String get animeContinueWatching => '继续观看';

  @override
  String get animeTrending => '热门番剧';

  @override
  String get animeTrendingDescription => '近期人气番剧';

  @override
  String get animeSeasonPopular => '本季热门';

  @override
  String get animeMasterpieces => '经典高分番剧';

  @override
  String get animeMasterpiecesDescription => '口碑佳作，值得补番';

  @override
  String get animeNextSeason => '下季新番';

  @override
  String get animeNextSeasonDescription => '即将开播，敬请期待';

  @override
  String get animeAction => '动作与冒险';

  @override
  String get animeActionDescription => '热血战斗与冒险旅程';

  @override
  String get animeRomance => '恋爱与剧情';

  @override
  String get animeRomanceDescription => '细腻动人的情感故事';

  @override
  String get animeFantasy => '奇幻与异世界';

  @override
  String get animeFantasyDescription => '探索奇幻世界';

  @override
  String get animeSciFi => '科幻与赛博朋克';

  @override
  String get animeSciFiDescription => '未来科技与幻想世界';

  @override
  String get sourcesTitle => '播放源';

  @override
  String get sourcesSeederFilter => '做种人数';

  @override
  String get sourcesAllSeeds => '不限人数';

  @override
  String get sourcesMostSeeds => '做种人数从高到低';

  @override
  String get sourcesMostSeedsShort => '做种最多';

  @override
  String get sourcesSeeds50 => '50 人以上';

  @override
  String get sourcesSeeds20 => '20 人以上';

  @override
  String get sourcesSeeds5 => '5 人以上';

  @override
  String get sourcesActiveSeeds => '有活跃做种（>0）';

  @override
  String get sourcesActiveSeedsShort => '活跃做种';

  @override
  String get sourcesSizeFilter => '文件大小';

  @override
  String get sourcesAllSizes => '不限大小';

  @override
  String get sourcesLargestFirst => '从大到小';

  @override
  String get sourcesLargest => '最大优先';

  @override
  String get sourcesSmallestFirst => '从小到大';

  @override
  String get sourcesSmallest => '最小优先';

  @override
  String get sourcesProvider => '播放源服务';

  @override
  String get sourcesAll => '全部来源';

  @override
  String get sourcesAudioLanguage => '音轨语言';

  @override
  String get sourcesAllAudio => '全部音轨';

  @override
  String get sourcesMultiAudio => '🌐 多音轨';

  @override
  String get sourcesEnglishAudio => '🇺🇸 英语 / 原声';

  @override
  String get sourcesHindiAudio => '🇮🇳 印地语 / 印度语言';

  @override
  String get sourcesGermanAudio => '🇩🇪 德语';

  @override
  String get sourcesFrenchAudio => '🇫🇷 法语';

  @override
  String get sourcesSpanishSpain => '🇪🇸 西班牙语（西班牙）';

  @override
  String get sourcesSpanishLatin => '🇲🇽 西班牙语（拉美）';

  @override
  String get sourcesSpanishAll => '🌎 全部西班牙语';

  @override
  String get sourcesRussianAudio => '🇷🇺 俄语';

  @override
  String get sourcesJapaneseAudio => '🇯🇵 日语';

  @override
  String get sourcesItalianAudio => '🇮🇹 意大利语';

  @override
  String get sourcesEmpty => '暂无可用播放源';

  @override
  String get sourcesEmptyHint => '请在设置中检查播放源，或尝试其他影片。';

  @override
  String get sourcesInstallAddons => '管理播放源插件';

  @override
  String get sourcesMagnetCopied => '磁力链接已复制';

  @override
  String get uiHeroBannerPlay => '播放';

  @override
  String get uiHeroBannerMoreInfo => '查看详情';

  @override
  String get uiHeroBannerTrailer => '预告片';

  @override
  String get uiContinueWatchingSliderHoldOkForOptions => '长按确认键查看选项';

  @override
  String get uiContinueWatchingSliderViewDetails => '查看详情';

  @override
  String get uiContinueWatchingSliderViewDetails3 => '查看详情';

  @override
  String get uiContinueWatchingSliderRemoveFromContinueWatching => '从继续观看中移除';

  @override
  String get uiContinueWatchingSliderResume => '继续播放';

  @override
  String get uiPlayerTopBarBack => '返回';

  @override
  String get uiPlayerTopBarEpisodes => '选集';

  @override
  String get uiPlayerTopBarSources => '播放源';

  @override
  String get uiPlayerTopBarCopyStreamUrl => '复制播放地址';

  @override
  String get uiPlayerTopBarScreenshot => '截图';

  @override
  String get uiPlayerTopBarLockScreen => '锁定屏幕';

  @override
  String get uiPlayerTopBarCast => '投屏';

  @override
  String get uiPlayerSpeedMenuPlaybackSpeed => '播放速度';

  @override
  String get uiPlayerAspectMenuAspectRatio => '画面比例';

  @override
  String get uiPlayerAspectMenuSubtitleSizeScale => '字幕缩放';

  @override
  String get uiPlayerAudioMenuAudioTracks => '音轨';

  @override
  String get uiPlayerAudioMenuClose => '关闭';

  @override
  String get uiPlayerAudioMenuDefaultAudioStreamPlaying => '正在播放默认音轨';

  @override
  String get uiPlayerAudioMenuAudioSyncOffset => '音频延迟';

  @override
  String get uiPlayerEpisodesPanelScrollUp => '向上滚动';

  @override
  String get uiPlayerEpisodesPanelScrollDown => '向下滚动';

  @override
  String get uiPlayerEpisodesPanelEpisodes => '选集';

  @override
  String get uiPlayerEpisodesPanelClose => '关闭';

  @override
  String get uiPlayerEpisodesPanelPreviousSeasons => '上一季';

  @override
  String get uiPlayerEpisodesPanelNextSeasons => '下一季';

  @override
  String get uiPlayerEpisodesPanelPlaying => '正在播放';

  @override
  String get uiPlayerEpisodesPanelSelectSources => '选择播放源';

  @override
  String get uiPlayerLoadingOverlayPlaybackIssue => '播放异常';

  @override
  String get uiPlayerLoadingOverlayThisSourceIsnTResponding => '当前播放源未响应';

  @override
  String get uiPlayerLoadingOverlayChooseAnotherSource => '切换播放源';

  @override
  String get uiPlayerLoadingOverlayGoBack => '返回';

  @override
  String get uiPlayerLoadingOverlayCopyDiagnostic => '复制诊断信息';

  @override
  String get uiPlayerMenuRowsClose => '关闭';

  @override
  String get uiPlayerSourcesPanelBackToEpisodes => '返回选集';

  @override
  String get uiPlayerSourcesPanelClose => '关闭';

  @override
  String get uiPlayerSourcesPanelSearchingEveryProvider => '正在查找播放源…';

  @override
  String get uiPlayerSourcesPanelRescrapeSources => '重新查找播放源';

  @override
  String get uiPlayerSourcesPanelScrapingAdditionalSources => '正在查找更多播放源…';

  @override
  String get uiPlayerSourcesPanelMagnetLinkCopiedToClipboard => '磁力链接已复制';

  @override
  String get uiPlayerSubtitleMenuSubtitles => '字幕';

  @override
  String get uiPlayerSubtitleMenuRefreshOnlineSubtitles => '刷新在线字幕';

  @override
  String get uiPlayerSubtitleMenuSubtitleSyncBar => '字幕同步';

  @override
  String get uiPlayerSubtitleMenuSubtitleAppearance => '字幕样式';

  @override
  String get uiPlayerSubtitleMenuSpeechTextSync => '语音与字幕同步';

  @override
  String get uiPlayerSubtitleMenuClose => '关闭';

  @override
  String get uiPlayerSubtitleMenuOff => '关闭';

  @override
  String get uiPlayerSubtitleMenuEmbedded => '内嵌字幕';

  @override
  String get uiPlayerSubtitleMenuAll => '全部';

  @override
  String get uiPlayerSubtitleMenuForced => '强制字幕';

  @override
  String get uiPlayerSubtitleMenuSearchOnline => '搜索在线字幕';

  @override
  String get uiPlayerSubtitleMenuEmbedded12 => '内嵌字幕';

  @override
  String get uiPlayerSubtitleMenuSearchingSubtitles => '正在查找字幕…';

  @override
  String get uiPlayerSubtitleMenuNoSubtitlesAvailable => '暂无可用字幕';

  @override
  String get uiPlayerSubtitleMenuSearchOnlineProviders => '搜索在线字幕服务';

  @override
  String get uiPlayerSubtitleMenuSearchingAdditionalSubtitlesOnline =>
      '正在查找更多在线字幕…';

  @override
  String get uiPlayerSubtitleMenuForced17 => '强制字幕';

  @override
  String get uiPlayerSubtitleMenuFindMoreSubtitles => '查找更多字幕';

  @override
  String get uiPlayerSubStyleModalSubtitleAppearance => '字幕样式';

  @override
  String get uiPlayerSubStyleModalLibassLibmpvHardwareRenderedSubtitles =>
      'libass / libmpv 字幕渲染';

  @override
  String get uiPlayerSubStyleModalResetSubtitleDefaults => '恢复默认字幕设置';

  @override
  String get uiPlayerSubStyleModalClose => '关闭';

  @override
  String get uiPlayerSubStyleModalZplaySampleSubtitlePreview => 'Kiru · 字幕预览';

  @override
  String get uiPlayerSubStyleModalBoldText => '粗体';

  @override
  String get uiPlayerSubStyleModalItalicText => '斜体';

  @override
  String get uiPlayerSubStyleModalFlutterSubtitleEngineRecommended =>
      'Flutter 字幕引擎（推荐）';

  @override
  String get uiPlayerSubStyleModalNativeMpvLibassEngine => 'MPV 原生 libass 引擎';

  @override
  String get uiPlayerSubStyleModal100ReliableHardwareAcceleratedSubtitle =>
      '跨平台硬件加速字幕叠加，支持自定义样式。';

  @override
  String get uiPlayerSubStyleModalDirectGpuVideoTextureRendering =>
      '使用 libass 直接渲染字幕，支持 SSA/ASS 排版及内置 Poppins 字体。';

  @override
  String get uiSubSyncBarTextSync => '字幕同步';

  @override
  String get uiSubSyncBarDiscardChanges => '放弃修改';

  @override
  String get uiSubSyncBarDone => '完成';

  @override
  String get uiSubSyncBarClose => '关闭';

  @override
  String get uiTextSyncOverlayClose => '关闭';

  @override
  String get uiTextSyncOverlaySearchDialogue => '搜索台词…';

  @override
  String get uiTextSyncOverlayNow => '当前';

  @override
  String get uiTextSyncOverlaySyncFromHere => '从此处同步';

  @override
  String get uiTextSyncOverlayJumpHere => '跳转至此';

  @override
  String get uiTextSyncOverlayJumpToNow => '返回当前进度';

  @override
  String get uiTextSyncOverlayResetTiming => '重置时间轴';

  @override
  String get uiPlayerScreenFailedToDownloadSubtitle => '字幕下载失败';

  @override
  String get uiPlayerScreenSubtitleTimingSynchronizedAndSaved => '字幕同步设置已保存';

  @override
  String get uiPlayerScreenScreenIsLockedTapThe => '屏幕已锁定，点击锁定图标解锁。';

  @override
  String get uiPlayerScreenTestingOtherSourcesForYou => '正在尝试其他播放源';

  @override
  String get uiPlayerScreenChooseASourceMyself => '手动选择播放源';

  @override
  String get uiPlayerScreenDownloadAlreadyInProgressIn => '该影片正在后台下载';

  @override
  String get uiPlayerScreenThisMediaIsAlreadyDownloaded => '该影片已下载';

  @override
  String get uiPlayerScreenDownloadStartedInBackgroundTrack =>
      '已开始后台下载，可在下载列表查看进度。';

  @override
  String get uiPlayerScreenStreamUrlCopiedToClipboard => '播放地址已复制';

  @override
  String get uiPlayerScreenNoActiveStreamUrlAvailable => '暂无可复制的播放地址';

  @override
  String get uiPlayerScreenSubtitleSyncIsNotSupported =>
      '内嵌字幕不支持此同步功能，请选择外挂字幕。';

  @override
  String get uiPlayerScreenPleaseLoadAnExternalSubtitle => '请先加载外挂字幕';

  @override
  String get uiPlayerScreenSubtitleSyncIsNotSupported13 => '内嵌字幕不支持此同步功能';

  @override
  String get uiPlayerScreenSpeechSyncRequiresAnExternal => '语音同步需要外挂字幕文件';

  @override
  String get uiPlayerScreen2xSpeed => '2 倍速';

  @override
  String get uiPlayerScreenUnlock => '解锁';

  @override
  String get uiAnimeSearchPageClear => '清除';

  @override
  String get uiAnimeSearchPageReleaseYear => '发行年份';

  @override
  String get uiAnimeSearchPageSearchAnimeMoviesOvas => '搜索番剧、动画电影、OVA…';

  @override
  String get uiAnimeSearchPageSortBy => '排序方式';

  @override
  String get uiAnimeSearchPageGenre => '题材';

  @override
  String get uiAnimeSearchPageSeason => '季度';

  @override
  String get uiAnimeSearchPageFormat => '类型';

  @override
  String get uiAnimeSearchPageStatus => '连载状态';

  @override
  String get uiAnimeSearchPageReset => '重置';

  @override
  String get uiAnimeSearchPageNoAnimeFoundMatchingYour => '未找到符合条件的动漫';

  @override
  String get uiAnimeSearchPageTryDifferentKeywordsOrClearing =>
      '试试其他关键词或清除筛选条件';

  @override
  String get uiAnimeSearchPageAnimeTvSeries => '电视动画';

  @override
  String get uiAnimeSearchPageAnimeMovies => '动画电影';

  @override
  String get uiAnimeSearchPageOvasOnasSpecials => 'OVA、ONA 与特别篇';

  @override
  String get uiAnimeSearchPageTrendingAnime => '热门番剧';

  @override
  String get uiAnimeSearchPagePopularThisSeason => '本季热门';

  @override
  String get uiAnimeSearchPageAllTimeTopRated => '经典高分';

  @override
  String get uiAnimeDetailsPageEpisodes => '选集';

  @override
  String get uiAnimeDetailsPageWatching => '在看';

  @override
  String get uiAnimeDetailsPagePlanToWatch => '想看';

  @override
  String get uiAnimeDetailsPageCompleted => '已看完';

  @override
  String get uiAnimeDetailsPageDropped => '已弃番';

  @override
  String get uiAnimeDetailsPageSub => '字幕版';

  @override
  String get uiAnimeDetailsPageDub => '配音版';

  @override
  String get uiAnimeDetailsPageJumpToEp => '跳转集数';

  @override
  String get uiAnimeStreamSheetSubtitleOrDub => '字幕或配音';

  @override
  String get uiAnimeStreamSheetAll => '全部';

  @override
  String get uiAnimeStreamSheetSub => '字幕版';

  @override
  String get uiAnimeStreamSheetDub => '配音版';

  @override
  String get uiAnimeStreamSheetSources => '播放源';

  @override
  String get uiAnimeStreamSheetRetryScraping => '重新查找';

  @override
  String get uiMyListPageRemoveFromMyList => '从片单中移除？';

  @override
  String get uiMyListPageCancel => '取消';

  @override
  String get uiMyListPageRemove => '移除';

  @override
  String get uiMyListPageMyList => '我的片单';

  @override
  String get uiMyListPageAll => '全部';

  @override
  String get uiMyListPageMovies => '电影';

  @override
  String get uiMyListPageTvShows => '剧集';

  @override
  String get uiMyListPageFilterSavedTitles => '筛选已收藏内容';

  @override
  String get uiMyListPageRecentlyAdded => '最近添加';

  @override
  String get uiMyListPageAlphabetical => '按名称排序';

  @override
  String get uiMyListPageReleaseYear => '发行年份';

  @override
  String get uiMyListPageSearchSavedTitles => '搜索片单…';

  @override
  String get uiMyListPageResetFilters => '重置筛选';

  @override
  String get uiDownloadsPageFileNotFoundOnDisk => '找不到文件，可能已被移动或删除。';

  @override
  String get uiDownloadsPageDeleteDownload => '删除下载';

  @override
  String get uiDownloadsPageCancel => '取消';

  @override
  String get uiDownloadsPageDelete => '删除';

  @override
  String get uiDownloadsPageDownloadList => '下载列表';

  @override
  String get uiDownloadsPageActive => '下载中';

  @override
  String get uiDownloadsPageDownloaded => '已下载';

  @override
  String get uiDownloadsPageDownloads => '下载';

  @override
  String get uiDownloadsPageOpenDownloadsFolder => '打开下载目录';

  @override
  String get uiDownloadsPageNoActiveDownloads => '暂无下载任务';

  @override
  String get uiDownloadsPageMediaYouDownloadFromThe => '从播放器下载的影片将在此显示。';

  @override
  String get uiDownloadsPagePause => '暂停';

  @override
  String get uiDownloadsPageResume => '继续下载';

  @override
  String get uiDownloadsPageRetryReconnect => '重试 / 重新连接';

  @override
  String get uiDownloadsPageOpenFolderLocation => '打开文件所在目录';

  @override
  String get uiDownloadsPageNoDownloadedMedia => '暂无已下载影片';

  @override
  String get uiDownloadsPageCompletedDownloadsWillAppearHere =>
      '下载完成的影片将在此显示，可离线观看。';

  @override
  String get uiDiscoverPageCancel => '取消';

  @override
  String get uiDiscoverPageApply => '应用';

  @override
  String get uiVideoSettingsPageVideoUpscaling => '视频与画质';

  @override
  String get uiVideoSettingsPageGpuUpscaling => 'GPU 超分辨率';

  @override
  String get uiVideoSettingsPageUpscalingPresets => '画质增强预设';

  @override
  String get uiVideoSettingsPageDisabledOff => '关闭增强';

  @override
  String get uiVideoSettingsPageStandardVideoPlaybackWithoutGlsl =>
      '标准视频播放，不启用 GLSL 增强滤镜，GPU 开销最低。';

  @override
  String get uiVideoSettingsPageModeAFastBalanced => '模式 A · 快速 / 均衡';

  @override
  String get uiVideoSettingsPageSharpLineRestoration2xCnn =>
      '恢复清晰线条并进行 2 倍 CNN 超分，适合 1080p 动漫。';

  @override
  String get uiVideoSettingsPageModeAHighQualityUltra => '模式 A · 极致画质';

  @override
  String get uiVideoSettingsPageMaximumPerceptualFidelityUsingVery =>
      '使用大型 CNN 提升画质，建议使用独立显卡。';

  @override
  String get uiVideoSettingsPageModeBSoftDenoise => '模式 B · 柔化 / 降噪';

  @override
  String get uiVideoSettingsPageSmoothLineReconstructionAndArtifact =>
      '重建平滑线条并减少压缩瑕疵，适合模糊或老旧动漫。';

  @override
  String get uiVideoSettingsPageModeCDeblurScale => '模式 C · 去模糊 / 超分';

  @override
  String get uiVideoSettingsPageAggressiveDeblurringAndScalingBest =>
      '加强去模糊和超分效果，适合 480p、720p 低分辨率动漫。';

  @override
  String get uiVideoSettingsPageFsr10Smooth => 'FSR 1.0 · 柔和';

  @override
  String get uiVideoSettingsPageFsr10Sharp => 'FSR 1.0 · 锐化';

  @override
  String get uiVideoSettingsPagePipelineCompatibility => '渲染与兼容性';

  @override
  String get uiVideoSettingsPagePlaybackStartApplication => '播放启动时应用';

  @override
  String get uiVideoSettingsPageHardwareDecoderAcceleration => '硬件解码加速';

  @override
  String get uiVideoSettingsPagePlatformRecommendation => '平台建议';

  @override
  String get uiVideoSettingsPageHardwareAccelerationDecoding => '硬件加速与解码';

  @override
  String get uiVideoSettingsPageAllPlatforms => '所有平台';

  @override
  String get uiVideoSettingsPageAutoSafeRecommended => '自动兼容（推荐）';

  @override
  String get uiVideoSettingsPageGpuHardwareDecodingWithSafe =>
      '使用 GPU 硬件解码，异常时回退兼容模式，适合大多数设备。';

  @override
  String get uiVideoSettingsPageSoftwareDecodingCrashProof => '软件解码（兼容模式）';

  @override
  String get uiVideoSettingsPagePureCpuDecodingViaFfmpeg =>
      '使用 FFmpeg 进行 CPU 解码，有助于减少旧显卡或虚拟机上的黑屏和驱动异常。';

  @override
  String get uiVideoSettingsPageDirectHardware => '直接硬件解码';

  @override
  String get uiVideoSettingsPageDirectGpuDecodingDirect3d11 =>
      '使用 Direct3D 11 / MediaCodec / VAAPI 直接硬解，适合现代 GPU。';

  @override
  String get uiVideoSettingsPagePlaybackEngine => '播放内核';

  @override
  String get uiVideoSettingsPageTorrentsAndLiveTvAlways => '种子与电视直播始终使用 mpv';

  @override
  String get uiVideoSettingsPageAutoRecoverBlackScreens => '黑屏自动恢复';

  @override
  String get uiVideoSettingsPageActiveWatchdog => '播放异常监控';

  @override
  String get uiVideoSettingsPageAndroidRenderingEngine => 'Android 渲染引擎';

  @override
  String get uiVideoSettingsPageDirectSurfaceSurfaceview => '直接渲染（SurfaceView）';

  @override
  String get uiAppearanceSettingsPageAppearanceInterface => '外观与界面';

  @override
  String get uiAppearanceSettingsPageFineTuneTheVisualAtmosphere =>
      '自定义背景、主题配色与界面布局。';

  @override
  String get uiAppearanceSettingsPageInterfaceAtmosphere => '界面与氛围';

  @override
  String get uiAppearanceSettingsPageCustomBackgroundWallpaper => '自定义背景与壁纸';

  @override
  String get uiAppearanceSettingsPageLiquidGlassSetup => '液态玻璃效果';

  @override
  String get uiAppearanceSettingsPageHomePageUiThemes => '首页与主题';

  @override
  String get uiAppearanceSettingsPageLiveTvSportsUi => '直播与体育界面';

  @override
  String get uiAppearanceSettingsPageContent => '内容';

  @override
  String get uiAppearanceSettingsPageMangaUiReaderAtmosphere => '漫画与阅读界面';

  @override
  String get uiAppearanceSettingsPagePlayback => '播放';

  @override
  String get uiAppearanceSettingsPageAudiobookUiPlayerStudio => '有声书与播放器';

  @override
  String get uiAppearanceSettingsPageMusicUiPlayerStudio => '音乐与播放器';

  @override
  String get uiAppearanceSettingsPageDiagnostics => '诊断';

  @override
  String get uiAppearanceSettingsPageGraphicsBackend => '图形渲染后端';

  @override
  String get uiAppearanceSettingsPageRestartTheAppToApply => '重启应用后生效。';

  @override
  String get uiAboutSettingsPageAboutZplay => '关于 Kiru';

  @override
  String get uiAboutSettingsPageUniversalEntertainmentEcosystem => '一站式影音娱乐平台';

  @override
  String get uiAboutSettingsPageCoreTechnologies => '核心技术';

  @override
  String get uiAboutSettingsPageHighPerformanceVideoEngine => '高性能视频引擎';

  @override
  String get uiAboutSettingsPagePoweredByEmbeddedMediaKitLibmpv =>
      '基于 media_kit / libmpv，支持硬件加速解码。';

  @override
  String get uiAboutSettingsPageCreditsLicence => '致谢与许可证';

  @override
  String get uiAboutSettingsPageIndependentForkMaintainedByTzero86 =>
      '由 tzero86 维护的独立分支';

  @override
  String get uiAboutSettingsPageBasedOnPlaytorrioV3 => '基于 PlayTorrio V3';

  @override
  String get uiAboutSettingsPageOriginalProjectByAymanAyman708Ux =>
      '原项目作者 Ayman (@ayman708-UX)';

  @override
  String get uiAboutSettingsPageThisProductUsesTheTmdbApi =>
      '本产品使用 TMDB API，但未获得 TMDB 的背书或认证。';

  @override
  String get uiAddonsSettingsPageShareYourDebridKey => '是否共享 Debrid 密钥？';

  @override
  String get uiAddonsSettingsPageCancel => '取消';

  @override
  String get uiAddonsSettingsPageContinue => '继续';

  @override
  String get uiAddonsSettingsPageAddStremioAddon => '添加 Stremio 插件';

  @override
  String get uiAddonsSettingsPagePasteTheStremioAddonManifestJson =>
      '粘贴 Stremio 插件的 manifest.json 地址，以添加目录、媒体信息、播放源或字幕。';

  @override
  String get uiAddonsSettingsPageInstall => '安装';

  @override
  String get uiAddonsSettingsPageRemove => '移除';

  @override
  String get uiAddonsSettingsPageRepositoryAddedSuccessfully => '插件仓库已添加';

  @override
  String get uiAddonsSettingsPageInstallRepositoryPlugins => '安装仓库中的插件？';

  @override
  String get uiAddonsSettingsPageBrowseLater => '稍后浏览';

  @override
  String get uiAddonsSettingsPageInstallAllNow => '立即全部安装';

  @override
  String get uiAddonsSettingsPageInstallingPlugins => '正在安装插件';

  @override
  String get uiAddonsSettingsPageAddCloudstreamRepository =>
      '添加 CloudStream 仓库';

  @override
  String get uiAddonsSettingsPageBrowseMarketplace => '浏览插件市场';

  @override
  String get uiAddonsSettingsPageAddRepository => '添加仓库';

  @override
  String get uiAddonsSettingsPageAddonsExtensions => '插件与扩展';

  @override
  String get uiAddonsSettingsPageStremioAddons => 'Stremio 插件';

  @override
  String get uiAddonsSettingsPageAddonsProvideMetadataCatalogsAndStreaming =>
      '插件提供媒体信息、目录和播放源。长按拖动可调整优先级，排在前面的服务优先加载和展示。';

  @override
  String get uiAddonsSettingsPageInstalledProvidersAddons => '已安装的服务与插件';

  @override
  String get uiAddonsSettingsPageNoAddonsInstalled => '尚未安装插件';

  @override
  String get uiAddonsSettingsPageClickAddAddonAboveToInstall =>
      '点击上方添加插件，输入 Stremio manifest 地址。';

  @override
  String get uiAddonsSettingsPageDebridAddons => 'Debrid 插件';

  @override
  String get uiAddonsSettingsPageRepositoryMarketplace => '插件仓库市场';

  @override
  String get uiAddonsSettingsPageBrowseAvailablePlugins => '浏览可用插件';

  @override
  String get uiAddonsSettingsPageInstalledExtensions => '已安装扩展';

  @override
  String get uiAddonsSettingsPageInstalledCloudstreamExtensions =>
      '已安装 CloudStream 扩展';

  @override
  String get uiAddonsSettingsPageNoExtensionsInstalled => '尚未安装扩展';

  @override
  String get uiAddonsSettingsPageClickBrowseAvailablePluginsToFind =>
      '点击浏览可用插件，查找并安装扩展。';

  @override
  String get uiAddonsSettingsPageRepositories => '插件仓库';

  @override
  String get uiAddonsSettingsPageNoCustomRepositoriesAddedClickAdd =>
      '尚未添加自定义仓库，点击添加仓库以订阅。';

  @override
  String get uiAddonsSettingsPageInstallAllPluginsFromThisRepository =>
      '安装仓库中的全部插件';

  @override
  String get uiAddonsSettingsPageBrowseRepositoryPlugins => '浏览仓库插件';

  @override
  String get uiAddonsSettingsPageRemoveRepository => '移除仓库';

  @override
  String get uiAddonsSettingsPageSetupEngine => '配置运行引擎';

  @override
  String get uiAddonsSettingsPageMoveUpInPriority => '提高优先级';

  @override
  String get uiAddonsSettingsPageMoveDownInPriority => '降低优先级';

  @override
  String get uiAddonsSettingsPageRemoveAddon => '移除插件';

  @override
  String get uiAddonsSettingsPageFunctions => '功能';

  @override
  String get uiAddonsSettingsPageCatalogs => '内容目录';

  @override
  String get uiAddonsSettingsPageSearch => '搜索';

  @override
  String get uiAddonsSettingsPageSources => '播放源';

  @override
  String get uiAddonsSettingsPageSubtitles => '字幕';

  @override
  String get uiAddonsSettingsPageDisconnect => '断开连接';

  @override
  String get uiAddonsSettingsPageConnected => '已连接';

  @override
  String get uiBuiltinProvidersSettingsPageBuiltInProviders => '内置播放源';

  @override
  String get uiBuiltinProvidersSettingsPageReset => '重置';

  @override
  String get uiBuiltinProvidersSettingsPageResetProvidersOrder => '重置播放源排序？';

  @override
  String get uiBuiltinProvidersSettingsPageCancel => '取消';

  @override
  String get uiBuiltinProvidersSettingsPageDefaultMode => '默认模式';

  @override
  String get uiBuiltinProvidersSettingsPageCustomMode => '自定义模式';

  @override
  String
  get uiBuiltinProvidersSettingsPageManualProviderOrderTogglesPriorityScraping =>
      '手动排序、启停及查询优先级';

  @override
  String get uiBuiltinProvidersSettingsPageDefault => '默认';

  @override
  String get uiBuiltinProvidersSettingsPageStandardAutoSorting => '自动排序';

  @override
  String get uiBuiltinProvidersSettingsPageCustom => '自定义';

  @override
  String get uiBuiltinProvidersSettingsPageManualOrderToggles => '手动排序与启停';

  @override
  String get uiBuiltinProvidersSettingsPageDefaultModeActive => '当前使用默认模式';

  @override
  String get uiBuiltinProvidersSettingsPageSwitchToCustomMode => '切换为自定义模式';

  @override
  String get uiBuiltinProvidersSettingsPagePriorityScrapeResultSorting =>
      '查询优先级与结果排序';

  @override
  String get uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrc => '搜索播放源…';

  @override
  String get uiBuiltinProvidersSettingsPageEnableAll => '全部启用';

  @override
  String get uiBuiltinProvidersSettingsPageDisableAll => '全部停用';

  @override
  String get uiBuiltinProvidersSettingsPageSearchProvidersEGCinesrcDulo =>
      '搜索播放源…';

  @override
  String get uiBuiltinProvidersSettingsPageClearSearchToDragReorder =>
      '清除搜索后可拖动排序';

  @override
  String get uiBuiltinProvidersSettingsPageOff => '关闭';

  @override
  String get uiBuiltinProvidersSettingsPageMoveUp => '上移';

  @override
  String get uiBuiltinProvidersSettingsPageMoveDown => '下移';

  @override
  String get uiCloudstreamMarketplaceModalLater => '稍后';

  @override
  String get uiCloudstreamMarketplaceModalInstallAllNow => '立即全部安装';

  @override
  String get uiCloudstreamMarketplaceModalInstallingRepositoryPlugins =>
      '正在安装仓库插件';

  @override
  String get uiCloudstreamMarketplaceModalMarketplace => '插件市场';

  @override
  String get uiCloudstreamMarketplaceModalRefreshListFromWeb => '刷新列表';

  @override
  String get uiCloudstreamMarketplaceModalSearchRepositoryOrPluginEG =>
      '搜索仓库或插件…';

  @override
  String get uiCloudstreamMarketplaceModalAdded => '已添加';

  @override
  String get uiCloudstreamMarketplaceModalInstallAllPlugins => '安装全部插件';

  @override
  String get uiCloudstreamMarketplaceModalBrowse => '浏览';

  @override
  String get uiCloudstreamRepoModalAllMatchingPluginsAreAlreadyInstalled =>
      '所有匹配的插件均已安装';

  @override
  String get uiCloudstreamRepoModalCancel => '取消';

  @override
  String get uiCloudstreamRepoModalAvailablePlugins => '可用插件';

  @override
  String get uiCloudstreamRepoModalAvailableCloudstreamPlugins =>
      '可用 CloudStream 插件';

  @override
  String get uiCloudstreamRepoModalSearchPluginsEGSflixSuperstream => '搜索插件…';

  @override
  String get uiCloudstreamRepoModalInstalled => '已安装';

  @override
  String get uiCloudstreamRepoModalUninstall => '卸载';

  @override
  String get uiCloudstreamRepoModalInstall => '安装';

  @override
  String get uiDebridSettingsPageDismiss => '关闭';

  @override
  String get uiDebridSettingsPageDebridCloudStreaming => 'Debrid 与云端播放';

  @override
  String get uiDebridSettingsPageUseDebridForStreams => '使用 Debrid 播放';

  @override
  String get uiDebridSettingsPageRouteTorrentLinksThroughCloudServers =>
      '通过云端服务器处理种子链接';

  @override
  String get uiDebridSettingsPageActiveProvider => '当前服务';

  @override
  String get uiDebridSettingsPageSelectDefaultDebridProvider =>
      '选择默认 Debrid 服务';

  @override
  String get uiDebridSettingsPageZplayWillSendRequestsToThis => '播放时将向此服务发起请求。';

  @override
  String get uiDebridSettingsPageProviderCredentials => '服务凭据';

  @override
  String get uiDebridSettingsPageActive => '已启用';

  @override
  String get uiDebridSettingsPagePasteApiKeyToken => '粘贴 API 密钥或令牌';

  @override
  String get uiDebridSettingsPageClear => '清除';

  @override
  String get uiDebridSettingsPagePasteFromClipboard => '从剪贴板粘贴';

  @override
  String get uiDebridSettingsPageSave => '保存';

  @override
  String get uiServiceKeysSettingsPageDismiss => '关闭';

  @override
  String get uiServiceKeysSettingsPageServiceApiKeys => '服务 API 密钥';

  @override
  String get uiServiceKeysSettingsPageKeysYouCanObtain => '可申请的密钥';

  @override
  String get uiServiceKeysSettingsPageBorrowedCredentials => '外部提供的凭据';

  @override
  String get uiServiceKeysSettingsPageRelated => '相关设置';

  @override
  String get uiServiceKeysSettingsPageSaved => '已保存';

  @override
  String get uiServiceKeysSettingsPagePasteFromClipboard => '从剪贴板粘贴';

  @override
  String get uiServiceKeysSettingsPageSave => '保存';

  @override
  String get uiServiceKeysSettingsPageClearKey => '清除密钥';

  @override
  String get uiServiceKeysSettingsPageTmdbApiKey => 'TMDb API 密钥';

  @override
  String get uiSimklSettingsPageFailedToRequestSimklPinCode =>
      '无法获取 Simkl PIN 码';

  @override
  String get uiSimklSettingsPageSimklSynchronization => 'Simkl 同步';

  @override
  String get uiSimklSettingsPageDisconnect => '断开连接';

  @override
  String get uiSimklSettingsPageConnectSimkl => '连接 Simkl';

  @override
  String get uiSimklSettingsPageEnterThisPinCodeAtSimkl =>
      '请在 simkl.com/pin 输入此 PIN 码：';

  @override
  String get uiSimklSettingsPagePinCopiedToClipboard => 'PIN 码已复制';

  @override
  String get uiSimklSettingsPageOpenSimklComPin => '打开 simkl.com/pin';

  @override
  String get uiSimklSettingsPageWaitingForPinApprovalOnSimkl =>
      '正在等待 Simkl 授权…';

  @override
  String get uiSimklSettingsPageCloudSyncControls => '云端同步';

  @override
  String get uiSimklSettingsPageSyncSimklWatchlistContinueWatching =>
      '同步 Simkl 片单与观看进度';

  @override
  String get uiSimklSettingsPageManuallyTriggersAnImmediatePullFrom =>
      '立即从 Simkl 获取最新数据';

  @override
  String get uiSimklSettingsPageSyncingWithSimkl => '正在同步 Simkl…';

  @override
  String get uiSimklSettingsPageSimklSyncComplete => 'Simkl 同步完成';

  @override
  String get uiTmdbSettingsPageDismiss => '关闭';

  @override
  String get uiTmdbSettingsPageTmdbApiKey => 'TMDb API 密钥';

  @override
  String get uiTmdbSettingsPageTmdbCredential => 'TMDB 凭据';

  @override
  String get uiTmdbSettingsPageCredits => '致谢';

  @override
  String get uiTmdbSettingsPageSaved => '已保存';

  @override
  String get uiTmdbSettingsPagePasteYourTmdbApiKey => '粘贴 TMDb API 密钥';

  @override
  String get uiTmdbSettingsPagePasteFromClipboard => '从剪贴板粘贴';

  @override
  String get uiTmdbSettingsPageSaveAndTest => '保存并测试';

  @override
  String get uiTmdbSettingsPageClearKey => '清除密钥';

  @override
  String get uiTraktSettingsPageTraktTvSynchronization => 'Trakt.tv 同步';

  @override
  String get uiTraktSettingsPageDisconnect => '断开连接';

  @override
  String get uiTraktSettingsPagePairAccount => '关联账户';

  @override
  String get uiTraktSettingsPageEnterThisActivationCodeAtTrakt =>
      '请在 trakt.tv/activate 输入此激活码：';

  @override
  String get uiTraktSettingsPageCodeCopiedToClipboard => '激活码已复制';

  @override
  String get uiTraktSettingsPageOpenTraktTvActivate => '打开 trakt.tv/activate';

  @override
  String get uiTraktSettingsPageWaitingForAuthorizationOnTraktTv =>
      '正在等待 Trakt 授权…';

  @override
  String get uiTraktSettingsPageCloudSyncControls => '云端同步';

  @override
  String get uiTraktSettingsPageSyncWatchlistContinueWatchingNow =>
      '立即同步片单与观看进度';

  @override
  String get uiTraktSettingsPageManuallyTriggersAnImmediatePullFrom =>
      '立即从 Trakt 获取最新数据';

  @override
  String get uiTraktSettingsPageSyncingWithTraktTv => '正在同步 Trakt.tv…';

  @override
  String get uiTraktSettingsPageTraktSyncComplete => 'Trakt 同步完成';

  @override
  String get uiUpdatesSettingsPageZplayIsUpToDate => '当前已是最新版本';

  @override
  String get uiUpdatesSettingsPageAppUpdatesSystem => '应用更新与系统';

  @override
  String get uiUpdatesSettingsPageKeepZplayUpToDateWith => '获取最新功能、安全修复与性能改进。';

  @override
  String get uiUpdatesSettingsPageReleaseChannels => '发布渠道';

  @override
  String get uiUpdatesSettingsPageOfficialStableChannel => '官方稳定版渠道';

  @override
  String
  get uiUpdatesSettingsPageDirectGithubReleaseDistributionWithAutomated =>
      '通过 GitHub 发布版本，并自动校验文件完整性。';

  @override
  String get uiUpdatesSettingsPageSeamlessInAppPatching => '应用内更新';

  @override
  String
  get uiUpdatesSettingsPageDownloadsAndAppliesExecutableUpdatesDirectly =>
      '直接下载并应用更新，无需手动下载安装文件。';

  @override
  String get libraryMyList => '我的片单';

  @override
  String get libraryDownloads => '下载';

  @override
  String get librarySection => '媒体库分类';

  @override
  String get mediaTypeMovie => '电影';

  @override
  String get mediaTypeSeries => '剧集';

  @override
  String get mediaTypeAnime => '动漫';

  @override
  String get mediaTypeOther => '其他';

  @override
  String get aspectFit => '适应屏幕（完整画面）';

  @override
  String get aspectCover => '填满屏幕（裁剪）';

  @override
  String get aspectStretch => '拉伸填满';

  @override
  String get detailsPlayFirst => '播放首部电影';

  @override
  String get detailsPlayEpisodes => '播放剧集';

  @override
  String get detailsPlayMovie => '播放电影';

  @override
  String get detailsCollectionMovies => '合集影片';

  @override
  String get detailsEpisodes => '选集';

  @override
  String get detailsSimilar => '相似影片';

  @override
  String get detailsCast => '主要演员与角色';

  @override
  String get detailsRecommendations => '相关推荐';

  @override
  String detailsSeasonCount(int count) {
    return '共 $count 季';
  }

  @override
  String detailsSeasonLabel(int season) {
    return '第 $season 季';
  }

  @override
  String playerSubtitleSwitched(String title) {
    return '已切换至内嵌字幕：$title';
  }

  @override
  String playerSubtitleDownloading(String language) {
    return '正在下载$language字幕…';
  }

  @override
  String playerSubtitleLoaded(String language, int count) {
    return '$language字幕已加载（$count 条）';
  }

  @override
  String playerSubtitleLoadError(String error) {
    return '无法加载字幕：$error';
  }

  @override
  String playerSourceAttempt(String source, int attempt, int total) {
    return '$source · 第 $attempt/$total 次尝试';
  }

  @override
  String playerDownloadError(String error) {
    return '无法开始下载：$error';
  }

  @override
  String animeTotalEpisodes(int count) {
    return '（共 $count 话）';
  }

  @override
  String animeSearchResultCount(int count) {
    return '$count 个结果';
  }

  @override
  String libraryRemoveTitle(String title) {
    return '将《$title》从片单中移除？';
  }

  @override
  String downloadsSummary(int active, int completed) {
    return '$active 个下载中 · $completed 个已完成';
  }

  @override
  String downloadsFolderPath(String path) {
    return '目录：$path';
  }

  @override
  String downloadsDeleteConfirm(String title) {
    return '确定删除《$title》及其本地文件？';
  }

  @override
  String get auxShellBackGuardPressBackAgainToExit => '再次返回退出应用';

  @override
  String get auxSectionHeaderSeeAll => '查看全部';

  @override
  String get auxTrailerModalTrailerUnavailable => '暂无预告片';

  @override
  String get auxTrailerModalThisTrailerCouldNotBePlayedIn => '无法在应用内播放该预告片。';

  @override
  String get auxTrailerModalWatchOnYoutube => '前往 YouTube 观看';

  @override
  String get auxTrailerModalCloseTrailer => '关闭预告片';

  @override
  String get auxIptvChannelCardHdLive => '高清直播';

  @override
  String get auxIptvHeroCarouselInstantLiveMultiSourceStreamingWithReal =>
      '多源直播，实时解析与高帧率播放。';

  @override
  String get auxIptvHeroCarouselWatchLive => '观看直播';

  @override
  String get auxIptvHeroCarouselStreamFeeds => '直播源';

  @override
  String get auxMultinutzChannelSheetSearchChannels => '搜索频道…';

  @override
  String get auxMultinutzChannelSheetPortals => '服务门户';

  @override
  String get auxMultinutzChannelSheetCopyLoginUrlUserPass =>
      '复制登录信息（地址:用户名:密码）';

  @override
  String get auxMultinutzChannelSheetRemovePortal => '移除服务门户';

  @override
  String get auxMultinutzChannelSheetNoLiveChannelsAvailableForThisPortal =>
      '此服务暂无直播频道';

  @override
  String get auxMultinutzChannelSheetPlaylists => '播放列表';

  @override
  String get auxMultinutzChannelSheetCopyPlaylistUrl => '复制播放列表地址';

  @override
  String get auxMultinutzChannelSheetRemovePlaylist => '移除播放列表';

  @override
  String get auxMultinutzChannelSheetNoChannelsInThisPlaylist => '此播放列表暂无频道';

  @override
  String get auxMangaCategoryDropdownMangaCategories => '漫画分类';

  @override
  String get auxMangaCategoryDropdownFilterCategories => '筛选分类…';

  @override
  String get auxMangaCategoryDropdownNoMatchingCategories => '没有匹配的分类';

  @override
  String get auxMangaCategoryDropdownResetToAllCategories => '重置为全部分类';

  @override
  String get auxMovieSliderSectionCalendar => '日历';

  @override
  String get auxP2PWarningDialogP2pTorrentStreamingNotice => 'P2P 播放须知';

  @override
  String get auxP2PWarningDialogExit => '退出';

  @override
  String get auxP2PWarningDialogWouldYouLikeToTurnOffThe =>
      '是否停用内置 P2P 播放源，仅使用 HTTP 直连播放？';

  @override
  String get auxP2PWarningDialogP2pPeerToPeerTorrentStreamingConnects =>
      'P2P（点对点）播放直接连接公共种子网络，下载并上传视频数据。在部分国家和地区，未加密的种子活动可能受到监控，并可能收到网络服务商的警告或通知。';

  @override
  String get auxP2PWarningDialogZplayhttpDirectStream => 'ZPlayHTTP（直连播放）';

  @override
  String get auxP2PWarningDialogSafeDirectHttpsWebStreamsNoTorrenting =>
      'HTTPS 直连播放，不进行种子传输或点对点上传。';

  @override
  String get auxP2PWarningDialogZplayTorrentEngine => 'ZPlay（种子引擎）';

  @override
  String get auxP2PWarningDialogP2pSwarmsKnabenTorrentgalaxyInvolvesPeerData =>
      'P2P 网络（Knaben、TorrentGalaxy），涉及与其他节点共享数据。';

  @override
  String get auxP2PWarningDialogNoteYouCanEasilyToggleTheBuilt =>
      '可随时在设置中启用或停用内置 P2P 播放源。';

  @override
  String get auxP2PWarningDialogDonTShowAgain => '不再提示';

  @override
  String get auxP2PWarningDialogP2pTorrentSourceTurnedOffZplayhttpWill =>
      '已停用 P2P 播放源，将使用 ZPlayHTTP。';

  @override
  String get auxP2PWarningDialogYesTurnOffP2p => '确认停用 P2P';

  @override
  String get auxPlayerSkipButtonDismiss => '关闭（✕）';

  @override
  String get auxMagnetFilesViewGatheringFileListStreamMetadata =>
      '正在获取文件列表与媒体信息';

  @override
  String get auxMagnetFilesViewFailedToReadMagnet => '无法读取磁力链接';

  @override
  String get auxMagnetFilesViewTryAgain => '重试';

  @override
  String get auxMagnetFilesViewNoFilesMatchFilter => '没有符合条件的文件';

  @override
  String get auxMagnetFilesViewFilterFilesByName => '按文件名筛选…';

  @override
  String get auxMagnetFilesViewNonVideo => '非视频';

  @override
  String get auxTvOnScreenKeyboardSpace => '空格';

  @override
  String get auxUpdateDialogCurrent => '当前版本';

  @override
  String get auxUpdateDialogLatest => '最新版本';

  @override
  String get auxUpdateDialogDownloading => '正在下载…';

  @override
  String get auxUpdateDialogUpdateNow => '立即更新';

  @override
  String get auxUpdateDialogUpdateCouldNotBeVerified => '无法验证更新包';

  @override
  String get auxUpdateDialogOpenReleasePage => '打开发布页面';

  @override
  String get auxUpdateDialogPleaseEnableInstallUnknownAppsPermissionFor =>
      '请在 Android 设置中允许 Kiru 安装未知来源应用。';

  @override
  String get auxUpdateDialogDownloadComplete => '下载完成';

  @override
  String get auxUpdateDialogOpenFolder => '打开文件夹';

  @override
  String get auxAdultPageCouldNotLoad18Sources => '无法加载成人内容播放源';

  @override
  String get auxAdultPageTitlesFromTheAddonsMarked18Or => '来自标记为成人或混合内容的插件。';

  @override
  String get auxWewatchQuizPageRecommendationQuiz => '观影偏好测试';

  @override
  String get auxWewatchQuizPageRetake => '重新测试';

  @override
  String get auxWewatchQuizPageWhatDoYouLikeToWatch => '你喜欢看什么？';

  @override
  String get auxWewatchQuizPageRate3OrMoreMoviesOrTv =>
      '评价至少 3 部电影或剧集，选择喜欢或不喜欢的元素，以获取 AI 推荐。';

  @override
  String get auxWewatchQuizPageAddAnotherTitle => '添加另一部作品';

  @override
  String get auxWewatchQuizPageRemoveThisTitle => '移除此作品';

  @override
  String get auxWewatchQuizPageSearchMovieOrTvSeries => '搜索电影或剧集…';

  @override
  String get auxWewatchQuizPageNeedIdeas => '需要一些灵感？';

  @override
  String get auxWewatchQuizPageHowWasYourExperienceWithIt => '你的观影感受如何？';

  @override
  String get auxWewatchQuizPageWhatStoodOutPickKeyElementsOr =>
      '哪些元素让你印象深刻？（选择标签或填写备注）';

  @override
  String get auxWewatchQuizPageFetchingReasonTags => '正在获取偏好标签…';

  @override
  String get auxWewatchQuizPageAdditionalNotesOrSpecificsOptional =>
      '补充说明（选填）…';

  @override
  String get auxWewatchQuizPageSynthesizingTasteVectorsWithMultiSignalAi =>
      '正在分析观影偏好…';

  @override
  String get auxWewatchQuizPageYourPersonalizedMatches => '为你推荐';

  @override
  String get auxAnimePageAnimeCatalogue => '动漫目录';

  @override
  String get auxAnimePageWatchS1E1 => '播放第 1 季第 1 集';

  @override
  String get auxAnimePageAnilistDetails => 'AniList 详情';

  @override
  String
  get auxAnimeStreamSheetExtractingMegaplayVidwishAllanimeMiruroStreams =>
      '正在查找各服务的播放源…';

  @override
  String get auxAudiobooksPageCustomizeAudiobookSection => '自定义有声书专区';

  @override
  String get auxAudiobooksPagePosterCardDensity => '封面卡片密度';

  @override
  String get auxAudiobooksPageAudiobookPosterCardDensity => '有声书封面密度';

  @override
  String get auxAudiobooksPageFeaturedHeroSpotlightCarousel => '精选推荐轮播';

  @override
  String get auxAudiobooksPageMovingAmbientBackgroundGlow => '动态背景光';

  @override
  String get auxAudiobooksPageShowContinueListeningCarousel => '显示“继续收听”';

  @override
  String get auxAudiobooksPageOpenPlayerStudioThemes => '打开播放器工作室与主题';

  @override
  String get auxAudiobooksPageAudiobookHub => '有声书中心';

  @override
  String get auxAudiobooksPageExploreStreamListenToThousandsOfStories =>
      '探索并收听有声作品';

  @override
  String get auxAudiobooksPageAudiobookGeneratorStudio => '有声书生成器与工作室';

  @override
  String get auxAudiobooksPageAudiobookCustomizer => '有声书自定义设置';

  @override
  String get auxAudiobooksPageSearchAudiobooksByTitleAuthorOrGenre =>
      '按书名、作者或题材搜索有声书…';

  @override
  String get auxAudiobooksPageAudiobookGenres => '有声书题材';

  @override
  String get auxAudiobooksPageScrapingHighQualityAudiobookSources =>
      '正在查找有声书播放源…';

  @override
  String get auxAudiobooksPageCouldNotLoadAudiobooks => '无法加载有声书';

  @override
  String get auxAudiobooksPageNoAudiobooksFoundTryAnotherSearchQuery =>
      '未找到有声书，请尝试其他关键词。';

  @override
  String get auxAudiobooksPageContinueListening => '继续收听';

  @override
  String get auxAudiobooksPageAiAudiobookStudioEpubGenerator =>
      'AI 有声书与 EPUB 生成器';

  @override
  String get auxAudiobooksPageGenerateAudiobooksFromEpubsOrImportYour =>
      '从 EPUB 生成有声书，或导入自己的 MP3/M4B 文件。';

  @override
  String get auxAudiobooksPageOpenStudio => '打开工作室';

  @override
  String get auxAudiobooksPageMyGeneratedUploadedAudiobooks => '我生成和导入的有声书';

  @override
  String get auxAudiobooksPageStudio => '工作室';

  @override
  String get auxAudiobookDetailPageAudiobookDetails => '有声书详情';

  @override
  String get auxAudiobookDetailPageChaptersAudioFiles => '章节与音频文件';

  @override
  String get auxAudiobookDetailPageCouldNotLoadChapters => '无法加载章节';

  @override
  String get auxAudiobookDetailPageNoPlayableChaptersFound => '暂无可播放章节。';

  @override
  String get auxAudiobookDetailPagePlayFirstChapter => '播放第一章';

  @override
  String get auxAudiobookPlayerScreenAudioPlayerStyleStudio => '音频播放器样式与工作室';

  @override
  String get auxAudiobookPlayerScreenSelectPlayerDesignPreset => '选择播放器预设';

  @override
  String get auxAudiobookPlayerScreenAudioPlayerDesignPreset => '音频播放器设计预设';

  @override
  String get auxAudiobookPlayerScreenSeekBarScrubberStyle => '进度条滑块样式';

  @override
  String get auxAudiobookPlayerScreenSeekBarScrubberStyle2 => '进度条滑块样式';

  @override
  String get auxAudiobookPlayerScreenPlayPauseButtonStyle => '播放 / 暂停按钮样式';

  @override
  String get auxAudiobookPlayerScreenPlayPauseButtonStyle2 => '播放 / 暂停按钮样式';

  @override
  String get auxAudiobookPlayerScreenOpenDragDropPlayerStudio => '打开拖拽式播放器工作室';

  @override
  String get auxAudiobookPlayerScreenAutoplay => '自动播放';

  @override
  String get auxAudiobookPlayerScreenCustomizeAudioPlayer => '自定义音频播放器';

  @override
  String get auxAudiobookPlayerScreenChaptersList => '章节列表';

  @override
  String get auxAudiobookPlayerScreenRetryChapter => '重新加载章节';

  @override
  String get auxAudiobookPlayerScreenOpenChaptersPanel => '打开章节面板';

  @override
  String get auxAudiobookPlayerScreenPreviousChapter => '上一章';

  @override
  String get auxAudiobookPlayerScreenRewind10s => '快退 10 秒';

  @override
  String get auxAudiobookPlayerScreenForward10s => '快进 10 秒';

  @override
  String get auxAudiobookPlayerScreenNextChapter => '下一章';

  @override
  String get auxAudiobookPlayerScreenAudiobookChapters => '有声书章节';

  @override
  String get auxAudiobookPlayerScreenFilterChaptersByName => '按章节名称筛选…';

  @override
  String get auxGenerateAudiobookScreenEpubExceeds250kWords => 'EPUB 超过 25 万词';

  @override
  String get auxGenerateAudiobookScreenSplitGenerate => '拆分并生成';

  @override
  String get auxGenerateAudiobookScreenStreamUrlCopiedToClipboard => '播放地址已复制';

  @override
  String get auxGenerateAudiobookScreenRemoveGenerationJob => '移除生成任务？';

  @override
  String get auxGenerateAudiobookScreenAddPersonalAudiobook => '添加个人有声书';

  @override
  String get auxGenerateAudiobookScreenImportToLibrary => '导入媒体库';

  @override
  String get auxGenerateAudiobookScreenAudiobookStudioGenerator => '有声书工作室与生成器';

  @override
  String get auxGenerateAudiobookScreenAudiobookStudioTabs => '有声书工作室分类';

  @override
  String get auxGenerateAudiobookScreenAiEpubGeneratorTts => 'AI EPUB 生成器（TTS）';

  @override
  String get auxGenerateAudiobookScreenMyUploadedAudiobooks => '我导入的有声书';

  @override
  String get auxGenerateAudiobookScreenRefreshStatus => '刷新状态';

  @override
  String get auxGenerateAudiobookScreenNoGeneratedAudiobooksYet => '暂无已生成的有声书';

  @override
  String get auxGenerateAudiobookScreenPickAnEpubAboveToSynthesizeHigh =>
      '选择 EPUB 文件以合成语音旁白。';

  @override
  String get auxGenerateAudiobookScreenAiNarratorVoiceKokoroEngine =>
      'AI 旁白音色（Kokoro 引擎）';

  @override
  String get auxGenerateAudiobookScreenRescanBooks => '重新扫描书籍';

  @override
  String get auxGenerateAudiobookScreenGenerate => '生成';

  @override
  String get auxGenerateAudiobookScreenPickAnyEpubFileFromYourDevice =>
      '选择设备上的 EPUB 文件，超过 25 万词的书籍将自动拆分。';

  @override
  String get auxGenerateAudiobookScreenPlayInApp => '在应用内播放';

  @override
  String get auxGenerateAudiobookScreenUploadPersonalAudiobookFiles =>
      '导入个人有声书文件';

  @override
  String get auxGenerateAudiobookScreenImportYourOwnMp3M4bM4aOr =>
      '导入 MP3、M4B、M4A 或 FLAC 有声书，离线收听。';

  @override
  String get auxGenerateAudiobookScreenNoPersonalAudiobooksAddedYet =>
      '尚未添加个人有声书';

  @override
  String get auxGenerateAudiobookScreenTapTheBannerAboveToImportAudio =>
      '点击上方区域，从设备导入音频文件。';

  @override
  String get auxGenerateAudiobookScreenDeleteAudiobook => '删除有声书？';

  @override
  String get auxBooksPageCouldNotLoadBooks => '无法加载书籍';

  @override
  String get auxBooksPageNoBooksFound => '未找到书籍';

  @override
  String get auxBooksPageTrySearchingForAnotherTitleAuthorOr => '请尝试其他书名、作者或语言';

  @override
  String get auxBooksPageSearchMillionsOfBooksAuthors => '搜索书籍与作者…';

  @override
  String get auxBooksPageFontEngine => '字体引擎：';

  @override
  String get auxBooksPageReaderFontEngine => '阅读器字体引擎';

  @override
  String get auxBooksPageAllFormats => '全部格式';

  @override
  String get auxBooksPageBookFormats => '书籍格式';

  @override
  String get auxBookDetailSheetGenerateAiAudiobookTts => '生成 AI 有声书（TTS）';

  @override
  String get auxBookDetailSheetDeleteDownloadedFile => '删除已下载文件';

  @override
  String get auxBookDetailSheetInformation => '信息';

  @override
  String get auxBookDetailSheetOverview => '简介';

  @override
  String get auxEpubReaderPageBackToLibrary => '返回媒体库';

  @override
  String get auxEpubReaderPageTableOfContentsT => '目录（T）';

  @override
  String get auxEpubReaderPageFocusModeLineByLine => '专注模式（逐行）';

  @override
  String get auxEpubReaderPageAppearanceCustomization => '外观与自定义';

  @override
  String get auxEpubReaderPageToggleFullscreenF => '切换全屏（F）';

  @override
  String get auxEpubReaderPagePreviousChapterLeftArrow => '上一章（←）';

  @override
  String get auxEpubReaderPageNextChapterRightArrow => '下一章（→）';

  @override
  String get auxEpubReaderPageNoReadableChaptersFound => '暂无可阅读章节。';

  @override
  String get auxEpubReaderPageTableOfContents => '目录';

  @override
  String get auxEpubReaderPageNoTableOfContentsAvailable => '暂无目录';

  @override
  String get auxPdfReaderPageZoomIn => '放大';

  @override
  String get auxPdfReaderPageZoomOut => '缩小';

  @override
  String get auxPdfReaderPagePreviousPage => '上一页';

  @override
  String get auxPdfReaderPageNextPage => '下一页';

  @override
  String get auxBrowsePageBrowseVerticals => '内容分类';

  @override
  String get auxTvCalendarPageTvShowsAiringCalendar => '剧集播出日历';

  @override
  String
  get auxTvCalendarPageUpcomingBroadcastStreamingEpisodesWithLiveNetwork =>
      '即将播出的剧集，支持按播出平台筛选';

  @override
  String get auxTvCalendarPageFilterShows => '筛选剧集…';

  @override
  String get auxTvCalendarPageNetwork => '播出平台：';

  @override
  String get auxTvCalendarPageShowAllNetworks => '全部播出平台';

  @override
  String get auxCatalogPageNoItemsFound => '暂无内容';

  @override
  String get auxCatalogPageSearch => '搜索…';

  @override
  String get auxCollectionsPageFranchises => '系列电影';

  @override
  String get auxCollectionsPageMemoryLane => '怀旧经典';

  @override
  String get auxCollectionsPageCuratedFranchisesEras => '精选系列与年代';

  @override
  String get auxCollectionsPageHandPickedFilmPacksInWatchOrder =>
      '精选影视合集，按观看顺序排列。';

  @override
  String get auxIptvChannelSheetStop => '停止';

  @override
  String get auxIptvChannelSheetScanningAllVerifiedPortalsInParallel =>
      '正在并行检查服务…';

  @override
  String get auxIptvChannelSheetNoAliveStreamsDiscoveredYet => '暂未发现可用直播源。';

  @override
  String get auxIptvChannelSheetTapScanMorePortalsToDiscoverFresh =>
      '点击“查找更多”获取新的直播源。';

  @override
  String get auxIptvChannelSheetClearSearch => '清除搜索';

  @override
  String get auxIptvChannelSheetScanMore => '查找更多';

  @override
  String get auxIptvPageChannelListAndProgrammeSchedule => '频道列表与节目单';

  @override
  String get auxIptvPageMultiStreamsMultiViewWindow => '多路直播（多画面）';

  @override
  String get auxIptvPageMultiStreams => '多路直播';

  @override
  String get auxIptvPageManagePortalsPlaylists => '管理服务与播放列表';

  @override
  String get auxIptvPageSearchChannels => '搜索频道';

  @override
  String get auxIptvPageQuickChannels => '快捷频道';

  @override
  String get auxIptvPageAddQuickChannel => '添加快捷频道';

  @override
  String get auxIptvPageAddChannel => '添加频道';

  @override
  String get auxIptvPageEGCnnNewsInternational => '例如 cnn、news、international';

  @override
  String get auxIptvPageGradient => '渐变';

  @override
  String get auxIptvPortalsModalPortalDisplaySettings => '服务门户显示设置';

  @override
  String get auxIptvPortalsModalChoosePortalSource => '选择服务门户来源';

  @override
  String get auxIptvPortalsModalCloudVault => '云端资料库';

  @override
  String get auxIptvPortalsModalHighSpeedCloudDatabaseWithLiveIptv =>
      '提供 IPTV 服务信息的云端数据库';

  @override
  String get auxIptvPortalsModalRedditCommunities => 'Reddit 社区';

  @override
  String get auxIptvPortalsModalScrapesLiveSharedPastesFromSubreddits =>
      '查询社区公开分享的信息';

  @override
  String get auxIptvPortalsModalDeleteAll => '全部删除';

  @override
  String get auxIptvPortalsModalAddXtreamCodesPortal => '添加 Xtream Codes 服务';

  @override
  String get auxIptvPortalsModalVerifySave => '验证并保存';

  @override
  String get auxIptvPortalsModalAddM3uPlaylistSubscription => '添加 M3U 播放列表订阅';

  @override
  String get auxIptvPortalsModalFetchSave => '获取并保存';

  @override
  String get auxIptvPortalsModalNoM3uPlaylistsSaved => '尚未保存 M3U 播放列表。';

  @override
  String get auxIptvPortalBrowserPageCustomizePortalBrowser => '自定义服务浏览器';

  @override
  String get auxIptvPortalBrowserPageChannelStreamLayoutMode => '频道布局模式';

  @override
  String get auxIptvPortalBrowserPageGridStreamColumns => '网格列数';

  @override
  String get auxIptvPortalBrowserPageShowChannelStreamLogos => '显示频道标志';

  @override
  String get auxIptvPortalBrowserPageShowEpgNowPlayingSnippet => '显示 EPG 当前节目';

  @override
  String get auxIptvPortalBrowserPageShowCategoryStreamCounts => '显示分类频道数量';

  @override
  String get auxIptvPortalBrowserPageSelectCategory => '选择分类';

  @override
  String get auxIptvPortalBrowserPageCustomizePortalBrowserLayout =>
      '自定义服务浏览器布局';

  @override
  String get auxIptvPortalBrowserPageCheckHealth => '检测可用性';

  @override
  String get auxIptvPortalBrowserPageCustomize => '自定义';

  @override
  String get auxIptvPortalBrowserPageCouldNotLoadThisPortal => '无法加载此服务';

  @override
  String get auxIptvPortalBrowserPageNoFavoritedChannels => '暂无收藏频道';

  @override
  String get auxIptvPortalBrowserPageTapTheStarIconOnAnyChannel =>
      '点击频道的星标即可收藏。';

  @override
  String get auxIptvPortalBrowserPageLiveStreamFeed => '直播源';

  @override
  String get auxIptvPortalBrowserPageCouldNotLoadEpisodes => '无法加载剧集';

  @override
  String get auxIptvSearchPageSearch60LiveChannelsLeaguesNetworks =>
      '搜索直播频道、赛事与播出平台…';

  @override
  String get auxIptvSearchPageChannelCategories => '频道分类';

  @override
  String get auxIptvSearchPageNoChannelsMatchYourSearch => '没有符合搜索条件的频道。';

  @override
  String get auxMangaDetailsPageSynopsis => '简介';

  @override
  String get auxMangaDetailsPageChapters => '章节';

  @override
  String get auxMangaDetailsPageSearchChapters => '搜索章节…';

  @override
  String get auxMangaDetailsPageStartReading => '开始阅读';

  @override
  String get auxMangaPageCustomizeMangaSection => '自定义漫画专区';

  @override
  String get auxMangaPageMangaPosterCardDensity => '漫画封面卡片密度';

  @override
  String get auxMangaPageShowContinueReadingSlider => '显示“继续阅读”';

  @override
  String get auxMangaPageShowContentTypeBadgeOnPosters => '显示内容类型标签';

  @override
  String get auxMangaPageMoreAppearanceReaderSettings => '更多外观与阅读设置';

  @override
  String get auxMangaPageContinueReading => '继续阅读';

  @override
  String get auxMangaPageNoMangaFound => '未找到漫画';

  @override
  String get auxMangaPageSearchMangaManhwaManhua => '搜索日漫、韩漫、国漫…';

  @override
  String get auxMangaPageRemoveFromContinueReading => '从继续阅读中移除';

  @override
  String get auxMangaReaderPageReaderSettingsLayout => '阅读器设置与布局';

  @override
  String get auxMangaReaderPageReadingOrientationMode => '阅读方向';

  @override
  String get auxMangaReaderPageReadingOrientationMode2 => '阅读方向';

  @override
  String get auxMangaReaderPagePageReadingWidthConstraint => '页面宽度限制';

  @override
  String get auxMangaReaderPagePageReadingWidthConstraint2 => '页面宽度限制';

  @override
  String get auxMangaReaderPageReaderBackgroundAtmosphere => '阅读背景氛围';

  @override
  String get auxMangaReaderPageShowPageDeckPreviewsDrawer => '显示页面预览抽屉';

  @override
  String get auxMangaReaderPageShowNextChapterDeckCard => '显示下一章预览卡片';

  @override
  String get auxMangaReaderPageNoPagesFoundForThisChapter => '本章暂无可阅读页面。';

  @override
  String get auxMangaReaderPageReadNextChapter => '阅读下一章';

  @override
  String get auxMangaReaderPageBackToMangaDetails => '返回漫画详情';

  @override
  String get auxMangaReaderPagePageDeckPreview => '页面预览';

  @override
  String get auxMultinutzPageSelectChannel => '选择频道';

  @override
  String get auxMultinutzPageStreamDetails => '直播源详情';

  @override
  String get auxMultinutzPageAddLiveStreamFeed => '添加直播源';

  @override
  String get auxMultinutzPageBackToLiveTv => '返回电视直播';

  @override
  String get auxMultinutzPagePreviousLayout => '上一种布局';

  @override
  String get auxMultinutzPageNextLayout => '下一种布局';

  @override
  String get auxMultinutzPageMuteAll => '全部静音';

  @override
  String get auxMultinutzPageClearAllWindows => '清除所有窗口';

  @override
  String get auxMusicPageNewPlaylist => '新建播放列表';

  @override
  String get auxMusicPageEnterPlaylistTitle => '输入播放列表名称…';

  @override
  String get auxMusicPageCreate => '创建';

  @override
  String get auxMusicPageSaveToPlaylist => '保存至播放列表';

  @override
  String get auxMusicPageNoCustomPlaylistsYet => '暂无自定义播放列表';

  @override
  String get auxMusicPageCreateFirstPlaylist => '创建第一个播放列表';

  @override
  String get auxMusicPageNewAlbumReleases => '新专辑';

  @override
  String get auxMusicPageCuratedChartsMixes => '精选榜单与歌单';

  @override
  String get auxMusicPageSearchResults => '搜索结果';

  @override
  String get auxMusicPageSongs => '歌曲';

  @override
  String get auxMusicPageArtists => '艺人';

  @override
  String get auxMusicPageAlbums => '专辑';

  @override
  String get auxMusicPageBrowseMoodsGenres => '按心情与曲风浏览';

  @override
  String get auxMusicPageRadioStationsLiveStreams => '电台与直播';

  @override
  String get auxMusicPageContinuousMusicChannelsTunedToYourMood =>
      '持续播放的音乐频道，适合不同心情。';

  @override
  String get auxMusicPageYourLibrary => '我的音乐库';

  @override
  String get auxMusicPageLikedSongs => '喜欢的歌曲';

  @override
  String get auxMusicPageDownloadedSongs => '已下载歌曲';

  @override
  String get auxMusicPageCustomPlaylists => '自定义播放列表';

  @override
  String get auxMusicPageRecentlyPlayed => '最近播放';

  @override
  String get auxMusicPageMusicPlayerStudio => '音乐播放器工作室';

  @override
  String get auxMusicPageMusicAtmosphereSettings => '音乐氛围设置';

  @override
  String get auxMusicPageAppSettings => '应用设置';

  @override
  String get auxMusicPageMusicView => '音乐视图';

  @override
  String get auxMusicPageAudioSourceQuality => '音频来源与音质';

  @override
  String get auxMusicPageChooseYourPreferredMusicExtractionEngine =>
      '选择首选音频解析引擎';

  @override
  String get auxMusicPageFlacLosslessQobuzHiRes => 'FLAC 无损（Qobuz Hi-Res）';

  @override
  String get auxMusicPageStudioMasterQualityUpTo24Bit =>
      '最高 24-bit/192kHz 无损音质';

  @override
  String get auxMusicPageYoutubeAudio => 'YouTube 音频';

  @override
  String get auxMusicPageHighSpeedAudioExtractionWithIntelligentTrack =>
      '音频解析与曲目时长匹配';

  @override
  String get auxMusicPagePlayNow => '立即播放';

  @override
  String get auxMusicPageTrendingArtists => '热门艺人';

  @override
  String get auxMusicPageDownloadedOffline => '已下载（离线）';

  @override
  String get auxMusicPageQueuedForDownload => '已加入下载队列';

  @override
  String get auxMusicPageDownloadTrack => '下载歌曲';

  @override
  String get auxMusicPageSyncedLyrics => '同步歌词';

  @override
  String get auxMusicPageNoLyricsFoundForThisTrack => '该歌曲暂无歌词。';

  @override
  String get auxMusicPageQueueIsEmpty => '播放队列为空';

  @override
  String get auxMusicPagePlayAll => '全部播放';

  @override
  String get auxMusicPageTopSongs => '热门歌曲';

  @override
  String get auxMusicPageAlbumsDiscography => '专辑与作品目录';

  @override
  String get auxMusicPagePlayAlbum => '播放专辑';

  @override
  String get auxMusicPageDownloadAlbum => '下载专辑';

  @override
  String get auxMusicPagePlayPlaylist => '播放歌单';

  @override
  String get auxMusicPageDownloadPlaylist => '下载歌单';

  @override
  String get auxMusicPageDownloadAll => '全部下载';

  @override
  String get auxMusicPageNoTracksInThisPlaylistYet => '此歌单暂无歌曲';

  @override
  String get auxMusicPagePlayingQueue => '播放队列';

  @override
  String get auxMusicPageKeyboardShortcuts => '键盘快捷键';

  @override
  String get auxMusicPageShuffle => '随机播放';

  @override
  String get auxMusicPageSearchOffline => '搜索离线内容…';

  @override
  String get auxMusicPageDeleteFromDownloads => '从下载中删除';

  @override
  String get auxMusicPageDeleteDownloadedSong => '删除已下载歌曲';

  @override
  String get auxAboutSettingsPageZplayIsAnAllInOneEntertainment =>
      'Kiru 是综合影音客户端，集合电影、剧集、动漫、电视直播、音乐、漫画和有声书，并提供统一的界面与播放体验。';

  @override
  String get auxAboutSettingsPageDebridMultiSourceScrapers => 'Debrid 与多源解析';

  @override
  String get auxAboutSettingsPageDirectHighSpeedCloudPlaybackViaReal =>
      '支持通过 Real-Debrid、TorBox 与 Stremio 插件播放。';

  @override
  String get auxAboutSettingsPageLiquidGlassGlslShaders => '液态玻璃 GLSL 着色器';

  @override
  String get auxAboutSettingsPageCustomRealTimeOpticalRefractionLensesAnd =>
      '自定义实时折射、透镜与流体效果。';

  @override
  String get auxAboutSettingsPageTraktCloudSynchronization => 'Trakt 与云端同步';

  @override
  String
  get auxAboutSettingsPageCrossPlatformWatchlistEpisodeTrackingAndPlayback =>
      '跨平台同步片单、剧集进度与播放记录。';

  @override
  String get auxAboutSettingsPagePoppinsIsBundledUnderTheSilOpen =>
      'Poppins 字体采用 SIL Open Font License 1.1。';

  @override
  String get auxAddonsSettingsPageItsCatalogsAndMetadataWillBeRemoved =>
      '该插件的目录与媒体信息将从首页移除。';

  @override
  String get auxAddonsSettingsPageWouldYouLikeToInstallAllPlugins =>
      '是否安装此仓库中的所有插件，使其播放源立即可用？';

  @override
  String
  get auxAddonsSettingsPagePasteTheRepositoryUrlSupportsCloudstreamrepoRepo =>
      '粘贴仓库地址（支持 cloudstreamrepo://、repo.json 或 plugins.json）。';

  @override
  String get auxAddonsSettingsPageThisCloudstreamExtensionWillBeUninstalled =>
      '此 CloudStream 扩展将被卸载。';

  @override
  String get auxAddonsSettingsPagePluginsFromThisRepositoryWillNotBe =>
      '已安装的插件不会被删除，但不再获取此仓库的更新。';

  @override
  String get auxAddonsSettingsPageInstallsTheAddonForTheDebridProvider =>
      '安装所选 Debrid 服务的插件，并在请求时填入已保存的密钥，避免重复存储。';

  @override
  String
  get auxAddonsSettingsPageCloudstreamCs3ExtensionsProvideStreamProvidersDirectly =>
      'CloudStream（.cs3）扩展提供播放源适配，在本地隔离进程或原生 ART 引擎中运行。';

  @override
  String get auxAddonsSettingsPage45Repos => '45+ 个仓库';

  @override
  String get auxAddonsSettingsPageBrowseCuratedTurkish3rabiEnglishHindiGlobal =>
      '浏览精选土耳其语、阿拉伯语、英语、印地语及全球仓库。';

  @override
  String get auxAddonsSettingsPageSetUpADebridProviderInSettings =>
      '请先在设置中配置 Debrid 服务，再返回连接。';

  @override
  String
  get auxAppearanceSettingsPageUploadCustomPhotosChooseCuratedDarkWallpapers =>
      '上传照片、选择深色壁纸并融合主题光效';

  @override
  String
  get auxAppearanceSettingsPageAdjustHoverImpactWobbleSpringPhysicsLens =>
      '调整悬停、弹性、透镜折射与色差';

  @override
  String get auxAppearanceSettingsPageColorSchemesBecauseYouHaveOnYour =>
      '配色、基于片单的推荐、精选横幅与卡片密度';

  @override
  String
  get auxAppearanceSettingsPageBroadcastHeroSpotlightChannelCardDensityCategory =>
      '直播精选、频道密度、分类顺序与标签样式';

  @override
  String
  get auxAppearanceSettingsPageAmbientMovingLightingCardDensityReadingLayout =>
      '动态光效、卡片密度、阅读宽度、阅读模式与页面预览';

  @override
  String get auxAppearanceSettingsPageHeroSpotlight5DistinctPlayerDesignsDrag =>
      '精选推荐、播放器预设、拖拽式布局、波形进度条与自定义控件';

  @override
  String
  get auxAppearanceSettingsPageHeroSpotlightLosslessBadgesAndFullscreenPlayer =>
      '精选推荐、无损标签、全屏播放器布局、进度条与唱盘样式';

  @override
  String
  get auxBuiltinProvidersSettingsPageThisWillRestoreAll45ZplayhttpProviders =>
      '将恢复全部内置播放源的默认排序，并重新启用已停用的服务。';

  @override
  String
  get auxBuiltinProvidersSettingsPageStandardAutoSortingAcrossAll45Providers =>
      '全部内置播放源自动排序';

  @override
  String get auxBuiltinProvidersSettingsPageInDefaultModeZplayUsesItsNative =>
      '默认模式下，多源并行查询，并按视频分辨率（4K、1080p、720p）及文件大小排序。';

  @override
  String get auxBuiltinProvidersSettingsPageProvidersAtTheTopScrapeFirstAnd =>
      '排在前面的服务优先查询和展示，不受文件大小或画质排序影响。';

  @override
  String
  get auxDebridSettingsPageStreamTorrentsAndMagnetLinksInstantlyThrough =>
      '通过 Debrid 云端服务处理种子与磁力链接，无需本地点对点下载。';

  @override
  String get auxDebridSettingsPageWhenEnabledAllTorrentsFromZplayAnd =>
      '启用后，Kiru 和 Stremio 插件的种子链接仅通过当前 Debrid 服务解析，不使用本地种子引擎。';

  @override
  String get auxServiceKeysSettingsPageRanksThe1990sRailsAndCoversThe =>
      '用于 90 年代电影推荐排序及媒体信息查询。';

  @override
  String get auxSimklSettingsPageConnectYourSimklAccountToSynchronizeMovies =>
      '关联 Simkl 账户，同步电影、剧集、动漫片单及观看进度。';

  @override
  String get auxTraktSettingsPageConnectYourTraktTvAccountToSeamlessly =>
      '关联 Trakt.tv 账户，跨设备同步观看历史、片单、观看进度及评分。';

  @override
  String get auxVideoSettingsPageAndroidSExoplayerFastestAt4k =>
      'Android ExoPlayer（4K 播放优化）';

  @override
  String get auxVideoSettingsPageMpvFullSubtitleControl => 'mpv（完整字幕控制）';

  @override
  String
  get auxVideoSettingsPageUsesFlutterSurfaceproducerToRenderFramesDirectly =>
      '通过 Flutter SurfaceProducer 直接渲染至硬件表面，减少纹理复制，有助于改善 Android 4K/60fps 播放及功耗。如出现画面异常，请关闭。';

  @override
  String get auxAudiobookPlayerStudioPagePlayerStudio => '播放器工作室';

  @override
  String get auxAudiobookPlayerStudioPageCustomAudiobookPlayerStudio =>
      '自定义有声书播放器工作室';

  @override
  String
  get auxAudiobookPlayerStudioPageDragComponentsTransformSeekbarsCustomizeButtonPhysics =>
      '拖动组件，自定义进度条及按钮反馈';

  @override
  String get auxAudiobookPlayerStudioPageApplyAsActivePlayer => '应用为当前播放器';

  @override
  String get auxAudiobookPlayerStudioPageCustomPlayerStudioLayoutAppliedSetAs =>
      '自定义播放器布局已启用';

  @override
  String get auxAudiobookPlayerStudioPageStudioDesigner => '布局设计';

  @override
  String get auxAudiobookPlayerStudioPageLivePreviewCanvas => '实时预览';

  @override
  String get auxAudiobookPlayerStudioPageTestLiveCanvas => '交互预览';

  @override
  String get auxAudiobookPlayerStudioPageBackToCustomizer => '返回自定义设置';

  @override
  String get auxAudiobookPlayerStudioPageLiveInteractiveCanvas => '实时交互预览';

  @override
  String get auxAudiobookPlayerStudioPageCustomStudio => '自定义工作室';

  @override
  String get auxAudiobookPlayerStudioPagePremadeChaptersPanel => '预设章节面板';

  @override
  String get auxAudiobookPlayerStudioPagePremadeChaptersPanelPreview =>
      '预设章节面板预览';

  @override
  String get auxAudiobookPlayerStudioPageDragDropComponentArranger => '拖拽式组件布局';

  @override
  String get auxAudiobookPlayerStudioPageHoldAndDragAnyBlockToReorder =>
      '长按拖动组件，实时调整音频播放器布局顺序。';

  @override
  String get auxAudiobookPlayerStudioPageSeekBarCanvasScrubberStyles =>
      '进度条与滑块样式';

  @override
  String get auxAudiobookPlayerStudioPageSelectHowYourProgressBarAndScrubber =>
      '选择自定义播放器中的进度条与滑块样式。';

  @override
  String get auxAudiobookPlayerStudioPageHoverTouchPhysics => '悬停与触控反馈';

  @override
  String get auxAudiobookPlayerStudioPageLiveTouchHoverPhysicsPlayground =>
      '触控与悬停反馈预览';

  @override
  String get auxAudiobookPlayerStudioPageArtworkDisplayMode => '封面显示模式';

  @override
  String get auxAudiobookSettingsPageEnableMovingAmbientAtmosphere =>
      '启用动态背景氛围';

  @override
  String get auxAudiobookSettingsPageLightingFlowPattern => '光效流动模式';

  @override
  String get auxAudiobookSettingsPageGlowStrengthOpacity => '光效强度 / 不透明度';

  @override
  String get auxAudiobookSettingsPageMotionDriftSpeed => '动态流动速度';

  @override
  String get auxAudiobookSettingsPageLiveAtmospherePreview => '氛围实时预览';

  @override
  String get auxAudiobookSettingsPageShowHeroSpotlightCarousel => '显示精选轮播';

  @override
  String
  get auxAudiobookSettingsPageFeaturedBestsellingAudiobookShowcaseAtTheTop =>
      '在有声书首页顶部展示精选作品';

  @override
  String get auxAudiobookSettingsPageQuickResumeCardsWithChapterProgressBar =>
      '显示章节进度与快捷继续收听卡片';

  @override
  String get auxAudiobookSettingsPageAudiobookPosterCardDensity => '有声书封面卡片密度';

  @override
  String get auxAudiobookSettingsPageShowQuickGenreCategoryBadges =>
      '显示题材与分类标签';

  @override
  String get auxAudiobookSettingsPageShowAudiobookRuntimeTotalDuration =>
      '显示有声书总时长';

  @override
  String get auxAudiobookSettingsPagePosterCardHoverGlowElevation =>
      '封面悬停光效与抬升';

  @override
  String get auxAudiobookSettingsPageVisualCustomPlayerStudio => '可视化播放器工作室';

  @override
  String get auxAudiobookSettingsPageFullStudio => '完整工作室';

  @override
  String
  get auxAudiobookSettingsPageDragDropLayoutElementsProceduralWaveformCanvases =>
      '实时拖拽调整布局、波形、液态玻璃按钮及章节面板。';

  @override
  String get auxAudiobookSettingsPageEnterCustomPlayerStudio => '进入自定义播放器工作室';

  @override
  String get auxAudiobookSettingsPageInteractiveStudioPreview => '工作室交互预览';

  @override
  String get auxAudiobookSettingsPageSeekBarScrubberStyle => '进度条 / 滑块样式';

  @override
  String get auxAudiobookSettingsPagePlayPauseButtonStyling => '播放 / 暂停按钮样式';

  @override
  String get auxAudiobookSettingsPageArtworkDisplayStyle => '封面显示样式';

  @override
  String get auxAudiobookSettingsPageButtonHoverTouchPhysics => '按钮悬停与触控反馈';

  @override
  String get auxAudiobookSettingsPagePlayerLayoutComponentsDragToArrange =>
      '播放器布局组件（拖动排序）';

  @override
  String get auxAudiobookSettingsPageHoldAndDragAnyBlockToReorder =>
      '长按拖动组件，调整播放器控件顺序';

  @override
  String get auxAudiobookSettingsPageLiquidGlassPlayerBlurRefraction =>
      '液态玻璃模糊与折射';

  @override
  String get auxAudiobookSettingsPageShowPlaybackSpeedSelector05x2 =>
      '显示倍速选择（0.5×–2.5×）';

  @override
  String get auxAudiobookSettingsPageShowSkipForwardRewindButtons10s =>
      '显示快进 / 快退按钮（±10 秒）';

  @override
  String get auxAudiobookSettingsPageShowQuickChaptersSlidingDrawerButton =>
      '显示章节快捷抽屉按钮';

  @override
  String get auxAudiobookSettingsPageLaunchFullCustomPlayerStudio =>
      '打开完整播放器工作室';

  @override
  String get auxCustomBackgroundSettingsPageUploadYourOwnPhotoOrChooseA =>
      '上传照片或选择精选壁纸，融合主题配色与动态光效。';

  @override
  String get auxCustomBackgroundSettingsPageResetToDefaultBackground =>
      '恢复默认背景';

  @override
  String get auxCustomBackgroundSettingsPageOrPasteImageUrlHttps =>
      '或粘贴图片地址（https://…）';

  @override
  String get auxCustomBackgroundSettingsPageCuratedDarkWallpapers => '精选深色壁纸';

  @override
  String get auxCustomBackgroundSettingsPageWallpaperLightBlendingControls =>
      '壁纸与光效融合';

  @override
  String get auxCustomBackgroundSettingsPagePhotoVisibilityDarkness =>
      '照片可见度 / 暗度';

  @override
  String get auxCustomBackgroundSettingsPagePhotoSoftBlur => '照片柔化模糊';

  @override
  String get auxCustomBackgroundSettingsPageThemeColorTintOverlay => '主题色叠加';

  @override
  String get auxCustomBackgroundSettingsPageBlendMovingAmbientLights =>
      '融合动态氛围光';

  @override
  String
  get auxCustomBackgroundSettingsPageSoftlyIlluminatesAndAnimatesThemeLightsOver =>
      '在壁纸上叠加柔和的动态主题光效';

  @override
  String get auxHomeUiSettingsPageColorThemesAccents => '主题与强调色';

  @override
  String get auxHomeUiSettingsPageAmbientBackgroundLightingMovingGlows =>
      '动态背景光效';

  @override
  String get auxHomeUiSettingsPageCustomBackgroundWallpaper => '自定义背景与壁纸';

  @override
  String get auxHomeUiSettingsPageCustomWallpaperLightingBlend => '自定义壁纸与光效融合';

  @override
  String get auxHomeUiSettingsPageSmartRecommendationsBecauseYouHaveOnYour =>
      '智能推荐（根据你的片单）';

  @override
  String get auxHomeUiSettingsPageCuratedCollections => '精选合集';

  @override
  String get auxHomeUiSettingsPageHeroBannerSpotlight => '精选横幅与轮播';

  @override
  String get auxHomeUiSettingsPagePosterCardsDensity => '海报卡片与密度';

  @override
  String get auxHomeUiSettingsPageHeaderShortcutsButtons => '顶部快捷入口';

  @override
  String get auxHomeUiSettingsPageLiveLightingEnginePreview => '光效引擎实时预览';

  @override
  String get auxHomeUiSettingsPageMovingAmbientLightsGlows => '动态氛围光效';

  @override
  String get auxHomeUiSettingsPageDriftingFadedLightWavesFloatingColorOrbs =>
      '背景中的柔和流光与浮动色彩';

  @override
  String get auxHomeUiSettingsPageLightingPatternPosition => '光效样式与位置';

  @override
  String get auxHomeUiSettingsPageGlowStrengthIntensity => '光效强度';

  @override
  String get auxHomeUiSettingsPageMotionFlowSpeed => '流动速度';

  @override
  String get auxHomeUiSettingsPageSmartRecommendations => '智能推荐';

  @override
  String
  get auxHomeUiSettingsPageConfigurePersonalizedAlgorithmicRecommendationSliders =>
      '配置个性化推荐栏目';

  @override
  String get auxHomeUiSettingsPageBecauseYouHaveMyList => '因为你收藏了…（片单）';

  @override
  String
  get auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnTitlesSavedIn =>
      '根据片单中的作品推荐相似内容';

  @override
  String
  get auxHomeUiSettingsPageBestsimilarRecommendationsBasedOnActiveContinueWatching =>
      '根据正在观看的作品推荐相似内容';

  @override
  String get auxHomeUiSettingsPageHideRailsWithNoArtwork => '隐藏缺少封面的栏目';

  @override
  String get auxHomeUiSettingsPageTraktRecommendations => 'Trakt 推荐';

  @override
  String get auxHomeUiSettingsPageSimklRecommendations => 'Simkl 推荐';

  @override
  String get auxHomeUiSettingsPageRecommendationSlidersPositionOnHomePage =>
      '首页推荐栏目位置';

  @override
  String get auxHomeUiSettingsPageShowCuratedCollectionRailsOnTheHome =>
      '在首页展示精选合集';

  @override
  String get auxHomeUiSettingsPageShowHeroSpotlightBanner => '显示精选推荐横幅';

  @override
  String get auxHomeUiSettingsPageFeaturedRotationBannerAtTheTopOf =>
      '首页顶部的精选轮播横幅';

  @override
  String get auxHomeUiSettingsPageSpotlightStyle => '精选横幅样式';

  @override
  String get auxHomeUiSettingsPageAutoRotateSpotlight => '自动轮播精选';

  @override
  String get auxHomeUiSettingsPageCyclesThroughFeaturedTitlesAutomatically =>
      '自动切换精选作品';

  @override
  String get auxHomeUiSettingsPageAmbientBackdropLighting => '背景氛围光';

  @override
  String get auxHomeUiSettingsPageSoftDiffusedColorGlowBehindActiveHero =>
      '在精选海报后方显示柔和光效';

  @override
  String get auxHomeUiSettingsPagePosterSizeGridDensity => '海报尺寸与网格密度';

  @override
  String get auxHomeUiSettingsPageShowImdbRatingBadges => '显示 IMDb 评分标签';

  @override
  String get auxHomeUiSettingsPageDisplayRatingStarPillOnPosterCorners =>
      '在海报角落显示评分';

  @override
  String get auxHomeUiSettingsPagePosterHoverZoomScale => '海报悬停缩放比例';

  @override
  String get auxHomeUiSettingsPageShowTvCalendarButtonsOnHomeBar =>
      '在首页导航及栏目显示剧集日历入口';

  @override
  String get auxHomeUiSettingsPageAiRecommendationQuiz => 'AI 观影偏好测试';

  @override
  String get auxHomeUiSettingsPageShowAiQuizButtonOnHomeSearch =>
      '在首页与搜索页显示 AI 偏好入口';

  @override
  String get auxLiquidGlassSettingsPageLiquidGlassSettingsResetToDefaults =>
      '已恢复液态玻璃默认设置。';

  @override
  String get auxLiquidGlassSettingsPageEnableLiquidGlass => '启用液态玻璃';

  @override
  String
  get auxLiquidGlassSettingsPageRealTimeRefractionShadersJellySpringsAnd =>
      '实时折射着色器、弹性反馈与透镜效果';

  @override
  String get auxLiquidGlassSettingsPagePresets => '预设';

  @override
  String get auxLiquidGlassSettingsPagePhysicsOpticalParameters => '物理与光学参数';

  @override
  String get auxLiquidGlassSettingsPageHoverScaleImpact => '悬停缩放幅度';

  @override
  String
  get auxLiquidGlassSettingsPageMagnificationAmountAppliedToThePlayerGlass =>
      '控制悬停时玻璃控件的放大比例';

  @override
  String get auxLiquidGlassSettingsPageWobbleFluidElasticity => '摆动与流体弹性';

  @override
  String
  get auxLiquidGlassSettingsPageSpringBounceIntensityAndDeformationResponsiveness =>
      '控制回弹强度与形变响应';

  @override
  String get auxLiquidGlassSettingsPageOpticalRefractionIndex => '光学折射率';

  @override
  String
  get auxLiquidGlassSettingsPageLightBendingAndBackgroundWarpIndexInside =>
      '控制玻璃透镜内的光线弯曲与背景形变';

  @override
  String get auxLiquidGlassSettingsPageLensMagnification => '透镜放大倍率';

  @override
  String
  get auxLiquidGlassSettingsPageUnderlyingZoomFactorSeenThroughTheGlass =>
      '透过玻璃时背景的放大倍率';

  @override
  String get auxLiquidGlassSettingsPageChromaticAberrationPrismSplit =>
      '色差（棱镜分色）';

  @override
  String
  get auxLiquidGlassSettingsPageSeparatesRgbSpectrumColorsAlongOpticalGlass =>
      '在玻璃边缘分离 RGB 色彩';

  @override
  String get auxLiquidGlassSettingsPageFrostedGlassBlur => '磨砂玻璃模糊';

  @override
  String
  get auxLiquidGlassSettingsPageGaussianBlurDiffusionAppliedBehindGlassComponents =>
      '在玻璃组件后应用高斯模糊';

  @override
  String get auxLiquidGlassSettingsPageSpecularLightShimmer => '镜面高光与微光';

  @override
  String
  get auxLiquidGlassSettingsPageGlossySpecularReflectionAndBorderIlluminationIntensity =>
      '控制镜面反射与边缘光强度';

  @override
  String get auxLiquidGlassSettingsPageBorderWidth => '边框宽度';

  @override
  String
  get auxLiquidGlassSettingsPageThicknessOfTheRefractiveOuterBoundaryEdge =>
      '折射外边界的厚度';

  @override
  String get auxLiquidGlassSettingsPageHoverOrTapTheIconsToPreview =>
      '悬停或点击图标，预览回弹与缩放';

  @override
  String get auxLiveTvSettingsPageLiveSpotlightHeroBanner => '直播精选与横幅';

  @override
  String get auxLiveTvSettingsPageChannelCardsPosterDensity => '频道卡片与密度';

  @override
  String get auxLiveTvSettingsPageSectionsCategoryManager => '栏目与分类管理';

  @override
  String get auxLiveTvSettingsPagePortalsPlaylistsModal => '服务与播放列表弹窗';

  @override
  String get auxLiveTvSettingsPagePortalBrowserChannelGuide => '服务浏览与节目单';

  @override
  String get auxLiveTvSettingsPageStreamSources => '播放源';

  @override
  String get auxLiveTvSettingsPageShowLiveSpotlightBanner => '显示直播精选横幅';

  @override
  String
  get auxLiveTvSettingsPageFeaturedChampionshipMatchesAndTopBroadcastChannels =>
      '顶部展示精选赛事和热门频道';

  @override
  String get auxLiveTvSettingsPageHeroBannerStyle => '精选横幅样式';

  @override
  String get auxLiveTvSettingsPageAutoRotateChannels => '自动轮播频道';

  @override
  String get auxLiveTvSettingsPageAutomaticallyCycleThroughFeaturedLiveEvents =>
      '自动切换精选直播';

  @override
  String get auxLiveTvSettingsPageRotationInterval => '轮播间隔';

  @override
  String get auxLiveTvSettingsPageChannelCardSize => '频道卡片大小';

  @override
  String get auxLiveTvSettingsPageCardHoverScaleZoom => '卡片悬停缩放比例';

  @override
  String get auxLiveTvSettingsPageShowLiveHdStreamBadge => '显示直播 / 高清标签';

  @override
  String get auxLiveTvSettingsPageDisplayRadiantLiveBroadcastBadgeOnChannel =>
      '在频道卡片角落显示直播标签';

  @override
  String get auxLiveTvSettingsPageShowChannelCategoryTag => '显示频道分类标签';

  @override
  String get auxLiveTvSettingsPageShowCategoryLabelBelowChannelName =>
      '在频道名称下方显示分类';

  @override
  String get auxLiveTvSettingsPageShowFeedHealthBadge => '显示播放源状态标签';

  @override
  String get auxLiveTvSettingsPageMarkAChannelAsAliveUncheckedOr =>
      '显示频道可用、未检测或不可用状态';

  @override
  String get auxLiveTvSettingsPageChannelCategoriesSections => '频道分类与栏目';

  @override
  String get auxLiveTvSettingsPageToggleVisibilityOfLiveTvRows => '控制直播栏目的显示';

  @override
  String get auxLiveTvSettingsPageResetAll => '全部重置';

  @override
  String get auxLiveTvSettingsPagePortalCardDisplayStyle => '服务卡片显示样式';

  @override
  String get auxLiveTvSettingsPageShowPortalExpiryDate => '显示服务到期日期';

  @override
  String
  get auxLiveTvSettingsPageDisplaySubscriptionExpirationTagOnPortalCards =>
      '在服务卡片显示订阅到期信息';

  @override
  String get auxLiveTvSettingsPageShowMaxActiveConnectionsTag => '显示最大连接数标签';

  @override
  String
  get auxLiveTvSettingsPageDisplayCurrentAndMaxConcurrentStreamingConnections =>
      '显示当前及最大并发连接数';

  @override
  String get auxLiveTvSettingsPageDefaultStartingTab => '默认打开的标签页';

  @override
  String get auxLiveTvSettingsPageXtreamPanels => 'Xtream 服务';

  @override
  String get auxLiveTvSettingsPageM3uPlaylists => 'M3U 播放列表';

  @override
  String get auxLiveTvSettingsPageCategorySidebarWidth => '分类侧栏宽度';

  @override
  String get auxLiveTvSettingsPageDisplayChannelPosterAndLogosInStream =>
      '在频道列表中显示海报与标志';

  @override
  String
  get auxLiveTvSettingsPageDisplayCurrentTelevisionGuideTitleBelowChannel =>
      '在频道下方显示当前节目名称';

  @override
  String get auxLiveTvSettingsPageShowNumberOfAvailableStreamsNextTo =>
      '在分类旁显示可用频道数量';

  @override
  String get auxLiveTvSettingsPageIncludeFreePublicSources => '包含免费公开来源';

  @override
  String get auxMangaSettingsPageEnableMovingAmbientLighting => '启用动态氛围光';

  @override
  String get auxMangaSettingsPageDisplayYourActiveReadingHistoryAtThe =>
      '在漫画页顶部显示阅读进度';

  @override
  String get auxMangaSettingsPageMangaPosterCardDensity => '漫画封面卡片密度';

  @override
  String get auxMangaSettingsPageShowContentTypeBadgeMangaManhwa =>
      '显示内容类型标签（日漫 / 韩漫）';

  @override
  String get auxMangaSettingsPageShowPublicationYearOnCards => '在卡片上显示发行年份';

  @override
  String get auxMangaSettingsPagePosterCardHoverGlowEffect => '封面悬停光效';

  @override
  String get auxMangaSettingsPageShowDesktopScrollTrack => '显示桌面滚动轨道';

  @override
  String get auxMangaSettingsPageDefaultReadingMode => '默认阅读模式';

  @override
  String get auxMangaSettingsPageControlToolbarStyle => '控制工具栏样式';

  @override
  String get auxMangaSettingsPageVerticalPageGap => '垂直页面间距';

  @override
  String get auxMangaSettingsPageShowPageDeckThumbnailPreviews => '显示页面缩略图预览';

  @override
  String get auxMangaSettingsPageInteractiveVisualTrayOfThumbnailPreviewsFor =>
      '通过缩略图快速跳转页面';

  @override
  String get auxMangaSettingsPageShowPageScrubberSlider => '显示页面进度滑块';

  @override
  String get auxMangaSettingsPageEnableNextChapterPreviewCardDeck =>
      '启用下一章预览卡片';

  @override
  String get auxMangaSettingsPageRichGlassDeckCardAtTheEnd =>
      '在章节末尾展示下一章封面与阅读入口';

  @override
  String get auxMusicPlayerStudioPageCustomMusicPlayerStudio => '自定义音乐播放器工作室';

  @override
  String
  get auxMusicPlayerStudioPageDesignTheFullscreenPlayerDragComponentsCustomize =>
      '自定义全屏播放器布局、交互反馈与液态玻璃';

  @override
  String get auxMusicPlayerStudioPageApplyActive => '应用并启用';

  @override
  String get auxMusicPlayerStudioPageCustomFullscreenPlayerStudioLayoutSetAs =>
      '自定义全屏播放器布局已启用';

  @override
  String get auxMusicPlayerStudioPageFullscreenLiveStudio => '全屏实时工作室';

  @override
  String get auxMusicPlayerStudioPageFlac24Bit96khzLossless =>
      'FLAC 24-bit / 96kHz 无损';

  @override
  String get auxMusicPlayerStudioPageSyncedLyricsSandbox => '同步歌词预览';

  @override
  String get auxMusicPlayerStudioPagePlayingQueueSandbox4Tracks =>
      '播放队列预览（4 首）';

  @override
  String get auxMusicPlayerStudioPageFullscreenPlayerDragDropArranger =>
      '全屏播放器拖拽布局';

  @override
  String get auxMusicPlayerStudioPageHoldAndDragAnyBlockToReorder =>
      '长按拖动组件，实时调整全屏播放器布局。';

  @override
  String get auxMusicPlayerStudioPageSeekBarCanvasScrubberEngine => '进度条与滑块引擎';

  @override
  String
  get auxMusicPlayerStudioPageSelectHowAudioWaveformsAndScrubbingTracks =>
      '选择音乐播放器中的音频波形与进度条样式。';

  @override
  String get auxMusicPlayerStudioPagePlayButtonAestheticStyle => '播放按钮外观与样式';

  @override
  String get auxMusicPlayerStudioPageHoverTouchPhysicsEngine => '悬停与触控反馈引擎';

  @override
  String
  get auxMusicPlayerStudioPageSelectTheInteractivePhysicsFeedbackAppliedWhen =>
      '选择悬停或按下控件时的交互反馈。';

  @override
  String get auxMusicPlayerStudioPageLivePhysicsTestingPad => '实时交互反馈预览';

  @override
  String get auxMusicPlayerStudioPageArtworkTurntablePresentation => '封面与唱盘展示';

  @override
  String
  get auxMusicPlayerStudioPageSelectHowAlbumCoversVinylTurntableAnimations =>
      '选择播放器中的专辑封面、唱盘动画与卡片展示方式。';

  @override
  String get auxMusicSettingsPageMusicUiPlayerAtmosphere => '音乐界面与播放器氛围';

  @override
  String get auxMusicSettingsPageMovingBackgroundAmbientLighting => '动态背景氛围光';

  @override
  String get auxMusicSettingsPageDynamicMovingGlowingOrbsReactingWithYour =>
      '随主题强调色变化的动态光效';

  @override
  String get auxMusicSettingsPageAmbientLightPattern => '氛围光样式';

  @override
  String get auxMusicSettingsPageShowHeroSpotlightShowcase => '显示精选推荐';

  @override
  String get auxMusicSettingsPageFeaturedBestsellingAlbumTrackShowcaseAtThe =>
      '在音乐页顶部展示热门专辑与歌曲';

  @override
  String get auxMusicSettingsPageShowLosslessHiResAudioBadges =>
      '显示 Hi-Res 无损音频标签';

  @override
  String get auxMusicSettingsPageDisplaysFlacHiResLosslessStreamIndicators =>
      '在音乐卡片和播放器上显示 FLAC / Hi-Res 标识';

  @override
  String get auxMusicSettingsPageMusicCardGridDensity => '音乐卡片与网格密度';

  @override
  String get auxMusicSettingsPageFullPlayerEngine => '完整播放器引擎';

  @override
  String get auxMusicSettingsPageCustomizeTheFullscreenPlayerDragDropBlocks =>
      '自定义全屏播放器的组件布局、波形、唱盘与液态玻璃按钮。';

  @override
  String get auxMusicSettingsPageLiveWaveformControlsPreview => '波形与控件实时预览';

  @override
  String get auxMusicSettingsPageOpenFullStudio => '打开完整工作室';

  @override
  String get auxMangaReaderControlsReaderAtmosphere => '阅读氛围：';

  @override
  String get auxLiveGuideBandUpcomingOnThisChannel => '该频道即将播出';

  @override
  String get auxLiveGuideBandNothingElseListedForThisChannel => '该频道暂无其他节目。';

  @override
  String get auxLiveGuideBandNoProgrammeGuideForThisChannelYet => '该频道暂无节目单。';

  @override
  String get auxLiveGuideBandFindLiveStreams => '查找直播源';

  @override
  String get auxLiveGuideBandWatchLiveStream => '观看直播';

  @override
  String get auxComicReaderViewZoomOutCtrl => '缩小（Ctrl -）';

  @override
  String get auxComicReaderViewZoomInCtrl => '放大（Ctrl +）';

  @override
  String get auxComicReaderViewResetZoom100 => '重置缩放（100%）';

  @override
  String get auxFocusModeViewFocusModeActive => '专注模式已启用';

  @override
  String get auxFocusModeViewExitFocusMode => '退出专注模式';

  @override
  String get auxFocusModeViewExitEsc => '退出（Esc）';

  @override
  String get auxFocusModeViewTapAboveBelowToMoveKeysTo => '点击上方或下方移动，或使用 ↑ ↓ 键';

  @override
  String get auxFocusModeViewPreviousLineUpArrow => '上一行（↑）';

  @override
  String get auxFocusModeViewNextLineDownArrowSpace => '下一行（↓ / 空格）';

  @override
  String get auxReaderCustomizationSheetAppearance => '外观';

  @override
  String get auxReaderCustomizationSheetLight => '浅色';

  @override
  String get auxReaderCustomizationSheetSepia => '护眼暖色';

  @override
  String get auxReaderCustomizationSheetDark => '深色';

  @override
  String get auxReaderCustomizationSheetContinuousScroll => '连续滚动';

  @override
  String get auxReaderCustomizationSheetPaginatedTurns => '分页阅读';

  @override
  String dynamicAnimeCardEps(String v1) {
    return '$v1 话';
  }

  @override
  String dynamicMultinutzChannelSheetCopied(String v1) {
    return '已复制：$v1';
  }

  @override
  String dynamicMultinutzChannelSheetExpires(String v1) {
    return '到期：$v1';
  }

  @override
  String dynamicMultinutzChannelSheetConnections(String v1, String v2) {
    return '连接数：$v1/$v2';
  }

  @override
  String dynamicMultinutzChannelSheetLiveChannels(String v1) {
    return '$v1 个直播频道';
  }

  @override
  String dynamicMultinutzChannelSheetChannels(String v1) {
    return '$v1 个频道';
  }

  @override
  String dynamicPlayerEpisodesPanelEpisodes(String v1, String v2) {
    return '$v1 · $v2 集';
  }

  @override
  String dynamicPlayerEpisodesPanelEp(String v1) {
    return '第 $v1 集';
  }

  @override
  String dynamicPlayerSourcesPanelEpisode(String v1) {
    return '第 $v1 话';
  }

  @override
  String dynamicPlayerSourcesPanelSE(String v1, String v2) {
    return '第 $v1 季 · 第 $v2 集';
  }

  @override
  String dynamicPlayerSourcesPanelAllProvidersWatchingVia(String v1) {
    return '全部播放源 · 当前使用 $v1';
  }

  @override
  String dynamicTextSyncOverlayErrorSavingSync(String v1) {
    return '无法保存字幕同步设置：$v1';
  }

  @override
  String dynamicMagnetFilesView(String v1, String v2) {
    return '$v1 个文件';
  }

  @override
  String dynamicMagnetFilesView2(String v1, String v2) {
    return '$v1 个视频';
  }

  @override
  String dynamicUpdateDialogVersion(String v1) {
    return '版本 $v1';
  }

  @override
  String dynamicUpdateDialogDownloadFailed(String v1) {
    return '下载失败：$v1';
  }

  @override
  String dynamicWewatchQuizPage3Rated(String v1) {
    return '已评价 $v1/3 部作品';
  }

  @override
  String dynamicWewatchQuizPageCinemaPicksTailoredToYourTaste(String v1) {
    return '为你推荐 $v1 部符合偏好的作品';
  }

  @override
  String dynamicWewatchQuizPageMatch(String v1) {
    return '$v1% 匹配';
  }

  @override
  String dynamicAnimeDetailsPageEp(String v1, String v2) {
    return '共 $v1 话';
  }

  @override
  String dynamicAnimePageEpisode(String v1) {
    return '第 $v1 话';
  }

  @override
  String dynamicAnimePageCurrentlyAiringHits(String v1) {
    return '正在播出的热门番剧 · $v1';
  }

  @override
  String dynamicAnimeSearchPageSort(String v1) {
    return '排序：$v1';
  }

  @override
  String dynamicAnimeStreamSheetEpisode(String v1, String v2) {
    return '$v1 · 第 $v2 话';
  }

  @override
  String dynamicAnimeStreamSheetEp(String v1, String v2) {
    return '$v1 · 第 $v2 话';
  }

  @override
  String dynamicAnimeStreamSheetNoSourcesFound(String v1) {
    return '暂无 $v1 播放源。';
  }

  @override
  String dynamicAnimeArabicDetailsPageWatchEpisode(String v1) {
    return '播放第 $v1 话';
  }

  @override
  String dynamicAnimeArabicDetailsPageEp(String v1) {
    return '第 $v1 话';
  }

  @override
  String dynamicAnimeArabicStreamSheetEpisode(String v1, String v2) {
    return '$v1 · 第 $v2 话';
  }

  @override
  String dynamicAudiobooksPageLeft(String v1) {
    return '剩余 $v1';
  }

  @override
  String dynamicAudiobooksPageLocal(String v1) {
    return '$v1 · 本地';
  }

  @override
  String dynamicAudiobooksPageCompleted(String v1) {
    return '已完成 $v1%';
  }

  @override
  String dynamicAudiobookPlayerScreenChapterOf(
    String v1,
    String v2,
    String v3,
  ) {
    return '第 $v1/$v2 章 · $v3';
  }

  @override
  String dynamicAudiobookPlayerScreenChapters(String v1) {
    return '共 $v1 章';
  }

  @override
  String dynamicGenerateAudiobookScreenGenerationFailed(String v1) {
    return '生成失败：$v1';
  }

  @override
  String dynamicGenerateAudiobookScreenRemoveFromTheGenerationList(String v1) {
    return '将“$v1”从生成列表中移除？';
  }

  @override
  String dynamicGenerateAudiobookScreenSelectedAudioFileS(String v1) {
    return '已选择 $v1 个音频文件：';
  }

  @override
  String dynamicGenerateAudiobookScreenGenerationQueueCompleted(String v1) {
    return '生成任务与已完成（$v1）';
  }

  @override
  String dynamicGenerateAudiobookScreenDownloadedBooksFromLibrary(String v1) {
    return '媒体库已下载书籍（$v1）';
  }

  @override
  String dynamicGenerateAudiobookScreenSizeMb(String v1) {
    return '大小：$v1 MB';
  }

  @override
  String dynamicGenerateAudiobookScreenVoice(String v1) {
    return '音色：$v1';
  }

  @override
  String dynamicGenerateAudiobookScreenImportedAudiobooks(String v1) {
    return '已导入有声书（$v1）';
  }

  @override
  String dynamicGenerateAudiobookScreenPartSMb(
    String v1,
    String v2,
    String v3,
  ) {
    return '$v1 · $v2 个音频文件（$v3 MB）';
  }

  @override
  String dynamicGenerateAudiobookScreenDeleteFromYourLibrary(String v1) {
    return '从媒体库删除《$v1》？';
  }

  @override
  String dynamicBookDetailSheetFailedToDownloadBook(String v1) {
    return '书籍下载失败：$v1';
  }

  @override
  String dynamicBookDetailSheetCompleted(String v1) {
    return '已完成 $v1%';
  }

  @override
  String dynamicEpubReaderPageChOf(String v1, String v2) {
    return '第 $v1/$v2 章';
  }

  @override
  String dynamicEpubReaderPageMinLeft(String v1, String v2) {
    return '$v1% · 约剩 $v2 分钟';
  }

  @override
  String dynamicPdfReaderPagePageOf(String v1, String v2) {
    return '第 $v1/$v2 页';
  }

  @override
  String dynamicDiscoverPageSelect(String v1, String v2) {
    return '选择$v1$v2';
  }

  @override
  String dynamicDiscoverPageEnter(String v1) {
    return '输入$v1';
  }

  @override
  String dynamicDiscoverPageTypeHere(String v1) {
    return '请输入$v1…';
  }

  @override
  String dynamicDiscoverPageAll(String v1) {
    return '全部$v1';
  }

  @override
  String dynamicDiscoverPageBy(String v1) {
    return '按$v1筛选';
  }

  @override
  String dynamicDiscoverPageNoResultsFoundFor(String v1) {
    return '未找到与“$v1”匹配的内容';
  }

  @override
  String dynamicDownloadsPagePeers(String v1) {
    return '$v1 个节点';
  }

  @override
  String dynamicDownloadsPageFolder(String v1) {
    return '目录：$v1';
  }

  @override
  String dynamicDownloadsPagePath(String v1) {
    return '路径：$v1';
  }

  @override
  String dynamicDownloadsPageDeviceStorageUsedOf(String v1, String v2) {
    return '设备存储：已使用 $v1 / $v2';
  }

  @override
  String dynamicDownloadsPageFree(String v1) {
    return '剩余 $v1';
  }

  @override
  String dynamicIptvChannelSheetRemovedStreamFeed(String v1, String v2) {
    return '已移除 $v1 个直播源';
  }

  @override
  String dynamicIptvChannelSheetSearchChannelsEG1080p4k(String v1) {
    return '搜索 $v1 个频道（画质或名称）…';
  }

  @override
  String dynamicIptvChannelSheetDelete(String v1) {
    return '删除（$v1）';
  }

  @override
  String dynamicIptvChannelSheetNoFeedsMatch(String v1) {
    return '未找到与“$v1”匹配的直播源';
  }

  @override
  String dynamicIptvPageChannels(String v1) {
    return '$v1 个频道';
  }

  @override
  String dynamicIptvPortalsModalRemovedPortal(String v1, String v2) {
    return '已移除 $v1 个服务';
  }

  @override
  String dynamicIptvPortalsModalRemovedAllPortals(String v1) {
    return '已移除全部 $v1 个服务';
  }

  @override
  String dynamicIptvPortalsModalRemovedPlaylist(String v1, String v2) {
    return '已移除 $v1 个播放列表';
  }

  @override
  String dynamicIptvPortalsModalRemovedAllPlaylists(String v1) {
    return '已移除全部 $v1 个播放列表';
  }

  @override
  String dynamicIptvPortalsModalDelete(String v1) {
    return '删除（$v1）';
  }

  @override
  String dynamicIptvPortalsModalCopied(String v1) {
    return '已复制：$v1';
  }

  @override
  String dynamicIptvPortalsModalExpires(String v1) {
    return '到期：$v1';
  }

  @override
  String dynamicIptvPortalsModalConnections(String v1, String v2) {
    return '连接数：$v1/$v2';
  }

  @override
  String dynamicIptvPortalsModalCh(String v1) {
    return '$v1 个频道';
  }

  @override
  String dynamicIptvPortalBrowserPageCols(String v1) {
    return '$v1 列';
  }

  @override
  String dynamicIptvPortalBrowserPageTotal(String v1) {
    return '共 $v1 个';
  }

  @override
  String dynamicIptvPortalBrowserPageExpiry(String v1) {
    return '到期时间：$v1';
  }

  @override
  String dynamicIptvPortalBrowserPageConnections(String v1, String v2) {
    return '连接数：$v1/$v2';
  }

  @override
  String dynamicIptvPortalBrowserPageConn(String v1, String v2, String v3) {
    return '连接数：$v1/$v2 · 到期：$v3';
  }

  @override
  String dynamicMangaDetailsPagePageOf(String v1, String v2) {
    return '第 $v1/$v2 页';
  }

  @override
  String dynamicMangaReaderPagePageOf(String v1, String v2) {
    return '第 $v1/$v2 页';
  }

  @override
  String dynamicMangaReaderPagePage(String v1, String v2) {
    return '第 $v1/$v2 页';
  }

  @override
  String dynamicMultinutzPageStreamUrlFor(String v1) {
    return '$v1 的直播地址';
  }

  @override
  String dynamicMultinutzPageStream(String v1, String v2) {
    return '$v1 路直播';
  }

  @override
  String dynamicMusicPageTracks(String v1) {
    return '$v1 首歌曲';
  }

  @override
  String dynamicMusicPageTracks2(String v1) {
    return '歌曲（$v1）';
  }

  @override
  String dynamicMusicPageArtists(String v1) {
    return '艺人（$v1）';
  }

  @override
  String dynamicMusicPageAlbums(String v1) {
    return '专辑（$v1）';
  }

  @override
  String dynamicMusicPagePlaylists(String v1) {
    return '歌单（$v1）';
  }

  @override
  String dynamicMusicPageFavouriteTracks(String v1) {
    return '$v1 首喜欢的歌曲';
  }

  @override
  String dynamicMusicPageQueue(String v1) {
    return '播放队列（$v1）';
  }

  @override
  String dynamicMusicPageOfflineTracksMb(String v1, String v2) {
    return '$v1 首离线歌曲 · $v2 MB';
  }

  @override
  String dynamicMusicPageDownloading(String v1) {
    return '正在下载 $v1%';
  }

  @override
  String dynamicMusicPageAddedToDownloadQueue(String v1) {
    return '《$v1》已加入下载队列';
  }

  @override
  String dynamicMusicPageAddedTracksFromToDownloadQueue(String v1, String v2) {
    return '专辑《$v2》中的 $v1 首歌曲已加入下载队列';
  }

  @override
  String dynamicMusicPageCuratedByTracks(String v1, String v2) {
    return '由 $v1 创建 · $v2 首歌曲';
  }

  @override
  String dynamicMusicPageAddedTracksFromToDownloadQueue2(String v1, String v2) {
    return '歌单《$v2》中的 $v1 首歌曲已加入下载队列';
  }

  @override
  String dynamicMusicPageCustomPlaylistTracks(String v1) {
    return '自定义歌单 · $v1 首歌曲';
  }

  @override
  String dynamicMusicPageOfflineTracksMbStorage(String v1, String v2) {
    return '$v1 首离线歌曲 · 占用 $v2 MB';
  }

  @override
  String dynamicMusicPageDeleteFromOfflineStorage(String v1) {
    return '删除离线歌曲《$v1》？';
  }

  @override
  String dynamicMusicPageInQueue(String v1) {
    return '队列中有 $v1 首歌曲';
  }

  @override
  String dynamicPlayerScreenAudio(String v1) {
    return '音轨 $v1';
  }

  @override
  String dynamicAboutSettingsPageVersionNextGenStreamingHub(String v1) {
    return '版本 $v1 · 综合影音中心';
  }

  @override
  String dynamicAddonsSettingsPageConnectedTo(String v1, String v2) {
    return '$v1 已连接至 $v2';
  }

  @override
  String dynamicAddonsSettingsPageInstalledSuccessfully(String v1) {
    return '$v1 已安装';
  }

  @override
  String dynamicAddonsSettingsPageRemove(String v1) {
    return '移除 $v1？';
  }

  @override
  String dynamicAddonsSettingsPageSuccessfullyInstalledPluginsFromRepository(
    String v1,
  ) {
    return '已安装仓库中的 $v1 个插件';
  }

  @override
  String dynamicAddonsSettingsPageInstallationError(String v1) {
    return '安装失败：$v1';
  }

  @override
  String dynamicAddonsSettingsPageRemove2(String v1) {
    return '移除（$v1）';
  }

  @override
  String dynamicAddonsSettingsPageTotal(String v1) {
    return '共 $v1 个';
  }

  @override
  String dynamicAddonsSettingsPageRepos(String v1) {
    return '$v1 个仓库';
  }

  @override
  String dynamicAddonsSettingsPageRuntimeSetupError(String v1) {
    return '运行引擎配置失败：$v1';
  }

  @override
  String dynamicBuiltinProvidersSettingsPageNoProvidersFoundMatching(
    String v1,
  ) {
    return '未找到与“$v1”匹配的播放源';
  }

  @override
  String dynamicBuiltinProvidersSettingsPageAllZplayhttpProvidersAreActiveAnd(
    String v1,
  ) {
    return '全部 $v1 个内置播放源已启用并并行查询。';
  }

  @override
  String dynamicBuiltinProvidersSettingsPageActive(String v1, String v2) {
    return '已启用 $v1 / $v2';
  }

  @override
  String dynamicCloudstreamMarketplaceModalAddedSuccessfully(String v1) {
    return '$v1 已添加';
  }

  @override
  String dynamicCloudstreamMarketplaceModalInstallPlugins(String v1) {
    return '安装 $v1 中的插件？';
  }

  @override
  String dynamicCloudstreamMarketplaceModalPluginsInstalledAndReady(String v1) {
    return '已安装 $v1 个插件';
  }

  @override
  String dynamicCloudstreamMarketplaceModalInstallationError(String v1) {
    return '安装失败：$v1';
  }

  @override
  String
  dynamicCloudstreamMarketplaceModalReposDirectInstallLinksVerifiedProviders(
    String v1,
  ) {
    return '$v1 个仓库 · 支持直接安装';
  }

  @override
  String dynamicCloudstreamMarketplaceModalNoRepositoriesFoundFor(String v1) {
    return '未找到与“$v1”匹配的仓库';
  }

  @override
  String dynamicCloudstreamMarketplaceModalPlugins(String v1) {
    return '$v1 个插件';
  }

  @override
  String dynamicCloudstreamMarketplaceModalCopiedLink(String v1) {
    return '链接已复制：$v1';
  }

  @override
  String dynamicCloudstreamRepoModalInstalledSuccessfully(String v1) {
    return '$v1 已安装';
  }

  @override
  String dynamicCloudstreamRepoModalUninstalled(String v1) {
    return '$v1 已卸载';
  }

  @override
  String dynamicCloudstreamRepoModalSuccessfullyInstalledPlugins(String v1) {
    return '已安装 $v1 个插件';
  }

  @override
  String dynamicCloudstreamRepoModalInstallationError(String v1) {
    return '安装失败：$v1';
  }

  @override
  String dynamicCloudstreamRepoModalUninstallAllInstalledPluginsFromThis(
    String v1,
  ) {
    return '确定卸载列表中的全部 $v1 个已安装插件？其下载文件也将被删除。';
  }

  @override
  String dynamicCloudstreamRepoModalRemoveAll(String v1) {
    return '全部移除（$v1）';
  }

  @override
  String dynamicCloudstreamRepoModalSuccessfullyUninstalledPlugins(String v1) {
    return '已卸载 $v1 个插件';
  }

  @override
  String dynamicCloudstreamRepoModalInstallAll(String v1) {
    return '全部安装（$v1）';
  }

  @override
  String dynamicServiceKeysSettingsPagePasteYourKey(String v1) {
    return '粘贴 $v1 密钥';
  }

  @override
  String dynamicUpdatesSettingsPageErrorCheckingUpdates(String v1) {
    return '检查更新失败：$v1';
  }

  @override
  String dynamicUpdatesSettingsPageInstalledVersionVBuild(
    String v1,
    String v2,
  ) {
    return '当前版本：v$v1（构建 $v2）';
  }

  @override
  String dynamicAudiobookPlayerStudioPageXSpeed(String v1) {
    return '$v1 倍速';
  }

  @override
  String dynamicAudiobookPlayerStudioPagePosition(String v1) {
    return '位置 $v1';
  }

  @override
  String dynamicAudiobookPlayerStudioPageHoverOrTapBelowToPreview(String v1) {
    return '悬停或点击下方，实时预览“$v1”：';
  }

  @override
  String dynamicAudiobookPlayerStudioPageTest(String v1) {
    return '测试“$v1”';
  }

  @override
  String dynamicAudiobookSettingsPageSoftFlowingGlowingOrbsAndAurora(
    String v1,
  ) {
    return '随 $v1 主题变化的柔和动态光效';
  }

  @override
  String dynamicHomeUiSettingsPageIntervalS(String v1) {
    return '间隔：$v1 秒';
  }

  @override
  String dynamicLiveTvSettingsPageSeconds(String v1) {
    return '$v1 秒';
  }

  @override
  String dynamicLiveTvSettingsPageColumns(String v1) {
    return '$v1 列';
  }

  @override
  String dynamicMangaSettingsPageSoftFlowingGlowingOrbsAndAurora(String v1) {
    return '随 $v1 主题变化的柔和动态光效';
  }

  @override
  String dynamicMangaReaderControlsPageMode(String v1) {
    return '阅读模式：$v1';
  }

  @override
  String dynamicMangaReaderControlsAtmosphere(String v1) {
    return '阅读氛围：$v1';
  }

  @override
  String dynamicLiveGuideBandNowAiringOn(String v1) {
    return '$v1 正在播出';
  }

  @override
  String get mediaLabelAction => '动作';

  @override
  String get mediaLabelAdventure => '冒险';

  @override
  String get mediaLabelComedy => '喜剧';

  @override
  String get mediaLabelDrama => '剧情';

  @override
  String get mediaLabelEcchi => '轻度成人向';

  @override
  String get mediaLabelFantasy => '奇幻';

  @override
  String get mediaLabelHentai => '成人向';

  @override
  String get mediaLabelHorror => '恐怖';

  @override
  String get mediaLabelMahouShoujo => '魔法少女';

  @override
  String get mediaLabelMecha => '机甲';

  @override
  String get mediaLabelMusic => '音乐';

  @override
  String get mediaLabelMystery => '悬疑';

  @override
  String get mediaLabelPsychological => '心理';

  @override
  String get mediaLabelRomance => '爱情';

  @override
  String get mediaLabelSciFi => '科幻';

  @override
  String get mediaLabelScienceFiction => '科幻';

  @override
  String get mediaLabelSliceOfLife => '日常';

  @override
  String get mediaLabelSports => '运动';

  @override
  String get mediaLabelSupernatural => '超自然';

  @override
  String get mediaLabelThriller => '惊悚';

  @override
  String get mediaLabelAnimation => '动画';

  @override
  String get mediaLabelDocumentary => '纪录片';

  @override
  String get mediaLabelCrime => '犯罪';

  @override
  String get mediaLabelFamily => '家庭';

  @override
  String get mediaLabelHistory => '历史';

  @override
  String get mediaLabelWar => '战争';

  @override
  String get mediaLabelWestern => '西部';

  @override
  String get mediaLabelBiography => '传记';

  @override
  String get mediaLabelSport => '运动';

  @override
  String get mediaLabelMusical => '歌舞';

  @override
  String get mediaLabelFilmNoir => '黑色电影';

  @override
  String get mediaLabelActionAdventure => '动作与冒险';

  @override
  String get mediaLabelSciFiFantasy => '科幻与奇幻';

  @override
  String get mediaLabelWarPolitics => '战争与政治';

  @override
  String get mediaLabelKids => '儿童';

  @override
  String get mediaLabelReality => '真人秀';

  @override
  String get mediaLabelTalk => '访谈';

  @override
  String get mediaLabelNews => '新闻';

  @override
  String get mediaLabelSoap => '肥皂剧';

  @override
  String get mediaLabelTvMovie => '电视电影';

  @override
  String get mediaLabelWinter => '冬季';

  @override
  String get mediaLabelSpring => '春季';

  @override
  String get mediaLabelSummer => '夏季';

  @override
  String get mediaLabelFall => '秋季';

  @override
  String get mediaLabelTv => '电视动画';

  @override
  String get mediaLabelTvShort => '短篇动画';

  @override
  String get mediaLabelMovie => '动画电影';

  @override
  String get mediaLabelOva => 'OVA';

  @override
  String get mediaLabelOna => 'ONA';

  @override
  String get mediaLabelSpecial => '特别篇';

  @override
  String get mediaLabelMusic50 => '音乐动画';

  @override
  String get mediaLabelReleasing => '连载中';

  @override
  String get mediaLabelFinished => '已完结';

  @override
  String get mediaLabelNotYetReleased => '尚未开播';

  @override
  String get mediaLabelCancelled => '已取消';

  @override
  String get mediaLabelHiatus => '暂停连载';

  @override
  String get mediaLabelTrending => '近期热门';

  @override
  String get mediaLabelMostPopular => '人气最高';

  @override
  String get mediaLabelTopRated => '评分最高';

  @override
  String get mediaLabelMostFavorited => '收藏最多';

  @override
  String get mediaLabelNewest => '最新发行';

  @override
  String get mediaLabelOldest => '最早发行';

  @override
  String get mediaLabelTitleAZ => '按名称排序';

  @override
  String get mediaLabelNewSeason => '新一季';

  @override
  String get mediaLabelNewEpisode => '新一集';

  @override
  String get mediaLabelNewRelease => '新上映';

  @override
  String get mediaLabelMovie66 => '电影';

  @override
  String get mediaLabelSeries => '剧集';

  @override
  String get mediaLabelAnime => '动漫';

  @override
  String get mediaLabelInLibrary => '已加入片单';

  @override
  String get mediaLabelLibrary => '媒体库';

  @override
  String get mediaLabelShowLess => '收起';

  @override
  String get mediaLabelReadMore => '展开简介';

  @override
  String get mediaLabelYear => '年份';

  @override
  String get mediaLabelMuted => '已静音';

  @override
  String get mediaLabelDownloading => '正在下载…';

  @override
  String get mediaLabelDownloadMedia => '下载影片';

  @override
  String get mediaLabelLiveAction => '真人影视';

  @override
  String get mediaLabelUseWithCare => '谨慎使用';

  @override
  String get mediaLabelFasterAt4k => '4K 播放优化';

  @override
  String get mediaLabelMostFeatures => '功能最完整';

  @override
  String get mediaLabelSortBy => '排序方式';

  @override
  String get mediaLabelRequired => '必选 *';

  @override
  String get mediaLabelEnter => '输入';

  @override
  String get mediaLabelAll => '全部';

  @override
  String get mediaLabelGenre => '题材';

  @override
  String get mediaLabelSeason => '季度';

  @override
  String get mediaLabelFormat => '类型';

  @override
  String get mediaLabelStatus => '状态';

  @override
  String get mediaLabelClear => '清除';

  @override
  String get mediaLabelRetry => '重试';

  @override
  String get mediaLabelPlay => '播放';

  @override
  String get mediaLabelAdd => '添加';

  @override
  String get mediaLabelCopyStreamUrl => '复制播放地址';

  @override
  String get mediaLabelCustomBackgroundWallpaper => '自定义背景与壁纸';

  @override
  String get mediaLabelHomePageUiThemes => '首页与主题';

  @override
  String get mediaLabelTvAiringCalendar => '剧集播出日历';

  @override
  String get mediaLabelLiveTvSportsUi => '直播与体育界面';

  @override
  String get mediaLabelMangaUiReaderAtmosphere => '漫画与阅读界面';

  @override
  String get mediaLabelPasteFromClipboard => '从剪贴板粘贴';

  @override
  String get videoUpscalingExplanation =>
      '通过 GLSL 实时增强画质。Anime4K 适合动画线条重建，AMD FSR 适合真人影视。两种方案不可同时启用。';

  @override
  String get videoFsrSmoothExplanation =>
      'AMD FidelityFX 边缘自适应超分，适合真人影视。不额外锐化，兼容性较好；实际效果取决于 GPU。';

  @override
  String get videoFsrSharpExplanation =>
      'FSR 结合对比度自适应锐化，改善模糊或低码率画面。对于 2K、4K 片源，过度锐化可能降低观感。';

  @override
  String get videoMedia3Explanation =>
      '解码后直接输出至渲染表面，减少 4K 视频的帧复制与延迟。字幕由 Android 系统渲染，因此下方的自定义字幕样式不适用。';

  @override
  String get videoMpvExplanation =>
      '内置播放引擎，支持种子、直播、完整字幕样式及画质增强。通过纹理传递解码帧，低性能电视播放 4K 时可能卡顿。';

  @override
  String get videoWatchdogExplanation =>
      '监控播放启动状态。如果声音已播放 2.5 秒但没有画面，或 GPU 解码异常，播放器将尝试自动恢复。Android 在 1080p 及以下可回退软件解码，更高分辨率则重新同步硬件解码器。尚未收到数据时继续等待，不误判为解码故障。';

  @override
  String get catalogLabelMovies => '电影';

  @override
  String get catalogLabelSeries => '剧集';

  @override
  String get catalogLabelAnime => '动漫';

  @override
  String get catalogLabelChannels => '频道';

  @override
  String get catalogLabelCollections => '影视合集';

  @override
  String get catalogLabelAdult => '成人内容';

  @override
  String get catalogLabelBrowse => '浏览';

  @override
  String get catalogLabelPopular => '热门';

  @override
  String get catalogLabelTop => '热门';

  @override
  String get catalogLabelTrendingMovies => '热门电影';

  @override
  String get catalogLabelTrendingSeries => '热门剧集';

  @override
  String get catalogLabelTrendingAnime => '热门番剧';

  @override
  String get catalogLabelPopularMovies => '热门电影';

  @override
  String get catalogLabelPopularSeries => '热门剧集';

  @override
  String get catalogLabelPopularAnime => '热门番剧';

  @override
  String get catalogLabelPopularTvShows => '热门剧集';

  @override
  String get catalogLabelNewMovies => '新上映电影';

  @override
  String get catalogLabelNewSeries => '最新剧集';

  @override
  String get catalogLabelNewAnime => '新番动漫';

  @override
  String get catalogLabelTopRatedMovies => '高分电影';

  @override
  String get catalogLabelTopRatedSeries => '高分剧集';

  @override
  String get catalogLabelTopRatedAnime => '高分动漫';

  @override
  String get catalogLabelFeatured => '精选';

  @override
  String get catalogLabelLatest => '最新';

  @override
  String get catalogLabelLatestMovies => '最新电影';

  @override
  String get catalogLabelLatestSeries => '最新剧集';

  @override
  String get catalogLabelRecentlyAdded => '最近添加';

  @override
  String get catalogLabelNewReleases => '新上映';

  @override
  String get catalogLabelContinueWatching => '继续观看';

  @override
  String get catalogLabelGenres => '题材';

  @override
  String get catalogLabelYears => '年份';

  @override
  String get catalogLabelLanguages => '语言';

  @override
  String get catalogLabelCountries => '地区';

  @override
  String get catalogLabelRegions => '地区';

  @override
  String get catalogLabelGenre => '题材';

  @override
  String get catalogLabelYear => '年份';

  @override
  String get catalogLabelLanguage => '语言';

  @override
  String get catalogLabelCountry => '地区';

  @override
  String get catalogLabelRegion => '地区';

  @override
  String get catalogLabelSearch => '搜索';

  @override
  String get catalogLabelSort => '排序';

  @override
  String get catalogLabelSortby => '排序方式';

  @override
  String get catalogLabelRequired => '必选';

  @override
  String get catalogLabelCustom => '自定义';

  @override
  String get catalogLabelSearch44 => '搜索…';

  @override
  String get catalogLabelDiscoverTheLatestAndGreatestFilms => '探索新片与经典电影';

  @override
  String get catalogLabelBingeWorthyShowsAndTheNewestSeasons => '发现热门剧集与最新季度';

  @override
  String get catalogLabelSimulcastsClassicsAndEverythingInBetween =>
      '新番、经典与更多动漫';

  @override
  String get catalogLabelLiveChannelsFromYourAddons => '来自插件的直播频道';

  @override
  String get catalogLabelEverythingYourAddonsHaveToOffer => '探索插件提供的全部内容';

  @override
  String get catalogLabelAddToList => '加入片单';

  @override
  String get catalogLabelWatching => '在看';

  @override
  String get catalogLabelPlantowatch => '想看';

  @override
  String get catalogLabelPlanToWatch => '想看';

  @override
  String get catalogLabelCompleted => '已看完';

  @override
  String get catalogLabelDropped => '已弃番';

  @override
  String get catalogLabelFindingAWorkingSource => '正在查找可用播放源…';

  @override
  String get catalogLabelFindBestSource => '查找最佳播放源';

  @override
  String get catalogLabelChooseAnotherSource => '切换播放源';

  @override
  String get catalogLabelSub => '字幕版';

  @override
  String get catalogLabelDub => '配音版';

  @override
  String get catalogLabelSub61 => '字幕版';

  @override
  String get catalogLabelDub62 => '配音版';

  @override
  String get catalogLabelAll => '全部';

  @override
  String discoverSortCatalog(String name) {
    return '排序：$name';
  }

  @override
  String discoverSearchWithin(String catalog) {
    return '在$catalog中搜索…';
  }

  @override
  String discoverRequiredFields(String fields) {
    return '请选择$fields后加载内容。';
  }

  @override
  String get discoverDefaultCatalog => '当前目录';

  @override
  String get updateChecksumWarning =>
      '此版本未发布 SHA-256 校验值，Kiru 不会自动安装。请打开发布页面，核验下载文件后再安装。';

  @override
  String get playerExternalSubtitleEngine => '外挂字幕需要 mpv 播放内核，请选择内嵌字幕。';

  @override
  String get aboutUpstreamLicense =>
      'Kiru 基于 ZPlay（PlayTorrio V3 的修改版本）开发，遵循 GNU GPL v3.0 许可证。点击查看许可证。';

  @override
  String get addonCredentialSharingWarning =>
      '此插件地址包含 Debrid 密钥占位符。Kiru 会填入已保存的密钥，插件服务器将通过请求地址接收该密钥。仅在信任此插件时继续。';

  @override
  String addonCredentialPlaceholderHelp(String example) {
    return '以普通 URL 参数接收密钥的插件支持 $example 形式的占位符。若密钥包含在 Base64 配置中，请先完成配置再粘贴完整地址。';
  }

  @override
  String get appearanceSkiaRecommendation =>
      'Windows 建议使用 Skia；此前使用 Impeller 时曾出现 NVIDIA 驱动崩溃。';

  @override
  String get serviceKeysIntroduction =>
      'Kiru 接入多项第三方服务。在此保存的密钥将替换当前版本使用的密钥，并立即生效，无须重启。';

  @override
  String get serviceKeysExternalCredentials =>
      '这些凭据并非由第三方服务签发给本项目。若没有自己的合法凭据，请留空。私有构建可通过 --dart-define 配置自有凭据；清空源码中的对应注册项只会停用该来源。';

  @override
  String get serviceKeysStorageNotice => '凭据仅保存在此设备上，不会在这些输入框中重新显示。';

  @override
  String get tmdbKeyIntroduction =>
      '添加个人 TMDB API 密钥，可按投票数量排列六个 90 年代电影栏目，并支持内置媒体信息查询。请在 themoviedb.org 申请密钥。';

  @override
  String get tmdbKeyStorageNotice =>
      '密钥仅保存在本机，应用不内置密钥。未配置时使用原有回退机制；清除密钥后将恢复内置的 90 年代精选内容。';

  @override
  String get traktPairingRejected =>
      'Trakt 拒绝了关联请求。请在设置 > 服务 API 密钥中检查 Client ID；若 Trakt 要求，请同时填写 Client Secret。';

  @override
  String get homeHideArtlessRailsHelp => '当栏目中所有作品都缺少图片时隐藏该栏目，避免横向海报卡片显示为空白。';

  @override
  String get p2pPrivacyHeading => '隐私与网络须知';

  @override
  String get updateAvailableHeading => '发现新版本';

  @override
  String get updateWhatsNewHeading => '更新内容';

  @override
  String get cardTopRank => '排名';

  @override
  String get channelLiveBadge => '直播';

  @override
  String get channelLiveBroadcast => '正在直播';

  @override
  String get channelFreeBadge => '免费';

  @override
  String get multiStreamsHeading => '多路直播';

  @override
  String get copyPlaybackUrl => '复制播放地址';

  @override
  String get commonAddAction => '添加';

  @override
  String get appearanceCustomWallpaper => '自定义背景与壁纸';

  @override
  String get commonPasteClipboard => '从剪贴板粘贴';

  @override
  String get appearanceHomeTitle => '首页与主题';

  @override
  String get homeBecauseWatching => '因为你正在观看…';

  @override
  String get homeAiringCalendar => '剧集播出日历';

  @override
  String get appearanceLiveTvTitle => '直播与体育界面';

  @override
  String get appearancePublicPlaylistHelp =>
      '将公开 M3U 播放列表添加到频道的播放源列表（如 iptv-org）。';

  @override
  String get appearanceMangaTitle => '漫画与阅读界面';

  @override
  String traktPairingClientIdRequired(String url) {
    return '关联 Trakt 前需要 Client ID。请在 $url 创建应用，再到设置 > 服务 API 密钥中填写 Client ID。Client Secret 为选填项。';
  }

  @override
  String playerSourceRetrySemantics(String source, int attempt, int total) {
    return '正在尝试其他播放源：$source，第 $attempt/$total 次尝试。';
  }

  @override
  String animeEpisodeCount(int count) {
    return '共 $count 话';
  }

  @override
  String get animeTitleDataAttribution =>
      '动漫中文名数据 · bangumi-data v0.3.237 · CC BY 4.0';

  @override
  String get animeCastHeading => '角色与声优';

  @override
  String get animeRelationsHeading => '系列与关联作品';

  @override
  String get animeRecommendationsHeading => '相关推荐';

  @override
  String channelGuideWaiting(String channel) {
    return '当服务中存在经过验证的 $channel 直播源时，将显示其节目单。';
  }

  @override
  String get finalPlayerSubStyleModalTypography => '字体排版';

  @override
  String get finalPlayerSubStyleModalColorsBox => '颜色与背景';

  @override
  String get finalPlayerSubStyleModalOutlineShadow => '描边与阴影';

  @override
  String get finalPlayerSubStyleModalPosition => '位置';

  @override
  String get finalPlayerSubStyleModalAdvancedAss => '高级 / ASS';

  @override
  String get finalPlayerSubStyleModalFontFamily => '字体';

  @override
  String get finalPlayerSubStyleModalSubtitleTextColor => '字幕文字颜色';

  @override
  String get finalPlayerSubStyleModalBackgroundBoxAccessibilityReadability =>
      '字幕背景框（可读性）';

  @override
  String get finalPlayerSubStyleModalOutlineBorderColor => '描边颜色';

  @override
  String get finalPlayerSubStyleModalHorizontalAlignment => '水平对齐';

  @override
  String get finalPlayerSubStyleModalSubtitleRenderingEngine => '字幕渲染引擎';

  @override
  String get finalPlayerSubStyleModalSsaAssFansubScriptOverrideMode =>
      'SSA / ASS 字幕样式覆盖模式';

  @override
  String get finalReaderCustomizationSheetTheme => '主题';

  @override
  String get finalReaderCustomizationSheetLayout => '布局';

  @override
  String get finalReaderCustomizationSheetReset => '已重置 ✓';

  @override
  String get finalReaderCustomizationSheetFontFamily => '字体';

  @override
  String get finalReaderCustomizationSheetFontSize => '字号';

  @override
  String get finalReaderCustomizationSheetLineHeight => '行高';

  @override
  String get finalReaderCustomizationSheetAlignment => '对齐方式';

  @override
  String get finalReaderCustomizationSheetFirstLineIndent => '首行缩进';

  @override
  String get finalReaderCustomizationSheetReadingThemes => '阅读主题';

  @override
  String get finalReaderCustomizationSheetReaderBrightness => '阅读亮度';

  @override
  String get finalReaderCustomizationSheetPageMargins => '页边距';

  @override
  String get finalReaderCustomizationSheetReadingMode => '阅读模式';

  @override
  String get finalTrailerMuteButtonUnmuteTrailer => '取消预告片静音';

  @override
  String get finalTrailerMuteButtonMuteTrailer => '预告片静音';

  @override
  String get finalMultinutzChannelSheetRemoveFavorite => '取消收藏';

  @override
  String get finalTextSyncOverlaySelecting => '选择中';

  @override
  String get finalTextSyncOverlaySaving => '正在保存…';

  @override
  String get finalAnimePageGeneral => '🇯🇵 综合动漫';

  @override
  String get finalAnimePageArabicAnime => '🇸🇦 阿语动漫';

  @override
  String get finalAnimePageSearchAnime => '搜索动漫';

  @override
  String get finalAnimeSearchPageArabic => '🇸🇦 阿语';

  @override
  String get finalAnimeStreamSheetCascadingNativeAnimeExtractors =>
      '正在依次查询动漫播放源…';

  @override
  String get finalAudiobookPlayerScreenPause => '暂停';

  @override
  String get finalGenerateAudiobookScreenUnknownAuthor => '未知作者';

  @override
  String get finalGenerateAudiobookScreenAnalyzingUploadingBook => '正在分析并上传书籍…';

  @override
  String get finalIptvChannelSheetCancelSelection => '取消选择';

  @override
  String get finalIptvChannelSheetDeselectAll => '取消全选';

  @override
  String get finalIptvPlayerPageMuted => '已静音';

  @override
  String get finalIptvPortalsModalShowPassword => '显示密码';

  @override
  String get finalIptvPortalsModalAddM3u => '添加 M3U';

  @override
  String get finalMangaReaderPageUpNext => '下一章';

  @override
  String get finalMultinutzPageCustomUrl => '自定义地址';

  @override
  String get finalMultinutzPageDoneRearranging => '完成排序';

  @override
  String get finalMusicPageSearch => '搜索…';

  @override
  String get finalMyListPageSyncing => '正在同步…';

  @override
  String get finalMyListPageYourListIsEmpty => '片单为空';

  @override
  String get finalWatchScreenCopied => '已复制';

  @override
  String get finalAddonsSettingsPageBuiltInTorrent => '内置种子引擎';

  @override
  String get finalAddonsSettingsPageInstalling => '正在安装…';

  @override
  String get finalAddonsSettingsPageConnecting => '正在连接…';

  @override
  String get finalCloudstreamMarketplaceModalHidePlugins => '隐藏插件';

  @override
  String get finalCloudstreamMarketplaceModalAddingRepository => '正在添加仓库…';

  @override
  String get finalDebridSettingsPageShowKey => '显示密钥';

  @override
  String get finalDebridSettingsPageHideKey => '隐藏密钥';

  @override
  String get finalSimklSettingsPageConnected => '已连接';

  @override
  String get finalUpdatesSettingsPageCheckingForUpdates => '正在检查更新…';

  @override
  String get finalAudiobookSettingsPageAmbientBackgroundLightingMovingGlows =>
      '动态背景氛围光';

  @override
  String get finalAudiobookSettingsPageDiscoveryAudiobookPosters =>
      '内容发现与有声书封面';

  @override
  String get finalAudiobookSettingsPageChooseAudioPlayerPreset => '选择播放器预设';

  @override
  String get finalAudiobookSettingsPageMakeYourCustomAudiobookPlayerDragDrop =>
      '自定义有声书播放器（拖拽式工作室）';

  @override
  String get finalCustomBackgroundSettingsPageUploading => '正在上传…';

  @override
  String
  get finalHomeUiSettingsPagePersonalizedRecommendationsComputedByTrakt =>
      'Trakt 个性化推荐';

  @override
  String get finalHomeUiSettingsPageTopRatedPersonalizedSuggestionsFromSimkl =>
      'Simkl 高分与个性化推荐';

  @override
  String get finalLiquidGlassSettingsPageLiveInteractivePreview => '实时交互预览';

  @override
  String get finalMangaSettingsPageDiscoveryPosterCards => '内容发现与封面卡片';

  @override
  String get finalMangaSettingsPageMangaReaderChapterViewer => '漫画阅读器与章节浏览';

  @override
  String get finalMusicSettingsPageVisualThemePalette => '视觉主题配色';

  @override
  String get finalMusicSettingsPageAmbientAtmosphereGlow => '背景氛围光';

  @override
  String get finalMusicSettingsPageDiscoveryCatalogConfiguration => '内容发现与目录配置';

  @override
  String get finalMusicSettingsPageFullscreenPlayerPresets => '全屏播放器预设';

  @override
  String get finalMusicSettingsPageCustomPlayerEngineDesigner => '自定义播放器设计';

  @override
  String get arabicSectionContinueWatching0 => '继续观看';

  @override
  String get arabicSectionLatestEpisodes1 => '⚡ 最新剧集';

  @override
  String get arabicSectionLatestEpisodesWithArabicSubtitles2 => '最新上线的阿语字幕剧集';

  @override
  String get arabicSectionTrending3 => '🔥 热门动漫';

  @override
  String get arabicSectionMostWatchedAnimeRightNow4 => '当前观看人数最多的动漫';

  @override
  String get arabicSectionPopularFilms5 => '🎬 热门动画电影';

  @override
  String get arabicSectionFeaturedAnimeFilms6 => '精选动画电影';

  @override
  String get arabicSectionTopRatedAnime7 => '👑 高分动漫';

  @override
  String get arabicSectionHighlyRatedAnime8 => '高评价动漫';

  @override
  String get arabicSectionSeasonalAnime9 => '🌟 当季动漫';

  @override
  String get arabicSectionCurrentSeasonShows10 => '本季播出作品';

  @override
  String get arabicSectionClassicAnime11 => '⚔️ 经典动漫';

  @override
  String get arabicSectionTimelessAnimeClassics12 => '值得观看的经典作品';

  @override
  String get arabicSectionComingSoon13 => '🚀 即将播出';

  @override
  String get arabicSectionUpcomingAnime14 => '即将上线的动漫';

  @override
  String get arabicSectionAiringNow15 => '正在播出';

  @override
  String get arabicSectionShowLess16 => '收起';

  @override
  String get arabicSectionShowMore17 => '展开';

  @override
  String get arabicSectionEpisodes18 => '选集';

  @override
  String get arabicSectionJumpToEpisode19 => '跳转至集数…';

  @override
  String get arabicSectionRelatedAnime20 => '相关动漫';

  @override
  String get arabicSectionCheckingServers21 => '正在检查播放服务器…';

  @override
  String get arabicSectionServers22 => '播放服务器';

  @override
  String get arabicSectionRetry23 => '重试';

  @override
  String get arabicSectionPlaybackServer24 => '播放服务器';

  @override
  String get arabicSectionDirectStreamingHighQuality25 => '直接播放 · 高清';

  @override
  String subtitleBaseFontSize(String value) {
    return '基础字号（$value pt）';
  }

  @override
  String subtitleScaleMultiplier(String value) {
    return '缩放比例（$value%）';
  }

  @override
  String subtitleOutlineThickness(String value) {
    return '描边粗细（$value px）';
  }

  @override
  String subtitleShadowOffset(String value) {
    return '阴影偏移（$value px）';
  }

  @override
  String subtitleBottomMargin(String value) {
    return '底部边距 / 偏移（$value px）';
  }

  @override
  String subtitleVerticalPosition(String value) {
    return '垂直位置（$value%）';
  }

  @override
  String arabicEpisodeNumber(String number) {
    return '第 $number 话';
  }

  @override
  String downloadFailedDetail(String error) {
    return '下载失败：$error';
  }

  @override
  String get downloadUnknownError => '未知错误';

  @override
  String downloadPausedProgress(String progress) {
    return '已暂停（$progress%）';
  }

  @override
  String downloadEtaProgress(String progress, String speed, String eta) {
    return '$progress% · $speed · 预计剩余：$eta';
  }

  @override
  String get subtitleOptionWhite0 => '白色';

  @override
  String get subtitleOptionCinemaYellow1 => '影院黄';

  @override
  String get subtitleOptionAmberGold2 => '琥珀金';

  @override
  String get subtitleOptionElectricCyan3 => '亮青色';

  @override
  String get subtitleOptionNeonGreen4 => '亮绿色';

  @override
  String get subtitleOptionVibrantOrange5 => '亮橙色';

  @override
  String get subtitleOptionSoftRose6 => '柔玫瑰色';

  @override
  String get subtitleOptionLightGray7 => '浅灰色';

  @override
  String get subtitleOptionNone8 => '无';

  @override
  String get subtitleOption25Dark9 => '25% 深色';

  @override
  String get subtitleOption50Dark10 => '50% 深色';

  @override
  String get subtitleOption75Dark11 => '75% 深色';

  @override
  String get subtitleOption100Solid12 => '100% 不透明';

  @override
  String get subtitleOption50Indigo13 => '50% 靛蓝色';

  @override
  String get subtitleOptionTransparent14 => '透明';

  @override
  String get subtitleOptionSubtle15 => '浅淡';

  @override
  String get subtitleOptionStandardBox16 => '标准背景框';

  @override
  String get subtitleOptionHighContrast17 => '高对比度';

  @override
  String get subtitleOptionOpaqueBlack18 => '不透明黑色';

  @override
  String get subtitleOptionSlateTint19 => '蓝灰色调';

  @override
  String get subtitleOptionBlack20 => '黑色';

  @override
  String get subtitleOptionDarkSlate21 => '深蓝灰';

  @override
  String get subtitleOptionGold22 => '金色';

  @override
  String get subtitleOptionCrimson23 => '绯红色';

  @override
  String get subtitleOptionNeonCyan24 => '亮青色';

  @override
  String get subtitleOptionPreserveAnimeSsaAssStylingRecommended25 =>
      '保留动漫 SSA/ASS 原始样式（推荐）';

  @override
  String get subtitleOptionLeavesSsaAssAnimeSubtitlesUntouched26 =>
      '保留 SSA/ASS 字幕的卡拉 OK 特效、样式和位置；普通 SRT/VTT 字幕使用自定义主题。';

  @override
  String get subtitleOptionScaleOnly27 => '仅缩放';

  @override
  String get subtitleOptionAppliesSizeScalingToSsaAss28 =>
      '仅调整 SSA/ASS 字幕尺寸，保留原字体、颜色和排版。';

  @override
  String get subtitleOptionOverrideColorsOutlines29 => '覆盖颜色与描边';

  @override
  String get subtitleOptionAppliesYourCustomColorsAndOutlines30 =>
      '使用自定义颜色和描边覆盖 SSA/ASS 字幕样式。';

  @override
  String get uiFinalTextSyncOverlayFixSection => '修正片段';

  @override
  String get uiFinalTextSyncOverlaySubtitleTiming => '字幕时间轴';

  @override
  String get uiFinalTextSyncOverlaySelectRangeSync => '选择范围并同步';

  @override
  String get uiFinalTextSyncOverlaySpeechDialogueSync => '语音对白同步';

  @override
  String get uiFinalAdultPageNo18SourcesYet => '暂无成人内容来源。';

  @override
  String get uiFinalAdultPage18SourcesFoundNothingToShow => '成人内容来源暂无可展示内容。';

  @override
  String get uiFinalAdultPageMarkAnAddonAs18Or =>
      '请在设置 > 插件中标记相应来源，或安装支持此分类的插件。';

  @override
  String get uiFinalAdultPageTheAddonsThisPageListsAnswered =>
      '当前插件未返回作品，请稍后重试。';

  @override
  String get uiFinalMyListPageSaveYourFavoriteMoviesAndTv => '收藏喜欢的电影和剧集，随时观看';

  @override
  String get uiFinalMyListPageTryAdjustingYourSearchQueryOr =>
      '请尝试调整搜索关键词或筛选条件';

  @override
  String get uiFinalAddonsSettingsPageCloudstreamEngineReady =>
      'CloudStream 引擎已就绪';

  @override
  String get uiFinalAddonsSettingsPageRuntimeSetupRequired => '需要配置运行环境';

  @override
  String get uiFinalAddonsSettingsPageNativeEngineActiveAndListeningFor =>
      '原生引擎已启动，正在等待查询。';

  @override
  String get uiFinalAddonsSettingsPageDeselectAll => '取消全选';

  @override
  String get uiFinalAddonsSettingsPageSelectAll => '全选';

  @override
  String get uiFinalAddonsSettingsPageNoDebridProviderIsSetUp =>
      '尚未配置 Debrid 服务';

  @override
  String get uiFinalIptvPortalsModalPortalsPlaylists => '服务与播放列表';

  @override
  String get uiFinalIptvPortalsModalIptvPortalsPlaylists => 'IPTV 服务与播放列表';

  @override
  String get uiFinalIptvPortalBrowserPageCheckHealth => '检测可用性';

  @override
  String get uiFinalIptvPortalBrowserPageNow => '正在播出：';

  @override
  String get uiFinalIptvPortalBrowserPageNext => '   即将播出：';

  @override
  String get uiFinalTvCalendarPageNoEpisodesFoundForThisDay => '当天暂无剧集播出';

  @override
  String get uiFinalTvCalendarPageTrySelectingAllOrADifferent =>
      '请选择全部播出平台或其他平台';

  @override
  String get uiFinalTvCalendarPageSelectAnotherDayFromTheTimeline =>
      '请在上方时间轴选择其他日期';

  @override
  String get uiFinalMusicPageDownloadedOfflineTapToRemove => '已离线下载（点击移除）';

  @override
  String get uiFinalMusicPageDownloadingQueued => '正在下载或排队…';

  @override
  String get uiFinalMusicPageDownloadTrackOffline => '下载歌曲至本地';

  @override
  String get uiFinalTmdbSettingsPageSavedOnThisDeviceEnterA =>
      '密钥已保存在本机，输入新密钥即可替换。';

  @override
  String get uiFinalTmdbSettingsPageFreeKeyFromThemoviedbOrg =>
      '从 themoviedb.org 免费申请密钥';

  @override
  String get uiFinalTraktSettingsPageCheckingCredentials => '正在验证凭据…';

  @override
  String get uiFinalTraktSettingsPageSignInToActivateTwoWay => '登录以启用双向云端同步';

  @override
  String get uiFinalSimklSettingsPageCheckingCredentials => '正在验证凭据…';

  @override
  String get uiFinalSimklSettingsPageSignInWithPinToActivate =>
      '使用 PIN 码登录以启用 Simkl 云端同步';

  @override
  String get uiFinalHomeUiSettingsPageCustomBackgroundActiveWithAmbientLight =>
      '自定义背景与氛围光已启用';

  @override
  String get uiFinalHomeUiSettingsPageUploadPhotosOrChooseCuratedDark =>
      '上传照片或选择精选深色壁纸';

  @override
  String get uiFinalBookDetailSheetResumeReading => '继续阅读';

  @override
  String get uiFinalBookDetailSheetReadNow => '立即阅读';

  @override
  String get uiFinalMagnetFilesViewConnectingToSwarmPeers => '正在连接节点…';

  @override
  String get uiFinalMagnetFilesViewP2pSwarm => 'P2P 节点网络';

  @override
  String get uiFinalWewatchQuizPageRate3TitlesToUnlockRecommendations =>
      '评价 3 部作品以获取推荐';

  @override
  String addonsRemoveCount(int count) {
    return '移除 $count 个插件？';
  }

  @override
  String addonsRemovedCount(int count) {
    return '已移除 $count 个插件。';
  }

  @override
  String addonsUsesServiceKey(String value) {
    return '使用你的 $value 密钥';
  }

  @override
  String addonsContainsPlugins(String value) {
    return '包含：$value';
  }

  @override
  String iptvCurrentChannel(int index, int total, String name) {
    return '频道 $index/$total · $name';
  }

  @override
  String iptvCurrentSource(int index, int total, String name) {
    return '播放源 $index/$total · $name';
  }

  @override
  String iptvNoPlayableStream(String name) {
    return '“$name”暂无可播放的直播源。请重新连接服务，或移除后添加其他服务。';
  }

  @override
  String iptvStopHealthCheck(int checked, int total) {
    return '停止（$checked/$total）';
  }

  @override
  String calendarNoNetworkEpisodes(String value) {
    return '$value 当天暂无剧集播出';
  }

  @override
  String musicLosslessQuality(String value) {
    return '$value · 高解析度无损音频';
  }

  @override
  String musicExtractingTrack(String value) {
    return '正在查找《$value》播放源…';
  }

  @override
  String musicDownloadingTrack(String title, int progress) {
    return '正在下载《$title》（$progress%）';
  }

  @override
  String accountLoggedInTrakt(String value) {
    return '已登录：$value';
  }

  @override
  String accountLoggedInSimkl(String value) {
    return '已登录：$value';
  }

  @override
  String wallpaperActivePalette(String value) {
    return '已启用壁纸及 $value 氛围光';
  }

  @override
  String wallpaperDefaultPalette(String value) {
    return '默认 $value 主题背景';
  }

  @override
  String bookDownloadingProgress(int progress) {
    return '正在下载 $progress%…';
  }

  @override
  String mediaCollectionPart(String value) {
    return '第 $value 部';
  }

  @override
  String magnetUsingProvider(String value) {
    return '正在通过 $value 获取文件…';
  }

  @override
  String magnetProviderCloud(String value) {
    return '$value 云端';
  }

  @override
  String aiDiscoverRated(int count) {
    return '获取推荐（已评价 $count 部作品）';
  }

  @override
  String iptvChannelsCount(int count) {
    return '$count 个频道';
  }

  @override
  String audiobookVoiceName(String value) {
    return '音色：$value';
  }

  @override
  String audiobookGeneratingProgress(int progress) {
    return '正在生成 $progress%';
  }

  @override
  String updateExecutableInstructions(String file) {
    return '赋予文件执行权限后运行：\nchmod +x \"$file\"\n./$file';
  }

  @override
  String get videoZeroCopy => '零拷贝';

  @override
  String get videoTextureViewOff => '关闭（TextureView）';

  @override
  String get aiRecMediaSeries => '剧集';

  @override
  String audiobookSplitNotice(String words, int parts) {
    return '此书约有 $words 词，将按章节自动拆分为 $parts 个部分并加入队列：';
  }

  @override
  String audiobookSplitPart(String name, String words) {
    return '$name（约 $words 词）';
  }

  @override
  String get configCopyModernGlassIsland => '现代玻璃悬浮播放器';

  @override
  String get configCopySleekFloatingGlassmorphismPlayerWithWaveformScrubber =>
      '悬浮玻璃播放器，带波形进度条及氛围光';

  @override
  String get configCopyVinylTurntableStudio => '黑胶唱片工作室';

  @override
  String get configCopyRotatingVinylDiscTonearmAnimationAnalogVintage =>
      '旋转唱片、唱臂动画及复古音量表';

  @override
  String get configCopyMinimalistFocusCapsule => '极简专注胶囊';

  @override
  String get configCopyCompactDistractionFreeFloatingCapsuleWithEssential =>
      '仅保留必要控制的紧凑悬浮播放器';

  @override
  String get configCopyImmersiveCanvasStudio => '沉浸式画布工作室';

  @override
  String get configCopyFullScreenCinematicAmbientBlurCanvasWith =>
      '全屏影院式模糊背景及大幅封面';

  @override
  String get configCopyCustomDragDropStudio => '自定义拖拽工作室';

  @override
  String get configCopyYourFullyCustomizedArrangedAndStyledAudio =>
      '自由调整布局与样式的音频播放器';

  @override
  String get configCopyDynamicAudioWaveformCanvas => '动态音频波形';

  @override
  String get configCopyProceduralAnimatedWaveformBarsWithLiveEqualizer =>
      '动态波形条及实时均衡器进度控制';

  @override
  String get configCopyNeonGradientProgressBar => '霓虹渐变进度条';

  @override
  String get configCopyMultiColorVibrantLinearGradientScrubberWith =>
      '多色渐变进度条及发光滑块';

  @override
  String get configCopyPrecisionGlassSlider => '精细玻璃滑块';

  @override
  String get configCopyTactileInteractiveGlassTrackWithTimecodeReadouts =>
      '带时间读数的交互式玻璃滑轨';

  @override
  String get configCopyRadialCircularRingScrubber => '环形进度控制';

  @override
  String get configCopyRadialCircularDialScrubberForCompactModern =>
      '适合紧凑界面的环形进度拨盘';

  @override
  String get configCopyCircleAuraGlow => '圆形光晕';

  @override
  String get configCopyLiquidGlassNeomorphic => '液态玻璃拟态';

  @override
  String get configCopyRoundedGlassSquare => '圆角玻璃方块';

  @override
  String get configCopyWideAccentPill => '宽幅强调色胶囊';

  @override
  String get configCopyScaleSpringBounce => '缩放与弹簧回弹';

  @override
  String get configCopyThemeAccentGlowAura => '主题色光晕';

  @override
  String get configCopyLiquidGlassRipple => '液态玻璃波纹';

  @override
  String get configCopy3dSubtleTiltPerspective => '轻微 3D 倾斜';

  @override
  String get configCopy3dRoundedSquareWithGlow => '发光 3D 圆角方形';

  @override
  String get configCopySpinningVinylDisc => '旋转黑胶唱片';

  @override
  String get configCopyFloatingGlassCard => '悬浮玻璃卡片';

  @override
  String get configCopyHiddenFocusMode => '隐藏 / 专注模式';

  @override
  String get configCopyCompactDenseGrid => '紧凑（密集网格）';

  @override
  String get configCopyStandardBalanced => '标准（均衡）';

  @override
  String get configCopySpaciousLargeCovers => '宽松（大封面）';

  @override
  String get configCopyRecommendedOnWindowsFasterInPracticeHere =>
      'Windows 推荐使用：实际运行较快，并可避开此前 Impeller 导致的 NVIDIA 驱动崩溃。';

  @override
  String get configCopyEngineDefaultKeptSelectableForTestingCoincided =>
      '引擎默认选项，保留用于测试。此前在本机出现过 NVIDIA 驱动崩溃提示。';

  @override
  String get configCopyTopBelowHeroBanner => '顶部（轮播图下方）';

  @override
  String get configCopyUnderCinemetaAddon => 'Cinemeta 插件下方';

  @override
  String get configCopyMiddleOfCatalog => '目录中部';

  @override
  String get configCopyBottomOfPage => '页面底部';

  @override
  String get configCopyImmersiveCinematicCarousel => '沉浸式影院轮播';

  @override
  String get configCopyCompactSpotlight => '紧凑精选轮播';

  @override
  String get configCopyMinimalistHeader => '极简页眉';

  @override
  String get configCopyDualFloatingOrbs => '双浮动光球';

  @override
  String get configCopyTopAuroraHorizon => '顶部极光';

  @override
  String get configCopyFullDeepAmbientMesh => '全屏深色氛围网格';

  @override
  String get configCopyPulsingCore => '脉动光核';

  @override
  String get configCopyStandardBalanced2 => '标准均衡';

  @override
  String get configCopyCinematicLargePosters => '影院式（大海报）';

  @override
  String get configCopyCloudVault => '云端库';

  @override
  String get configCopyHighSpeedCloudDatabaseWith9000 =>
      '包含 9,000 多个 IPTV 服务器的高速云端数据库';

  @override
  String get configCopyLiveScrapersFromRedditIptvSubreddits =>
      '从 Reddit IPTV 社区获取的直播来源';

  @override
  String get configCopyRichCardWithBadges => '带徽标的详细卡片';

  @override
  String get configCopyCompactRow => '紧凑列表';

  @override
  String get configCopyGridCards => '网格卡片';

  @override
  String get configCopyDetailedListWithEpg => '带节目单的详细列表';

  @override
  String get configCopyCompactChannelList => '紧凑频道列表';

  @override
  String get configCopySpaciousLargePosters => '宽松（大海报）';

  @override
  String get configCopyVerticalContinuousWebtoon => '纵向连续阅读';

  @override
  String get configCopyHorizontalLeftToRight => '横向（从左至右）';

  @override
  String get configCopyHorizontalRightToLeftManga => '横向（从右至左）';

  @override
  String get configCopyFullScreen100 => '全屏（100%）';

  @override
  String get configCopyCompact720px => '紧凑（720px）';

  @override
  String get configCopyStandard900px => '标准（900px）';

  @override
  String get configCopyWide1150px => '宽幅（1150px）';

  @override
  String get configCopyPitchBlack => '纯黑';

  @override
  String get configCopyDeepCharcoal => '深炭灰';

  @override
  String get configCopySepiaDark => '深褐色';

  @override
  String get configCopyFloatingGlassIsland => '悬浮玻璃岛';

  @override
  String get configCopyDockedBottomBar => '底部固定工具栏';

  @override
  String get configCopyMinimalistFloatingPill => '极简悬浮胶囊';

  @override
  String get configCopyRotating33rpmVinylDiscWithTonearmAnd =>
      '33 转黑胶唱片与唱臂，营造温暖的录音室氛围';

  @override
  String get configCopyCyberpunkWaveVisualizer => '赛博朋克波形可视化';

  @override
  String get configCopyRealTimeAnimatedAudioVisualizerCanvasWith =>
      '带霓虹光效的实时音频可视化';

  @override
  String get configCopyLiquidGlassSanctuary => '液态玻璃空间';

  @override
  String get configCopyDeepOpticalRefractionGlassSheetsPoweredBy =>
      '基于高斯模糊的磨砂背景';

  @override
  String get configCopyCinematicPosterFocus => '影院式封面聚焦';

  @override
  String get configCopyMassiveEdgeToEdgeImmersiveAlbumArt => '全幅沉浸式专辑封面与模糊背景';

  @override
  String get configCopyCustomDragDropFullPlayer => '自定义拖拽全屏播放器';

  @override
  String get configCopyYourFullyCustomizedArrangedAndStyledFullscreen =>
      '自由调整布局与样式的全屏播放器';

  @override
  String get configCopyLiquidGlassTrackSlider => '液态玻璃进度滑块';

  @override
  String get configCopyRefractiveFrostedGlassSliderTrackWithSmooth =>
      '折射磨砂玻璃滑轨及平滑滑块';

  @override
  String get configCopyPrecisionTactileSlider => '精细触感滑块';

  @override
  String get configCopyRadialCircularRingDial => '环形进度拨盘';

  @override
  String get configCopyAuraGlowCircle => '圆形光晕';

  @override
  String get configCopyNeonGlassSquare => '霓虹玻璃方块';

  @override
  String get configCopySpinningVinylDiscWithCenterLabel => '带中心标签的旋转黑胶唱片';

  @override
  String get configCopy3dFloatingGlassCardWithElevation => '带层次的 3D 悬浮玻璃卡片';

  @override
  String get configCopyRoundedNeomorphicSquareWithGlow => '发光圆角拟态方形';

  @override
  String get configCopyAtmosphericGlowOrb => '氛围光球';

  @override
  String get configCopyClassicWhite => '经典白色';

  @override
  String get configCopyCrispWhiteTextWithBlackOutline => '清晰白字与黑色描边';

  @override
  String get configCopyWarmYellowTextWithSubtleShadowAnd => '暖黄文字与柔和阴影描边';

  @override
  String get configCopyStreamingBox => '流媒体背景框';

  @override
  String get configCopyWhiteTextInsideA50TranslucentBlack => '白字与 50% 半透明黑色背景';

  @override
  String get configCopyBoldYellowTextWithSolidOpaqueBlack => '粗体黄字与不透明黑色背景';

  @override
  String get configCopyAnimeClean => '清爽动漫';

  @override
  String get configCopyBoldWhiteTextWithDeepOutlineShadow => '粗体白字与深色描边阴影';

  @override
  String get configCopyCyberpunkCyan => '赛博青色';

  @override
  String get configCopyVibrantCyanTextWithDarkBorder => '亮青文字与深色描边';

  @override
  String get configCopyNightModeWarm => '暖色夜间模式';

  @override
  String get configCopySoftCreamTextWith40TranslucentBackground =>
      '柔和米色文字与 40% 半透明背景';

  @override
  String get configCopyUserConfiguredCustomSubtitleStyles => '用户自定义字幕样式';

  @override
  String get configCopyStandardVideoPlaybackWithoutNeuralUpscalingShaders =>
      '不使用神经网络超分着色器的标准播放';

  @override
  String get configCopyModeAFastBalanced => '模式 A（快速 / 均衡）';

  @override
  String get configCopyRestoresLineArtAndUpscalesCleanlyBalanced =>
      '恢复线条并清晰放大，GPU 负载均衡，适合 1080p 动漫及移动或集成显卡。';

  @override
  String get configCopyModeAHighQualityHq => '模式 A（高画质）';

  @override
  String get configCopyUltraCrispPerceptualLineReconstructionAndUpscale =>
      '使用大型卷积网络重建清晰线条并超分，适合桌面独立显卡。';

  @override
  String get configCopyModeBSoftDenoise => '模式 B（柔化 / 降噪）';

  @override
  String get configCopySoftLineReconstructionAndArtifactReductionBest =>
      '柔和重建线条并减少压缩伪影，适合模糊或较旧的动漫。';

  @override
  String get configCopyModeCDeblurUpscale => '模式 C（去模糊 / 超分）';

  @override
  String get configCopyAggressiveDeblurringAndScalingBestFor720p =>
      '较强的去模糊及超分，适合 720p 或 480p 低分辨率动漫。';

  @override
  String get configCopyFsr10Smooth => 'FSR 1.0（平滑）';

  @override
  String get configCopyEdgeAdaptiveUpscalingForLiveActionAnd =>
      '适用于真人影视及较旧片源的边缘自适应超分。侧重放大而非锐化；片源已达到显示分辨率时作用有限。';

  @override
  String get configCopyFsr10Sharp => 'FSR 1.0（锐化）';

  @override
  String get configCopyFsrWithContrastAdaptiveSharpeningAddsBite =>
      '带对比度自适应锐化的 FSR，可增强模糊或低码率片源；2K 或 4K 片源可能出现过度锐化。';

  @override
  String get configCopyAutoSafeHardwareAccelerated => '自动安全（硬件加速）';

  @override
  String get configCopyGpuHardwareDecodingWithSafeDriverFallbacks =>
      'GPU 硬件解码并支持安全回退（推荐）';

  @override
  String get configCopyPureCpuDecodingUsingFfmpegLibavcodecGuarantees =>
      '使用 FFmpeg libavcodec 进行 CPU 解码，适合排查硬件解码黑屏。';

  @override
  String get configCopyDirectGpuHardwareDecodingDirect3d11Mediacodec =>
      '直接使用 GPU 硬件解码（Direct3D 11 / MediaCodec / VAAPI）。';

  @override
  String get configCopySubtleGlass => '轻透玻璃';

  @override
  String get configCopyBalancedLiquid => '均衡液态玻璃';

  @override
  String get configCopyHyperJelly => '弹性果冻';

  @override
  String get configCopyCrystalPrism => '水晶棱镜';

  @override
  String get configCopyFrostedCyber => '赛博磨砂';

  @override
  String get configCopySignalTeal => '信号青';

  @override
  String get configCopyAmethystViolet => '紫水晶';

  @override
  String get configCopyCyberpunkNeon => '赛博霓虹';

  @override
  String get configCopyEmeraldAurora => '翡翠极光';

  @override
  String get configCopySunsetCrimson => '落日绯红';

  @override
  String get configCopyMidnightSapphire => '午夜蓝宝石';

  @override
  String get configCopyGoldenAmber => '金色琥珀';

  @override
  String get configCopyVampireRed => '暗夜红';

  @override
  String get configCopyPinkBarbie => '芭比粉';

  @override
  String get configCopyEmberCrimson => '余烬红';

  @override
  String get configCopyStudioBone => '暖象牙白';

  @override
  String get configCopyCyberNeonCity => '霓虹都市';

  @override
  String get configCopyCosmicNebula => '宇宙星云';

  @override
  String get configCopyDarkLiquidSilk => '暗色流体丝绸';

  @override
  String get configCopySynthwaveHorizon => '复古电子地平线';

  @override
  String get configCopyMoodyForestMist => '幽静森林薄雾';

  @override
  String get configCopyAbstractDarkNeon => '抽象暗色霓虹';

  @override
  String get configCopyRecommendedForYouTrakt => '为你推荐（Trakt）';

  @override
  String get configCopyPersonalizedBasedOnYourTraktWatchHistory =>
      '根据 Trakt 观看历史进行个性化推荐';

  @override
  String get configCopyTrendingThisWeek => '本周热门';

  @override
  String get configCopyWhatTraktViewersAreWatchingRightNow => 'Trakt 用户正在观看的作品';

  @override
  String get configCopyPopularNow => '当前热门';

  @override
  String get configCopyMostWatchedTitlesAcrossTrakt => 'Trakt 观看次数最多的作品';

  @override
  String get configCopyComingSoon => '即将上映';

  @override
  String get configCopyMostAnticipatedUpcomingReleases => '最受期待的即将上映作品';

  @override
  String get configCopyFromTrakt => '来自 Trakt';

  @override
  String get configCopyRecommendedForYouSimkl => '为你推荐（Simkl）';

  @override
  String get configCopyThe1970s => '70 年代经典';

  @override
  String get configCopyThe1980s => '80 年代经典';

  @override
  String get configCopyThe2000s => '2000 年代经典';

  @override
  String get configCopyThe2010s => '2010 年代经典';

  @override
  String get configCopyThe90sAction => '90 年代 · 动作';

  @override
  String get configCopyThe90sComedy => '90 年代 · 喜剧';

  @override
  String get configCopyThe90sHorror => '90 年代 · 恐怖';

  @override
  String get configCopyThe90sSciFi => '90 年代 · 科幻';

  @override
  String get configCopyThe90sAnimation => '90 年代 · 动画';

  @override
  String get configCopyThe90sThriller => '90 年代 · 惊悚';

  @override
  String get configCopyGodfatherCollection => '教父系列';

  @override
  String get configCopyRockyAndCreed => '洛奇与奎迪系列';

  @override
  String get configCopyBackToTheFuture => '回到未来';

  @override
  String get configCopyAlien => '异形';

  @override
  String get configCopyDieHard => '虎胆龙威';

  @override
  String get configCopyLethalWeapon => '致命武器';

  @override
  String get configCopyTheTerminator => '终结者';

  @override
  String get configCopyPredator => '铁血战士';

  @override
  String get configCopyJurassicPark => '侏罗纪公园';

  @override
  String get configCopyRambo => '第一滴血';

  @override
  String get configCopyIndianaJones => '夺宝奇兵';

  @override
  String get configCopyTheMarxBrothers => '马克思兄弟';

  @override
  String get configCopyGrouchoAndHisBrothers13Films1929 =>
      '马克思兄弟的 13 部电影（1929—1949 年）';

  @override
  String get configCopyOnHold => '暂停观看';

  @override
  String get configCopyDropped => '已弃剧';

  @override
  String get configCopyRatings => '评分';

  @override
  String get configCopyTrending => '热门';

  @override
  String get configCopyTopRated => '高分';

  @override
  String get configCopyNewUpcoming => '最新与即将上映';

  @override
  String get configCopyWatchlist => '待看片单';

  @override
  String get configCopyHistory => '观看历史';

  @override
  String get configCopyCollection => '收藏';

  @override
  String get configCopyRecommendations => '推荐';

  @override
  String get configCopyAnticipated => '备受期待';

  @override
  String get configCopyUntitledList => '未命名片单';

  @override
  String get configCopyStreamSource => '播放源';

  @override
  String get configCopyAllLanguages => '全部语言';

  @override
  String get configCopyDefaultZplaySubfont => '默认（内置字幕字体）';

  @override
  String get configCopyAddToFavorites => '添加收藏';

  @override
  String get configCopyHidePassword => '隐藏密码';

  @override
  String get configCopyAspectFitContain => '画面比例：适应屏幕';

  @override
  String get configCopyAspectFillZoomCrop => '画面比例：填充（裁剪）';

  @override
  String get configCopyAspectStretchFill => '画面比例：拉伸填充';

  @override
  String get configCopyPreviousChapterPage => '上一页章节';

  @override
  String get configCopyNextChapterPage => '下一页章节';

  @override
  String get configCopyClearChapterSearch => '清除章节搜索';

  @override
  String get configCopyClearSearch => '清除搜索';

  @override
  String get configCopyReaderCustomization => '阅读器自定义';

  @override
  String get configCopyZoomOut => '缩小（-）';

  @override
  String get configCopyZoomIn => '放大（+）';

  @override
  String get configCopyTogglePageDeck => '切换页面缩略图';

  @override
  String get configCopyRearrangeStreams => '调整直播画面顺序';

  @override
  String get configCopyAllCategories => '全部分类';

  @override
  String get configCopyFavorites => '收藏';

  @override
  String get configCopyUnknownSource => '未知来源';

  @override
  String get configCopyUnknown => '未知';

  @override
  String get configCopyUnknownTitle => '未知标题';

  @override
  String get configCopyUnknownTrack => '未知歌曲';

  @override
  String get configCopyUntitledBook => '未命名书籍';

  @override
  String get configCopyUntitledAudiobook => '未命名有声书';

  @override
  String get configCopyUnknownAddon => '未知插件';

  @override
  String get configCopyUnknownPlugin => '未知插件';

  @override
  String get configCopyTitles => '作品';

  @override
  String get configCopySkipIntro => '跳过片头';

  @override
  String get configCopySkipRecap => '跳过前情回顾';

  @override
  String get configCopySkipCredits => '跳过片尾';

  @override
  String get configCopySkipPreview => '跳过预告';

  @override
  String get configCopySegment => '片段';

  @override
  String get configCopyPublisher => '出版社';

  @override
  String get configCopySize => '大小';

  @override
  String get configCopyTvShort => '电视短篇';

  @override
  String get configCopySpecial => '特别篇';

  @override
  String get configCopyAiring => '播出中';

  @override
  String get configCopyUpcoming => '即将播出';

  @override
  String get configCopyCancelled => '已取消';

  @override
  String get configCopyOnHiatus => '暂停播出';

  @override
  String get configCopyAiringSoon => '即将开播';

  @override
  String get configCopySearchesTheWyzieSubtitleCatalogueForMovies =>
      '通过 Wyzie 字幕目录搜索电影和剧集字幕。';

  @override
  String get configCopyMintsTheAnonymousTokenTheAudionestAudiobook =>
      '生成 Audionest 有声书搜索 API 所需的匿名令牌。';

  @override
  String get configCopyBearerForTheAudionestAudiobookSearchEndpoint =>
      'Audionest 有声书搜索接口的 Bearer 令牌。';

  @override
  String get configCopyFirebaseKeyForThePaper2audioPdfTo =>
      'paper2audio PDF 转有声书服务的 Firebase 密钥。';

  @override
  String get configCopyBearerForTheVidgodCloudCacheBehind =>
      'VidGod 云端缓存服务的 Bearer 令牌。';

  @override
  String get configCopyBearerForTheFilms365DirectStreamApi =>
      'Films365 播放接口的 Bearer 令牌。';

  @override
  String get configCopyIdentifiesTheTraktApplicationThePairingFlow =>
      '用于标识 Trakt 应用，并在设备关联及 API 请求中使用。';

  @override
  String get configCopyExchangesTheDeviceCodeForATrakt =>
      '将设备代码交换为 Trakt 访问令牌。';

  @override
  String get configCopyYourKeyIsInUse => '正在使用你的密钥。';

  @override
  String get configCopySuppliedAtBuildTimeForThisBuild => '由当前构建在编译时提供。';

  @override
  String get configCopyRunningOnTheValueThisAppShips => '正在使用应用内置的值。';

  @override
  String get configCopyNoKeyAvailableSoThisSourceStays => '没有可用密钥，当前来源保持停用。';

  @override
  String get configCopyThatKeyWasRejectedByTmdb => 'TMDB 拒绝了该密钥';

  @override
  String get configCopyCouldNotReachTmdb => '无法连接 TMDB';

  @override
  String get configCopy10PicksFrom1970To1979 => '10 部作品（1970—1979 年）';

  @override
  String get configCopy10PicksFrom1980To1989 => '10 部作品（1980—1989 年）';

  @override
  String get configCopy10PicksFrom2000To2009 => '10 部作品（2000—2009 年）';

  @override
  String get configCopy10PicksFrom2010To2019 => '10 部作品（2010—2019 年）';

  @override
  String get configCopy10PicksFrom1990To1999 => '10 部作品（1990—1999 年）';

  @override
  String get configCopy3Films1972To1990 => '3 部作品（1972—1990 年）';

  @override
  String get configCopy9Films1976To2023 => '9 部作品（1976—2023 年）';

  @override
  String get configCopy3Films1985To1990 => '3 部作品（1985—1990 年）';

  @override
  String get configCopy7Films1979To2024 => '7 部作品（1979—2024 年）';

  @override
  String get configCopy5Films1988To2013 => '5 部作品（1988—2013 年）';

  @override
  String get configCopy4Films1987To1998 => '4 部作品（1987—1998 年）';

  @override
  String get configCopy6Films1984To2019 => '6 部作品（1984—2019 年）';

  @override
  String get configCopy5Films1987To2022 => '5 部作品（1987—2022 年）';

  @override
  String get configCopy6Films1993To2022 => '6 部作品（1993—2022 年）';

  @override
  String get configCopy5Films1982To2019 => '5 部作品（1982—2019 年）';

  @override
  String get configCopy5Films1981To2023 => '5 部作品（1981—2023 年）';

  @override
  String get configCopyStremioBasedMultiResolutionHttpStreamScraper =>
      '111477 · 多分辨率视频源';

  @override
  String get configCopyDirectHighSpeedHttpMediaStorageScraper =>
      'Vadapav · HTTP 视频源解析';

  @override
  String get configCopy4kHdDirectStreamExtractor => '4KHDHub · 4K 与高清视频源';

  @override
  String get configCopyFastMultiSourceStreamDownloader =>
      'XDownloader · 多来源视频流解析';

  @override
  String get configCopyVideasyMultiCdnEncryptedHlsScraper =>
      'Videasy · 加密视频流解析';

  @override
  String get configCopyVidsrcStreamingNetworkResolver => 'VidSrc · 视频流解析';

  @override
  String get configCopy2embedMultiHostStreamAggregator =>
      'MultiEmbed · 多主机视频流解析';

  @override
  String get configCopyMultiSourceHdVideoCoreExtractor => 'VidCore · 视频流解析';

  @override
  String get configCopyUltraFastHlsStreamingNetwork => 'FlyStream · HLS 视频流解析';

  @override
  String get configCopyMovienightMultiServerHlsStreams =>
      'MovieNight · 多服务器视频流解析';

  @override
  String get configCopyDirectMediaDownloadStreamExtractor =>
      'DownloadEverything · 媒体下载与视频流解析';

  @override
  String get configCopyDirectEncryptedMp4HlsSourceProvider => 'Movy · 加密视频流解析';

  @override
  String get configCopyFastCloudHlsStreamResolver => 'Vuflix · HLS 视频流解析';

  @override
  String get configCopyRiveMultiServerDirectStreamProvider =>
      'RiveStream · 多服务器视频流解析';

  @override
  String get configCopyCinejoyMultiCdnVideoSourceProvider =>
      'Cinejoy · 多 CDN 视频流解析';

  @override
  String get configCopyDuloHighSpeedDirectStreamNetwork => 'Dulo · 视频流解析';

  @override
  String get configCopyVidupCloudVideoHostingScraper => 'VidUp · 云端视频流解析';

  @override
  String get configCopyFlaxmoviesMultiCdnDirectStreams =>
      'FlaxMovies · 多 CDN 视频流解析';

  @override
  String get configCopyMultiServerCloudVideoStreams => 'VidGod · 云端视频流解析';

  @override
  String get configCopyLowLatencyDirectStreamingProvider => 'VidFast · 视频流解析';

  @override
  String get configCopyFastCloudVideoSourceProvider => 'PeeStream · 云端视频流解析';

  @override
  String get configCopyLookmovieDirectMultiQualityStreams =>
      'LookMovie · 视频流解析';

  @override
  String get configCopyHexaMultiHostVideoExtractor => 'Hexa · 多主机视频流解析';

  @override
  String get configCopyBcineDirectMasterHlsProvider => 'Bcine · HLS 视频流解析';

  @override
  String get configCopyMappleFastStreamingProvider => 'Mapple · 视频流解析';

  @override
  String get configCopyNovaMultiServerStreamExtractor => 'Nova · 多服务器视频流解析';

  @override
  String get configCopyMegasourceMultiCdnVideoNetwork =>
      'MegaSource · 多 CDN 视频流解析';

  @override
  String get configCopyPurstreamDirectVideoStreamResolver =>
      'Purstream · 视频流解析';

  @override
  String get configCopyVidapiDirectVideoSourceExtractor => 'VidApi · 视频流解析';

  @override
  String get configCopyVidrockCloudVideoProvider => 'VidRock · 云端视频流解析';

  @override
  String get configCopyVidvaultSecureStreamingNetwork => 'VidVault · 视频流解析';

  @override
  String get configCopyVidzeeHighSpeedVideoProvider => 'VidZee · 视频流解析';

  @override
  String get configCopyCinesrcDirectMasterHlsWithBright67Subtitles =>
      'CineSrc · HLS 视频流解析';

  @override
  String get configCopyCinesuDirectVideoStreamExtractor => 'CineSu · 视频流解析';

  @override
  String get configCopyFrameMultiResolutionStreamProvider => 'Frame · 多分辨率视频源';

  @override
  String get configCopyFsharetvCloudStreamingNetwork => 'FshareTV · 云端视频流解析';

  @override
  String get configCopyFsonicDirectCloudVideoScraper => 'FSonic · 云端视频流解析';

  @override
  String get configCopyFsonlineMultiHostStreamResolver => 'FSOnline · 多主机视频流解析';

  @override
  String get configCopyKisskhAsianDramaAnimeStreamingProvider =>
      'KissKH · 亚洲剧集与动漫视频源';

  @override
  String get configCopyLmscriptVideoSourceExtractor => 'LMScript · 视频流解析';

  @override
  String get configCopyMeowtvDirectStreamingNetwork => 'MeowTV · 视频流解析';

  @override
  String get configCopyVidlinkFastMultiCdnStreamProvider =>
      'VidLink · 多 CDN 视频流解析';

  @override
  String get configCopyVixsrcDirectMasterStreamingExtractor => 'VixSrc · 视频流解析';

  @override
  String get configCopyXpassMultiServerVideoScraper => 'XPass · 多服务器视频流解析';

  @override
  String get configCopyZxcstreamMultiSourceDirectProvider =>
      'ZxcStream · 多来源视频流解析';

  @override
  String get configCopyBollywoodHindiDualAudioHollywoodDirectStreams =>
      'HindMoviez · 宝莱坞、印地语双音轨与好莱坞视频源';

  @override
  String get configExtraStandard => '标准';

  @override
  String get configExtraRecommended => '推荐';

  @override
  String get configExtraUltraQuality => '超高画质';

  @override
  String get configExtraDenoise => '降噪';

  @override
  String get configExtraDeblur => '去模糊';

  @override
  String get configExtraDefault => '默认';

  @override
  String get configExtra100Reliable => '高兼容性';

  @override
  String get configExtraMaxGpu => '最大化 GPU 加速';

  @override
  String get configExtraSimilarTo => '相似作品';

  @override
  String get configExtraMoviesTv => '电影与剧集';

  @override
  String get configExtraLiveTv => '电视直播';

  @override
  String get configExtraMyList => '我的片单';

  @override
  String get configExtraDownloads => '下载';

  @override
  String get configExtraManga => '漫画';

  @override
  String get configExtraBooks => '电子书';

  @override
  String get configExtraAudiobooks => '有声书';

  @override
  String get configExtraMusic => '音乐';

  @override
  String get configExtraCollections => '影视合集';

  @override
  String get configExtraAnime => '动漫';

  @override
  String get configExtraAll => '全部';

  @override
  String get configExtraNone => '无';

  @override
  String get configExtraSeries => '剧集';

  @override
  String get configExtraMovie => '电影';

  @override
  String get configExtraCustomStream => '自定义直播源';

  @override
  String get configExtraLiveStream => '直播源';

  @override
  String get configExtraTorrentEngine => '种子引擎';

  @override
  String get configExtraRefusedByProvider => '来源拒绝访问';

  @override
  String get configExtraAccountRejected => '账户验证被拒绝';

  @override
  String get appearanceDetailCustomActive => '自定义背景已启用';

  @override
  String get appearanceDetailDefaultTheme => '默认主题';

  @override
  String get appearanceDetailSpotlightOn => '精选轮播已启用';

  @override
  String get appearanceDetailCompact => '紧凑模式';

  @override
  String get appearanceDetailWebtoon => '纵向阅读';

  @override
  String get appearanceDetailHorizontal => '横向阅读';

  @override
  String get appearanceDetailSkiaRecommended => 'Skia（推荐）';

  @override
  String get appearanceDetailDisabled => '已停用';

  @override
  String get appearanceDetailBackgroundImageUploadedAndAppliedAcrossAllUi =>
      '背景图片已上传并应用至全局界面。';

  @override
  String get appearanceDetailPleaseEnterAValidHttpOrHttpsImage =>
      '请输入有效的 HTTP 或 HTTPS 图片地址。';

  @override
  String get appearanceDetailCustomBackgroundUrlApplied => '已应用自定义背景地址。';

  @override
  String get appearanceDetailUploadPhotoFromDevice => '从设备上传图片';

  @override
  String get appearanceDetailBackgroundResetToDefaultTheme => '背景已恢复为默认主题。';

  @override
  String appearanceDetailAppliedWallpaperName(String name) {
    return '已应用壁纸：$name';
  }

  @override
  String get appearanceDetailRequiresTraktLoginInSettingsTrakt =>
      '请先在设置 > Trakt 中登录';

  @override
  String get appearanceDetailRequiresSimklLoginInSettingsSimkl =>
      '请先在设置 > Simkl 中登录';

  @override
  String get appearanceDetailDisconnected => '未连接';

  @override
  String get appearanceDetailPreviewEnableGlassAbove => '预览（请先启用上方玻璃效果）';

  @override
  String get appearanceDetailDragDropLayout => '拖拽布局';

  @override
  String get appearanceDetailSeekBarCanvas => '进度条画布';

  @override
  String get appearanceDetailPlayButtonPhysics => '播放按钮与交互动效';

  @override
  String get appearanceDetailArtworkFrame => '封面与边框';

  @override
  String get appearanceDetailArtworkVinylFrame => '封面与黑胶唱片边框';

  @override
  String get appearanceDetailChapterBookTitles => '章节与书名';

  @override
  String get appearanceDetailSeekBarScrubberCanvas => '进度条画布';

  @override
  String get appearanceDetailPrimaryControlsPlayPauseSkip10s =>
      '主要控制（播放、暂停、快进或快退 10 秒）';

  @override
  String get appearanceDetailSecondaryControlsSpeedPillVolume => '次要控制（倍速与音量）';

  @override
  String get appearanceDetailPremadeChaptersPanelButton => '章节面板按钮';

  @override
  String get appearanceDetailPlay => '播放';

  @override
  String get appearanceDetailChapter4TheSecretsOfTheNight => '第 4 章：夜的秘密';

  @override
  String get appearanceDetailChapter4Of24HarryPotterTheSorcerer =>
      '第 4/24 章 · 哈利·波特与魔法石';

  @override
  String get appearanceDetailChapter1TheBoyWhoLived => '第 1 章：大难不死的男孩';

  @override
  String get appearanceDetailChapter2TheVanishingGlass => '第 2 章：消失的玻璃';

  @override
  String get appearanceDetailChapter3TheLettersFromNoOne => '第 3 章：无人寄来的信';

  @override
  String get appearanceDetailChapter4TheKeeperOfTheKeys => '第 4 章：钥匙保管员';

  @override
  String get appearanceDetailChapter5DiagonAlley => '第 5 章：对角巷';

  @override
  String get appearanceDetailArtworkTurntable => '封面与唱盘';

  @override
  String get appearanceDetailAlbumArtVinylTurntable => '专辑封面与黑胶唱盘';

  @override
  String get appearanceDetailTrackArtistAlbumTitles => '歌曲、艺人及专辑名称';

  @override
  String get appearanceDetailTrackTitleQualityBadge => '歌曲名称与音质标识';

  @override
  String get appearanceDetailLosslessHiResAudioQualityBadge => '高解析度无损音质标识';

  @override
  String get appearanceDetailPrimaryControlsPlayPauseSkipShuffleRepeat =>
      '主要控制（播放、暂停、切歌、随机及循环）';

  @override
  String get appearanceDetailSecondaryControlsVolumeSlider => '次要控制（音量滑块）';

  @override
  String get appearanceDetailSyncedLyricsQueueQuickButtons => '同步歌词与播放队列快捷按钮';

  @override
  String get appearanceDetailAudiobookCoverArtworkDeck => '有声书封面';

  @override
  String get appearanceDetailTitleAuthorChapterLabel => '书名、作者与章节';

  @override
  String get appearanceDetailSeekBarWaveformCanvasScrubber => '进度条与波形画布';

  @override
  String get appearanceDetailMainPlayPauseSkip10sCluster => '播放、暂停及快进快退控制';

  @override
  String get appearanceDetailSpeedSelectorVolumeControls => '倍速选择与音量控制';

  @override
  String get appearanceDetailPremadeSlidingChaptersPanelTrigger => '章节面板入口';

  @override
  String get appearanceDetailTheWayOfKings => '王者之路';

  @override
  String get appearanceDetailBrandonSandersonChapter1Stormblessed =>
      '布兰登·桑德森 · 第 1 章：风暴降临';

  @override
  String get animeSourceSettingsTitle => '动漫数据源';

  @override
  String get animeSourceSettingsSubtitle => '切换动漫目录、搜索和详情的数据源，不改变播放源。';

  @override
  String get animeSourceAniList => 'AniList';

  @override
  String get animeSourceBangumi => 'Bangumi（中文元数据）';

  @override
  String get animeSourceFallback => '自动回退与补充数据';

  @override
  String get animeSourceFallbackHelp =>
      'Bangumi 请求失败或不支持筛选时使用 AniList，并补充角色、播放匹配等字段。';

  @override
  String get animeSourceMirror => '可选 HTTPS 镜像';

  @override
  String get animeSourceMirrorHelp =>
      '留空使用官方接口。仅填写可信、获准使用且兼容 Bangumi 的镜像域名；公开搜索请求将发送至该镜像。';

  @override
  String get animeSourceProxy => '可选 HTTP 代理';

  @override
  String get animeSourceProxyHelp =>
      '例如 http://127.0.0.1:7890。留空时优先使用进程代理环境变量，其次使用 Windows 系统代理。';

  @override
  String get animeSourceSave => '保存网络设置';

  @override
  String get animeSourceSaved => '网络设置已保存';

  @override
  String get animeSourceInvalid => '地址无效。镜像须为 HTTPS 域名，代理须为带端口的 HTTP 地址。';

  @override
  String get animeSourceIdentityHelp =>
      '现阶段 Bangumi 目录仅展示有可靠 AniList ID 对照的作品，保留现有历史与收藏标识。';

  @override
  String get animeSourceCheck => '测试 Bangumi 连接';

  @override
  String get animeSourceCheckOk => 'Bangumi 连接成功';

  @override
  String get animeSourceCheckFail => 'Bangumi 连接失败，请检查网络配置。';
}
