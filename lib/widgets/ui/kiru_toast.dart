import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart' as f;
import '../../services/theme/design_tokens.dart';
import 'kiru_controls.dart';

class KiruToast {
  const KiruToast({
    required this.content,
    this.backgroundColor,
    this.duration = const Duration(seconds: 4),
    this.action,
    this.behavior,
    this.shape,
    this.margin,
  });
  final Widget content;
  final Color? backgroundColor;
  final Duration duration;
  final KiruToastAction? action;
  final SnackBarBehavior? behavior;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;
}

class KiruToastAction {
  const KiruToastAction({
    required this.label,
    required this.onPressed,
    this.textColor,
  });
  final String label;
  final VoidCallback onPressed;
  final Color? textColor;
}

/// The production root hosts FToaster. Preserve FIFO delivery and replace
/// semantics from the old messenger; isolated Material test hosts may fall back.
class KiruToastMessenger {
  KiruToastMessenger._(this._host, this._fallback);
  final f.FToasterState? _host;
  final ScaffoldMessengerState? _fallback;
  static final _queues = Expando<_ToastQueue>();
  static KiruToastMessenger of(BuildContext context) =>
      maybeOf(context) ?? KiruToastMessenger._(null, null);
  static KiruToastMessenger? maybeOf(BuildContext context) {
    final host = context.findAncestorStateOfType<f.FToasterState>();
    final fallback = host == null ? ScaffoldMessenger.maybeOf(context) : null;
    return host == null && fallback == null
        ? null
        : KiruToastMessenger._(host, fallback);
  }

  void showSnackBar(KiruToast toast) {
    final host = _host;
    if (host != null && host.mounted) {
      final queue = _queues[host] ??= _ToastQueue(host);
      queue.add(toast);
    } else if (_fallback?.mounted ?? false) {
      _fallback!.showSnackBar(
        SnackBar(
          content: toast.content,
          duration: toast.duration,
          backgroundColor: toast.backgroundColor,
          behavior: toast.behavior,
          shape: toast.shape,
          margin: toast.margin,
          action: toast.action == null
              ? null
              : SnackBarAction(
                  label: toast.action!.label,
                  onPressed: toast.action!.onPressed,
                  textColor: toast.action!.textColor,
                ),
        ),
      );
    }
  }

  void hideCurrentSnackBar() {
    final host = _host;
    if (host != null) {
      _queues[host]?.current?.dismiss();
    } else if (_fallback?.mounted ?? false) {
      _fallback!.hideCurrentSnackBar();
    }
  }
}

class _ToastQueue {
  _ToastQueue(this.host);
  final f.FToasterState host;
  final pending = Queue<KiruToast>();
  f.FToasterEntry? current;
  void add(KiruToast toast) {
    pending.add(toast);
    _next();
  }

  void _next() {
    if (!host.mounted || current != null || pending.isEmpty) return;
    final toast = pending.removeFirst();
    final tokens = host.context.tokens;
    final bg = toast.backgroundColor ?? tokens.surfaceOverlay;
    final fg = ThemeData.estimateBrightnessForColor(bg) == Brightness.dark
        ? Colors.white
        : Colors.black87;
    final style = f.FToastStyle(
      decoration: ShapeDecoration(
        color: bg,
        shape:
            toast.shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      iconStyle: IconThemeData(color: fg, size: 18),
      titleTextStyle: TextStyle(color: fg, fontSize: 13),
      descriptionTextStyle: TextStyle(color: fg, fontSize: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      constraints: const BoxConstraints(maxWidth: 560, maxHeight: 300),
    );
    current = host.show(
      alignment: f.FToastAlignment.bottomCenter,
      duration: toast.duration,
      style: style,
      builder: (context, entry) => f.FToast(
        style: style,
        title: toast.content,
        suffix: toast.action == null
            ? null
            : KiruButton(
                kind: KiruButtonKind.ghost,
                compact: true,
                style: TextButton.styleFrom(
                  foregroundColor: toast.action!.textColor ?? fg,
                ),
                onPressed: () {
                  entry.dismiss();
                  toast.action!.onPressed();
                },
                child: Text(toast.action!.label),
              ),
      ),
      onDismiss: () {
        current = null;
        WidgetsBinding.instance.addPostFrameCallback((_) => _next());
      },
    );
  }
}
