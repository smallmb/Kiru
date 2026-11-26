import 'dart:convert';

import 'package:flutter/material.dart' as m;
import 'package:zplay/services/settings/locale_settings.dart';

const _zhTextJson = r'''
{
  "+0.1s": "+0.1 秒",
  "+0.5s": "+0.5 秒",
  "100% reliable hardware-accelerated subtitle overlay across Android, iOS, Windows, Mac, and Linux with full styling support.": "提供可靠的硬件加速字幕叠加，支持 Android、iOS、Windows、macOS 和 Linux，并可完整调整字幕样式。",
  "2X Speed": "2 倍速",
  "45+ Repos": "45+ 个仓库",
  "9.6k+": "9.6k+",
  "A": "A",
  "ACTIVE": "已启用",
  "ACTIVE PROVIDER": "当前提供方",
  "AI Audiobook Studio & EPUB Generator": "AI 有声书工作室与 EPUB 生成器",
  "AI Narrator Voice (Kokoro Engine)": "AI 旁白音色（Kokoro 引擎）",
  "AI Recommendation Quiz": "AI 推荐问答",
  "AMBIENT BACKGROUND LIGHTING & MOVING GLOWS": "环境背景光与动态光晕",
  "ANDROID RENDERING ENGINE": "Android 渲染引擎",
  "AUDIO TRACKS": "音轨",
  "Active Watchdog": "主动监控",
  "Add": "添加",
  "Add Channel": "添加频道",
  "Add CloudStream Repository": "添加 CloudStream 仓库",
  "Add Live Stream Feed": "添加直播源",
  "Add M3U Playlist Subscription": "添加 M3U 播放列表订阅",
  "Add Personal Audiobook": "添加个人有声书",
  "Add Quick Channel": "快速添加频道",
  "Add Repository": "添加仓库",
  "Add Stremio Addon": "添加 Stremio 插件",
  "Add Xtream Codes Portal": "添加 Xtream Codes 门户",
  "Add public M3U playlists (e.g. iptv-org) to a channel's stream list": "将公开的 M3U 播放列表（例如 iptv-org）添加到频道的播放源列表",
  "Add your own free TMDb key to rank the six \"The 90s\" rails by ": "添加免费的个人 TMDb 密钥，即可按实际热度为六个“90 年代”内容栏排序。",
  "Added": "已添加",
  "Addons provide metadata, catalogs, and streaming sources. Hold and drag to reorder priority. Providers higher up load and appear first in watch sources.": "插件可提供元数据、目录和播放源。按住并拖动即可调整优先级；排在前面的提供方会优先加载，并首先显示在播放源列表中。",
  "Addons that take the key as a plain URL parameter accept a {realdebrid} style placeholder. Addons that hide it inside a base64 config blob have to be pasted fully configured instead.": "如果插件通过普通 URL 参数读取密钥，可以使用 {realdebrid} 这样的占位符。若密钥嵌在 Base64 配置中，请先完成配置，再粘贴完整网址。",
  "Albums & Discography": "专辑与作品目录",
  "All": "全部",
  "All Platforms": "所有平台",
  "All matching plugins are already installed!": "所有匹配的插件都已安装！",
  "All red Lamb' just to tease you, ah": "All red Lamb' just to tease you, ah",
  "Alphabetical": "按字母排序",
  "Ambient Backdrop Lighting": "环境背景光",
  "Ambient Light Pattern": "环境光效果",
  "Android": "Android",
  "Appearance": "外观",
  "Apply": "应用",
  "Apply Active": "应用并启用",
  "Apply As Active Player": "应用为当前播放器",
  "Artwork & Turntable Presentation": "封面与唱盘展示",
  "Artwork Display Mode": "封面显示模式",
  "Artwork Display Style": "封面显示样式",
  "Audio Player Style & Studio": "音乐播放器样式与工作室",
  "Audio Source & Quality": "音频来源与音质",
  "Audio Sync Offset": "音频同步偏移",
  "Audiobook Chapters": "有声书章节",
  "Audiobook Details": "有声书详情",
  "Audiobook Hub": "有声书中心",
  "Audiobook Poster Card Density": "有声书封面卡片密度",
  "Audiobook Studio & Generator": "有声书工作室与生成器",
  "Auto-Recover Black Screens": "黑屏时自动恢复",
  "Auto-Rotate Channels": "自动轮播频道",
  "Auto-Rotate Spotlight": "自动轮播精选内容",
  "Automatically cycle through featured live events": "自动轮播精选直播活动",
  "Autoplay": "自动播放",
  "Available CloudStream Plugins": "可用的 CloudStream 插件",
  "Available Plugins": "可用插件",
  "BORROWED CREDENTIALS": "外部提供的凭据",
  "Back to Customizer": "返回自定义设置",
  "Back to Library": "返回媒体库",
  "Back to Manga Details": "返回漫画详情",
  "Blend Moving Ambient Lights": "混合动态环境光",
  "Brandon Sanderson • Chapter 1: Stormblessed": "Brandon Sanderson · 第 1 章：风暴降临",
  "Browse": "浏览",
  "Browse Available Plugins": "浏览可用插件",
  "Browse Later": "稍后浏览",
  "Browse Marketplace": "浏览插件市场",
  "Browse curated Turkish, 3rabi, English, Hindi & global repos with direct install links.": "浏览精选的土耳其语、阿拉伯语、英语、印地语及全球仓库，并通过直达链接安装插件。",
  "Button Hover & Touch Physics": "按钮悬停与触控反馈",
  "CHANNEL CARDS & POSTER DENSITY": "频道卡片与封面密度",
  "COLOR THEMES & ACCENTS": "配色主题与强调色",
  "CORE TECHNOLOGIES": "核心技术",
  "CREDITS": "致谢",
  "CREDITS & LICENCE": "致谢与许可",
  "CURATED COLLECTIONS": "精选合集"
}
''';

final Map<String, String> _zhText = Map<String, String>.unmodifiable(
  (jsonDecode(_zhTextJson) as Map<String, dynamic>).cast<String, String>(),
);

/// 根据当前应用语言替换尚未迁移到 ARB 的旧版界面文案。
String localizeUiText(String value) {
  final languageCode =
      LocaleSettings.locale.value?.languageCode ??
      m.WidgetsBinding.instance.platformDispatcher.locale.languageCode;
  if (languageCode != 'zh') return value;
  return _zhText[value] ?? value;
}

/// 保留 Flutter 文本组件的布局参数，并在中文界面显示对应译文。
class UiText extends m.StatelessWidget {
  const UiText(
    String data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : data = data,
       textSpan = null;

  const UiText.rich(
    m.InlineSpan textSpan, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.semanticsIdentifier,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  }) : data = null,
       textSpan = textSpan;

  final String? data;
  final m.InlineSpan? textSpan;
  final m.TextStyle? style;
  final m.StrutStyle? strutStyle;
  final m.TextAlign? textAlign;
  final m.TextDirection? textDirection;
  final m.Locale? locale;
  final bool? softWrap;
  final m.TextOverflow? overflow;
  final double? textScaleFactor;
  final m.TextScaler? textScaler;
  final int? maxLines;
  final String? semanticsLabel;
  final String? semanticsIdentifier;
  final m.TextWidthBasis? textWidthBasis;
  final m.TextHeightBehavior? textHeightBehavior;
  final m.Color? selectionColor;

  @override
  m.Widget build(m.BuildContext context) {
    if (data case final value?) {
      return m.Text(
        localizeUiText(value),
        key: key,
        style: style,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        semanticsIdentifier: semanticsIdentifier,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
    }

    return m.Text.rich(
      _localizeSpan(textSpan!),
      key: key,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      textScaler: textScaler,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      semanticsIdentifier: semanticsIdentifier,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }
}

m.InlineSpan _localizeSpan(m.InlineSpan span) {
  if (span is! m.TextSpan) return span;
  return m.TextSpan(
    style: span.style,
    recognizer: span.recognizer,
    mouseCursor: span.mouseCursor,
    onEnter: span.onEnter,
    onExit: span.onExit,
    semanticsLabel: span.semanticsLabel,
    locale: span.locale,
    spellOut: span.spellOut,
    text: span.text == null ? null : localizeUiText(span.text!),
    children: span.children?.map(_localizeSpan).toList(),
  );
}
