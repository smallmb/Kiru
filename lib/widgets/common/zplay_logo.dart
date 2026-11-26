import 'package:flutter/material.dart';

/// Kiru's supplied portrait artwork. Retain the existing widget name for
/// compatibility with call sites; brand artwork is independent of theme.
class ZplayLogo extends StatelessWidget {
  const ZplayLogo({super.key, this.size = 24});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: Image.asset(
      'assets/icon_small.png',
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      semanticLabel: 'Kiru',
    ),
  );
}
