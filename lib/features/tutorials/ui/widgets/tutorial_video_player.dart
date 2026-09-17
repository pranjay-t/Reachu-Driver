import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_text_styles.dart';

class TutorialVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final VoidCallback onCompleted;

  const TutorialVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.onCompleted,
  });

  @override
  State<TutorialVideoPlayer> createState() => _TutorialVideoPlayerState();
}

class _TutorialVideoPlayerState extends State<TutorialVideoPlayer> {
  YoutubePlayerController? _controller;
  bool _hasTriggeredCompletion = false;
  String? _videoId;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() {
    try {
      _videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      if (_videoId != null && _videoId!.isNotEmpty) {
        _controller = YoutubePlayerController(
          initialVideoId: _videoId!,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            disableDragSeek: false,
            loop: false,
            isLive: false,
            forceHD: false,
            enableCaption: true,
          ),
        )..addListener(_videoListener);
      } else {
        _isError = true;
      }
    } catch (_) {
      _isError = true;
    }
  }

  void _videoListener() {
    if (!mounted || _controller == null || _hasTriggeredCompletion) return;

    final value = _controller!.value;
    if (value.isReady) {
      final position = value.position;
      final duration = _controller!.metadata.duration;

      // 1. Direct completion if player state ended
      if (value.playerState == PlayerState.ended) {
        _hasTriggeredCompletion = true;
        widget.onCompleted();
        return;
      }

      // 2. Completion if watched >= 88%
      if (duration.inSeconds > 0) {
        final progress = position.inMilliseconds / duration.inMilliseconds;
        if (progress >= 0.88) {
          _hasTriggeredCompletion = true;
          widget.onCompleted();
          return;
        }
      }
    }
  }

  @override
  void didUpdateWidget(covariant TutorialVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUrl != widget.videoUrl) {
      _controller?.removeListener(_videoListener);
      _controller?.dispose();
      _hasTriggeredCompletion = false;
      _initPlayer();
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_videoListener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_isError || _controller == null) {
      return Container(
        height: 200.h,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface02 : AppColors.neutral100,
          borderRadius: BorderRadius.circular(16.r),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.video_library_rounded,
              size: 48.sp,
              color: AppColors.neutral400,
            ),
            SizedBox(height: 8.h),
            Text(
              'Video playback unavailable',
              style: AppTextStyles.bodyMedium.copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              ),
            ),
          ],
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.primary500,
        progressColors: const ProgressBarColors(
          playedColor: AppColors.primary500,
          handleColor: AppColors.primary600,
          bufferedColor: Colors.white24,
          backgroundColor: Colors.black26,
        ),
        onEnded: (metaData) {
          if (!_hasTriggeredCompletion) {
            _hasTriggeredCompletion = true;
            widget.onCompleted();
          }
        },
      ),
    );
  }
}
