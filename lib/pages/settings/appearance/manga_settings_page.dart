import 'package:zplay/l10n/config_labels.dart';
import 'package:zplay/l10n/l10n.dart';

import 'package:flutter/material.dart';
import '../../../widgets/ui/kiru_controls.dart';
import '../palette_picker.dart';
import '../../../services/theme/design_tokens.dart';
import '../../../services/theme/app_theme_service.dart';
import '../../../services/home/home_page_settings.dart';
import '../../../services/manga/manga_settings.dart';
import '../../../widgets/common/animated_ambient_background.dart';
import '../../../widgets/common/segmented_tabs.dart';
import '../../../widgets/settings/settings_scaffold.dart';

class MangaSettingsPage extends StatefulWidget {
  const MangaSettingsPage({super.key});

  @override
  State<MangaSettingsPage> createState() => _MangaSettingsPageState();
}

class _MangaSettingsPageState extends State<MangaSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final palette = AppThemeService.currentPalette.value;

    return SettingsScaffold(
      title: l10nOf(context).appearanceMangaTitle,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          // ── 1. Color Themes & Accents ──
          _buildSectionHeader(
            l10nOf(context).auxHomeUiSettingsPageColorThemesAccents,
          ),
          const SizedBox(height: 12),
          const PalettePicker(),

          const SizedBox(height: 28),

          // ── 2. Ambient Background Lighting ──
          _buildSectionHeader(
            l10nOf(
              context,
            ).finalAudiobookSettingsPageAmbientBackgroundLightingMovingGlows,
          ),
          const SizedBox(height: 12),
          _buildAmbientLightsCard(palette),

          const SizedBox(height: 28),

          // ── 3. Discovery & Cards ──
          _buildSectionHeader(
            l10nOf(context).finalMangaSettingsPageDiscoveryPosterCards,
          ),
          const SizedBox(height: 12),
          _buildCardsConfigCard(palette),

          const SizedBox(height: 28),

          // ── 4. Manga Reader Customization ──
          _buildSectionHeader(
            l10nOf(context).finalMangaSettingsPageMangaReaderChapterViewer,
          ),
          const SizedBox(height: 12),
          _buildReaderConfigCard(palette),

          const SizedBox(height: 36),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    final tokens = context.tokens;
    return Text(
      title,
      style: ZplayType.overline.toStyle(color: tokens.textMuted),
    );
  }

  // ── 2. Ambient Lighting ──
  Widget _buildAmbientLightsCard(AppThemePalette palette) {
    final tokens = context.tokens;
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.enableAmbientLights,
            builder: (context, enabled, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(
                    context,
                  ).auxMangaSettingsPageEnableMovingAmbientLighting,
                  style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
                ),
                subtitle: Text(
                  l10nOf(
                    context,
                  ).dynamicMangaSettingsPageSoftFlowingGlowingOrbsAndAurora(
                    (palette.name).toString(),
                  ),
                  style: ZplayType.bodySmall.toStyle(
                    color: tokens.textSecondary,
                  ),
                ),
                value: enabled,
                onChanged: (val) => MangaSettings.setEnableAmbientLights(val),
              );
            },
          ),

          const SizedBox(height: 12),
          KiruDivider(height: 16, color: tokens.borderDefault),
          const SizedBox(height: 12),

          // Pattern selector
          Text(
            l10nOf(context).auxAudiobookSettingsPageLightingFlowPattern,
            style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<AmbientLightPattern>(
            valueListenable: MangaSettings.ambientLightPattern,
            builder: (context, currentPattern, _) {
              return SegmentedTabs<AmbientLightPattern>(
                selected: currentPattern,
                onSelected: (p) {
                  MangaSettings.setAmbientLightPattern(p);
                },
                options: [
                  for (final p in AmbientLightPattern.values)
                    SegmentedTabOption(
                      value: p,
                      label: configLabel(context, p.label),
                    ),
                ],
              );
            },
          ),

          const SizedBox(height: 16),

          // Intensity Slider
          ValueListenableBuilder<double>(
            valueListenable: MangaSettings.ambientLightIntensity,
            builder: (context, intensity, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10nOf(
                          context,
                        ).auxAudiobookSettingsPageGlowStrengthOpacity,
                        style: ZplayType.subtitle.toStyle(
                          color: tokens.textPrimary,
                        ),
                      ),
                      Text(
                        '${(intensity * 100).round()}%',
                        style: ZplayType.labelNumeric.toStyle(
                          color: palette.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: palette.primaryColor,
                      inactiveTrackColor: Colors.white.withValues(
                        alpha: ZplayOpacity.borderStrong,
                      ),
                      thumbColor: palette.primaryColor,
                      trackHeight: 3,
                    ),
                    child: KiruSlider(
                      value: intensity,
                      min: 0.08,
                      max: 0.60,
                      divisions: 26,
                      onChanged: (val) =>
                          MangaSettings.setAmbientLightIntensity(val),
                    ),
                  ),
                ],
              );
            },
          ),

          // Speed Slider
          ValueListenableBuilder<double>(
            valueListenable: MangaSettings.ambientLightSpeed,
            builder: (context, speed, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10nOf(
                          context,
                        ).auxAudiobookSettingsPageMotionDriftSpeed,
                        style: ZplayType.subtitle.toStyle(
                          color: tokens.textPrimary,
                        ),
                      ),
                      Text(
                        '${speed.toStringAsFixed(1)}x',
                        style: ZplayType.labelNumeric.toStyle(
                          color: palette.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: palette.primaryColor,
                      inactiveTrackColor: Colors.white.withValues(
                        alpha: ZplayOpacity.borderStrong,
                      ),
                      thumbColor: palette.primaryColor,
                      trackHeight: 3,
                    ),
                    child: KiruSlider(
                      value: speed,
                      min: 0.2,
                      max: 3.0,
                      divisions: 14,
                      onChanged: (val) =>
                          MangaSettings.setAmbientLightSpeed(val),
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 10),

          // Atmosphere Live Preview Box
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: ZplayRadius.smAll,
              border: Border.fromBorderSide(tokens.hairline),
            ),
            child: ClipRRect(
              borderRadius: ZplayRadius.smAll,
              child: Stack(
                children: [
                  const Positioned.fill(child: AnimatedAmbientBackground()),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: tokens.bg.withValues(
                          alpha: ZplayOpacity.textSecondary,
                        ),
                        borderRadius: ZplayRadius.lgAll,
                        border: Border.fromBorderSide(tokens.hairlineStrong),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome_rounded,
                            color: palette.primaryColor,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            l10nOf(
                              context,
                            ).auxAudiobookSettingsPageLiveAtmospherePreview,
                            style: ZplayType.caption.toStyle(
                              color: tokens.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 3. Discovery & Cards Config ──
  Widget _buildCardsConfigCard(AppThemePalette palette) {
    final tokens = context.tokens;
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.showContinueReading,
            builder: (context, show, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(context).auxMangaPageShowContinueReadingSlider,
                  style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
                ),
                subtitle: Text(
                  l10nOf(
                    context,
                  ).auxMangaSettingsPageDisplayYourActiveReadingHistoryAtThe,
                  style: ZplayType.bodySmall.toStyle(
                    color: tokens.textSecondary,
                  ),
                ),
                value: show,
                onChanged: (val) => MangaSettings.setShowContinueReading(val),
              );
            },
          ),

          const SizedBox(height: 12),
          KiruDivider(height: 16, color: tokens.borderDefault),
          const SizedBox(height: 12),

          Text(
            l10nOf(context).auxMangaSettingsPageMangaPosterCardDensity,
            style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<MangaCardDensity>(
            valueListenable: MangaSettings.cardDensity,
            builder: (context, currentDensity, _) {
              return SegmentedTabs<MangaCardDensity>(
                selected: currentDensity,
                onSelected: (d) {
                  MangaSettings.setCardDensity(d);
                },
                options: [
                  for (final d in MangaCardDensity.values)
                    SegmentedTabOption(
                      value: d,
                      label: configLabel(context, d.label),
                    ),
                ],
              );
            },
          ),

          const SizedBox(height: 14),

          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.showContentTypeBadge,
            builder: (context, show, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(
                    context,
                  ).auxMangaSettingsPageShowContentTypeBadgeMangaManhwa,
                  style: ZplayType.label.toStyle(color: tokens.textPrimary),
                ),
                value: show,
                onChanged: (val) => MangaSettings.setShowContentTypeBadge(val),
              );
            },
          ),

          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.showMangaYear,
            builder: (context, show, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(
                    context,
                  ).auxMangaSettingsPageShowPublicationYearOnCards,
                  style: ZplayType.label.toStyle(color: tokens.textPrimary),
                ),
                value: show,
                onChanged: (val) => MangaSettings.setShowMangaYear(val),
              );
            },
          ),

          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.ambientCardGlow,
            builder: (context, show, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(context).auxMangaSettingsPagePosterCardHoverGlowEffect,
                  style: ZplayType.label.toStyle(color: tokens.textPrimary),
                ),
                value: show,
                onChanged: (val) => MangaSettings.setAmbientCardGlow(val),
              );
            },
          ),
        ],
      ),
    );
  }

  // ── 4. Reader Configuration ──
  Widget _buildReaderConfigCard(AppThemePalette palette) {
    final tokens = context.tokens;
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Default Reading Mode
          Text(
            l10nOf(context).auxMangaSettingsPageDefaultReadingMode,
            style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<MangaReadingMode>(
            valueListenable: MangaSettings.defaultReadingMode,
            builder: (context, currentMode, _) {
              return SegmentedTabs<MangaReadingMode>(
                selected: currentMode,
                onSelected: (m) {
                  MangaSettings.setDefaultReadingMode(m);
                },
                options: [
                  for (final m in MangaReadingMode.values)
                    SegmentedTabOption(
                      value: m,
                      label: configLabel(context, m.label),
                    ),
                ],
              );
            },
          ),

          const SizedBox(height: 16),

          // Reader Max Width
          Text(
            l10nOf(context).auxMangaReaderPagePageReadingWidthConstraint,
            style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<MangaReaderMaxWidth>(
            valueListenable: MangaSettings.readerMaxWidth,
            builder: (context, currentWidth, _) {
              return SegmentedTabs<MangaReaderMaxWidth>(
                selected: currentWidth,
                onSelected: (w) {
                  MangaSettings.setReaderMaxWidth(w);
                },
                options: [
                  for (final w in MangaReaderMaxWidth.values)
                    SegmentedTabOption(
                      value: w,
                      label: configLabel(context, w.label),
                    ),
                ],
              );
            },
          ),

          const SizedBox(height: 16),

          // Reader Background Color
          Text(
            l10nOf(context).auxMangaReaderPageReaderBackgroundAtmosphere,
            style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<MangaReaderBackground>(
            valueListenable: MangaSettings.readerBackground,
            builder: (context, currentBg, _) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: MangaReaderBackground.values.map((b) {
                  final isSelected = b == currentBg;
                  return KiruChoiceChip(
                    avatar: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: b.color,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                          BorderSide(
                            color: Colors.white.withValues(
                              alpha: ZplayOpacity.textDisabled,
                            ),
                          ),
                        ),
                      ),
                    ),
                    label: Text(configLabel(context, b.label)),
                    selected: isSelected,
                    selectedColor: palette.primaryColor.withValues(alpha: 0.25),
                    backgroundColor: tokens.surface,
                    labelStyle: ZplayType.label.toStyle(
                      color: isSelected
                          ? palette.primaryColor
                          : tokens.textEmphasis,
                    ),
                    side: BorderSide(
                      color: isSelected
                          ? palette.primaryColor.withValues(alpha: 0.6)
                          : tokens.borderDefault,
                    ),
                    onSelected: (selected) {
                      if (selected) MangaSettings.setReaderBackground(b);
                    },
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 16),

          // Control Bar Style
          Text(
            l10nOf(context).auxMangaSettingsPageControlToolbarStyle,
            style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder<MangaControlBarStyle>(
            valueListenable: MangaSettings.readerControlBarStyle,
            builder: (context, currentStyle, _) {
              return SegmentedTabs<MangaControlBarStyle>(
                selected: currentStyle,
                onSelected: (s) {
                  MangaSettings.setReaderControlBarStyle(s);
                },
                options: [
                  for (final s in MangaControlBarStyle.values)
                    SegmentedTabOption(
                      value: s,
                      label: configLabel(context, s.label),
                    ),
                ],
              );
            },
          ),

          const SizedBox(height: 16),

          // Page Gap slider (for webtoon mode)
          ValueListenableBuilder<double>(
            valueListenable: MangaSettings.pageGap,
            builder: (context, gap, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10nOf(context).auxMangaSettingsPageVerticalPageGap,
                        style: ZplayType.subtitle.toStyle(
                          color: tokens.textPrimary,
                        ),
                      ),
                      Text(
                        '${gap.round()} px',
                        style: ZplayType.labelNumeric.toStyle(
                          color: palette.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: palette.primaryColor,
                      inactiveTrackColor: Colors.white.withValues(
                        alpha: ZplayOpacity.borderStrong,
                      ),
                      thumbColor: palette.primaryColor,
                      trackHeight: 3,
                    ),
                    child: KiruSlider(
                      value: gap,
                      min: 0,
                      max: 24,
                      divisions: 12,
                      onChanged: (val) => MangaSettings.setPageGap(val),
                    ),
                  ),
                ],
              );
            },
          ),

          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.showPageDeck,
            builder: (context, show, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(
                    context,
                  ).auxMangaSettingsPageShowPageDeckThumbnailPreviews,
                  style: ZplayType.label.toStyle(color: tokens.textPrimary),
                ),
                subtitle: Text(
                  l10nOf(
                    context,
                  ).auxMangaSettingsPageInteractiveVisualTrayOfThumbnailPreviewsFor,
                  style: ZplayType.caption.toStyle(color: tokens.textSecondary),
                ),
                value: show,
                onChanged: (val) => MangaSettings.setShowPageDeck(val),
              );
            },
          ),

          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.showPageScrubber,
            builder: (context, show, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(context).auxMangaSettingsPageShowPageScrubberSlider,
                  style: ZplayType.label.toStyle(color: tokens.textPrimary),
                ),
                value: show,
                onChanged: (val) => MangaSettings.setShowPageScrubber(val),
              );
            },
          ),

          ValueListenableBuilder<bool>(
            valueListenable: MangaSettings.enableNextChapterDeck,
            builder: (context, show, _) {
              return KiruSwitchRow(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  l10nOf(
                    context,
                  ).auxMangaSettingsPageEnableNextChapterPreviewCardDeck,
                  style: ZplayType.label.toStyle(color: tokens.textPrimary),
                ),
                subtitle: Text(
                  l10nOf(context).auxMangaSettingsPageRichGlassDeckCardAtTheEnd,
                  style: ZplayType.caption.toStyle(color: tokens.textSecondary),
                ),
                value: show,
                onChanged: (val) => MangaSettings.setEnableNextChapterDeck(val),
              );
            },
          ),
        ],
      ),
    );
  }
}
