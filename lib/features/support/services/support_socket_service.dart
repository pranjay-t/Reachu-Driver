import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../core/network/api_endpoints.dart';
import '../../../core/utils/app_logger.dart';

part 'support_socket_service.g.dart';

@Riverpod(keepAlive: true)
SupportSocketService supportSocketService(Ref ref) {
  return SupportSocketService();
}

class SupportSocketService {
  IO.Socket? _socket;

  // Callbacks
  VoidCallback? onConnect;
  VoidCallback? onDisconnect;
  Function(dynamic)? onConnectError;
  Function(Map<String, dynamic>)? onMessageReceived;
  Function(Map<String, dynamic>)? onTicketUpdated;
  Function(Map<String, dynamic>)? onTypingStatusChanged;
  Function(dynamic)? onError;

  bool _isConnecting = false;

  bool get isConnected => _socket?.connected ?? false;

  void connect({required String userId, required String token}) {
    if (_socket != null) {
      if (_socket!.connected) return;
      if (_isConnecting) {
        AppLogger.d('🔌 Support Socket is already in connecting state...');
        return;
      }
      _socket!.disconnect();
      _socket = null;
    }

    _isConnecting = true;
    final socketUrl = _getSocketUrl();
    AppLogger.i('🔌 Connecting to Support Socket at: $socketUrl');

    try {
      _socket = IO.io(
        socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setAuth({'token': token})
            .setExtraHeaders({'Authorization': 'Bearer $token'})
            .setQuery({
              'userRole': 'Driver',
              'platform': Platform.operatingSystem,
              'userId': userId,
            })
            .setReconnectionAttempts(50)
            .setTimeout(20000)
            .enableReconnection()
            .enableForceNew()
            .build(),
      );

      _setupListeners();
      _socket!.connect();
    } catch (e) {
      _isConnecting = false;
      AppLogger.e('🔌 Socket.IO Connection Setup Error', error: e);
    }
  }

  void disconnect() {
    if (_socket != null) {
      AppLogger.i('🔌 Disconnecting Support Socket...');
      _socket!.disconnect();
      _socket = null;
      _isConnecting = false;
    }
  }

  void _setupListeners() {
    if (_socket == null) return;

    _socket!.onConnect((_) {
      AppLogger.i('🟢 Support Socket Connected');
      _isConnecting = false;
      onConnect?.call();
    });

    _socket!.onDisconnect((_) {
      AppLogger.w('🔴 Support Socket Disconnected');
      _isConnecting = false;
      onDisconnect?.call();
    });

    _socket!.onConnectError((err) {
      AppLogger.e('🔌 Support Socket Connect Error: $err');
      _isConnecting = false;
      onConnectError?.call(err);
    });

    _socket!.on('support:receiveMessage', (data) {
      AppLogger.d('💬 Received support message: $data');
      if (data != null && onMessageReceived != null) {
        if (data is Map<String, dynamic>) {
          onMessageReceived?.call(data);
        } else if (data is Map) {
          onMessageReceived?.call(Map<String, dynamic>.from(data));
        }
      }
    });

    _socket!.on('support:ticketUpdated', (data) {
      AppLogger.i('🎫 Ticket updated: $data');
      if (data != null && onTicketUpdated != null) {
        if (data is Map<String, dynamic>) {
          onTicketUpdated?.call(data);
        } else if (data is Map) {
          onTicketUpdated?.call(Map<String, dynamic>.from(data));
        }
      }
    });

    _socket!.on('support:typing', (data) {
      if (data != null && onTypingStatusChanged != null) {
        if (data is Map<String, dynamic>) {
          onTypingStatusChanged?.call(data);
        } else if (data is Map) {
          onTypingStatusChanged?.call(Map<String, dynamic>.from(data));
        }
      }
    });

    _socket!.on('support:error', (err) {
      AppLogger.e('🔌 Support Socket Error Event: $err');
      _isConnecting = false;
      onError?.call(err);
    });
  }

  void joinRoom(String ticketId) {
    if (_socket != null && _socket!.connected) {
      AppLogger.d('🔌 Emitting support:joinRoom for $ticketId');
      _socket!.emit('support:joinRoom', {'ticketId': ticketId});
    } else {
      AppLogger.w('🔌 Cannot join room. Socket is not connected.');
    }
  }

  void leaveRoom(String ticketId) {
    if (_socket != null && _socket!.connected) {
      AppLogger.d('🔌 Emitting support:leaveRoom for $ticketId');
      _socket!.emit('support:leaveRoom', {'ticketId': ticketId});
    }
  }

  void sendMessage(String ticketId, String message) {
    if (_socket != null && _socket!.connected) {
      AppLogger.d('🔌 Emitting support:sendMessage for $ticketId');
      _socket!.emit('support:sendMessage', {
        'ticketId': ticketId,
        'message': message,
      });
    } else {
      AppLogger.w('🔌 Cannot send socket message. Socket is not connected.');
    }
  }

  void markRead(String ticketId) {
    if (_socket != null && _socket!.connected) {
      AppLogger.d('🔌 Emitting support:markRead for $ticketId');
      _socket!.emit('support:markRead', {'ticketId': ticketId});
    }
  }

  void setTyping(String ticketId, bool isTyping) {
    if (_socket != null && _socket!.connected) {
      _socket!.emit('support:typing', {
        'ticketId': ticketId,
        'isTyping': isTyping,
      });
    }
  }

  String _getSocketUrl() {
    final baseUrl = ApiEndpoints.baseUrl;
    final uri = Uri.parse(baseUrl);
    return '${uri.scheme}://${uri.host}${uri.hasPort ? ':${uri.port}' : ''}';
  }
}
