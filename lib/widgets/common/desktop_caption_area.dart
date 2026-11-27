import 'package:flutter/material.dart';
import '../../services/window/window_service.dart';

/// A caption-only gesture target, never an ancestor of actionable controls.
class DesktopCaptionDrag extends StatelessWidget {
  const DesktopCaptionDrag({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final window = WindowService.instance;
    if (!window.usesCustomCaptionBar) return child ?? const SizedBox.shrink();
    return ValueListenableBuilder<bool>(
      valueListenable: window.isFullscreenNotifier,
      child: child,
      builder: (context, fullscreen, child) => fullscreen
          ? child ?? const SizedBox.shrink()
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              excludeFromSemantics: true,
              onPanStart: (_) => window.startDragging(),
              child: child,
            ),
    );
  }
}

/// A narrow reserved caption strip above the Navigator guarantees a drag
/// target on every route, including standalone detail pages and dialogs.
/// No overlay is placed over buttons or scrollable content.
class DesktopCaptionArea extends StatelessWidget {
  const DesktopCaptionArea({super.key, required this.child});
  final Widget child;
  static const double height = 10;

  @override
  Widget build(BuildContext context) {
    final window = WindowService.instance;
    if (!window.usesCustomCaptionBar) return child;
    return ValueListenableBuilder<bool>(
      valueListenable: window.isFullscreenNotifier,
      child: child,
      builder: (context, fullscreen, child) => Column(
        children: [
          SizedBox(
            height: fullscreen ? 0 : height,
            width: double.infinity,
            child: fullscreen
                ? null
                : const DesktopCaptionDrag(
                    key: ValueKey('kiru-global-caption-drag'),
                  ),
          ),
          Expanded(child: child!),
        ],
      ),
    );
  }
}
