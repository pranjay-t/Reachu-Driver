import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../../../core/utils/app_logger.dart';
import '../models/support_message_model.dart';
import '../models/ticket_model.dart';
import '../repositories/support_repository.dart';
import '../services/support_socket_service.dart';
import '../../../core/network/result.dart';

part 'support_controller.g.dart';

@riverpod
class SupportTickets extends _$SupportTickets {
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  @override
  Future<List<SupportTicket>> build() async {
    _currentPage = 1;
    _hasMore = true;
    _isLoadingMore = false;
    return _fetchTickets();
  }

  Future<List<SupportTicket>> _fetchTickets() async {
    final repository = ref.read(supportRepositoryProvider);
    final result = await repository.getTickets(page: _currentPage, limit: 20);
    switch (result) {
      case Success(:final data):
        if (data.data.length < 20) {
          _hasMore = false;
        }
        return data.data;
      case Failure(:final error):
        throw error;
    }
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    _currentPage++;

    final previousTickets = state.value ?? [];
    final repository = ref.read(supportRepositoryProvider);
    final result = await repository.getTickets(page: _currentPage, limit: 20);

    switch (result) {
      case Success(:final data):
        if (data.data.length < 20) {
          _hasMore = false;
        }
        state = AsyncValue.data([...previousTickets, ...data.data]);
        _isLoadingMore = false;
      case Failure():
        _currentPage--;
        _isLoadingMore = false;
    }
  }

  void addTicket(SupportTicket ticket) {
    if (state.hasValue) {
      final list = state.value!;
      // Prevent duplicates
      if (!list.any((t) => t.id == ticket.id)) {
        state = AsyncValue.data([ticket, ...list]);
      }
    }
  }

  void updateTicketStatus(String ticketId, String status) {
    if (state.hasValue) {
      final list = state.value!;
      final updated = list.map((t) {
        if (t.id == ticketId) {
          return t.copyWith(status: status, updatedAt: DateTime.now());
        }
        return t;
      }).toList();
      state = AsyncValue.data(updated);
    }
  }
}

@riverpod
class SupportChat extends _$SupportChat with WidgetsBindingObserver {
  late String _ticketId;
  final Set<String> _processedMessageIds = {};
  bool _isTyping = false;
  bool _isAgentTyping = false;

  bool get isAgentTyping => _isAgentTyping;

  @override
  Future<List<SupportMessage>> build(String ticketId) async {
    _ticketId = ticketId;
    _processedMessageIds.clear();
    _isTyping = false;
    _isAgentTyping = false;

    // Observe App Lifecycle to handle background/foreground reconnections
    WidgetsBinding.instance.addObserver(this);
    final socketService = ref.read(supportSocketServiceProvider);
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
      _cleanupSocket(socketService);
    });

    _initializeSocket();
    return _fetchMessageHistory();
  }

  Future<List<SupportMessage>> _fetchMessageHistory() async {
    final repository = ref.read(supportRepositoryProvider);
    final result = await repository.getMessages(
      ticketId: _ticketId,
      page: 1,
      limit: 50,
    );

    switch (result) {
      case Success(:final data):
        for (var msg in data.data) {
          _processedMessageIds.add(msg.id);
        }
        final messages = data.data.toList();
        messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        return messages;
      case Failure(:final error):
        throw error;
    }
  }

  Future<void> _initializeSocket() async {
    if (!ref.mounted) return;
    try {
      const secureStorage = FlutterSecureStorage();
      final token = await secureStorage.read(key: 'auth_token');
      if (!ref.mounted) return;
      if (token == null || token.isEmpty) {
        AppLogger.w('💬 Support Socket init skipped: auth token not found');
        return;
      }

      final decoded = JwtDecoder.decode(token);
      final userId = decoded['id'] ?? decoded['_id'] ?? '';

      final socketService = ref.read(supportSocketServiceProvider);

      socketService.onConnect = () {
        if (!ref.mounted) return;
        socketService.joinRoom(_ticketId);
        socketService.markRead(_ticketId);
      };

      socketService.onMessageReceived = (data) {
        if (!ref.mounted) return;
        _handleIncomingMessage(data);
      };

      socketService.onTicketUpdated = (data) {
        if (!ref.mounted) return;
        final status = data['status']?.toString() ?? 'open';
        // Update local tickets list status
        ref
            .read(supportTicketsProvider.notifier)
            .updateTicketStatus(_ticketId, status);
      };

      socketService.onTypingStatusChanged = (data) {
        if (!ref.mounted) return;
        final ticketId = data['ticketId']?.toString();
        final isTyping = data['isTyping'] as bool? ?? false;

        if (ticketId == _ticketId) {
          _isAgentTyping = isTyping;
          // Trigger UI update
          if (state.hasValue) {
            state = AsyncValue.data(state.value!);
          }
        }
      };

      socketService.connect(userId: userId, token: token);

      // If already connected, join right away
      if (socketService.isConnected) {
        socketService.joinRoom(_ticketId);
        socketService.markRead(_ticketId);
      }
    } catch (e) {
      AppLogger.e(
        '💬 Error initializing support socket in controller',
        error: e,
      );
    }
  }

  void _cleanupSocket(SupportSocketService socketService) {
    socketService.leaveRoom(_ticketId);
    socketService.onConnect = null;
    socketService.onDisconnect = null;
    socketService.onMessageReceived = null;
    socketService.onTicketUpdated = null;
    socketService.onTypingStatusChanged = null;
    socketService.onError = null;
  }

  void _handleIncomingMessage(Map<String, dynamic> data) {
    if (!ref.mounted) return;
    try {
      // Handle payload wrap where message is inside a nested Map
      final Map<String, dynamic> messageJson =
          data.containsKey('message') && data['message'] is Map<String, dynamic>
          ? data['message'] as Map<String, dynamic>
          : (data.containsKey('message') && data['message'] is Map
                ? Map<String, dynamic>.from(data['message'] as Map)
                : data);

      final message = SupportMessage.fromJson(messageJson);
      if (_processedMessageIds.contains(message.id)) {
        return;
      }
      _processedMessageIds.add(message.id);

      if (state.hasValue) {
        final currentMessages = state.value!;
        final List<SupportMessage> updated = [];

        // Check if this incoming message matches our optimistic sent message
        bool matched = false;
        for (var msg in currentMessages) {
          if (msg.status == 'sent' &&
              msg.senderType == message.senderType &&
              msg.message == message.message) {
            // Replace optimistic with official delivered message
            updated.add(message);
            matched = true;
          } else {
            updated.add(msg);
          }
        }

        if (!matched) {
          updated.add(message);
        }

        // Keep sorted
        updated.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        state = AsyncValue.data(updated);

        // If from agent, mark read
        if (message.senderType == 'agent') {
          ref.read(supportSocketServiceProvider).markRead(_ticketId);
        }
      }
    } catch (e) {
      AppLogger.e(
        '💬 Error parsing incoming socket message in controller',
        error: e,
      );
    }
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final tempId = const Uuid().v4();
    final socketService = ref.read(supportSocketServiceProvider);

    final optimisticMessage = SupportMessage(
      id: tempId,
      ticketId: _ticketId,
      senderId: 'self',
      senderType: 'user',
      message: text,
      createdAt: DateTime.now(),
      status: 'sent',
    );

    // Append optimistic message
    if (state.hasValue) {
      state = AsyncValue.data([...state.value!, optimisticMessage]);
    }

    if (socketService.isConnected) {
      socketService.sendMessage(_ticketId, text);
    } else {
      AppLogger.w(
        '🔌 Socket offline. Attempting REST fallback to send support message.',
      );
      // Proactively trigger socket reconnection in the background
      _initializeSocket();

      final repository = ref.read(supportRepositoryProvider);
      final result = await repository.sendMessageFallback(
        ticketId: _ticketId,
        message: text,
      );

      switch (result) {
        case Success(:final data):
          if (data) {
            _refreshChat();
          } else {
            _markOptimisticMessageFailed(tempId);
          }
        case Failure():
          _markOptimisticMessageFailed(tempId);
      }
    }
  }

  void _markOptimisticMessageFailed(String tempId) {
    if (state.hasValue) {
      final updated = state.value!.map((msg) {
        if (msg.id == tempId) {
          // Represent failed status
          return msg.copyWith(status: 'failed');
        }
        return msg;
      }).toList();
      state = AsyncValue.data(updated);
    }
  }

  Future<void> _refreshChat() async {
    if (!ref.mounted) return;
    try {
      final repository = ref.read(supportRepositoryProvider);
      final result = await repository.getMessages(
        ticketId: _ticketId,
        page: 1,
        limit: 50,
      );
      if (!ref.mounted) return;
      switch (result) {
        case Success(:final data):
          if (state.hasValue) {
            final List<SupportMessage> current = List.from(state.value!);
            // Filter out optimistic ones and merge new ones
            final nonOptimistic = current
                .where((m) => m.status != 'sent' && m.status != 'failed')
                .toList();

            for (var msg in data.data) {
              if (!_processedMessageIds.contains(msg.id)) {
                _processedMessageIds.add(msg.id);
                nonOptimistic.add(msg);
              }
            }
            nonOptimistic.sort((a, b) => a.createdAt.compareTo(b.createdAt));
            state = AsyncValue.data(nonOptimistic);
          }
        case Failure():
          break;
      }
    } catch (_) {}
  }

  void setTyping(bool isTyping) {
    if (!ref.mounted) return;
    if (_isTyping == isTyping) return;
    _isTyping = isTyping;
    ref.read(supportSocketServiceProvider).setTyping(_ticketId, isTyping);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!ref.mounted) return;
    if (state == AppLifecycleState.resumed) {
      AppLogger.i(
        '🔄 App resumed. Reconnecting support socket and refetching room state.',
      );
      _initializeSocket();
      _refreshChat();
    }
  }
}
