import 'package:flutter/material.dart';

/// Opt-in geometry for continuous artwork and content rails.
class ImmersiveContentLayout extends InheritedWidget {
  const ImmersiveContentLayout({
    super.key,
    required this.gutter,
    required this.overlap,
    required super.child,
  });
  final double gutter;
  final double overlap;
  static const double railGap = 36;
  static const double cardGap = 16;
  static const double artworkRadius = 12;
  static double gutterFor(double width) => width >= 1600
      ? 64
      : width >= 1100
      ? 48
      : 32;
  static double overlapFor(Size viewport) =>
      viewport.height >= 600 ? (viewport.height * .12).clamp(72.0, 120.0) : 0;
  double heroBandHeight(Size viewport, double chrome) =>
      (viewport.height * .72 - chrome - overlap).clamp(
        300.0,
        viewport.height * .72,
      );
  static ImmersiveContentLayout? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ImmersiveContentLayout>();
  @override
  bool updateShouldNotify(ImmersiveContentLayout oldWidget) =>
      gutter != oldWidget.gutter || overlap != oldWidget.overlap;
}

/// Keep the artwork and the leading rails in the same scroll item.
/// Only the background extends into the rail, not the actionable controls.
class ImmersiveHeroGroup extends StatelessWidget {
  const ImmersiveHeroGroup({
    super.key,
    required this.hero,
    required this.leadingSections,
  });
  final Widget hero;
  final List<Widget> leadingSections;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [hero, ...leadingSections],
  );
}
