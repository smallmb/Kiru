import 'dart:ui';
import 'package:flutter/material.dart';
import '../../services/theme/design_tokens.dart';
import '../common/desktop_caption_area.dart';
import 'immersive_content_layout.dart';

double libraryGutter(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  return width < 600 ? 16 : ImmersiveContentLayout.gutterFor(width);
}

/// One shared overlay for the tab switcher and page controls. At rest it is
/// transparent. While scrolling only this layer blurs, fading into the canvas.
class LibraryChrome extends StatefulWidget {
  const LibraryChrome({
    super.key,
    required this.tabs,
    required this.actions,
    required this.filters,
    required this.contentBuilder,
  });
  final Widget tabs, actions, filters;
  final Widget Function(double inset) contentBuilder;
  @override
  State<LibraryChrome> createState() => _LibraryChromeState();
}

class _LibraryChromeState extends State<LibraryChrome> {
  double _offset = 0;
  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final narrow = MediaQuery.sizeOf(context).width < 760;
    final gutter = libraryGutter(context);
    final band = narrow ? 156.0 : 104.0;
    final tokens = context.tokens;
    final strength = (_offset / 64).clamp(0.0, 1.0);
    return Stack(
      fit: StackFit.expand,
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (n) {
            if (n.depth == 0 && n.metrics.axis == Axis.vertical) {
              final next = n.metrics.pixels.clamp(0.0, 64.0);
              if (next != _offset) setState(() => _offset = next);
            }
            return false;
          },
          child: widget.contentBuilder(top + band + 12),
        ),
        Positioned(
          top: top,
          left: 0,
          right: 0,
          child: ClipRect(
            key: const ValueKey('kiru-library-glass-header'),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 18 * strength,
                sigmaY: 18 * strength,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      tokens.bg.withValues(alpha: .85 * strength),
                      tokens.bg.withValues(alpha: .72 * strength),
                      tokens.bg.withValues(alpha: 0),
                    ],
                    stops: const [0, .86, 1],
                  ),
                ),
                child: SizedBox(
                  height: band,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      const Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: 52,
                        child: DesktopCaptionDrag(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(gutter, 0, gutter, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 52,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: widget.tabs,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  widget.actions,
                                ],
                              ),
                            ),
                            widget.filters,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
