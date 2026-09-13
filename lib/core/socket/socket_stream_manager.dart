import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'socket_client.dart';

/// Provider for the single SocketClient instance.
final socketClientProvider = Provider<SocketClient>((ref) {
  final client = SocketClient();
  ref.onDispose(() {
    client.dispose();
  });
  return client;
});

/// Stream provider for connection status.
final socketConnectionProvider = StreamProvider<bool>((ref) {
  final client = ref.watch(socketClientProvider);
  return client.connectionStream;
});

/// Stream provider for driver duty status.
final socketDutyProvider = StreamProvider<bool>((ref) {
  final client = ref.watch(socketClientProvider);
  return client.dutyStream;
});

/// Stream provider for processing online status.
final socketProcessingProvider = StreamProvider<bool>((ref) {
  final client = ref.watch(socketClientProvider);
  return client.processingStream;
});

/// Stream provider for new incoming ride requests.
final newRideStreamProvider = StreamProvider<Map<String, dynamic>>((ref) {
  final client = ref.watch(socketClientProvider);
  return client.newRideStream;
});

/// Stream provider for cancelled ride requests.
final cancelRideStreamProvider = StreamProvider<Map<String, dynamic>>((ref) {
  final client = ref.watch(socketClientProvider);
  return client.cancelRideStream;
});

/// Stream provider for ride status updates.
final rideStatusStreamProvider = StreamProvider<Map<String, dynamic>>((ref) {
  final client = ref.watch(socketClientProvider);
  return client.rideStatusStream;
});

/// Stream provider for chat messages.
final chatStreamProvider = StreamProvider<Map<String, dynamic>>((ref) {
  final client = ref.watch(socketClientProvider);
  return client.chatStream;
});
