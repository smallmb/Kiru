import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forui/forui.dart' as f;
import '../../services/theme/forui_theme.dart';
import '../../services/theme/design_tokens.dart';
import '../common/focusable_card.dart';

/// Forui interaction primitive for custom player visuals. Preserve the
/// player's external focus ownership and remote activation contracts.
class PlayerTappable extends StatelessWidget {
  const PlayerTappable({
    super.key,
    required this.builder,
    this.onTap,
    this.focusNode,
    this.enabled = true,
    this.cursor = SystemMouseCursors.click,
  });
  final Widget Function(BuildContext, CardInteraction) builder;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool enabled;
  final MouseCursor cursor;

  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => f.FTappable.static(
      focusNode: focusNode,
      onPress: enabled ? onTap : null,
      behavior: HitTestBehavior.opaque,
      style: f.FTappableStyle(
        cursor: f.FVariants.all(cursor),
        pressedEnterDuration: Duration.zero,
        pressedExitDuration: Duration.zero,
        motion: f.FTappableMotion.none,
      ),
      shortcuts: const {
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
      },
      builder: (context, variants, _) => builder(
        context,
        CardInteraction(
          hovered: variants.contains(f.FTappableVariant.hovered),
          focused: variants.contains(f.FTappableVariant.focused),
          pressed: variants.contains(f.FTappableVariant.pressed),
        ),
      ),
    ),
  );
}

/// Media progress uses the Forui paint surface without the default 1 second
/// interpolation. The caller continues to own gestures, buffers and markers.
class PlayerTrackFill extends StatelessWidget {
  const PlayerTrackFill({
    super.key,
    required this.value,
    required this.height,
    required this.fill,
    this.track = const BoxDecoration(),
  });
  final double value, height;
  final Decoration fill, track;
  @override
  Widget build(BuildContext context) => KiruForuiTheme.ensure(
    context,
    (context) => ExcludeSemantics(
      child: f.FDeterminateProgress(
        value: value.clamp(0.0, 1.0).toDouble(),
        style: f.FDeterminateProgressStyle(
          trackDecoration: track,
          fillDecoration: fill,
          constraints: BoxConstraints.tightFor(height: height),
          motion: const f.FDeterminateProgressMotion(duration: Duration.zero),
        ),
      ),
    ),
  );
}

class PlayerRadio<T> extends StatelessWidget {
  const PlayerRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.activeColor,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Color? activeColor;
  @override
  Widget build(BuildContext context) =>
      KiruForuiTheme.ensure(context, (context) {
        final theme = f.FTheme.of(context);
        return f.FRadio(
          value: value == groupValue,
          enabled: onChanged != null,
          onChange: (selected) {
            if (selected) onChanged?.call(value);
          },
          style: activeColor == null
              ? const .context()
              : f.FRadioStyle.inherit(
                  colors: theme.colors.copyWith(primary: activeColor),
                  style: theme.style,
                  touch:
                      Theme.of(context).platform == TargetPlatform.android ||
                      Theme.of(context).platform == TargetPlatform.iOS,
                ),
        );
      });
}

/// Forui overlay tooltip with the original player palette and a semantic label.
class PlayerTooltip extends StatelessWidget {
  const PlayerTooltip({super.key, required this.message, required this.child});
  final String message;
  final Widget child;
  @override
  Widget build(BuildContext context) =>
      KiruForuiTheme.ensure(context, (context) {
        final tokens = context.tokens;
        final base = f.FTheme.of(context).tooltipStyle;
        return Semantics(
          tooltip: message,
          child: f.FTooltip(
            style: f.FTooltipStyle(
              decoration: BoxDecoration(
                color: tokens.surfaceOverlay,
                borderRadius: ZplayRadius.smAll,
                border: Border.all(color: tokens.borderDefault),
              ),
              textStyle: ZplayType.bodySmall.toStyle(color: tokens.textPrimary),
              hoverEnterDuration: const Duration(milliseconds: 400),
              hapticFeedback: base.hapticFeedback,
            ),
            tipBuilder: (_, _) => Text(message),
            child: child,
          ),
        );
      });
}
