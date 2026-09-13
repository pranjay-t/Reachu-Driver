import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/home/providers/home_controller.dart';
import '../utils/app_logger.dart';
import 'socket_stream_manager.dart';

part 'socket_manager_provider.g.dart';

class SocketManagerStatus {
  final bool isOnDuty;
  final bool isConnected;
  final bool isProcessing;

  SocketManagerStatus({
    required this.isOnDuty,
    required this.isConnected,
    required this.isProcessing,
  });

  SocketManagerStatus copyWith({
    bool? isOnDuty,
    bool? isConnected,
    bool? isProcessing,
  }) {
    return SocketManagerStatus(
      isOnDuty: isOnDuty ?? this.isOnDuty,
      isConnected: isConnected ?? this.isConnected,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }
}

@riverpod
class SocketManagerNotifier extends _$SocketManagerNotifier {
  @override
  SocketManagerStatus build() {
    final client = ref.watch(socketClientProvider);
    
    // Listen to changes in the streams to keep the state synchronized
    ref.listen(socketConnectionProvider, (prev, next) {
      final client = ref.read(socketClientProvider);
      state = state.copyWith(
        isConnected: next.value ?? false,
        isProcessing: client.isProcessingOnline,
      );
    });

    ref.listen(socketDutyProvider, (prev, next) {
      final client = ref.read(socketClientProvider);
      state = state.copyWith(
        isOnDuty: next.value ?? false,
        isProcessing: client.isProcessingOnline,
      );
    });

    ref.listen(socketProcessingProvider, (prev, next) {
      state = state.copyWith(isProcessing: next.value ?? false);
    });

    return SocketManagerStatus(
      isOnDuty: client.isOnDuty,
      isConnected: client.isConnected,
      isProcessing: client.isProcessingOnline,
    );
  }

  Future<void> goOnline({bool force = false}) async {
    state = state.copyWith(isProcessing: true);
    try {
      await ref.read(socketClientProvider).goOnline(force: force);
    } finally {
      final client = ref.read(socketClientProvider);
      state = state.copyWith(
        isOnDuty: client.isOnDuty,
        isConnected: client.isConnected,
        isProcessing: false,
      );
    }
  }

  Future<void> goOffline() async {
    state = state.copyWith(isProcessing: true);
    try {
      await ref.read(socketClientProvider).goOffline();
    } finally {
      final client = ref.read(socketClientProvider);
      state = state.copyWith(
        isOnDuty: client.isOnDuty,
        isConnected: client.isConnected,
        isProcessing: false,
      );
    }
  }

  Future<bool> toggleDuty(bool val) async {
    if (state.isProcessing) return false;
    state = state.copyWith(isProcessing: true);
    try {
      final success = await ref
          .read(homeControllerProvider.notifier)
          .toggleDutyStatus(val);
      if (success) {
        if (val) {
          await goOnline();
        } else {
          await goOffline();
        }
        return true;
      } else {
        state = state.copyWith(isProcessing: false);
        return false;
      }
    } catch (e) {
      AppLogger.e('Error in toggleDuty: $e');
      state = state.copyWith(isProcessing: false);
      return false;
    }
  }
}
