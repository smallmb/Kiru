import 'package:zplay/l10n/config_labels.dart';
import 'package:zplay/l10n/media_labels.dart';
import 'package:zplay/l10n/l10n.dart';

import 'package:flutter/material.dart';
import '../../services/theme/design_tokens.dart';
import '../../services/player/player_settings.dart';
import '../../widgets/common/focusable_card.dart';
import '../../services/player/engine/exo_player_engine.dart';
import '../../widgets/settings/settings_scaffold.dart';

class VideoSettingsPage extends StatefulWidget {
  const VideoSettingsPage({super.key});

  @override
  State<VideoSettingsPage> createState() => _VideoSettingsPageState();
}

class _VideoSettingsPageState extends State<VideoSettingsPage> {
  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return SettingsScaffold(
      title: l10nOf(context).uiVideoSettingsPageVideoUpscaling,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          // ── Top Intro Banner ──
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: tokens.accentSubtle,
                    borderRadius: ZplayRadius.mdAll,
                  ),
                  child: Icon(
                    Icons.auto_awesome_rounded,
                    color: tokens.accent,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10nOf(context).uiVideoSettingsPageGpuUpscaling,
                        style: ZplayType.subtitle.toStyle(
                          color: tokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        l10nOf(context).videoUpscalingExplanation,
                        style: ZplayType.bodySmall.toStyle(
                          color: tokens.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── Section: Presets ──
          Text(
            l10nOf(context).uiVideoSettingsPageUpscalingPresets,
            style: ZplayType.overline.toStyle(color: tokens.textMuted),
          ),
          const SizedBox(height: 12),

          ValueListenableBuilder<Anime4KPreset>(
            valueListenable: PlayerSettings.anime4kPreset,
            builder: (context, currentPreset, _) {
              return Column(
                children: [
                  _buildPresetCard(
                    preset: Anime4KPreset.off,
                    title: l10nOf(context).uiVideoSettingsPageDisabledOff,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPageStandardVideoPlaybackWithoutGlsl,
                    tag: 'Standard',
                    tagColor: tokens.textMuted,
                    icon: Icons.block_rounded,
                    isSelected: currentPreset == Anime4KPreset.off,
                    onTap: () =>
                        PlayerSettings.setAnime4kPreset(Anime4KPreset.off),
                  ),
                  const SizedBox(height: 10),
                  _buildPresetCard(
                    preset: Anime4KPreset.modeAFast,
                    title: l10nOf(context).uiVideoSettingsPageModeAFastBalanced,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPageSharpLineRestoration2xCnn,
                    tag: 'Recommended',
                    tagColor: tokens.success,
                    icon: Icons.speed_rounded,
                    isSelected: currentPreset == Anime4KPreset.modeAFast,
                    onTap: () => PlayerSettings.setAnime4kPreset(
                      Anime4KPreset.modeAFast,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPresetCard(
                    preset: Anime4KPreset.modeAHQ,
                    title: l10nOf(context).uiVideoSettingsPageModeAHighQualityUltra,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPageMaximumPerceptualFidelityUsingVery,
                    tag: 'Ultra Quality',
                    tagColor: tokens.accent,
                    icon: Icons.diamond_rounded,
                    isSelected: currentPreset == Anime4KPreset.modeAHQ,
                    onTap: () => PlayerSettings.setAnime4kPreset(
                      Anime4KPreset.modeAHQ,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPresetCard(
                    preset: Anime4KPreset.modeB,
                    title: l10nOf(context).uiVideoSettingsPageModeBSoftDenoise,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPageSmoothLineReconstructionAndArtifact,
                    tag: 'Denoise',
                    tagColor: tokens.accent,
                    icon: Icons.blur_linear_rounded,
                    isSelected: currentPreset == Anime4KPreset.modeB,
                    onTap: () => PlayerSettings.setAnime4kPreset(
                      Anime4KPreset.modeB,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPresetCard(
                    preset: Anime4KPreset.modeC,
                    title: l10nOf(context).uiVideoSettingsPageModeCDeblurScale,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPageAggressiveDeblurringAndScalingBest,
                    tag: 'Deblur',
                    tagColor: tokens.warning,
                    icon: Icons.high_quality_rounded,
                    isSelected: currentPreset == Anime4KPreset.modeC,
                    onTap: () => PlayerSettings.setAnime4kPreset(
                      Anime4KPreset.modeC,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPresetCard(
                    preset: Anime4KPreset.fsrEasu,
                    title: l10nOf(context).uiVideoSettingsPageFsr10Smooth,
                    subtitle:
                        l10nOf(context).videoFsrSmoothExplanation,
                    tag: mediaLabel(context, 'Live action'),
                    tagColor: tokens.success,
                    icon: Icons.filter_none_rounded,
                    isSelected: currentPreset == Anime4KPreset.fsrEasu,
                    onTap: () => PlayerSettings.setAnime4kPreset(
                      Anime4KPreset.fsrEasu,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPresetCard(
                    preset: Anime4KPreset.fsrEasuRcas,
                    title: l10nOf(context).uiVideoSettingsPageFsr10Sharp,
                    subtitle:
                        l10nOf(context).videoFsrSharpExplanation,
                    tag: mediaLabel(context, 'Use with care'),
                    tagColor: tokens.warning,
                    icon: Icons.filter_alt_rounded,
                    isSelected: currentPreset == Anime4KPreset.fsrEasuRcas,
                    onTap: () => PlayerSettings.setAnime4kPreset(
                      Anime4KPreset.fsrEasuRcas,
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 28),

          // ── Section: Details & Performance Note ──
          Text(
            l10nOf(context).uiVideoSettingsPagePipelineCompatibility,
            style: ZplayType.overline.toStyle(color: tokens.textMuted),
          ),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildInfoRow(
                  icon: Icons.info_outline_rounded,
                  title: l10nOf(context).uiVideoSettingsPagePlaybackStartApplication,
                  description:
                      'Shaders are configured before playback begins. Changing a preset applies to the next opened stream or video.',
                ),
                Divider(color: tokens.borderStrong, height: 24),
                _buildInfoRow(
                  icon: Icons.memory_rounded,
                  title: l10nOf(context).uiVideoSettingsPageHardwareDecoderAcceleration,
                  description:
                      'media_kit uses native auto-safe hardware decoding to feed GPU texture memory directly into the GLSL shader pass.',
                ),
                Divider(color: tokens.borderStrong, height: 24),
                _buildInfoRow(
                  icon: Icons.devices_rounded,
                  title: l10nOf(context).uiVideoSettingsPagePlatformRecommendation,
                  description:
                      'For desktop (Windows/macOS/Linux), Mode A HQ provides crystal-clear lines. For mobile devices, Mode A Fast offers smooth 60fps playback.',
                ),
              ],
            ),
          ),

          // ── Section: Hardware Acceleration & Decoding Engine ──
          const SizedBox(height: 28),
          Row(
            children: [
              Text(
                l10nOf(context).uiVideoSettingsPageHardwareAccelerationDecoding,
                style: ZplayType.overline.toStyle(color: tokens.accent),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: tokens.accent.withValues(
                    alpha: ZplayOpacity.overlayHover,
                  ),
                  borderRadius: ZplayRadius.xsAll,
                ),
                child: Text(
                  l10nOf(context).uiVideoSettingsPageAllPlatforms,
                  style: ZplayType.caption.toStyle(color: tokens.accent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          ValueListenableBuilder<HardwareAccelerationMode>(
            valueListenable: PlayerSettings.hwdecMode,
            builder: (context, currentMode, _) {
              return Column(
                children: [
                  _buildChoiceCard<HardwareAccelerationMode>(
                    option: HardwareAccelerationMode.autoSafe,
                    current: currentMode,
                    title: l10nOf(context).uiVideoSettingsPageAutoSafeRecommended,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPageGpuHardwareDecodingWithSafe,
                    badgeText: 'Default',
                    badgeColor: tokens.accent,
                    icon: Icons.speed_rounded,
                    onSelect: PlayerSettings.setHwdecMode,
                  ),
                  const SizedBox(height: 8),
                  _buildChoiceCard<HardwareAccelerationMode>(
                    option: HardwareAccelerationMode.software,
                    current: currentMode,
                    title: l10nOf(context).uiVideoSettingsPageSoftwareDecodingCrashProof,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPagePureCpuDecodingViaFfmpeg,
                    badgeText: '100% Reliable',
                    badgeColor: tokens.success,
                    icon: Icons.memory_rounded,
                    onSelect: PlayerSettings.setHwdecMode,
                  ),
                  const SizedBox(height: 8),
                  _buildChoiceCard<HardwareAccelerationMode>(
                    option: HardwareAccelerationMode.forceHardware,
                    current: currentMode,
                    title: l10nOf(context).uiVideoSettingsPageDirectHardware,
                    subtitle:
                        l10nOf(context).uiVideoSettingsPageDirectGpuDecodingDirect3d11,
                    badgeText: 'Max GPU',
                    badgeColor: tokens.warning,
                    icon: Icons.bolt_rounded,
                    onSelect: PlayerSettings.setHwdecMode,
                  ),
                ],
              );
            },
          ),

          // ── Section: Playback Engine ──
          const SizedBox(height: 28),
          Row(
            children: [
              Text(
                l10nOf(context).uiVideoSettingsPagePlaybackEngine,
                style: ZplayType.overline.toStyle(color: tokens.accent),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: tokens.accent.withValues(
                    alpha: ZplayOpacity.overlayHover,
                  ),
                  borderRadius: ZplayRadius.xsAll,
                ),
                child: Text(
                  ExoPlayerEngine.isSupported ? 'Android' : 'mpv only',
                  style: ZplayType.caption.toStyle(color: tokens.accent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder<PlaybackEngine>(
            valueListenable: PlayerSettings.playbackEngine,
            builder: (context, currentEngine, _) {
              return Column(
                children: [
                  _buildChoiceCard<PlaybackEngine>(
                    option: PlaybackEngine.media3,
                    current: currentEngine,
                    title: l10nOf(context).auxVideoSettingsPageAndroidSExoplayerFastestAt4k,
                    subtitle:
                        l10nOf(context).videoMedia3Explanation,
                    badgeText: mediaLabel(context, 'Faster at 4K'),
                    badgeColor: tokens.success,
                    icon: Icons.bolt_rounded,
                    onSelect: PlayerSettings.setPlaybackEngine,
                  ),
                  const SizedBox(height: 8),
                  _buildChoiceCard<PlaybackEngine>(
                    option: PlaybackEngine.mpv,
                    current: currentEngine,
                    title: l10nOf(context).auxVideoSettingsPageMpvFullSubtitleControl,
                    subtitle:
                        l10nOf(context).videoMpvExplanation,
                    badgeText: mediaLabel(context, 'Most features'),
                    badgeColor: tokens.accent,
                    icon: Icons.tune_rounded,
                    onSelect: PlayerSettings.setPlaybackEngine,
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    icon: Icons.info_outline_rounded,
                    title: l10nOf(context).uiVideoSettingsPageTorrentsAndLiveTvAlways,
                    description:
                        "Whichever engine you pick here, torrent sources and live channels play through mpv, because Android's player cannot open them. The choice applies to films, series and anything else fetched over plain HTTP.",
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 12),

          // Auto-Recover Black Screens Toggle
          ValueListenableBuilder<bool>(
            valueListenable: PlayerSettings.autoRecoverBlackScreen,
            builder: (context, autoRecover, _) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: autoRecover
                      ? tokens.accentSubtle
                      : Colors.transparent,
                  borderRadius: ZplayRadius.mdAll,
                  border: Border.all(
                    color: autoRecover
                        ? tokens.accent
                        : Colors.transparent,
                    width: autoRecover ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: autoRecover
                            ? tokens.accent.withValues(
                                alpha: ZplayOpacity.overlayHover,
                              )
                            : tokens.borderSubtle,
                        borderRadius: ZplayRadius.smAll,
                      ),
                      child: Icon(
                        Icons.shield_rounded,
                        color: autoRecover
                            ? tokens.accent
                            : tokens.textEmphasis,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  l10nOf(context).uiVideoSettingsPageAutoRecoverBlackScreens,
                                  style: ZplayType.subtitle.toStyle(
                                    color: tokens.textPrimary,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: tokens.success.withValues(
                                    alpha: ZplayOpacity.borderStrong,
                                  ),
                                  borderRadius: ZplayRadius.smAll,
                                ),
                                child: Text(
                                  l10nOf(context).uiVideoSettingsPageActiveWatchdog,
                                  style: ZplayType.caption.toStyle(
                                    color: tokens.success,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            l10nOf(context).videoWatchdogExplanation,
                            style: ZplayType.bodySmall.toStyle(
                              color: tokens.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Switch.adaptive(
                      value: autoRecover,
                      activeColor: tokens.accent,
                      onChanged: (val) {
                        PlayerSettings.setAutoRecoverBlackScreen(val);
                      },
                    ),
                  ],
                ),
              );
            },
          ),

          // ── Section: Android Rendering Engine ──
          const SizedBox(height: 28),
          Row(
            children: [
              Text(
                l10nOf(context).uiVideoSettingsPageAndroidRenderingEngine,
                style: ZplayType.overline.toStyle(color: tokens.accent),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: tokens.accent.withValues(
                    alpha: ZplayOpacity.overlayHover,
                  ),
                  borderRadius: ZplayRadius.xsAll,
                ),
                child: Text(
                  'Android',
                  style: ZplayType.caption.toStyle(color: tokens.accent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder<bool>(
            valueListenable: PlayerSettings.enableSurfaceProducer,
            builder: (context, isSurface, _) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSurface
                      ? tokens.accentSubtle
                      : Colors.transparent,
                  borderRadius: ZplayRadius.mdAll,
                  border: Border.all(
                    color: isSurface ? tokens.accent : Colors.transparent,
                    width: isSurface ? 1.5 : 1.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSurface
                            ? tokens.accent.withValues(
                                alpha: ZplayOpacity.overlayHover,
                              )
                            : tokens.borderSubtle,
                        borderRadius: ZplayRadius.smAll,
                      ),
                      child: Icon(
                        Icons.layers_rounded,
                        color: isSurface
                            ? tokens.accent
                            : tokens.textEmphasis,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  l10nOf(context).uiVideoSettingsPageDirectSurfaceSurfaceview,
                                  style: ZplayType.subtitle.toStyle(
                                    color: tokens.textPrimary,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      (isSurface
                                              ? tokens.success
                                              : tokens.warning)
                                          .withValues(
                                            alpha:
                                                ZplayOpacity.borderStrong,
                                          ),
                                  borderRadius: ZplayRadius.smAll,
                                ),
                                child: Text(
                                  isSurface
                                      ? l10nOf(context).videoZeroCopy
                                      : l10nOf(context).videoTextureViewOff,
                                  style: ZplayType.caption.toStyle(
                                    color: isSurface
                                        ? tokens.success
                                        : tokens.warning,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            l10nOf(context).auxVideoSettingsPageUsesFlutterSurfaceproducerToRenderFramesDirectly,
                            style: ZplayType.bodySmall.toStyle(
                              color: tokens.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Switch.adaptive(
                      value: isSurface,
                      activeColor: tokens.accent,
                      onChanged: (val) {
                        PlayerSettings.setEnableSurfaceProducer(val);
                      },
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildPresetCard({
    required Anime4KPreset preset,
    required String title,
    required String subtitle,
    required String tag,
    required Color tagColor,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final tokens = context.tokens;
    return InkWell(
      onTap: onTap,
      borderRadius: ZplayRadius.mdAll,
      child: AnimatedContainer(
        duration: ZplayMotion.base,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? tokens.accentSubtle : Colors.transparent,
          borderRadius: ZplayRadius.mdAll,
          border: Border.all(
            color: isSelected ? tokens.accent : Colors.transparent,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? tokens.accent.withValues(alpha: ZplayOpacity.overlayHover)
                    : tokens.borderSubtle,
                borderRadius: ZplayRadius.smAll,
              ),
              child: Icon(
                icon,
                color: isSelected ? tokens.accent : tokens.textEmphasis,
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          configLabel(context, title),
                          style: ZplayType.subtitle.toStyle(
                            color: tokens.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: tagColor.withValues(
                            alpha: ZplayOpacity.borderStrong,
                          ),
                          borderRadius: ZplayRadius.smAll,
                        ),
                        child: Text(
                          configLabel(context, tag),
                          style: ZplayType.caption.toStyle(color: tagColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    configLabel(context, subtitle),
                    style: ZplayType.bodySmall.toStyle(
                      color: tokens.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                isSelected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: isSelected ? tokens.accent : tokens.textDisabled,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// A selectable option card.
  ///
  /// Generic over the option type so the hardware-decoding modes and the
  /// playback-engine choice share one implementation. A D-pad cannot hover, so
  /// the focus ring is what tells a remote user which card is armed; without it
  /// these cards look identical whether you are on them or not.
  Widget _buildChoiceCard<T>({
    required T option,
    required T current,
    required String title,
    required String subtitle,
    required String badgeText,
    required Color badgeColor,
    required IconData icon,
    required Future<void> Function(T) onSelect,
  }) {
    final tokens = context.tokens;
    final isSelected = option == current;

    return FocusableCard(
      onTap: () => onSelect(option),
      builder: (context, state) {
        return CardFocusRing(
          focused: state.focused,
          radius: ZplayRadius.mdAll,
          child: AnimatedContainer(
            duration: ZplayMotion.base,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected || state.highlighted
                  ? tokens.accentSubtle
                  : Colors.transparent,
              borderRadius: ZplayRadius.mdAll,
              border: Border.all(
                color: isSelected ? tokens.accent : Colors.transparent,
                width: isSelected ? 1.5 : 1.0,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? tokens.accent.withValues(
                            alpha: ZplayOpacity.overlayHover,
                          )
                        : tokens.borderSubtle,
                    borderRadius: ZplayRadius.smAll,
                  ),
                  child: Icon(
                    icon,
                    color: isSelected ? tokens.accent : tokens.textEmphasis,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              configLabel(context, title),
                              style: ZplayType.subtitle.toStyle(
                                color: tokens.textPrimary,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: badgeColor.withValues(
                                alpha: ZplayOpacity.borderStrong,
                              ),
                              borderRadius: ZplayRadius.smAll,
                            ),
                            child: Text(
                              configLabel(context, badgeText),
                              style: ZplayType.caption.toStyle(
                                color: badgeColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        configLabel(context, subtitle),
                        style: ZplayType.bodySmall.toStyle(
                          color: tokens.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 20,
                  height: 20,
                  margin: const EdgeInsets.only(top: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? tokens.accent : tokens.textDisabled,
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: tokens.accent,
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String description,
  }) {
    final tokens = context.tokens;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: tokens.accent, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                configLabel(context, title),
                style: ZplayType.label.toStyle(color: tokens.textPrimary),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: ZplayType.bodySmall.toStyle(color: tokens.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
