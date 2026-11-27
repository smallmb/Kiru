import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

/// Centralized window and fullscreen state manager for desktop and mobile.
class WindowService with WindowListener {
  static final WindowService instance = WindowService._internal();
  WindowService._internal();

  final ValueNotifier<bool> isFullscreenNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isMaximizedNotifier = ValueNotifier<bool>(false);
  bool _isTransitioning = false;

  bool get isFullscreen => isFullscreenNotifier.value;
  bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
  bool get usesCustomCaptionBar => !kIsWeb && Platform.isWindows;

  Future<void> initialize() async {
    if (!isDesktop) return;
    try {
      windowManager.addListener(this);
      if (usesCustomCaptionBar) {
        await windowManager.setTitleBarStyle(
          TitleBarStyle.hidden,
          windowButtonVisibility: false,
        );
      }
      final isFs = await windowManager.isFullScreen();
      isFullscreenNotifier.value = isFs;
      isMaximizedNotifier.value = await windowManager.isMaximized();
    } catch (e) {
      debugPrint('[WindowService] initialize error: $e');
    }
  }

  /// 最小化 Windows 窗口。
  Future<void> minimize() async {
    if (isDesktop) await windowManager.minimize();
  }

  /// 在普通窗口与最大化窗口之间切换。
  Future<void> toggleMaximize() async {
    if (!isDesktop || _isTransitioning) return;
    if (await windowManager.isFullScreen()) {
      await exitFullscreen();
      return;
    }

    _isTransitioning = true;
    try {
      if (await windowManager.isMaximized()) {
        await windowManager.unmaximize();
      } else {
        await windowManager.maximize();
      }
      isMaximizedNotifier.value = await windowManager.isMaximized();
    } catch (e) {
      debugPrint('[WindowService] toggleMaximize error: $e');
    } finally {
      _isTransitioning = false;
    }
  }

  /// 关闭当前桌面窗口。
  Future<void> close() async {
    if (isDesktop) await windowManager.close();
  }

  /// 从自绘导航空白区域拖动无标题栏窗口。
  Future<void> startDragging() async {
    if (!usesCustomCaptionBar || isFullscreen || _isTransitioning) return;
    try {
      await windowManager.startDragging();
    } catch (e) {
      debugPrint('[WindowService] startDragging error: ' + e.toString());
    }
  }

  void dispose() {
    if (isDesktop) {
      windowManager.removeListener(this);
    }
  }

  /// Executes true borderless OS fullscreen toggle covering the Windows taskbar.
  Future<void> toggleFullscreen() async {
    if (_isTransitioning) return;
    _isTransitioning = true;

    try {
      if (!isDesktop) {
        // Mobile fallback
        final next = !isFullscreenNotifier.value;
        isFullscreenNotifier.value = next;
        if (next) {
          await SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.immersiveSticky,
          );
        } else {
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        }
        return;
      }

      final isCurrentlyFs = await windowManager.isFullScreen();
      if (isCurrentlyFs || isFullscreenNotifier.value) {
        await windowManager.setFullScreen(false);
        if (await windowManager.isMaximized()) {
          await windowManager.unmaximize();
        }
        isFullscreenNotifier.value = false;
        isMaximizedNotifier.value = await windowManager.isMaximized();
      } else {
        // Crucial for Windows: unmaximize first to drop the 8px DWM resize frame
        if (await windowManager.isMaximized()) {
          await windowManager.unmaximize();
        }
        await windowManager.setFullScreen(true);
        isFullscreenNotifier.value = true;
        isMaximizedNotifier.value = false;
      }
    } catch (e) {
      debugPrint('[WindowService] toggleFullscreen error: $e');
    } finally {
      _isTransitioning = false;
    }
  }

  /// Alias for toggleFullscreen
  Future<void> toggleFullScreen() => toggleFullscreen();

  /// Forces exit from fullscreen (e.g. when leaving player screen).
  Future<void> exitFullscreen() async {
    if (!isDesktop) {
      if (isFullscreenNotifier.value) {
        isFullscreenNotifier.value = false;
        await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
      return;
    }
    if (_isTransitioning) return;
    _isTransitioning = true;
    try {
      final isCurrentlyFs = await windowManager.isFullScreen();
      if (isCurrentlyFs || isFullscreenNotifier.value) {
        await windowManager.setFullScreen(false);
        if (await windowManager.isMaximized()) {
          await windowManager.unmaximize();
        }
        isFullscreenNotifier.value = false;
        isMaximizedNotifier.value = await windowManager.isMaximized();
      }
    } catch (e) {
      debugPrint('[WindowService] exitFullscreen error: $e');
    } finally {
      _isTransitioning = false;
    }
  }

  // ── WindowListener Callbacks (Synchronize OS events) ──

  @override
  void onWindowEnterFullScreen() {
    isFullscreenNotifier.value = true;
  }

  @override
  void onWindowLeaveFullScreen() {
    isFullscreenNotifier.value = false;
  }

  @override
  void onWindowRestore() {
    windowManager.isFullScreen().then((isFs) {
      isFullscreenNotifier.value = isFs;
    });
    windowManager.isMaximized().then((isMaximized) {
      isMaximizedNotifier.value = isMaximized;
    });
  }

  @override
  void onWindowUnmaximize() {
    isMaximizedNotifier.value = false;
    windowManager.isFullScreen().then(
      (isFs) => isFullscreenNotifier.value = isFs,
    );
  }

  @override
  void onWindowMaximize() {
    isMaximizedNotifier.value = true;
    windowManager.isFullScreen().then(
      (isFs) => isFullscreenNotifier.value = isFs,
    );
  }
}
