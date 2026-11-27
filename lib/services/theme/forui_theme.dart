import 'package:flutter/material.dart';
import 'package:forui/forui.dart' as f;
import 'design_tokens.dart';
import 'fonts/font_registry.dart';

/// Forui is a consumer of the existing Kiru palette and typography, not a
/// second source of design tokens. Material routes can coexist during migration.
abstract final class KiruForuiTheme {
  static f.FThemeData data(BuildContext context) {
    final t = context.tokens;
    final theme = Theme.of(context);
    final touch =
        theme.platform == TargetPlatform.android ||
        theme.platform == TargetPlatform.iOS;
    final base = theme.brightness == Brightness.dark
        ? f.FColors.neutralDark
        : f.FColors.neutralLight;
    final colors = base.copyWith(
      background: t.bg,
      foreground: t.textPrimary,
      primary: t.accent,
      primaryForeground: t.onAccent,
      secondary: t.surfaceRaised,
      secondaryForeground: t.textPrimary,
      muted: t.surface,
      mutedForeground: t.textSecondary,
      destructive: t.danger,
      error: t.danger,
      card: t.surface,
      border: t.borderStrong,
    );
    final type = f.FTypeface.inherit(
      colors: colors,
      touch: touch,
      fontFamily: FontRegistry.primary,
      fontFamilyFallback: FontRegistry.fallback,
    );
    return f.FThemeData(
      colors: colors,
      touch: touch,
      typography: f.FTypography(display: type, body: type),
    );
  }

  /// Feature widgets may also be mounted in an isolated Material route.
  /// Ensure Forui's theme, accessibility and adaptive scopes are present.
  static Widget ensure(BuildContext context, WidgetBuilder builder) {
    if (context.findAncestorWidgetOfExactType<f.FTheme>() != null) {
      return builder(context);
    }
    return wrap(context, Builder(builder: builder), toaster: false);
  }

  static Widget wrap(
    BuildContext context,
    Widget child, {
    bool toaster = true,
  }) {
    final inherited = DefaultTextStyle.of(context);
    return f.FTheme(
      data: data(context),
      // Keep legacy text defaults intact outside Forui components.
      child: DefaultTextStyle(
        style: inherited.style,
        textAlign: inherited.textAlign,
        softWrap: inherited.softWrap,
        overflow: inherited.overflow,
        maxLines: inherited.maxLines,
        textWidthBasis: inherited.textWidthBasis,
        textHeightBehavior: inherited.textHeightBehavior,
        child: toaster ? f.FToaster(child: child) : child,
      ),
    );
  }
}
