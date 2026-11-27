import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
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

/// A zero-layout caption fallback above the whole Navigator. Existing page
/// chrome still takes priority; the fallback only enters the gesture arena
/// for non-interactive pixels in the first 24 logical pixels of the window.
class DesktopCaptionArea extends StatelessWidget {
  const DesktopCaptionArea({super.key, required this.child});
  final Widget child;
  static const double height = 24;

  @override
  Widget build(BuildContext context) {
    final window = WindowService.instance;
    if (!window.usesCustomCaptionBar) return child;
    return ValueListenableBuilder<bool>(
      valueListenable: window.isFullscreenNotifier,
      child: child,
      builder: (context, fullscreen, child) => RawGestureDetector(
        behavior: HitTestBehavior.translucent,
        excludeFromSemantics: true,
        gestures: fullscreen
            ? const <Type, GestureRecognizerFactory>{}
            : <Type, GestureRecognizerFactory>{
                _CaptionFallbackRecognizer:
                    GestureRecognizerFactoryWithHandlers<
                      _CaptionFallbackRecognizer
                    >(_CaptionFallbackRecognizer.new, (recognizer) {
                      recognizer.onStart = (_) => window.startDragging();
                    }),
              },
        child: child!,
      ),
    );
  }
}

/// As an ancestor recognizer, this joins after the page's own gestures.
/// It never paints or reserves layout space, and rejects actionable controls
/// before joining the arena. A modal's dismissible scrim is not a button:
/// an ordinary click can dismiss it, whereas a pan can move the window.
class _CaptionFallbackRecognizer extends PanGestureRecognizer {
  _CaptionFallbackRecognizer()
    : super(allowedButtonsFilter: (buttons) => buttons == kPrimaryButton);

  @override
  bool isPointerAllowed(PointerEvent event) {
    if (event.localPosition.dy < 0 ||
        event.localPosition.dy >= DesktopCaptionArea.height ||
        event is! PointerDownEvent) {
      return false;
    }
    final hit = HitTestResult();
    GestureBinding.instance.hitTestInView(hit, event.position, event.viewId);
    for (final entry in hit.path) {
      final target = entry.target;
      if (target is RenderEditable) return false;
      if (target is RenderMouseRegion &&
          target.cursor != MouseCursor.defer &&
          target.cursor != SystemMouseCursors.basic) {
        return false;
      }
      if (target is RenderSemanticsAnnotations) {
        final properties = target.properties;
        if (properties.button == true ||
            properties.textField == true ||
            properties.slider == true ||
            properties.link == true ||
            properties.checked != null ||
            properties.toggled != null ||
            (properties.onTap != null && properties.onDismiss == null)) {
          return false;
        }
      }
      if (target is RenderSemanticsGestureHandler && target.onTap != null) {
        return false;
      }
    }
    return super.isPointerAllowed(event);
  }
}

/// For floating back-button headers with reserved space above their content.
/// Use as a child of Stack, before the back button, on Windows only.
class DesktopCaptionBand extends StatelessWidget {
  const DesktopCaptionBand({super.key, this.height = 60});
  final double height;
  @override
  Widget build(BuildContext context) =>
      SizedBox(height: height, child: const DesktopCaptionDrag());
}
