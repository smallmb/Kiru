import '../ui/kiru_controls.dart';
import 'package:zplay/l10n/config_labels.dart';
import 'package:zplay/l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart' as f;
import '../../services/theme/forui_theme.dart';
import 'package:media_kit/media_kit.dart';
import '../../services/player/player_settings.dart';
import '../../services/theme/app_theme_service.dart';
import '../../services/theme/design_tokens.dart';
import 'player_glass.dart';

/// Responsive, rich Subtitle Customization Modal with live preview,
/// presets, typography, colors, background boxes, outlines, shadows, and libass options.
class PlayerSubStyleModal extends StatefulWidget {
  final Player? player;
  final VoidCallback onClose;

  const PlayerSubStyleModal({super.key, this.player, required this.onClose});

  @override
  State<PlayerSubStyleModal> createState() => _PlayerSubStyleModalState();
}

class _PlayerSubStyleModalState extends State<PlayerSubStyleModal> {
  // User's subtitle colours (player content), not app-palette chrome — each 'hex' is written into the subtitle style, so the swatches keep rendering those exact colours.
  static const List<Map<String, dynamic>> _textColorPalette = [
    {'name': 'White', 'hex': '#FFFFFFFF', 'color': Color(0xFFFFFFFF)},
    {'name': 'Cinema Yellow', 'hex': '#FFFFEB3B', 'color': Color(0xFFFFEB3B)},
    {'name': 'Amber Gold', 'hex': '#FFFFC107', 'color': Color(0xFFFFC107)},
    {'name': 'Electric Cyan', 'hex': '#00E5FF', 'color': Color(0xFF00E5FF)},
    {'name': 'Neon Green', 'hex': '#00E676', 'color': Color(0xFF00E676)},
    {'name': 'Vibrant Orange', 'hex': '#FF9100', 'color': Color(0xFFFF9100)},
    {'name': 'Soft Rose', 'hex': '#FF80AB', 'color': Color(0xFFFF80AB)},
    {'name': 'Light Gray', 'hex': '#D1D5DB', 'color': Color(0xFFD1D5DB)},
  ];

  static const List<Map<String, dynamic>> _boxColorOptions = [
    {'name': 'None', 'hex': '#00000000', 'desc': 'Transparent'},
    {'name': '25% Dark', 'hex': '#40000000', 'desc': 'Subtle'},
    {'name': '50% Dark', 'hex': '#80000000', 'desc': 'Standard Box'},
    {'name': '75% Dark', 'hex': '#BF000000', 'desc': 'High Contrast'},
    {'name': '100% Solid', 'hex': '#FF000000', 'desc': 'Opaque Black'},
    {'name': '50% Indigo', 'hex': '#800F172A', 'desc': 'Slate Tint'},
  ];

  static const List<Map<String, dynamic>> _borderColorPalette = [
    {'name': 'Black', 'hex': '#FF000000', 'color': Color(0xFF000000)},
    {'name': 'Dark Slate', 'hex': '#FF1E293B', 'color': Color(0xFF1E293B)},
    {'name': 'White', 'hex': '#FFFFFFFF', 'color': Color(0xFFFFFFFF)},
    {'name': 'Gold', 'hex': '#FFFFD700', 'color': Color(0xFFFFD700)},
    {'name': 'Crimson', 'hex': '#FFE11D48', 'color': Color(0xFFE11D48)},
    {'name': 'Neon Cyan', 'hex': '#FF00E5FF', 'color': Color(0xFF00E5FF)},
  ];

  Color _parseColorFromHex(String hex, {Color fallback = Colors.white}) {
    var str = hex.replaceAll('#', '').trim();
    if (str.length == 6) {
      str = 'FF$str';
    }
    if (str.length == 8) {
      final val = int.tryParse(str, radix: 16);
      if (val != null) return Color(val);
    }
    return fallback;
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final isCompact = screen.width < 600;
    final isLandscapeMobile = screen.height < 500;

    final double cardWidth;
    if (isCompact) {
      cardWidth = (screen.width - 24).clamp(320.0, 560.0);
    } else if (isLandscapeMobile) {
      cardWidth = (screen.width - 32).clamp(440.0, 680.0);
    } else {
      cardWidth = (640.0).clamp(460.0, screen.width - 48);
    }

    final double cardHeight;
    if (isLandscapeMobile) {
      cardHeight = (screen.height - 32).clamp(240.0, screen.height - 20);
    } else if (isCompact) {
      cardHeight = (screen.height * 0.85).clamp(420.0, 660.0);
    } else {
      cardHeight = (screen.height * 0.76).clamp(520.0, 720.0);
    }

    return ValueListenableBuilder<int>(
      valueListenable: PlayerSettings.changeNotifier,
      builder: (context, _, __) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: PlayerGlassCard(
              width: cardWidth,
              height: cardHeight,
              borderRadius: ZplayRadius.lg,
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  // 1. Header Bar
                  _buildHeader(context, isCompact || isLandscapeMobile),

                  // 2. Interactive Live Preview
                  _buildLivePreview(isLandscapeMobile),

                  // 3. Quick Presets Carousel
                  _buildPresetsBar(),

                  // Forui owns the tab state and scrollable content.
                  Expanded(child: _buildTabs()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Header
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildHeader(BuildContext context, bool isSmall) {
    final tokens = context.tokens;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ZplaySpacing.s16,
        vertical: isSmall ? ZplaySpacing.s8 : ZplaySpacing.s12,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: PlayerTheme.edgeSoft)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: isSmall ? 28 : 34,
                  height: isSmall ? 28 : 34,
                  decoration: BoxDecoration(
                    color: PlayerTheme.accentSoft,
                    borderRadius: ZplayRadius.smAll,
                  ),
                  child: Icon(
                    Icons.subtitles_rounded,
                    color: PlayerTheme.accent,
                    size: isSmall ? 16 : 19,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10nOf(context).uiPlayerSubStyleModalSubtitleAppearance,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ZplayType.subtitle
                            .copyWith(
                              size: isSmall ? 13.5 : 15.5,
                              weight: FontWeight.w800,
                            )
                            .toStyle(color: PlayerTheme.ink),
                      ),
                      Text(
                        l10nOf(
                          context,
                        ).uiPlayerSubStyleModalLibassLibmpvHardwareRenderedSubtitles,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ZplayType.caption.toStyle(
                          color: PlayerTheme.inkSubtle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              // Reset Button
              KiruIconButton(
                icon: Icon(
                  Icons.restart_alt_rounded,
                  size: 19,
                  color: PlayerTheme.inkMuted,
                ),
                tooltip: l10nOf(
                  context,
                ).uiPlayerSubStyleModalResetSubtitleDefaults,
                onPressed: () =>
                    PlayerSettings.resetSubtitleDefaults(player: widget.player),
              ),
              // Close Button
              KiruIconButton(
                icon: Icon(
                  Icons.close_rounded,
                  size: 20,
                  color: tokens.textPrimary,
                ),
                tooltip: l10nOf(context).uiPlayerSubStyleModalClose,
                onPressed: widget.onClose,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Live Subtitle Preview Area
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildLivePreview(bool isLandscapeMobile) {
    final tokens = context.tokens;

    if (isLandscapeMobile) return const SizedBox.shrink();

    final textColor = _parseColorFromHex(PlayerSettings.subColor.value);
    final boxColor = _parseColorFromHex(
      PlayerSettings.subBackColor.value,
      fallback: Colors.transparent,
    );
    final borderColor = _parseColorFromHex(
      PlayerSettings.subBorderColor.value,
      fallback: Colors.black,
    );
    final shadowColor = _parseColorFromHex(
      PlayerSettings.subShadowColor.value,
      fallback: Colors.black54,
    );

    final fontName = PlayerSettings.subFont.value == 'subfont'
        ? 'Poppins'
        : PlayerSettings.subFont.value;

    final fontSize =
        (PlayerSettings.subFontSize.value *
                0.55 *
                PlayerSettings.subScale.value)
            .clamp(11.0, 32.0);
    final borderSize = (PlayerSettings.subBorderSize.value * 0.75).clamp(
      0.0,
      5.0,
    );
    final shadowOffset = PlayerSettings.subShadowOffset.value * 1.2;

    return Container(
      margin: const EdgeInsets.fromLTRB(14, 10, 14, 6),
      height: 74,
      decoration: BoxDecoration(
        borderRadius: ZplayRadius.mdAll,
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF020617), Color(0xFF1E1B4B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: tokens.textPrimary.withValues(
            alpha: ZplayOpacity.borderMedium,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: tokens.bg.withValues(alpha: 0.45),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background ambient grid / video frame simulator
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: CustomPaint(painter: _VideoGridPainter()),
            ),
          ),

          // Live Subtitle Text
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: ZplaySpacing.s12,
              vertical: ZplaySpacing.s4,
            ),
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: ZplayRadius.xsAll,
            ),
            child: Text(
              l10nOf(context).uiPlayerSubStyleModalZplaySampleSubtitlePreview,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: fontName,
                fontSize: fontSize,
                fontWeight: PlayerSettings.subBold.value
                    ? FontWeight.bold
                    : FontWeight.w600,
                fontStyle: PlayerSettings.subItalic.value
                    ? FontStyle.italic
                    : FontStyle.normal,
                color: textColor,
                shadows: [
                  if (borderSize > 0) ...[
                    Shadow(
                      color: borderColor,
                      offset: Offset(-borderSize, -borderSize),
                    ),
                    Shadow(
                      color: borderColor,
                      offset: Offset(borderSize, -borderSize),
                    ),
                    Shadow(
                      color: borderColor,
                      offset: Offset(borderSize, borderSize),
                    ),
                    Shadow(
                      color: borderColor,
                      offset: Offset(-borderSize, borderSize),
                    ),
                  ],
                  if (shadowOffset > 0)
                    Shadow(
                      color: shadowColor,
                      offset: Offset(shadowOffset, shadowOffset),
                      blurRadius: shadowOffset * 1.5,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Presets Horizontal Bar
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildPresetsBar() {
    final tokens = context.tokens;
    final activePreset = PlayerSettings.subStylePreset.value;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: PlayerTheme.edgeSoft)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: SubtitleStylePreset.values.map((preset) {
            final isSelected = activePreset == preset;
            return Padding(
              padding: const EdgeInsets.only(right: ZplaySpacing.s8),
              child: FocusableInkWell(
                onTap: () => PlayerSettings.setSubStylePreset(
                  preset,
                  player: widget.player,
                ),
                borderRadius: ZplayRadius.smAll,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? PlayerTheme.accent : PlayerTheme.raised,
                    borderRadius: ZplayRadius.smAll,
                    border: Border.all(
                      color: isSelected
                          ? PlayerTheme.accentGlow
                          : PlayerTheme.edgeSoft,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (preset != SubtitleStylePreset.custom)
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(right: 6),
                          decoration: BoxDecoration(
                            color: _parseColorFromHex(preset.textColor),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: tokens.textPrimary.withValues(alpha: 0.30),
                              width: 0.8,
                            ),
                          ),
                        ),
                      Text(
                        configLabel(context, preset.label),
                        style: ZplayType.caption
                            .copyWith(
                              weight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w600,
                            )
                            .toStyle(
                              color: isSelected
                                  ? tokens.textPrimary
                                  : PlayerTheme.inkMuted,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Tab Bar Navigation
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildTabs() => KiruForuiTheme.ensure(context, (context) {
    Widget label(IconData icon, String title) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon, size: 16), const SizedBox(width: 6), Text(title)],
    );
    return f.FTabs(
      scrollable: true,
      expands: true,
      children: [
        f.FTabEntry(
          label: label(
            Icons.text_fields_rounded,
            l10nOf(context).finalPlayerSubStyleModalTypography,
          ),
          child: _buildTypographyTab(),
        ),
        f.FTabEntry(
          label: label(
            Icons.palette_rounded,
            l10nOf(context).finalPlayerSubStyleModalColorsBox,
          ),
          child: _buildColorsAndBoxTab(),
        ),
        f.FTabEntry(
          label: label(
            Icons.border_style_rounded,
            l10nOf(context).finalPlayerSubStyleModalOutlineShadow,
          ),
          child: _buildOutlinesAndShadowsTab(),
        ),
        f.FTabEntry(
          label: label(
            Icons.vertical_align_bottom_rounded,
            l10nOf(context).finalPlayerSubStyleModalPosition,
          ),
          child: _buildPositionAndLayoutTab(),
        ),
        f.FTabEntry(
          label: label(
            Icons.tune_rounded,
            l10nOf(context).finalPlayerSubStyleModalAdvancedAss,
          ),
          child: _buildAdvancedTab(),
        ),
      ],
    );
  });

  Widget _buildTypographyTab() {
    final tokens = context.tokens;

    return ListView(
      padding: const EdgeInsets.all(ZplaySpacing.s16),
      physics: const BouncingScrollPhysics(),
      children: [
        // Font Family Selector
        _buildSectionTitle(l10nOf(context).finalPlayerSubStyleModalFontFamily),
        const SizedBox(height: ZplaySpacing.s8),
        KiruForuiTheme.ensure(
          context,
          (context) => KiruSelect<String>(
            value:
                PlayerSettings.popularFonts.contains(
                  PlayerSettings.subFont.value,
                )
                ? PlayerSettings.subFont.value
                : 'subfont',
            items: {
              for (final font in PlayerSettings.popularFonts)
                (font == 'subfont' ? 'Default (Kiru Subfont)' : font): font,
            },
            onChanged: (value) {
              if (value != null)
                PlayerSettings.setSubFont(value, player: widget.player);
            },
          ),
        ),

        const SizedBox(height: 18),

        // Base Font Size Slider
        _buildSectionTitle(
          l10nOf(
            context,
          ).subtitleBaseFontSize((PlayerSettings.subFontSize.value).toString()),
        ),
        Row(
          children: [
            KiruIconButton(
              icon: Icon(
                Icons.remove_circle_outline_rounded,
                size: 20,
                color: tokens.textEmphasis,
              ),
              onPressed: () => PlayerSettings.setSubFontSize(
                PlayerSettings.subFontSize.value - 2,
                player: widget.player,
              ),
            ),
            Expanded(
              child: KiruSlider(
                value: PlayerSettings.subFontSize.value.toDouble(),
                min: 16.0,
                max: 72.0,
                divisions: 28,
                onChanged: (v) => PlayerSettings.setSubFontSize(
                  v.round(),
                  player: widget.player,
                ),
              ),
            ),
            KiruIconButton(
              icon: Icon(
                Icons.add_circle_outline_rounded,
                size: 20,
                color: tokens.textEmphasis,
              ),
              onPressed: () => PlayerSettings.setSubFontSize(
                PlayerSettings.subFontSize.value + 2,
                player: widget.player,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Scale Multiplier Slider
        _buildSectionTitle(
          l10nOf(context).subtitleScaleMultiplier(
            ((PlayerSettings.subScale.value * 100).round()).toString(),
          ),
        ),
        KiruSlider(
          value: PlayerSettings.subScale.value,
          min: 0.5,
          max: 2.5,
          divisions: 20,
          onChanged: (v) =>
              PlayerSettings.setSubScale(v, player: widget.player),
        ),

        const SizedBox(height: 14),

        // Bold and Italic Toggles
        Row(
          children: [
            Expanded(
              child: _buildToggleTile(
                title: l10nOf(context).uiPlayerSubStyleModalBoldText,
                icon: Icons.format_bold_rounded,
                value: PlayerSettings.subBold.value,
                onChanged: (val) =>
                    PlayerSettings.setSubBold(val, player: widget.player),
              ),
            ),
            const SizedBox(width: ZplaySpacing.s12),
            Expanded(
              child: _buildToggleTile(
                title: l10nOf(context).uiPlayerSubStyleModalItalicText,
                icon: Icons.format_italic_rounded,
                value: PlayerSettings.subItalic.value,
                onChanged: (val) =>
                    PlayerSettings.setSubItalic(val, player: widget.player),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Tab 2: Colors & Box
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildColorsAndBoxTab() {
    final tokens = context.tokens;
    final activeColor = PlayerSettings.subColor.value;
    final activeBox = PlayerSettings.subBackColor.value;

    return ListView(
      padding: const EdgeInsets.all(ZplaySpacing.s16),
      physics: const BouncingScrollPhysics(),
      children: [
        // Text Color Palette
        _buildSectionTitle(
          l10nOf(context).finalPlayerSubStyleModalSubtitleTextColor,
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _textColorPalette.map((item) {
            final isSelected =
                activeColor.toLowerCase() ==
                (item['hex'] as String).toLowerCase();
            return FocusableInkWell(
              onTap: () => PlayerSettings.setSubColor(
                item['hex'],
                player: widget.player,
              ),
              borderRadius: ZplayRadius.smAll,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? PlayerTheme.accent : PlayerTheme.raised,
                  borderRadius: ZplayRadius.smAll,
                  border: Border.all(
                    color: isSelected
                        ? PlayerTheme.accentGlow
                        : PlayerTheme.edgeSoft,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: tokens.textPrimary.withValues(alpha: 0.38),
                          width: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(width: ZplaySpacing.s8),
                    Text(
                      item['name'] as String,
                      style: ZplayType.caption
                          .copyWith(weight: FontWeight.w600)
                          .toStyle(
                            color: isSelected
                                ? tokens.textPrimary
                                : PlayerTheme.inkMuted,
                          ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 22),

        // Background Box Style
        _buildSectionTitle(
          l10nOf(
            context,
          ).finalPlayerSubStyleModalBackgroundBoxAccessibilityReadability,
        ),
        const SizedBox(height: 10),
        Column(
          children: _boxColorOptions.map((opt) {
            final isSelected =
                activeBox.toLowerCase() == (opt['hex'] as String).toLowerCase();
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: FocusableInkWell(
                onTap: () => PlayerSettings.setSubBackColor(
                  opt['hex'],
                  player: widget.player,
                ),
                borderRadius: ZplayRadius.smAll,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? PlayerTheme.accentSoft
                        : PlayerTheme.raised,
                    borderRadius: ZplayRadius.smAll,
                    border: Border.all(
                      color: isSelected
                          ? PlayerTheme.accent
                          : PlayerTheme.edgeSoft,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: _parseColorFromHex(opt['hex']),
                              borderRadius: ZplayRadius.xsAll,
                              border: Border.all(
                                color: tokens.textPrimary.withValues(
                                  alpha: 0.30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: ZplaySpacing.s12),
                          Text(
                            _subtitleOptionLabel(opt['name'] as String),
                            style: ZplayType.label
                                .copyWith(weight: FontWeight.w600)
                                .toStyle(color: tokens.textPrimary),
                          ),
                        ],
                      ),
                      Text(
                        _subtitleOptionLabel(opt['desc'] as String),
                        style: ZplayType.caption.toStyle(
                          color: PlayerTheme.inkSubtle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Tab 3: Outlines & Shadows
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildOutlinesAndShadowsTab() {
    final tokens = context.tokens;
    final activeBorderColor = PlayerSettings.subBorderColor.value;

    return ListView(
      padding: const EdgeInsets.all(ZplaySpacing.s16),
      physics: const BouncingScrollPhysics(),
      children: [
        // Outline Color Selector
        _buildSectionTitle(
          l10nOf(context).finalPlayerSubStyleModalOutlineBorderColor,
        ),
        const SizedBox(height: ZplaySpacing.s8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _borderColorPalette.map((item) {
            final isSelected =
                activeBorderColor.toLowerCase() ==
                (item['hex'] as String).toLowerCase();
            return FocusableInkWell(
              onTap: () => PlayerSettings.setSubBorderColor(
                item['hex'],
                player: widget.player,
              ),
              borderRadius: ZplayRadius.smAll,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? PlayerTheme.accent : PlayerTheme.raised,
                  borderRadius: ZplayRadius.smAll,
                  border: Border.all(
                    color: isSelected
                        ? PlayerTheme.accentGlow
                        : PlayerTheme.edgeSoft,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: tokens.textPrimary.withValues(alpha: 0.38),
                          width: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(width: ZplaySpacing.s8),
                    Text(
                      item['name'] as String,
                      style: ZplayType.caption
                          .copyWith(weight: FontWeight.w600)
                          .toStyle(
                            color: isSelected
                                ? tokens.textPrimary
                                : PlayerTheme.inkMuted,
                          ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 18),

        // Outline Thickness Slider
        _buildSectionTitle(
          l10nOf(context).subtitleOutlineThickness(
            (PlayerSettings.subBorderSize.value.toStringAsFixed(1)).toString(),
          ),
        ),
        KiruSlider(
          value: PlayerSettings.subBorderSize.value,
          min: 0.0,
          max: 6.0,
          divisions: 12,
          onChanged: (v) =>
              PlayerSettings.setSubBorderSize(v, player: widget.player),
        ),

        const SizedBox(height: 18),

        // Drop Shadow Offset Slider
        _buildSectionTitle(
          l10nOf(context).subtitleShadowOffset(
            (PlayerSettings.subShadowOffset.value.toStringAsFixed(
              1,
            )).toString(),
          ),
        ),
        KiruSlider(
          value: PlayerSettings.subShadowOffset.value,
          min: 0.0,
          max: 6.0,
          divisions: 12,
          onChanged: (v) =>
              PlayerSettings.setSubShadowOffset(v, player: widget.player),
        ),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Tab 4: Position & Layout
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildPositionAndLayoutTab() {
    return ListView(
      padding: const EdgeInsets.all(ZplaySpacing.s16),
      physics: const BouncingScrollPhysics(),
      children: [
        // Horizontal Alignment
        _buildSectionTitle(
          l10nOf(context).finalPlayerSubStyleModalHorizontalAlignment,
        ),
        const SizedBox(height: ZplaySpacing.s8),
        Row(
          children: [
            _buildAlignButton('Left', 'left', Icons.format_align_left_rounded),
            const SizedBox(width: ZplaySpacing.s8),
            _buildAlignButton(
              'Center',
              'center',
              Icons.format_align_center_rounded,
            ),
            const SizedBox(width: ZplaySpacing.s8),
            _buildAlignButton(
              'Right',
              'right',
              Icons.format_align_right_rounded,
            ),
          ],
        ),

        const SizedBox(height: ZplaySpacing.s20),

        // Bottom Margin
        _buildSectionTitle(
          l10nOf(context).subtitleBottomMargin(
            (PlayerSettings.subMarginY.value.round()).toString(),
          ),
        ),
        KiruSlider(
          value: PlayerSettings.subMarginY.value,
          min: 10.0,
          max: 150.0,
          divisions: 28,
          onChanged: (v) =>
              PlayerSettings.setSubMarginY(v, player: widget.player),
        ),

        const SizedBox(height: ZplaySpacing.s20),

        // Vertical Screen Position
        _buildSectionTitle(
          l10nOf(context).subtitleVerticalPosition(
            (PlayerSettings.subPos.value.round()).toString(),
          ),
        ),
        KiruSlider(
          value: PlayerSettings.subPos.value,
          min: 0.0,
          max: 100.0,
          divisions: 20,
          onChanged: (v) => PlayerSettings.setSubPos(v, player: widget.player),
        ),
      ],
    );
  }

  Widget _buildAlignButton(String title, String alignVal, IconData icon) {
    final tokens = context.tokens;
    final isSelected = PlayerSettings.subAlignX.value == alignVal;
    return Expanded(
      child: FocusableInkWell(
        onTap: () =>
            PlayerSettings.setSubAlignX(alignVal, player: widget.player),
        borderRadius: ZplayRadius.smAll,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? PlayerTheme.accent : PlayerTheme.raised,
            borderRadius: ZplayRadius.smAll,
            border: Border.all(
              color: isSelected ? PlayerTheme.accentGlow : PlayerTheme.edgeSoft,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? tokens.onAccent : PlayerTheme.inkSubtle,
                size: 18,
              ),
              const SizedBox(height: ZplaySpacing.s4),
              Text(
                title,
                style: ZplayType.caption
                    .copyWith(weight: FontWeight.w600)
                    .toStyle(
                      color: isSelected
                          ? tokens.textPrimary
                          : PlayerTheme.inkMuted,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Tab 5: Advanced / ASS Script Behavior
  // ───────────────────────────────────────────────────────────────────────────

  Widget _buildAdvancedTab() {
    final tokens = context.tokens;
    final activeOverride = PlayerSettings.subAssOverride.value;

    final overrideModes = [
      {
        'val': 'no',
        'title': 'Preserve Anime & SSA/ASS Styling (Recommended)',
        'subtitle':
            'Leaves SSA/ASS anime subtitles untouched to preserve custom karaoke, styling & positions. Plain SRT/VTT are styled with your custom theme.',
      },
      {
        'val': 'scale',
        'title': 'Scale Only',
        'subtitle':
            'Applies size scaling to SSA/ASS scripts while preserving their fonts, colors, and author typography.',
      },
      {
        'val': 'yes',
        'title': 'Override Colors & Outlines',
        'subtitle':
            'Applies your custom colors and outlines on top of SSA/ASS subtitle scripts.',
      },
      {
        'val': 'force',
        'title': 'Force Full Override (Aggressive)',
        'subtitle':
            'Forces all custom fonts, colors, and styles onto all subtitle formats (may break anime effects).',
      },
    ];

    final useLibass = PlayerSettings.useLibass.value;

    return ListView(
      padding: const EdgeInsets.all(ZplaySpacing.s16),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildSectionTitle(
          l10nOf(context).finalPlayerSubStyleModalSubtitleRenderingEngine,
        ),
        const SizedBox(height: 10),

        // Flutter Engine Option
        Padding(
          padding: const EdgeInsets.only(bottom: ZplaySpacing.s8),
          child: FocusableInkWell(
            onTap: () =>
                PlayerSettings.setUseLibass(false, player: widget.player),
            borderRadius: ZplayRadius.smAll,
            child: Container(
              padding: const EdgeInsets.all(ZplaySpacing.s12),
              decoration: BoxDecoration(
                color: !useLibass ? PlayerTheme.accentSoft : PlayerTheme.raised,
                borderRadius: ZplayRadius.smAll,
                border: Border.all(
                  color: !useLibass ? PlayerTheme.accent : PlayerTheme.edgeSoft,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlayerRadio<bool>(
                    value: false,
                    groupValue: useLibass,
                    activeColor: PlayerTheme.accent,
                    onChanged: (val) {
                      if (val != null) {
                        PlayerSettings.setUseLibass(val, player: widget.player);
                      }
                    },
                  ),
                  const SizedBox(width: ZplaySpacing.s8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10nOf(
                            context,
                          ).uiPlayerSubStyleModalFlutterSubtitleEngineRecommended,
                          style: ZplayType.label
                              .copyWith(weight: FontWeight.w700)
                              .toStyle(color: tokens.textPrimary),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          l10nOf(
                            context,
                          ).uiPlayerSubStyleModal100ReliableHardwareAcceleratedSubtitle,
                          style: ZplayType.caption.toStyle(
                            color: PlayerTheme.inkSubtle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Native libass Option
        Padding(
          padding: const EdgeInsets.only(bottom: ZplaySpacing.s16),
          child: FocusableInkWell(
            onTap: () =>
                PlayerSettings.setUseLibass(true, player: widget.player),
            borderRadius: ZplayRadius.smAll,
            child: Container(
              padding: const EdgeInsets.all(ZplaySpacing.s12),
              decoration: BoxDecoration(
                color: useLibass ? PlayerTheme.accentSoft : PlayerTheme.raised,
                borderRadius: ZplayRadius.smAll,
                border: Border.all(
                  color: useLibass ? PlayerTheme.accent : PlayerTheme.edgeSoft,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlayerRadio<bool>(
                    value: true,
                    groupValue: useLibass,
                    activeColor: PlayerTheme.accent,
                    onChanged: (val) {
                      if (val != null) {
                        PlayerSettings.setUseLibass(val, player: widget.player);
                      }
                    },
                  ),
                  const SizedBox(width: ZplaySpacing.s8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10nOf(
                            context,
                          ).uiPlayerSubStyleModalNativeMpvLibassEngine,
                          style: ZplayType.label
                              .copyWith(weight: FontWeight.w700)
                              .toStyle(color: tokens.textPrimary),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          l10nOf(
                            context,
                          ).uiPlayerSubStyleModalDirectGpuVideoTextureRendering,
                          style: ZplayType.caption.toStyle(
                            color: PlayerTheme.inkSubtle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        _buildSectionTitle(
          l10nOf(
            context,
          ).finalPlayerSubStyleModalSsaAssFansubScriptOverrideMode,
        ),
        const SizedBox(height: 10),
        ...overrideModes.map((m) {
          final isSelected = activeOverride == m['val'];
          return Padding(
            padding: const EdgeInsets.only(bottom: ZplaySpacing.s8),
            child: FocusableInkWell(
              onTap: () => PlayerSettings.setSubAssOverride(
                m['val']!,
                player: widget.player,
              ),
              borderRadius: ZplayRadius.smAll,
              child: Container(
                padding: const EdgeInsets.all(ZplaySpacing.s12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? PlayerTheme.accentSoft
                      : PlayerTheme.raised,
                  borderRadius: ZplayRadius.smAll,
                  border: Border.all(
                    color: isSelected
                        ? PlayerTheme.accent
                        : PlayerTheme.edgeSoft,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlayerRadio<String>(
                      value: m['val']!,
                      groupValue: activeOverride,
                      activeColor: PlayerTheme.accent,
                      onChanged: (val) {
                        if (val != null) {
                          PlayerSettings.setSubAssOverride(
                            val,
                            player: widget.player,
                          );
                        }
                      },
                    ),
                    const SizedBox(width: ZplaySpacing.s8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _subtitleOptionLabel(m['title']!),
                            style: ZplayType.label
                                .copyWith(weight: FontWeight.w700)
                                .toStyle(color: tokens.textPrimary),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            _subtitleOptionLabel(m['subtitle']!),
                            style: ZplayType.caption.toStyle(
                              color: PlayerTheme.inkSubtle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────────────────────
  // Helper Component Builders
  // ───────────────────────────────────────────────────────────────────────────

  String _subtitleOptionLabel(String raw) {
    final l10n = l10nOf(context);
    return switch (raw) {
      'White' => l10n.subtitleOptionWhite0,
      'Cinema Yellow' => l10n.subtitleOptionCinemaYellow1,
      'Amber Gold' => l10n.subtitleOptionAmberGold2,
      'Electric Cyan' => l10n.subtitleOptionElectricCyan3,
      'Neon Green' => l10n.subtitleOptionNeonGreen4,
      'Vibrant Orange' => l10n.subtitleOptionVibrantOrange5,
      'Soft Rose' => l10n.subtitleOptionSoftRose6,
      'Light Gray' => l10n.subtitleOptionLightGray7,
      'None' => l10n.subtitleOptionNone8,
      '25% Dark' => l10n.subtitleOption25Dark9,
      '50% Dark' => l10n.subtitleOption50Dark10,
      '75% Dark' => l10n.subtitleOption75Dark11,
      '100% Solid' => l10n.subtitleOption100Solid12,
      '50% Indigo' => l10n.subtitleOption50Indigo13,
      'Transparent' => l10n.subtitleOptionTransparent14,
      'Subtle' => l10n.subtitleOptionSubtle15,
      'Standard Box' => l10n.subtitleOptionStandardBox16,
      'High Contrast' => l10n.subtitleOptionHighContrast17,
      'Opaque Black' => l10n.subtitleOptionOpaqueBlack18,
      'Slate Tint' => l10n.subtitleOptionSlateTint19,
      'Black' => l10n.subtitleOptionBlack20,
      'Dark Slate' => l10n.subtitleOptionDarkSlate21,
      'Gold' => l10n.subtitleOptionGold22,
      'Crimson' => l10n.subtitleOptionCrimson23,
      'Neon Cyan' => l10n.subtitleOptionNeonCyan24,
      'Preserve Anime & SSA/ASS Styling (Recommended)' =>
        l10n.subtitleOptionPreserveAnimeSsaAssStylingRecommended25,
      'Leaves SSA/ASS anime subtitles untouched to preserve custom karaoke, styling & positions. Plain SRT/VTT are styled with your custom theme.' =>
        l10n.subtitleOptionLeavesSsaAssAnimeSubtitlesUntouched26,
      'Scale Only' => l10n.subtitleOptionScaleOnly27,
      'Applies size scaling to SSA/ASS scripts while preserving their fonts, colors, and author typography.' =>
        l10n.subtitleOptionAppliesSizeScalingToSsaAss28,
      'Override Colors & Outlines' =>
        l10n.subtitleOptionOverrideColorsOutlines29,
      'Applies your custom colors and outlines on top of SSA/ASS subtitle scripts.' =>
        l10n.subtitleOptionAppliesYourCustomColorsAndOutlines30,
      _ => raw,
    };
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: ZplayType.overline
          .copyWith(weight: FontWeight.w700, letterSpacing: 1.1)
          .toStyle(color: PlayerTheme.inkSubtle),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    final tokens = context.tokens;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ZplaySpacing.s12,
        vertical: ZplaySpacing.s8,
      ),
      decoration: BoxDecoration(
        color: PlayerTheme.raised,
        borderRadius: ZplayRadius.smAll,
        border: Border.all(color: PlayerTheme.edgeSoft),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: tokens.textEmphasis),
              const SizedBox(width: ZplaySpacing.s8),
              Text(
                title,
                style: ZplayType.label
                    .copyWith(weight: FontWeight.w600)
                    .toStyle(color: tokens.textPrimary),
              ),
            ],
          ),
          KiruSwitch(
            value: value,
            activeColor: PlayerTheme.accent,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _VideoGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppThemeService.currentTokens.textPrimary.withValues(
        alpha: 0.24,
      )
      ..strokeWidth = 0.5;

    for (double i = 0; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
