import 'package:flutter/material.dart';

import '../../services/theme/design_tokens.dart';
import 'settings_row_surface.dart';

/// A navigating settings row inside a grouped section: bare 20 px leading icon,
/// title and subtitle, with the row's value right-aligned ahead of the chevron.
///
/// [iconColor] defaults to the accent, which is what a row whose icon says
/// nothing about state wears. Pass a colour only where the icon reports one -
/// brand hues for third-party services, the semantic warning/success for a
/// toggled state.
class SettingsNavRow extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final String? valueText;
  final VoidCallback onTap;

  const SettingsNavRow({
    super.key,
    required this.icon,
    this.iconColor,
    required this.title,
    required this.subtitle,
    this.valueText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    return SettingsRowSurface(
      onTap: onTap,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ZplaySpacing.s16,
          vertical: ZplaySpacing.s12,
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: iconColor ?? tokens.accent),
            const SizedBox(width: ZplaySpacing.s16),

            // Title and Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: ZplayType.subtitle.toStyle(
                      color: tokens.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: ZplaySpacing.s2),
                  Text(
                    subtitle,
                    style: ZplayType.bodySmall.toStyle(
                      color: tokens.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            if (valueText != null) ...[
              const SizedBox(width: ZplaySpacing.s12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 150),
                child: Text(
                  valueText!,
                  style: ZplayType.caption.toStyle(color: tokens.textMuted),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],

            const SizedBox(width: ZplaySpacing.s8),

            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: tokens.textDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
