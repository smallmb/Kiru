import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' show ImageFilter;
import '../../l10n/l10n.dart';
import '../../models/player/skip_segment_model.dart';
import '../../services/layout/form_factor.dart';
import '../../services/theme/design_tokens.dart';
import 'player_glass.dart';
import 'player_seek_bar.dart';
import 'player_volume_control.dart';

/// Full bottom transport bar containing timeline scrubber, play controls, and menu triggers.
class PlayerTransport extends StatelessWidget {
  final bool isPlaying;

  /// The playhead and the buffered edge, handed to the timeline as listenables
  /// so a tick repaints the bar rather than this whole row.
  final ValueListenable<Duration> positionListenable;
  final Duration duration;
  final ValueListenable<Duration?> bufferedListenable;
  final List<MediaSkipSegment> skipSegments;
  final double volume;
  final bool isMuted;
  final double playbackRate;
  final bool isSubtitlesActive;
  final bool isSubSyncActive;
  final bool isAudioActive;
  final bool isEpisodesActive;
  final bool isFullscreen;
  final bool hasPrevEpisode;
  final bool hasNextEpisode;

  /// The node the player hands focus to when the HUD opens, attached to the
  /// play/pause button so an open HUD lands on a control a remote can act on.
  final FocusNode? entryFocusNode;

  // Actions
  final VoidCallback onPlayPause;
  final ValueChanged<Duration> onSeek;
  final VoidCallback onSeekBack10;
  final VoidCallback onSeekForward10;
  final ValueChanged<double> onVolumeChanged;
  final VoidCallback onToggleMute;
  final VoidCallback? onToggleEpisodes;
  final VoidCallback onToggleAspectMenu;
  final VoidCallback onToggleSpeedMenu;
  final VoidCallback onToggleAudioMenu;
  final VoidCallback onToggleSubtitleMenu;
  final VoidCallback onToggleSubSync;
  final VoidCallback onToggleFullscreen;
  final VoidCallback? onPrevEpisode;
  final VoidCallback? onNextEpisode;
  final ValueChanged<bool>? onScrubbingChanged;

  const PlayerTransport({
    super.key,
    required this.isPlaying,
    required this.positionListenable,
    required this.duration,
    required this.bufferedListenable,
    this.skipSegments = const [],
    required this.volume,
    required this.isMuted,
    required this.playbackRate,
    required this.isSubtitlesActive,
    required this.isSubSyncActive,
    required this.isAudioActive,
    this.isEpisodesActive = false,
    required this.isFullscreen,
    this.hasPrevEpisode = false,
    this.hasNextEpisode = false,
    this.entryFocusNode,
    required this.onPlayPause,
    required this.onSeek,
    required this.onSeekBack10,
    required this.onSeekForward10,
    required this.onVolumeChanged,
    required this.onToggleMute,
    this.onToggleEpisodes,
    required this.onToggleAspectMenu,
    required this.onToggleSpeedMenu,
    required this.onToggleAudioMenu,
    required this.onToggleSubtitleMenu,
    required this.onToggleSubSync,
    required this.onToggleFullscreen,
    this.onPrevEpisode,
    this.onNextEpisode,
    this.onScrubbingChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final l10n = l10nOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isCompact = screenWidth < 680;
    final isDesktop =
        !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
    // The fullscreen control exists on a television too; without it the row ended
    // at the subtitle-sync button and the remote had no fullscreen button at all.
    // Reading it from the shell's classifier rather than the platform keeps the
    // decision in the one place that answers "what is this running on".
    final isTelevision = FormFactorService.of(context) == FormFactor.television;
    final btnSize = isCompact ? 36.0 : 42.0;
    final btnIconSize = isCompact ? 20.0 : 22.0;
    final playBtnSize = isCompact ? 46.0 : 54.0;
    final gap = isCompact ? 2.0 : 4.0;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: EdgeInsets.fromLTRB(
            isCompact ? 14 : 28,
            isCompact ? ZplaySpacing.s32 : ZplaySpacing.s48,
            isCompact ? 14 : 28,
            isCompact ? 14 : ZplaySpacing.s24,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                tokens.bg.withValues(alpha: 0.85),
                tokens.bg.withValues(alpha: 0.40),
                Colors.transparent,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Seek Bar & Timers
              PlayerSeekBar(
                positionListenable: positionListenable,
                duration: duration,
                bufferedListenable: bufferedListenable,
                skipSegments: skipSegments,
                onSeek: onSeek,
                onScrubbingChanged: onScrubbingChanged,
              ),

              SizedBox(height: isCompact ? ZplaySpacing.s8 : 14),

              // Bottom Controls Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Group: Play/Pause, Rewind 10, FastForward 10, Volume Control
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Forui play/pause button
                      _PlayerPlayPauseButton(
                        isPlaying: isPlaying,
                        size: playBtnSize,
                        iconSize: isCompact ? 28 : 34,
                        onTap: onPlayPause,
                        focusNode: entryFocusNode,
                      ),

                      SizedBox(width: isCompact ? ZplaySpacing.s8 : 14),

                      // Seek Back 10s
                      PlayerIconButton(
                        size: btnSize,
                        iconSize: btnIconSize + 2,
                        icon: const Icon(Icons.replay_10_rounded),
                        tooltip: l10n.playerSeekBack,
                        onPressed: onSeekBack10,
                      ),

                      SizedBox(width: gap),

                      // Seek Forward 10s
                      PlayerIconButton(
                        size: btnSize,
                        iconSize: btnIconSize + 2,
                        icon: const Icon(Icons.forward_10_rounded),
                        tooltip: l10n.playerSeekForward,
                        onPressed: onSeekForward10,
                      ),

                      // Volume Control (Full slider on wide screens, Mute button on compact)
                      if (!isCompact) ...[
                        const SizedBox(width: 10),
                        PlayerVolumeControl(
                          volume: volume,
                          isMuted: isMuted,
                          onVolumeChanged: onVolumeChanged,
                          onToggleMute: onToggleMute,
                        ),
                      ] else ...[
                        SizedBox(width: gap),
                        PlayerIconButton(
                          size: btnSize,
                          iconSize: btnIconSize,
                          icon: Icon(
                            isMuted || volume == 0
                                ? Icons.volume_off_rounded
                                : (volume > 1.0
                                      ? Icons.volume_up_rounded
                                      : Icons.volume_down_rounded),
                          ),
                          tooltip: isMuted
                              ? l10n.playerUnmute
                              : l10n.playerMute,
                          onPressed: onToggleMute,
                        ),
                      ],
                    ],
                  ),

                  // Center Group: Episode Navigation (if available and enough width)
                  if (!isCompact && (hasPrevEpisode || hasNextEpisode))
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (hasPrevEpisode && onPrevEpisode != null)
                          PlayerIconButton(
                            size: 40,
                            iconSize: 22,
                            icon: const Icon(Icons.skip_previous_rounded),
                            tooltip: l10n.playerPreviousEpisode,
                            onPressed: onPrevEpisode,
                          ),
                        if (hasNextEpisode && onNextEpisode != null) ...[
                          const SizedBox(width: 6),
                          PlayerIconButton(
                            size: 40,
                            iconSize: 22,
                            icon: const Icon(Icons.skip_next_rounded),
                            tooltip: l10n.playerNextEpisode,
                            onPressed: onNextEpisode,
                          ),
                        ],
                      ],
                    ),

                  // Right Group: Aspect, Speed, Audio, Subtitles, SubSync, Fullscreen
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Episodes Menu Trigger (for TV Shows)
                      if (onToggleEpisodes != null) ...[
                        PlayerIconButton(
                          size: btnSize,
                          iconSize: btnIconSize,
                          icon: const Icon(Icons.video_library_rounded),
                          tooltip: l10n.playerEpisodes,
                          active: isEpisodesActive,
                          activeColor: PlayerTheme.accent,
                          onPressed: onToggleEpisodes,
                        ),
                        SizedBox(width: gap),
                      ],

                      // Aspect Ratio Menu Trigger
                      PlayerIconButton(
                        size: btnSize,
                        iconSize: btnIconSize,
                        icon: const Icon(Icons.aspect_ratio_rounded),
                        tooltip: l10n.playerAspectRatio,
                        onPressed: onToggleAspectMenu,
                      ),

                      SizedBox(width: gap),

                      // Playback Speed Menu Trigger
                      PlayerIconButton(
                        size: btnSize,
                        iconSize: btnIconSize,
                        icon: const Icon(Icons.speed_rounded),
                        tooltip: l10n.playerPlaybackSpeed,
                        showActiveBadge: playbackRate != 1.0,
                        onPressed: onToggleSpeedMenu,
                      ),

                      SizedBox(width: gap),

                      // Audio Menu Trigger
                      PlayerIconButton(
                        size: btnSize,
                        iconSize: btnIconSize,
                        icon: const Icon(Icons.audiotrack_rounded),
                        tooltip: l10n.playerAudioTracks,
                        onPressed: onToggleAudioMenu,
                      ),

                      SizedBox(width: gap),

                      // Subtitles Menu Trigger
                      PlayerIconButton(
                        size: btnSize,
                        iconSize: btnIconSize,
                        icon: const Icon(Icons.subtitles_rounded),
                        tooltip: l10n.playerSubtitles,
                        showActiveBadge: isSubtitlesActive,
                        badgeColor: tokens.success,
                        onPressed: onToggleSubtitleMenu,
                      ),

                      SizedBox(width: gap),

                      // Subtitle Sync Trigger
                      PlayerIconButton(
                        size: btnSize,
                        iconSize: btnIconSize,
                        icon: const Icon(Icons.tune_rounded),
                        tooltip: l10n.playerSubtitleSync,
                        active: isSubSyncActive,
                        activeColor: PlayerTheme.accent,
                        onPressed: onToggleSubSync,
                      ),

                      // Fullscreen Button (Desktop and television)
                      //
                      // A television has no window manager, but the button is not
                      // window chrome here: it drives the immersive system UI mode,
                      // and without it a remote had no fullscreen control at all -
                      // the row ended at the subtitle-sync button.
                      if (isDesktop || isTelevision) ...[
                        SizedBox(width: gap),
                        PlayerIconButton(
                          size: btnSize,
                          iconSize: btnIconSize,
                          icon: Icon(
                            isFullscreen
                                ? Icons.fullscreen_exit_rounded
                                : Icons.fullscreen_rounded,
                          ),
                          tooltip: isFullscreen
                              ? l10n.playerExitFullscreen
                              : l10n.playerFullscreen,
                          onPressed: onToggleFullscreen,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayerPlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final double size;
  final double iconSize;
  final VoidCallback onTap;

  /// Supplied when the player owns where the HUD opens its focus.
  final FocusNode? focusNode;

  const _PlayerPlayPauseButton({
    required this.isPlaying,
    required this.size,
    required this.iconSize,
    required this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) => PlayerIconButton(
    icon: Icon(
      isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
      color: context.tokens.textPrimary,
    ),
    size: size,
    iconSize: iconSize,
    onPressed: onTap,
    focusNode: focusNode,
  );
}
