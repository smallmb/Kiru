import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart' as f;
import '../../services/theme/forui_theme.dart';
import '../../services/theme/design_tokens.dart';

/// A flat, rounded Forui interaction surface for custom content and cards.
/// The child owns its layout and artwork; no Material ink or splash is drawn.
class KiruTappable extends StatelessWidget {
  const KiruTappable({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.focusNode,
    this.autofocus = false,
  });
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(context, (
    context,
  ) {
    final tokens = context.tokens;
    final radius = borderRadius ?? BorderRadius.circular(8);
    return f.FTappable.static(
      onPress: onTap,
      focusNode: focusNode,
      autofocus: autofocus,
      behavior: HitTestBehavior.opaque,
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
      },
      style: f.FTappableStyle(
        cursor: f.FVariants.all(
          onTap == null ? SystemMouseCursors.basic : SystemMouseCursors.click,
        ),
        motion: f.FTappableMotion.none,
        pressedEnterDuration: Duration.zero,
        pressedExitDuration: Duration.zero,
      ),
      builder: (context, variants, _) {
        final pressed = variants.contains(f.FTappableVariant.pressed);
        final hovered = variants.contains(f.FTappableVariant.hovered);
        final focused = variants.contains(f.FTappableVariant.focused);
        return DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            borderRadius: radius,
            color: onTap == null
                ? Colors.transparent
                : tokens.textPrimary.withValues(
                    alpha: pressed
                        ? .12
                        : hovered || focused
                        ? .06
                        : 0,
                  ),
            border: focused && onTap != null
                ? Border.all(color: tokens.accent, width: 2)
                : null,
          ),
          child: child,
        );
      },
    );
  });
}
