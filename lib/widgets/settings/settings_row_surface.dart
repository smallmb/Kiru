import 'package:flutter/material.dart';
import '../../services/theme/design_tokens.dart';
import '../../services/layout/form_factor.dart';
import '../common/focusable_card.dart';

/// Shared row material: the highlight is inset and rounded, never an InkWell
/// rectangle painted across the parent Material. The existing keyboard/remote
/// activation remains on the entire row.
class SettingsRowSurface extends StatelessWidget {
  const SettingsRowSurface({
    super.key,
    required this.onTap,
    required this.builder,
    this.enabled = true,
  });
  static const radius = BorderRadius.all(Radius.circular(12));
  final VoidCallback? onTap;
  final Widget Function(BuildContext, CardInteraction) builder;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: FormFactorService.hasRemoteInput ? 0 : 2,
      ),
      child: FocusableCard(
        enabled: enabled,
        onTap: onTap,
        builder: (context, state) => AnimatedContainer(
          key: const ValueKey('settings-row-highlight'),
          duration: ZplayMotion.fast,
          decoration: BoxDecoration(
            color: !enabled
                ? Colors.transparent
                : state.pressed
                ? tokens.textPrimary.withValues(alpha: 0.10)
                : state.highlighted
                ? tokens.textPrimary.withValues(alpha: 0.055)
                : Colors.transparent,
            borderRadius: radius,
          ),
          child: CardFocusRing(
            focused: state.focused,
            radius: radius,
            child: builder(context, state),
          ),
        ),
      ),
    );
  }
}
