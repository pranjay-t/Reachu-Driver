import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/socket/socket_stream_manager.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/result.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/utils/app_logger.dart';
import '../models/ride_message_model.dart';

part 'ride_chat_provider.g.dart';

class RideChatState {
  final List<RideMessage> messages;
  final String? chatId;
  final String? riderId;
  final String? driverId;
  final String? riderName;
  final String? riderPhone;
  final String? riderImage;
  final bool isLoading;
  final bool isPeerTyping;
  final String? error;

  RideChatState({
    required this.messages,
    this.chatId,
    this.riderId,
    this.driverId,
    this.riderName,
    this.riderPhone,
    this.riderImage,
    this.isLoading = false,
    this.isPeerTyping = false,
    this.error,
  });

  RideChatState copyWith({
    List<RideMessage>? messages,
    String? chatId,
    String? riderId,
    String? driverId,
    String? riderName,
    String? riderPhone,
    String? riderImage,
    bool? isLoading,
    bool? isPeerTyping,
    String? error,
  }) {
    return RideChatState(
      messages: messages ?? this.messages,
      chatId: chatId ?? this.chatId,
      riderId: riderId ?? this.riderId,
      driverId: driverId ?? this.driverId,
      riderName: riderName ?? this.riderName,
      riderPhone: riderPhone ?? this.riderPhone,
      riderImage: riderImage ?? this.riderImage,
      isLoading: isLoading ?? this.isLoading,
      isPeerTyping: isPeerTyping ?? this.isPeerTyping,
      error: error ?? this.error,
    );
  }
}

@riverpod
class RideChatNotifier extends _$RideChatNotifier {
  late String _rideId;

  @override
  RideChatState build(String rideId) {
    _rideId = rideId;

    // Listen to changes in the streams to keep the state synchronized
    ref.listen(chatStreamProvider, (prev, next) {
      if (next.hasValue && next.value != null) {
        _handleIncomingEvent(next.value!);
      }
    });

    // Launch initial API fetching
    _initializeChat();

    final socketClient = ref.read(socketClientProvider);
    ref.onDispose(() {
      socketClient.leaveChat(_rideId);
    });

    return RideChatState(messages: [], isLoading: true);
  }

  Future<void> _initializeChat() async {
    try {
      final apiService = ref.read(apiServiceProvider);
      final chatResult = await apiService.get(
        '/chat/ride/$_rideId',
        converter: (data) => data as Map<String, dynamic>,
      );

      switch (chatResult) {
        case Success(:final data):
          if (data['success'] == true && data['data'] != null) {
            final chatData = data['data'] as Map<String, dynamic>;
            final chatId = chatData['_id']?.toString() ?? '';
            final riderInfo = chatData['riderId'] as Map<String, dynamic>? ?? {};
            final driverInfo = chatData['driverId'] as Map<String, dynamic>? ?? {};

            final riderId = riderInfo['_id']?.toString() ?? '';
            final driverId = driverInfo['_id']?.toString() ?? '';
            final riderName = riderInfo['name']?.toString() ?? 'Customer';
            final riderPhone = riderInfo['phone']?.toString() ?? '';
            final riderImage = riderInfo['image']?.toString() ?? '';

            state = state.copyWith(
              chatId: chatId,
              riderId: riderId,
              driverId: driverId,
              riderName: riderName,
              riderPhone: riderPhone,
              riderImage: riderImage,
            );

            // Connect/Join sockets
            final socketClient = ref.read(socketClientProvider);
            socketClient.joinRoom('chat:$chatId');
            socketClient.joinChat(rideId: _rideId, chatId: chatId);
            socketClient.markChatRead(chatId);

            // Fetch history
            await _fetchHistory(chatId);
          } else {
            state = state.copyWith(
              isLoading: false,
              error: 'Failed to retrieve chat details',
            );
          }
          break;
        case Failure(:final error):
          state = state.copyWith(
            isLoading: false,
            error: NetworkExceptions.getErrorMessage(error),
          );
          break;
      }
    } catch (e, stack) {
      AppLogger.e('Error initializing chat room', error: e, stackTrace: stack);
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred: $e',
      );
    }
  }

  Future<void> _fetchHistory(String chatId) async {
    final apiService = ref.read(apiServiceProvider);
    final historyResult = await apiService.get(
      '/chat/messages/$chatId',
      converter: (data) => data,
    );

    switch (historyResult) {
      case Success(:final data):
        try {
          List<dynamic> rawList = [];
          if (data is List) {
            rawList = data;
          } else if (data is Map && data['data'] is List) {
            rawList = data['data'] as List;
          } else if (data is Map && data['messages'] is List) {
            rawList = data['messages'] as List;
          }

          final List<RideMessage> messages = [];
          for (var item in rawList) {
            if (item is Map) {
              messages.add(RideMessage.fromRawJson(Map<String, dynamic>.from(item)));
            }
          }

          messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

          state = state.copyWith(
            messages: messages,
            isLoading: false,
          );
        } catch (e) {
          state = state.copyWith(
            isLoading: false,
            error: 'Failed to parse chat history',
          );
        }
        break;
      case Failure(:final error):
        state = state.copyWith(
          isLoading: false,
          error: NetworkExceptions.getErrorMessage(error),
        );
        break;
    }
  }

  void _handleIncomingEvent(Map<String, dynamic> eventData) {
    if (!ref.mounted) return;
    try {
      final event = eventData['event']?.toString();
      final data = eventData['data'];

      AppLogger.d('💬 RideChatNotifier handling event "$event"');

      if (event == 'chat:receiveMessage') {
        if (data is Map) {
          final payload = Map<String, dynamic>.from(data);
          
          final messageData = payload['message'] is Map
              ? Map<String, dynamic>.from(payload['message'] as Map)
              : payload;
              
          final message = RideMessage.fromRawJson(messageData);
          
          if (message.chatId == state.chatId || messageData['chatId'] == state.chatId) {
            if (state.messages.any((m) => m.id == message.id)) return;
            
            final updated = List<RideMessage>.from(state.messages);
            final isMe = message.senderId == state.driverId;
            
            bool matched = false;
            if (isMe) {
              for (int i = 0; i < updated.length; i++) {
                if ((updated[i].id.startsWith('temp_') || updated[i].status == 'sent') && 
                    updated[i].message == message.message) {
                  updated[i] = message;
                  matched = true;
                  break;
                }
              }
            }
            
            if (!matched) {
              updated.add(message);
            }
            
            updated.sort((a, b) => a.createdAt.compareTo(b.createdAt));
            state = state.copyWith(messages: updated);
            
            if (state.chatId != null) {
              ref.read(socketClientProvider).markChatRead(state.chatId!);
            }
          }
        }
      } else if (event == 'chat:messageRead') {
        if (data is Map) {
          final payload = Map<String, dynamic>.from(data);
          final eventChatId = payload['chatId']?.toString();
          if (eventChatId == state.chatId) {
            final updated = state.messages.map((m) {
              return m.copyWith(status: 'read');
            }).toList();
            state = state.copyWith(messages: updated);
          }
        }
      }
    } catch (e, stack) {
      AppLogger.e('Error handling incoming socket event in notifier', error: e, stackTrace: stack);
    }
  }

  void sendMessage(String message) {
    if (message.trim().isEmpty) return;
    if (state.chatId == null) {
      state = state.copyWith(error: 'Chat is not initialized');
      return;
    }

    final tempId = 'temp_${DateTime.now().millisecondsSinceEpoch}';
    final now = DateTime.now();

    final optimistic = RideMessage(
      id: tempId,
      chatId: state.chatId!,
      rideId: _rideId,
      senderId: state.driverId ?? 'self',
      userRole: 'Driver',
      message: message,
      createdAt: now,
      status: 'sent',
    );

    final updated = List<RideMessage>.from(state.messages)..add(optimistic);
    state = state.copyWith(messages: updated, error: null);

    ref.read(socketClientProvider).sendChatMessage(
          chatId: state.chatId!,
          rideId: _rideId,
          message: message,
          senderId: state.driverId ?? '',
          receiverId: state.riderId ?? '',
        );
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}
