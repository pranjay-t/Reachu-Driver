import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:vibration/vibration.dart';
import 'app_logger.dart';

/// Singleton service that plays a looping ride-alert alarm and vibration
/// whenever a new ride request arrives. Stops when the driver acts on it
/// (accept / decline / timeout / queue empty).
class RideSoundService {
  RideSoundService._internal();
  static final RideSoundService instance = RideSoundService._internal();

  AudioPlayer? _player;
  bool _isPlaying = false;
  Timer? _safetyTimer;
  Timer? _vibrationTimer;

  /// Maximum duration the alarm will loop before auto-stopping (safety net).
  static const Duration _maxAlarmDuration = Duration(seconds: 45);

  /// Start the looping ride-alert alarm sound + vibration.
  /// Safe to call multiple times — subsequent calls are no-ops while active.
  Future<void> startRideAlert() async {
    if (_isPlaying) return;
    _isPlaying = true;

    try {
      _player?.dispose();
      _player = AudioPlayer();

      // Use ALARM audio context so it plays even on silent/vibrate mode
      await _player!.setAudioContext(
        AudioContext(
          android: AudioContextAndroid(
            isSpeakerphoneOn: false,
            stayAwake: true,
            contentType: AndroidContentType.sonification,
            usageType: AndroidUsageType.alarm,
            audioFocus: AndroidAudioFocus.gainTransientMayDuck,
          ),
          iOS: AudioContextIOS(
            category: AVAudioSessionCategory.playback,
            options: {AVAudioSessionOptions.mixWithOthers},
          ),
        ),
      );

      await _player!.setReleaseMode(ReleaseMode.loop);
      await _player!.setVolume(1.0);
      await _player!.play(AssetSource('audio/new_ride_sound.ogg'));

      AppLogger.i('🔊 [RideSoundService] Ride alert started (looping)');
    } catch (e) {
      AppLogger.e('🔇 [RideSoundService] Failed to start ride alert: $e');
      _isPlaying = false;
    }

    // Start vibration pattern
    _startVibration();

    // Safety timer — auto-stop after max duration
    _safetyTimer?.cancel();
    _safetyTimer = Timer(_maxAlarmDuration, () {
      AppLogger.w(
        '⏱️ [RideSoundService] Safety timer reached. Auto-stopping alarm.',
      );
      stopRideAlert();
    });
  }

  /// Stop the alarm sound and vibration.
  Future<void> stopRideAlert() async {
    if (!_isPlaying && _player == null) return;
    _isPlaying = false;

    _safetyTimer?.cancel();
    _safetyTimer = null;

    _stopVibration();

    try {
      final playerToDispose = _player;
      _player = null;
      if (playerToDispose != null) {
        await playerToDispose.stop().catchError((_) {});
        await playerToDispose.dispose().catchError((_) {});
      }
      AppLogger.i('🔇 [RideSoundService] Ride alert stopped');
    } catch (e) {
      AppLogger.e('🔇 [RideSoundService] Error stopping ride alert: $e');
    }
  }

  /// Whether the alarm is currently playing.
  bool get isPlaying => _isPlaying;

  bool? _hasVibrator;

  /// Safely check if device supports vibration.
  Future<bool> _canVibrate() async {
    if (_hasVibrator != null) return _hasVibrator!;
    try {
      _hasVibrator = await Vibration.hasVibrator();
    } catch (_) {
      _hasVibrator = false;
    }
    return _hasVibrator!;
  }

  void _startVibration() {
    _stopVibration();
    // Vibrate in a repeating pattern: 500ms vibrate, 500ms pause
    _vibrationTimer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      _safeVibrate();
    });
    // Trigger first vibration immediately
    _safeVibrate();
  }

  /// Safely call vibration — catches MissingPluginException and async Future errors
  /// if native plugin is not available.
  void _safeVibrate() {
    unawaited(
      _canVibrate().then((canVibrate) {
        if (canVibrate) {
          return Vibration.vibrate(duration: 500);
        }
      }).catchError((e) {
        // Silently ignore — vibration is best-effort
      }),
    );
  }

  void _stopVibration() {
    _vibrationTimer?.cancel();
    _vibrationTimer = null;
    unawaited(
      Vibration.cancel().catchError((_) {}),
    );
  }
}
