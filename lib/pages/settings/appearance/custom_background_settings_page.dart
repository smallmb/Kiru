import '../../../widgets/ui/kiru_tappable.dart';
import '../../../widgets/ui/kiru_toast.dart';
import 'package:zplay/l10n/config_labels.dart';
import 'package:zplay/l10n/l10n.dart';

import 'package:flutter/material.dart';
import '../../../widgets/ui/kiru_controls.dart';
import 'package:flutter/services.dart';
import '../../../services/theme/design_tokens.dart';
import '../../../services/theme/app_theme_service.dart';
import '../../../services/theme/custom_background_service.dart';
import '../../../widgets/common/animated_ambient_background.dart';
import '../../../widgets/settings/settings_scaffold.dart';

class CustomBackgroundSettingsPage extends StatefulWidget {
  const CustomBackgroundSettingsPage({super.key});

  @override
  State<CustomBackgroundSettingsPage> createState() =>
      _CustomBackgroundSettingsPageState();
}

class _CustomBackgroundSettingsPageState
    extends State<CustomBackgroundSettingsPage> {
  final TextEditingController _urlController = TextEditingController();
  bool _isUploading = false;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  void _showSnack(String msg, {bool isError = false}) {
    if (!mounted) return;
    KiruToastMessenger.of(context).showSnackBar(
      KiruToast(
        content: Text(msg, style: ZplayType.subtitle.toStyle()),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isError
            ? context.tokens.danger
            : AppThemeService.currentPalette.value.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _handlePickImage() async {
    setState(() => _isUploading = true);
    final success = await CustomBackgroundService.pickAndSetImage();
    if (!mounted) return;
    setState(() => _isUploading = false);

    if (success) {
      _showSnack(
        l10nOf(
          context,
        ).appearanceDetailBackgroundImageUploadedAndAppliedAcrossAllUi,
      );
    }
  }

  Future<void> _handleApplyUrl() async {
    final text = _urlController.text.trim();
    if (text.isEmpty) return;

    if (!text.startsWith('http://') && !text.startsWith('https://')) {
      _showSnack(
        l10nOf(context).appearanceDetailPleaseEnterAValidHttpOrHttpsImage,
        isError: true,
      );
      return;
    }

    await CustomBackgroundService.setImageUrl(text);
    if (!mounted) return;
    _urlController.clear();
    _showSnack(l10nOf(context).appearanceDetailCustomBackgroundUrlApplied);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppThemePalette>(
      valueListenable: AppThemeService.currentPalette,
      builder: (context, palette, _) {
        return ValueListenableBuilder<CustomBackgroundData>(
          valueListenable: CustomBackgroundService.notifier,
          builder: (context, customBg, _) {
            final tokens = context.tokens;
            final hasWallpaper = customBg.hasCustomBackground;

            return SettingsScaffold(
              title: l10nOf(context).appearanceCustomWallpaper,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                children: [
                  // ── Header description ──
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      l10nOf(
                        context,
                      ).auxCustomBackgroundSettingsPageUploadYourOwnPhotoOrChooseA,
                      style: ZplayType.body.toStyle(
                        color: tokens.textSecondary,
                      ),
                    ),
                  ),

                  // ── 1. Live Interactive Preview Canvas ──
                  Container(
                    height: 200,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius: ZplayRadius.lgAll,
                    ),
                    child: Stack(
                      children: [
                        const Positioned.fill(
                          child: AnimatedAmbientBackground(),
                        ),
                        // Simulated UI Card overlay
                        Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              // Scrim that keeps the caption legible over
                              // whatever wallpaper sits behind it.
                              color: palette.cardBackgroundColor.withValues(
                                alpha: 0.82,
                              ),
                              borderRadius: ZplayRadius.mdAll,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: palette.primaryColor.withValues(
                                      alpha: 0.2,
                                    ),
                                    borderRadius: ZplayRadius.smAll,
                                  ),
                                  child: Icon(
                                    Icons.auto_awesome_rounded,
                                    color: palette.primaryColor,
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l10nOf(
                                          context,
                                        ).auxAudiobookSettingsPageLiveAtmospherePreview,
                                        style: ZplayType.subtitle.toStyle(
                                          color: tokens.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        hasWallpaper
                                            ? l10nOf(
                                                context,
                                              ).wallpaperActivePalette(
                                                configLabel(
                                                  context,
                                                  palette.name,
                                                ),
                                              )
                                            : l10nOf(
                                                context,
                                              ).wallpaperDefaultPalette(
                                                configLabel(
                                                  context,
                                                  palette.name,
                                                ),
                                              ),
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
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ── 2. Action Buttons (Upload / Remove) ──
                  Row(
                    children: [
                      Expanded(
                        child: KiruButton(
                          onPressed: _isUploading ? null : _handlePickImage,
                          icon: _isUploading
                              ? SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: KiruLoader(
                                    strokeWidth: 2,
                                    color: tokens.onAccent,
                                  ),
                                )
                              : const Icon(
                                  Icons.add_photo_alternate_rounded,
                                  size: 20,
                                ),
                          child: Text(
                            _isUploading
                                ? l10nOf(
                                    context,
                                  ).finalCustomBackgroundSettingsPageUploading
                                : l10nOf(
                                    context,
                                  ).appearanceDetailUploadPhotoFromDevice,
                            style: ZplayType.label.toStyle(),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: palette.primaryColor,
                            foregroundColor: tokens.onAccent,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: const RoundedRectangleBorder(
                              borderRadius: ZplayRadius.smAll,
                            ),
                            elevation: 0,
                          ),
                        ),
                      ),
                      if (hasWallpaper) ...[
                        const SizedBox(width: 12),
                        IconButton.filledTonal(
                          tooltip: l10nOf(
                            context,
                          ).auxCustomBackgroundSettingsPageResetToDefaultBackground,
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: tokens.danger,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: tokens.danger.withValues(
                              alpha: ZplayOpacity.borderStrong,
                            ),
                            padding: const EdgeInsets.all(14),
                            shape: const RoundedRectangleBorder(
                              borderRadius: ZplayRadius.smAll,
                            ),
                          ),
                          onPressed: () async {
                            await CustomBackgroundService.clearBackground();
                            if (!context.mounted) return;
                            _showSnack(
                              l10nOf(
                                context,
                              ).appearanceDetailBackgroundResetToDefaultTheme,
                            );
                          },
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ── URL Input Bar ──
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: tokens.surface,
                      borderRadius: ZplayRadius.smAll,
                      border: Border.fromBorderSide(tokens.hairline),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.link_rounded,
                          color: tokens.textMuted,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: KiruFormField(
                            controller: _urlController,
                            style: ZplayType.label.toStyle(
                              color: tokens.textPrimary,
                            ),
                            decoration: InputDecoration(
                              hintText: l10nOf(
                                context,
                              ).auxCustomBackgroundSettingsPageOrPasteImageUrlHttps,
                              hintStyle: ZplayType.bodySmall.toStyle(
                                color: tokens.textDisabled,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                            onSubmitted: (_) => _handleApplyUrl(),
                          ),
                        ),
                        KiruIconButton(
                          icon: Icon(
                            Icons.content_paste_rounded,
                            color: tokens.textSecondary,
                            size: 18,
                          ),
                          tooltip: l10nOf(context).commonPasteClipboard,
                          onPressed: () async {
                            final data = await Clipboard.getData(
                              Clipboard.kTextPlain,
                            );
                            if (data?.text != null) {
                              _urlController.text = data!.text!.trim();
                            }
                          },
                        ),
                        KiruButton(
                          kind: KiruButtonKind.ghost,
                          onPressed: _handleApplyUrl,
                          child: Text(
                            l10nOf(context).uiDiscoverPageApply,
                            style: ZplayType.label.toStyle(
                              color: palette.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ── 3. Curated Wallpaper Presets ──
                  Text(
                    l10nOf(
                      context,
                    ).auxCustomBackgroundSettingsPageCuratedDarkWallpapers,
                    style: ZplayType.overline.toStyle(color: tokens.textMuted),
                  ),
                  const SizedBox(height: 12),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 460;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isNarrow ? 2 : 3,
                          childAspectRatio: isNarrow ? 1.55 : 1.45,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: CustomBackgroundService.presets.length,
                        itemBuilder: (context, index) {
                          final preset = CustomBackgroundService.presets[index];
                          final isSelected =
                              customBg.imageUrl == preset.fullUrl;

                          return KiruTappable(
                            onTap: () async {
                              HapticFeedback.selectionClick();
                              await CustomBackgroundService.applyPreset(preset);
                              if (!context.mounted) return;
                              _showSnack(
                                l10nOf(
                                  context,
                                ).appearanceDetailAppliedWallpaperName(
                                  configLabel(context, preset.title),
                                ),
                              );
                            },
                            borderRadius: ZplayRadius.smAll,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: ZplayRadius.smAll,
                                border: Border.all(
                                  color: isSelected
                                      ? palette.primaryColor
                                      : tokens.borderDefault,
                                  width: isSelected ? 2.5 : 1.0,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(preset.previewUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: ZplayRadius.smAll,
                                        // Scrim that makes the preset title legible
                                        // over the artwork, so it keeps its own alpha.
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            tokens.bg.withValues(alpha: 0.85),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (isSelected)
                                    Positioned(
                                      top: 6,
                                      right: 6,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: palette.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.check_rounded,
                                          color: tokens.onAccent,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                  Positioned(
                                    bottom: 6,
                                    left: 8,
                                    right: 8,
                                    child: Text(
                                      configLabel(context, preset.title),
                                      style: ZplayType.caption.toStyle(
                                        color: tokens.textPrimary,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 28),

                  // ── 4. Atmosphere & Blending Controls ──
                  Text(
                    l10nOf(
                      context,
                    ).auxCustomBackgroundSettingsPageWallpaperLightBlendingControls,
                    style: ZplayType.overline.toStyle(color: tokens.textMuted),
                  ),
                  const SizedBox(height: 12),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Opacity / Visibility Slider
                        _buildSliderTile(
                          icon: Icons.opacity_rounded,
                          title: l10nOf(
                            context,
                          ).auxCustomBackgroundSettingsPagePhotoVisibilityDarkness,
                          valueText: '${(customBg.opacity * 100).round()}%',
                          value: customBg.opacity,
                          min: 0.10,
                          max: 1.0,
                          activeColor: palette.primaryColor,
                          onChanged: (v) =>
                              CustomBackgroundService.setOpacity(v),
                        ),
                        KiruDivider(color: tokens.borderStrong, height: 24),

                        // Blur Slider
                        _buildSliderTile(
                          icon: Icons.blur_on_rounded,
                          title: l10nOf(
                            context,
                          ).auxCustomBackgroundSettingsPagePhotoSoftBlur,
                          valueText: '${customBg.blur.toStringAsFixed(1)} px',
                          value: customBg.blur,
                          min: 0.0,
                          max: 24.0,
                          activeColor: palette.primaryColor,
                          onChanged: (v) => CustomBackgroundService.setBlur(v),
                        ),
                        KiruDivider(color: tokens.borderStrong, height: 24),

                        // Theme Tint Slider
                        _buildSliderTile(
                          icon: Icons.color_lens_outlined,
                          title: l10nOf(
                            context,
                          ).auxCustomBackgroundSettingsPageThemeColorTintOverlay,
                          valueText:
                              '${(customBg.themeTintOpacity * 100).round()}%',
                          value: customBg.themeTintOpacity,
                          min: 0.0,
                          max: 0.80,
                          activeColor: palette.primaryColor,
                          onChanged: (v) =>
                              CustomBackgroundService.setThemeTintOpacity(v),
                        ),
                        KiruDivider(color: tokens.borderStrong, height: 24),

                        // Moving Ambient Lights Switch
                        KiruSwitchRow(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            l10nOf(
                              context,
                            ).auxCustomBackgroundSettingsPageBlendMovingAmbientLights,
                            style: ZplayType.subtitle.toStyle(
                              color: tokens.textPrimary,
                            ),
                          ),
                          subtitle: Text(
                            l10nOf(
                              context,
                            ).auxCustomBackgroundSettingsPageSoftlyIlluminatesAndAnimatesThemeLightsOver,
                            style: ZplayType.bodySmall.toStyle(
                              color: tokens.textSecondary,
                            ),
                          ),
                          value: customBg.blendThemeLights,
                          onChanged: (v) =>
                              CustomBackgroundService.setBlendThemeLights(v),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSliderTile({
    required IconData icon,
    required String title,
    required String valueText,
    required double value,
    required double min,
    required double max,
    required Color activeColor,
    required ValueChanged<double> onChanged,
  }) {
    final tokens = context.tokens;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: tokens.textEmphasis),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: ZplayType.subtitle.toStyle(color: tokens.textPrimary),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: activeColor.withValues(alpha: 0.15),
                borderRadius: ZplayRadius.xsAll,
              ),
              child: Text(
                valueText,
                style: ZplayType.labelNumeric.toStyle(color: activeColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: activeColor,
            inactiveTrackColor: Colors.white.withValues(
              alpha: ZplayOpacity.borderStrong,
            ),
            thumbColor: activeColor,
            trackHeight: 3,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 7),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
          ),
          child: KiruSlider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
