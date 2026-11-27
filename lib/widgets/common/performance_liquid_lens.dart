import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import '../../services/theme/design_tokens.dart';
import '../../services/theme/glass_settings.dart';

enum FrostedSurfaceKind { dock, sheet, menuButton, menu }

class FrostedSurface extends StatelessWidget {
  const FrostedSurface({
    super.key,
    this.kind = FrostedSurfaceKind.dock,
    required this.child,
    this.visible = true,
  });
  final FrostedSurfaceKind kind;
  final Widget child;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final radius = kind == FrostedSurfaceKind.menuButton
        ? ZplayRadius.smAll
        : ZplayRadius.lgAll;
    return ValueListenableBuilder<bool>(
      valueListenable: GlassSettings.enabled,
      child: child,
      builder: (context, enabled, child) => ValueListenableBuilder<double>(
        valueListenable: GlassSettings.blurSigma,
        child: child,
        builder: (context, sigma, child) {
          final blur = enabled && visible && sigma.isFinite && sigma > 0;
          final surface = ColoredBox(
            color: tokens.surfaceOverlay.withValues(alpha: blur ? .72 : .94),
            child: child!,
          );
          return ClipRRect(
            borderRadius: radius,
            child: blur
                ? BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: sigma.clamp(0.0, 10.0),
                      sigmaY: sigma.clamp(0.0, 10.0),
                    ),
                    child: surface,
                  )
                : surface,
          );
        },
      ),
    );
  }
}
