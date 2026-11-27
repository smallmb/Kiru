import '../ui/kiru_controls.dart';
import 'package:zplay/l10n/l10n.dart';

import 'package:flutter/material.dart';
import '../../services/theme/design_tokens.dart';
import 'player_glass.dart';
import 'player_menu_rows.dart';

class AspectOption {
  final String id;
  final String label;
  final BoxFit fit;

  const AspectOption({
    required this.id,
    required this.label,
    required this.fit,
  });
}

const List<AspectOption> aspectOptions = [
  AspectOption(
    id: 'fit',
    label: 'Fit to screen (Contain)',
    fit: BoxFit.contain,
  ),
  AspectOption(
    id: 'cover',
    label: 'Fill screen (Crop/Zoom)',
    fit: BoxFit.cover,
  ),
  AspectOption(id: 'fill', label: 'Stretch to fill', fit: BoxFit.fill),
];

/// Aspect ratio and picture popover menu.
class PlayerAspectMenu extends StatelessWidget {
  final BoxFit currentFit;
  final double subtitleScale;
  final ValueChanged<BoxFit> onFitSelected;
  final ValueChanged<double> onSubtitleScaleChanged;
  final VoidCallback onClose;

  const PlayerAspectMenu({
    super.key,
    required this.currentFit,
    required this.subtitleScale,
    required this.onFitSelected,
    required this.onSubtitleScaleChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final tokens = context.tokens;

    return PlayerGlassCard(
      width: (320.0).clamp(240.0, screenWidth - 32),
      padding: const EdgeInsets.all(ZplaySpacing.s12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          PlayerMenuHeader(
            title: l10nOf(context).uiPlayerAspectMenuAspectRatio,
            onClose: onClose,
          ),

          const SizedBox(height: 6),

          // Aspect Options List
          Column(
            children: aspectOptions.map((opt) {
              return PlayerMenuOption(
                label: switch (opt.id) {
                  'fit' => l10nOf(context).aspectFit,
                  'cover' => l10nOf(context).aspectCover,
                  'fill' => l10nOf(context).aspectStretch,
                  _ => opt.label,
                },
                selected: currentFit == opt.fit,
                onTap: () {
                  onFitSelected(opt.fit);
                  onClose();
                },
              );
            }).toList(),
          ),

          const SizedBox(height: ZplaySpacing.s12),
          KiruDivider(color: tokens.borderDefault, height: 1),
          const SizedBox(height: ZplaySpacing.s12),

          // Subtitle Size Scaling Slider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: ZplaySpacing.s8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10nOf(context).uiPlayerAspectMenuSubtitleSizeScale,
                  style: ZplayType.bodySmall
                      .copyWith(size: 12.5, weight: FontWeight.w500)
                      .toStyle(color: PlayerTheme.inkMuted),
                ),
                Text(
                  '${subtitleScale.toStringAsFixed(1)}×',
                  style: ZplayType.bodySmall
                      .copyWith(size: 12.5, weight: FontWeight.w700)
                      .toStyle(color: PlayerTheme.ink, tabular: true),
                ),
              ],
            ),
          ),
          KiruSlider(
            value: subtitleScale,
            min: 0.5,
            max: 2.5,
            divisions: 20,
            onChanged: onSubtitleScaleChanged,
          ),
        ],
      ),
    );
  }
}
