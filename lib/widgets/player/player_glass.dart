import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart' as f;
import 'package:flutter/services.dart';
import '../../services/theme/forui_theme.dart';
import '../../services/theme/app_theme_service.dart';
import '../../services/theme/design_tokens.dart';
import '../../utils/a11y.dart';
import '../common/focusable_card.dart';
import 'player_forui.dart';
export 'player_forui.dart';

/// The player family's colour vocabulary, bridged onto the contract token layer.
///
/// The player was written against a private palette — a violet accent, a
/// near-black panel, 12% and 7% white edges — none of which followed the user's
/// [AppThemePalette], so every preset rendered the same player. Each member now
/// resolves through [AppThemeService.currentTokens], which memoises one
/// [ZplayTokens] per palette value and re-derives it when [AppThemeService]
/// switches palette; a palette change therefore reaches all ~15 player widgets
/// without renaming anything they read.
///
/// The member names stay because those widgets spell them. The player family
/// will take `context.tokens` directly in a later pass; this bridge keeps a
/// single vocabulary until then. Nothing below is `const` any more — a
/// token-backed colour has no compile-time value, so a call site that needs a
/// constant must inline a literal instead.
class PlayerTheme {
  /// Memoised per palette value by [AppThemeService].
  static ZplayTokens get _tokens => AppThemeService.currentTokens;

  // Backgrounds & Surfaces
  /// Page background behind the video.
  static Color get canvas => _tokens.bg;

  /// Glass panel over the video: the palette's overlay surface, kept at the
  /// original 94% alpha so the backdrop blur still shows the picture through.
  static Color get elevated => _tokens.surfaceOverlay.withValues(alpha: 0.94);

  /// The 10% white pill/chip fill — the audit's [ZplayOpacity.borderMedium] step
  /// used as a fill rather than a border.
  static Color get raised =>
      _tokens.textPrimary.withValues(alpha: ZplayOpacity.borderMedium);

  /// Hover / pressed wash on an interactive surface.
  static Color get surfaceHover =>
      _tokens.textPrimary.withValues(alpha: ZplayOpacity.overlayHover);

  // Borders
  /// The strong hairline: raised surfaces that must stay separated over video.
  static Color get edge => _tokens.borderStrong;

  /// The default hairline on panels and menus.
  static Color get edgeSoft => _tokens.borderDefault;

  // Accents. Sourced from the palette rather than a literal: these were pinned
  // to a hard-coded violet, which is only one palette's primary, so choosing any
  // other palette left the whole player UI purple regardless.
  static Color get accent => _tokens.accent;
  static Color get accentSoft => _tokens.accent.withValues(alpha: 0.20);
  static Color get accentGlow => _tokens.accent.withValues(alpha: 0.40);
  static Color get danger => _tokens.danger;
  static Color get success => _tokens.success;
  static Color get warning => _tokens.warning;

  // Typography / Text Colors
  static Color get ink => _tokens.textPrimary;
  static Color get inkMuted => _tokens.textEmphasis;
  static Color get inkSubtle => _tokens.textMuted;
  static Color get inkDisabled => _tokens.textDisabled;

  // Shadows. The alphas are the original ones — a shadow over video is a scrim,
  // not a surface — but the hue is the palette background, so a warm palette no
  // longer casts a cold black shadow.
  static List<BoxShadow> get menuShadow => [
    BoxShadow(
      color: _tokens.bg.withValues(alpha: 0.80),
      offset: const Offset(0, 24),
      blurRadius: 60,
      spreadRadius: -18,
    ),
    BoxShadow(
      color: _tokens.bg.withValues(alpha: 0.25),
      offset: const Offset(0, 10),
      blurRadius: 30,
      spreadRadius: -5,
    ),
  ];

  static List<BoxShadow> get buttonShadow => [
    BoxShadow(
      color: _tokens.bg.withValues(alpha: 0.30),
      offset: const Offset(0, 4),
      blurRadius: 16,
    ),
  ];
}

/// Floating Frosted Glass Card for menus, dialogs, and popovers.
class PlayerGlassCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Border? border;
  final List<BoxShadow>? shadows;
  final Color? backgroundColor;

  const PlayerGlassCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = ZplayRadius.lg,
    this.padding = EdgeInsets.zero,
    this.border,
    this.shadows,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        // No glossy shadow or rim on player surfaces.
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor ?? PlayerTheme.elevated,
              borderRadius: BorderRadius.circular(borderRadius),
              // A soft frosted surface, without a highlighted edge.
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Interactive button with smooth hover effects, tooltips, and badges.
///
/// Focus is answered with [CardFocusRing] over the disc, plus the same brighter
/// fill hover gets - the app's one indicator, because a television has no
/// pointer. The fill alone was what these buttons had, and a device pass found
/// them the only controls in the app whose focus state was not the ember ring
/// every other card draws.
class PlayerIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final double size;
  final double iconSize;
  final bool active;
  final Color? activeColor;
  final bool showActiveBadge;
  final Color? badgeColor;
  final Color? backgroundColor;
  final double borderRadius;

  /// Optional owner for the focus node, so the player can hand focus to a
  /// specific control when a remote raises the HUD.
  final FocusNode? focusNode;

  const PlayerIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.tooltip,
    this.size = 44,
    this.iconSize = 22,
    this.active = false,
    this.activeColor,
    this.showActiveBadge = false,
    this.badgeColor,
    this.backgroundColor,
    this.borderRadius = ZplayRadius.full,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final isToggle = active || activeColor != null;
    final radius = BorderRadius.circular(borderRadius.clamp(0.0, 10.0));
    return Semantics(
      container: true,
      button: true,
      enabled: onPressed != null,
      toggled: isToggle ? active : null,
      label: tooltip ?? A11y.iconLabel(icon),
      excludeSemantics: true,
      onTap: onPressed,
      child: KiruForuiTheme.ensure(context, (context) {
        final tokens = context.tokens;
        final theme = f.FTheme.of(context);
        final style = f.FButtonStyle.inherit(
          style: theme.style,
          decoration: f.FVariants.from(
            ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: radius),
            ),
            variants: {
              [f.FTappableVariant.hovered]: f.DecorationDelta.shapeDelta(
                color: tokens.textPrimary.withValues(alpha: 0.08),
              ),
              [f.FTappableVariant.pressed]: f.DecorationDelta.shapeDelta(
                color: tokens.textPrimary.withValues(alpha: 0.14),
              ),
            },
          ),
          foregroundColor: active
              ? (activeColor ?? tokens.accent)
              : PlayerTheme.inkMuted,
          disabledForegroundColor: tokens.textDisabled,
          textStyle: theme.typography.body.sm,
          contentConstraints: BoxConstraints.tightFor(
            width: size,
            height: size,
          ),
          contentPadding: EdgeInsets.zero,
          contentSpacing: 0,
          iconConstraints: BoxConstraints.tightFor(width: size, height: size),
          iconSize: iconSize,
          iconPadding: EdgeInsets.zero,
        );
        final button = f.FButton.raw(
          variant: f.FButtonVariant.ghost,
          focusNode: focusNode,
          onPress: onPressed,
          shortcuts: const {
            SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.select): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
            SingleActivator(LogicalKeyboardKey.gameButtonA): ActivateIntent(),
          },
          style: f.FButtonStyle(
            decoration: style.decoration,
            contentStyle: style.contentStyle,
            iconContentStyle: style.iconContentStyle,
            tappableStyle: f.FTappableStyle(
              cursor: f.FVariants.all(
                onPressed == null
                    ? SystemMouseCursors.basic
                    : SystemMouseCursors.click,
              ),
              pressedEnterDuration: Duration.zero,
              pressedExitDuration: Duration.zero,
              motion: f.FTappableMotion.none,
            ),
            // The existing app-wide focus ring is drawn inside the button.
            focusedOutlineStyle: f.FFocusedOutlineStyle(
              color: Colors.transparent,
              borderRadius: radius,
              spacing: 0,
            ),
          ),
          child: Builder(
            builder: (context) {
              final variants = f.FButtonData.of(context).variants;
              final focused = variants.contains(f.FTappableVariant.focused);
              final highlighted =
                  focused || variants.contains(f.FTappableVariant.hovered);
              final ringed = CardFocusRing(
                focused: focused,
                radius: radius,
                child: SizedBox(
                  width: size,
                  height: size,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      IconTheme(
                        data: IconThemeData(
                          color: onPressed == null
                              ? tokens.textDisabled
                              : active
                              ? (activeColor ?? tokens.accent)
                              : highlighted
                              ? tokens.textPrimary
                              : PlayerTheme.inkMuted,
                          size: iconSize,
                        ),
                        child: icon,
                      ),
                      if (showActiveBadge)
                        Positioned(
                          top: size * 0.17,
                          right: size * 0.17,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: badgeColor ?? tokens.accent,
                              shape: BoxShape.circle,
                            ),
                            child: const SizedBox.square(dimension: 5),
                          ),
                        ),
                    ],
                  ),
                ),
              );
              return tooltip == null
                  ? ringed
                  : PlayerTooltip(message: tooltip!, child: ringed);
            },
          ),
        );
        return button;
      }),
    );
  }
}

/// Rounded pill toggle chip for filters and options.
class PlayerToggleChip extends StatelessWidget {
  final bool active;
  final String label;
  final String? count;
  final VoidCallback onClick;
  final bool disabled;

  const PlayerToggleChip({
    super.key,
    required this.active,
    required this.label,
    this.count,
    required this.onClick,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return PlayerTappable(
      onTap: onClick,
      enabled: !disabled,
      builder: (context, _) => AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: disabled ? 0.35 : 1.0,
        child: Container(
          height: 28,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: active ? PlayerTheme.raised : Colors.transparent,
            borderRadius: ZplayRadius.fullAll,
            border: Border.all(
              color: active ? PlayerTheme.edge : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: ZplayType.caption
                    .copyWith(
                      weight: active ? FontWeight.w600 : FontWeight.w500,
                    )
                    .toStyle(
                      color: active ? PlayerTheme.ink : PlayerTheme.inkMuted,
                    ),
              ),
              if (count != null) ...[
                const SizedBox(width: ZplaySpacing.s4),
                Text(
                  count!,
                  style: ZplayType.caption.toStyle(
                    color: PlayerTheme.inkSubtle,
                    tabular: true,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// An [InkWell] a remote can see land on.
///
/// [InkWell] does install its own `Focus` node, so plain-InkWell controls are
/// *traversable* — but a bare one draws nothing on focus, because its only
/// highlight is the hover wash. That is the defect this file's siblings already
/// avoid: every transport button is a [FocusableCard], which raises
/// `onShowFocusHighlight` and paints [CardFocusRing]. The player's lists were
/// converted piecemeal and ~30 rows, season tabs, menu options and the skip
/// button stayed bare, so a D-pad could reach them and nothing changed on
/// screen — read as "navigation is broken" from the couch.
///
/// This wrapper keeps the `InkWell` call sites unchanged in shape — it forwards
/// `borderRadius`, `onTap`, `hoverColor`, `splashColor` and `child` — while
/// adding the focus node, the [ActivateIntent] binding and the ring. A
/// [FocusableCard] cannot be substituted here: its `builder` contract hands a
/// `CardInteraction` to a builder closure, whereas these rows build their own
/// decoration from a `Container` with their own `borderRadius`, so wrapping
/// would mean rewriting every row rather than converting it.
///
/// [enabled] mirrors `InkWell.enabled`; a disabled row stays focusable but inert,
/// matching the player's other rows.
class FocusableInkWell extends StatefulWidget {
  const FocusableInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.hoverColor,
    this.splashColor,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? hoverColor;
  final Color? splashColor;
  final bool enabled;

  @override
  State<FocusableInkWell> createState() => _FocusableInkWellState();
}

class _FocusableInkWellState extends State<FocusableInkWell> {
  final FocusNode _node = FocusNode(debugLabel: 'PlayerFocusableInkWell');

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? ZplayRadius.fullAll;
    return PlayerTappable(
      focusNode: _node,
      enabled: widget.enabled,
      onTap: widget.onTap,
      builder: (context, state) => CardFocusRing(
        focused: state.focused && widget.enabled,
        radius: radius,
        child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            color: state.pressed
                ? (widget.splashColor ?? PlayerTheme.surfaceHover)
                : state.hovered
                ? (widget.hoverColor ?? PlayerTheme.surfaceHover)
                : Colors.transparent,
            borderRadius: radius,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
