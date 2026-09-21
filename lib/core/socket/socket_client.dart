import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../network/api_endpoints.dart';
import '../utils/app_logger.dart';
import 'socket_events.dart';
import 'overlay_service.dart';

class SocketClient {
  static final SocketClient _instance = SocketClient._internal();
  factory SocketClient() => _instance;
  SocketClient._internal();

  static const MethodChannel _platform = MethodChannel(
    'com.reachu.driver/background_service',
  );

  IO.Socket? _socket;
  bool _isConnected = false;
  bool _isOnDuty = false;
  bool _isProcessingOnline = false;
  bool _isRideInProgress = false;
  String? _activeRideId;
  Map<String, dynamic>? _currentRide;

  double _currentLatitude = 0.0;
  double _currentLongitude = 0.0;
  DateTime? _lastLocationUpdate;
  DateTime? _lastProfileSyncTime;

  StreamSubscription<Position>? _positionStreamSubscription;
  Timer? _locationUpdateTimer;
  Timer? _reconnectTimer;
  Timer? _healthCheckTimer;

  // Stream Controllers for Reactive Architecture
  final StreamController<bool> _connectionStreamController =
      StreamController<bool>.broadcast();
  final StreamController<bool> _dutyStreamController =
      StreamController<bool>.broadcast();
  final StreamController<Map<String, dynamic>> _newRideStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _cancelRideStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _rideStatusStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _rideLocationStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<Map<String, dynamic>> _chatStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<String> _navigationStreamController =
      StreamController<String>.broadcast();

  final StreamController<bool> _processingStreamController =
      StreamController<bool>.broadcast();

  void _setProcessingOnline(bool val) {
    _isProcessingOnline = val;
    if (!_processingStreamController.isClosed) {
      _processingStreamController.add(val);
    }
  }

  // Getters
  bool get isConnected => _isConnected;
  bool get isOnDuty => _isOnDuty;
  bool get isProcessingOnline => _isProcessingOnline;
  bool get isRideInProgress => _isRideInProgress;
  String? get activeRideId => _activeRideId;
  Map<String, dynamic>? get currentRide => _currentRide;
  double get currentLatitude => _currentLatitude;
  double get currentLongitude => _currentLongitude;

  Stream<bool> get connectionStream => _connectionStreamController.stream;
  Stream<bool> get dutyStream => _dutyStreamController.stream;
  Stream<bool> get processingStream => _processingStreamController.stream;
  Stream<Map<String, dynamic>> get newRideStream =>
      _newRideStreamController.stream;
  Stream<Map<String, dynamic>> get cancelRideStream =>
      _cancelRideStreamController.stream;
  Stream<Map<String, dynamic>> get rideStatusStream =>
      _rideStatusStreamController.stream;
  Stream<Map<String, dynamic>> get rideLocationStream =>
      _rideLocationStreamController.stream;
  Stream<Map<String, dynamic>> get chatStream => _chatStreamController.stream;
  Stream<String> get navigationStream => _navigationStreamController.stream;

  // ==================== INITIALIZATION ====================
  Future<void> initialize() async {
    AppLogger.d('🔄 Initializing SocketClient...');
    await setNativeAppState('Foreground');

    // Initialize the background bubble overlay listener
    OverlayService.instance.initOverlayListener((message) {
      AppLogger.d('📱 [SocketClient] Overlay bubble tapped: $message');
    });

    final prefs = await SharedPreferences.getInstance();

    // Process pending actions (navigation or accepts) immediately to avoid UI delay
    await _processPendingNativeNotificationActions();

    final wasOnline = prefs.getBool("driver_is_online") ?? false;
    if (wasOnline) {
      _isOnDuty = true;
      _setProcessingOnline(true);
      _dutyStreamController.add(true);
      connectSocket();
    }
    await _restoreOnlineStatus();
  }

  Future<void> _processPendingNativeNotificationActions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs
          .reload(); // Force reload to fetch changes written by MainActivity on startup

      final keys = prefs.getKeys();
      AppLogger.d('🔑 [SocketClient] SharedPreferences Keys: $keys');

      final pendingAcceptOrderId =
          prefs.getString('pending_accept_order_id') ?? '';
      final pendingDeclineOrderId =
          prefs.getString('pending_decline_order_id') ?? '';
      final pendingOpenRequests =
          prefs.getBool('pending_open_requests') ?? false;

      AppLogger.d(
        '🚕 [SocketClient] pendingAcceptOrderId = "$pendingAcceptOrderId", '
        'pendingDeclineOrderId = "$pendingDeclineOrderId", '
        'pendingOpenRequests = $pendingOpenRequests',
      );

      if (pendingAcceptOrderId.isNotEmpty) {
        AppLogger.d(
          '🚕 [SocketClient] Processing pending native ACCEPT for $pendingAcceptOrderId',
        );
        await prefs.remove('pending_accept_order_id');
        if (!_isConnected) await connectSocket();
        await acceptRideFromNotification(pendingAcceptOrderId);
      } else if (pendingDeclineOrderId.isNotEmpty) {
        AppLogger.d(
          '🚕 [SocketClient] Processing pending native DECLINE for $pendingDeclineOrderId',
        );
        await prefs.remove('pending_decline_order_id');
        if (!_isConnected) await connectSocket();
        declineRide(
          pendingDeclineOrderId,
          reason: 'Declined from native notification',
        );
      }

      if (pendingOpenRequests) {
        AppLogger.d(
          '🚕 [SocketClient] Processing pending native OPEN REQUESTS navigation',
        );
        await prefs.remove('pending_open_requests');
        _navigationStreamController.add('/ride_request_queue');
      }
    } catch (e) {
      AppLogger.d(
        '❌ [SocketClient] Error processing pending native actions: $e',
      );
    }
  }

  Future<void> _restoreOnlineStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isRideInProgress = prefs.getBool("is_ride_in_progress") ?? false;
      _activeRideId = prefs.getString("active_ride_id");

      final wasOnline = prefs.getBool("driver_is_online") ?? false;
      if (wasOnline) {
        // Double check permissions before restoring online status
        bool allPermissionsGranted = true;
        if (Platform.isAndroid) {
          final hasLocation = await Permission.locationAlways.isGranted;
          final results = await Future.wait([
            Permission.notification.isGranted,
            Permission.systemAlertWindow.isGranted,
          ]);
          allPermissionsGranted = hasLocation && results[0] && results[1];
        } else {
          allPermissionsGranted = await Permission.locationAlways.isGranted;
        }

        if (!allPermissionsGranted) {
          AppLogger.w(
            '⚠️ Restoring online status failed: permissions are missing. Setting offline.',
          );
          await prefs.setBool("driver_is_online", false);
          await _stopNativeService();
          _cleanupSocket();
          _isOnDuty = false;
          _setProcessingOnline(false);
          _dutyStreamController.add(false);
          return;
        }

        AppLogger.d('🔄 Restoring online status from SharedPreferences...');
        int retries = 0;
        while (!_isConnected && retries < 10) {
          await Future.delayed(const Duration(milliseconds: 200));
          retries++;
        }
        if (_isConnected) {
          await goOnline(force: true);
        } else {
          _isOnDuty = true;
          _setProcessingOnline(false);
          _dutyStreamController.add(true);
        }
      } else {
        await _stopNativeService();
        _cleanupSocket();
        _setProcessingOnline(false);
      }
    } catch (e) {
      AppLogger.d('❌ Error restoring online status: $e');
      _setProcessingOnline(false);
    } finally {
      _setProcessingOnline(false);
    }
  }

  Future<void> getInitialLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 3),
      );
      _currentLatitude = position.latitude;
      _currentLongitude = position.longitude;
      _lastLocationUpdate = DateTime.now();
      AppLogger.d(
        '✅ Initial location fetched: $_currentLatitude, $_currentLongitude',
      );
    } catch (e) {
      AppLogger.d('⚠️ Quick location failed: $e. Using cached location.');
      try {
        final lastPos = await Geolocator.getLastKnownPosition();
        if (lastPos != null) {
          _currentLatitude = lastPos.latitude;
          _currentLongitude = lastPos.longitude;
          AppLogger.d(
            '📍 Using last known location: $_currentLatitude, $_currentLongitude',
          );
        } else {
          _currentLatitude = 23.2508131;
          _currentLongitude = 77.4647936;
          AppLogger.d(
            '📍 Location services unavailable. Using fallback location: $_currentLatitude, $_currentLongitude',
          );
        }
      } catch (innerError) {
        AppLogger.w(
          '⚠️ Last known location failed: $innerError. Using fallback location.',
        );
        _currentLatitude = 23.2508131;
        _currentLongitude = 77.4647936;
      }
    }
  }

  // ==================== SOCKET CONNECTION ====================
  Future<bool> connectSocket() async {
    try {
      if (_socket != null && _isConnected) return true;
      _cleanupSocket();

      const secureStorage = FlutterSecureStorage();
      final token = await secureStorage.read(key: 'auth_token');
      final phone = await secureStorage.read(key: 'driver_phone') ?? '';

      if (token == null || token.isEmpty) {
        AppLogger.e('❌ Cannot connect socket: auth_token is missing');
        return false;
      }

      // Decode token to get Mongo driver ID (user id) instead of phone number
      String driverId = '';
      try {
        final decodedToken = JwtDecoder.decode(token);
        driverId = decodedToken['id'] ?? decodedToken['_id'] ?? '';
        AppLogger.d('🔑 Extracted driverId (Mongo ID) from token: $driverId');
      } catch (e) {
        AppLogger.e('❌ Error decoding JWT token in socket: $e');
      }

      if (driverId.isEmpty) {
        driverId = phone;
        AppLogger.w('⚠️ Falling back to phone number as driverId: $driverId');
      }

      final baseUrl = ApiEndpoints.baseUrl;
      final uri = Uri.parse(baseUrl);
      final socketUrl =
          '${uri.scheme}://${uri.host}${uri.hasPort ? ':${uri.port}' : ''}';

      // Save token, driverId (Mongo ID) and socketUrl to SharedPreferences for Kotlin service takeover
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", token);
      await prefs.setString("driver_userid", driverId);
      await prefs.setString("socket_url", socketUrl);

      _socket = IO.io(
        socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket', 'polling'])
            .enableAutoConnect()
            .enableReconnection()
            .setReconnectionAttempts(999999)
            .setReconnectionDelay(1000)
            .setReconnectionDelayMax(5000)
            .setTimeout(10000)
            .setAuth({'token': token})
            .setQuery({
              'userRole': 'Driver',
              'platform': 'flutter',
              'driverId': driverId,
            })
            .build(),
      );

      _setupSocketListeners();
      _socket!.connect();

      return await _waitForConnection();
    } catch (e) {
      AppLogger.e('❌ Socket connection error: $e');
      _setProcessingOnline(false);
      _dutyStreamController.add(_isOnDuty);
      return false;
    }
  }

  void _cleanupSocket() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket!.dispose();
      _socket = null;
      _isConnected = false;
      _setProcessingOnline(false);
      _connectionStreamController.add(false);
    }
  }

  Future<bool> _waitForConnection() async {
    final completer = Completer<bool>();
    final timeout = Timer(const Duration(seconds: 10), () {
      if (!completer.isCompleted) completer.complete(false);
    });

    _socket!.once('connect', (_) {
      timeout.cancel();
      _isConnected = true;
      _connectionStreamController.add(true);
      if (!completer.isCompleted) completer.complete(true);
    });

    _socket!.once('connect_error', (_) {
      timeout.cancel();
      _setProcessingOnline(false);
      _dutyStreamController.add(_isOnDuty);
      if (!completer.isCompleted) completer.complete(false);
    });

    return completer.future;
  }

  void _setupSocketListeners() {
    if (_socket == null) return;

    _socket!.onAny((event, data) {
      try {
        String dataString;
        try {
          dataString = const JsonEncoder.withIndent('  ').convert(data);
        } catch (_) {
          dataString = jsonEncode(data);
        }
        final fullMessage =
            '📥 [SocketEvent] Received event: "$event" with data:\n$dataString';
        AppLogger.i(fullMessage);
      } catch (e) {
        AppLogger.d(
          '📥 [SocketEvent] Received event: "$event" (JSON serialization failed)',
        );
      }
    });

    _socket!.onConnect((_) {
      AppLogger.i('🟢 Socket Connected!');
      _isConnected = true;
      _connectionStreamController.add(true);
      if (_isOnDuty) {
        goOnline(force: true);
      }
    });

    _socket!.onDisconnect((_) {
      AppLogger.w('🔴 Socket Disconnected');
      _isConnected = false;
      _setProcessingOnline(false);
      _dutyStreamController.add(_isOnDuty);
      _connectionStreamController.add(false);
      _cancelHealthCheck();
      if (_isOnDuty) _scheduleReconnect();
    });

    _socket!.onConnectError((data) {
      AppLogger.w('⚠️ Socket Connect Error: $data');
      _isConnected = false;
      _setProcessingOnline(false);
      _dutyStreamController.add(_isOnDuty);
      _connectionStreamController.add(false);
    });

    _socket!.on(SocketEvents.onlineSuccess, (data) {
      AppLogger.i('✅ Server online success: $data');
      _isOnDuty = true;
      _setProcessingOnline(false);
      _dutyStreamController.add(true);
      _saveOnlineStatus(true);
    });

    _socket!.on(SocketEvents.onlineFailed, (data) {
      AppLogger.e('❌ Server online failed: $data');
      _isOnDuty = false;
      _setProcessingOnline(false);
      _dutyStreamController.add(false);
      _saveOnlineStatus(false);
      _stopNativeService();
    });

    _socket!.on(SocketEvents.newRide, (data) {
      AppLogger.i('🚕 New Ride Request received: $data');
      if (!_isOnDuty) return;
      final mapped = _mapRideData(data);
      _newRideStreamController.add(mapped);
    });

    _socket!.on(SocketEvents.orderCancelled, (data) async {
      AppLogger.i('❌ Ride cancelled: $data');
      final mapped = _mapRideData(data);
      _cancelRideStreamController.add(mapped);

      final String rideId = (mapped['orderId'] ?? mapped['id'] ?? '').toString();
      if (_activeRideId == rideId) {
        _completeRide();
      }

      // Clear pending ride request from SharedPreferences so it doesn't persist
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('last_ride_request');
        await prefs.remove('flutter.last_ride_request');
        await prefs.setBool('pending_ride_from_killed', false);
        await prefs.setBool('flutter.pending_ride_from_killed', false);
        await prefs.remove('pending_accept_order_id');
        await prefs.remove('pending_decline_order_id');
      } catch (e) {
        AppLogger.e('Error clearing pending ride on orderCancelled: $e');
      }
    });

    _socket!.on(SocketEvents.rideConfirmed, (data) {
      AppLogger.i('✅ Ride Confirmed: $data');
      final mapped = _mapRideData(data);
      _currentRide = mapped;
      _activeRideId = mapped['orderId']?.toString();
      _isRideInProgress = true;
      _saveRideState();

      _socket!.emit(SocketEvents.joinRoom, {'roomName': 'ride:$_activeRideId'});
      _updateNativeNotification(
        'Order in Progress',
        'Order #$_activeRideId is active.',
      );
    });

    _socket!.on(SocketEvents.rideReconnected, (data) {
      AppLogger.i('🔄 Ride Reconnected: $data');
      final mapped = _mapRideData(data);
      _currentRide = mapped;
      _activeRideId = mapped['orderId']?.toString();
      _isRideInProgress = true;
      _saveRideState();

      _socket!.emit(SocketEvents.joinRoom, {'roomName': 'ride:$_activeRideId'});
      _rideStatusStreamController.add(mapped);
      _updateNativeNotification(
        'Order in Progress',
        'Order #$_activeRideId is active.',
      );
    });

    _socket!.on(SocketEvents.ridePaymentPending, (data) {
      AppLogger.i('💳 Ride Payment Pending: $data');
      final mapped = _mapRideData(data);
      _currentRide = mapped;
      _activeRideId = mapped['orderId']?.toString();
      _isRideInProgress = true;
      _saveRideState();

      _socket!.emit(SocketEvents.joinRoom, {'roomName': 'ride:$_activeRideId'});
      _rideStatusStreamController.add(mapped);
      _updateNativeNotification(
        'Payment Pending',
        'Collect payment for order #$_activeRideId.',
      );
    });

    _socket!.on(SocketEvents.rideStatus, (data) {
      AppLogger.d('📊 Ride status update: $data');
      _rideStatusStreamController.add(Map<String, dynamic>.from(data));
      final status = (data['status']?.toString() ?? '').toLowerCase();
      if (status == 'paid' || status == 'cancelled') {
        _completeRide();
      }
    });

    _socket!.on(SocketEvents.rideLocation, (data) {
      AppLogger.d('📍 Ride location update: $data');
      if (data is Map) {
        _rideLocationStreamController.add(Map<String, dynamic>.from(data));
      }
    });

    // Chat listeners
    _socket!.on(SocketEvents.chatReceiveMessage, (data) {
      _chatStreamController.add({
        'event': SocketEvents.chatReceiveMessage,
        'data': data != null
            ? Map<String, dynamic>.from(data as Map)
            : <String, dynamic>{},
      });
    });
    _socket!.on(SocketEvents.chatMessage, (data) {
      _chatStreamController.add({
        'event': SocketEvents.chatMessage,
        'data': data != null
            ? Map<String, dynamic>.from(data as Map)
            : <String, dynamic>{},
      });
    });
    _socket!.on(SocketEvents.chatJoinSuccess, (data) {
      _chatStreamController.add({
        'event': SocketEvents.chatJoinSuccess,
        'data': data != null
            ? Map<String, dynamic>.from(data as Map)
            : <String, dynamic>{},
      });
    });
    _socket!.on(SocketEvents.chatJoinError, (data) {
      _chatStreamController.add({
        'event': SocketEvents.chatJoinError,
        'data': data != null
            ? Map<String, dynamic>.from(data as Map)
            : <String, dynamic>{},
      });
    });
    _socket!.on(SocketEvents.chatError, (data) {
      _chatStreamController.add({
        'event': SocketEvents.chatError,
        'data': data != null
            ? Map<String, dynamic>.from(data as Map)
            : <String, dynamic>{},
      });
    });
    _socket!.on(SocketEvents.chatTyping, (data) {
      _chatStreamController.add({
        'event': SocketEvents.chatTyping,
        'data': data != null
            ? Map<String, dynamic>.from(data as Map)
            : <String, dynamic>{},
      });
    });
    _socket!.on('chat:messageRead', (data) {
      _chatStreamController.add({
        'event': 'chat:messageRead',
        'data': data != null
            ? Map<String, dynamic>.from(data as Map)
            : <String, dynamic>{},
      });
    });
  }

  // ==================== ONLINE/OFFLINE ACTIONS ====================
  Future<void> goOnline({bool force = false}) async {
    if (_isProcessingOnline && !force) return;

    if (!force && _isOnDuty && _socket != null && _isConnected) {
      AppLogger.d('Already online and connected. Skipping goOnline.');
      _setProcessingOnline(false);
      _dutyStreamController.add(true);
      return;
    }

    _setProcessingOnline(true);
    _dutyStreamController.add(_isOnDuty);

    // Safety timeout of 6 seconds to prevent getting stuck in processing state
    Timer(const Duration(seconds: 6), () {
      if (_isProcessingOnline) {
        AppLogger.w(
          '⏳ goOnline timeout reached. Resetting isProcessingOnline.',
        );
        _setProcessingOnline(false);
        _dutyStreamController.add(_isOnDuty);
      }
    });

    try {
      if (_socket == null || !_isConnected) {
        final reconnected = await connectSocket();
        if (!reconnected) {
          _isOnDuty = false;
          _setProcessingOnline(false);
          _dutyStreamController.add(false);
          return;
        }
      }

      // Fetch driver's current position using Geolocator before going online
      await getInitialLocation();

      const secureStorage = FlutterSecureStorage();
      final token = await secureStorage.read(key: 'auth_token');

      // Asynchronously fetch latest profile to keep vehicle data in prefs up-to-date without delaying socket online emission
      if (token != null && token.isNotEmpty) {
        unawaited(_syncDriverProfileAsync(token));
      }

      final prefs = await SharedPreferences.getInstance();
      final vehicleType = prefs.getString("vehicle_type_id") ?? "";
      final vehicleSubType = prefs.getString("vehicle_SubType") ?? "";
      final vehicleId = prefs.getString("vehicle_id") ?? "";
      final vehicleImage = prefs.getString("driver_image");
      final fleetId = prefs.getString("fleet_id");

      final payload = {
        'latitude': _currentLatitude,
        'longitude': _currentLongitude,
        'vehicleType': vehicleType,
        'vehicleSubType': vehicleSubType,
        'vehicleId': vehicleId,
        if (vehicleImage != null) 'vehicleImage': vehicleImage,
        if (fleetId != null) 'fleetId': fleetId,
        'timestamp': DateTime.now().toIso8601String(),
      };

      _socket!.emit(SocketEvents.goOnline, payload);
      _startLocationUpdates();
      startLocationWatch();

      _isOnDuty = true;
      await _saveOnlineStatus(true);
      await _startNativeService();
    } catch (e) {
      AppLogger.e('Error going online: $e');
      _setProcessingOnline(false);
      _isOnDuty = false;
      _dutyStreamController.add(false);
    }
  }

  Future<void> _syncDriverProfileAsync(String token) async {
    // Throttle profile API sync to at most once every 10 minutes to avoid redundant backend calls
    if (_lastProfileSyncTime != null &&
        DateTime.now().difference(_lastProfileSyncTime!).inMinutes < 10) {
      return;
    }
    _lastProfileSyncTime = DateTime.now();

    try {
      final dio = Dio(BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ));
      dio.options.headers['Authorization'] = 'Bearer $token';
      final decodedToken = JwtDecoder.decode(token);
      final userId = decodedToken['id'] ?? decodedToken['_id'];
      if (userId != null) {
        final path = ApiEndpoints.getDriverById.replaceAll(
          '<driverId>',
          userId,
        );
        final response = await dio.get(path);
        if (response.statusCode == 200 && response.data != null) {
          final rawMap = response.data as Map<String, dynamic>;

          final vehicleMapImage =
              rawMap['vehicleMapImage']?.toString() ??
              (rawMap['driver'] is Map
                  ? (rawMap['driver'] as Map)['vehicleMapImage']?.toString()
                  : null) ??
              (rawMap['data'] is Map
                  ? (rawMap['data'] as Map)['vehicleMapImage']?.toString()
                  : null) ??
              "";

          final prefsInstance = await SharedPreferences.getInstance();
          if (vehicleMapImage.isNotEmpty) {
            await prefsInstance.setString(
              "vehicle_map_image",
              vehicleMapImage,
            );
          }

          if (rawMap.containsKey('driver')) {
            final driverData = rawMap['driver'] as Map<String, dynamic>?;
            if (driverData != null && driverData.containsKey('vehicle')) {
              final vehicle = driverData['vehicle'];
              if (vehicle is Map) {
                final vehicleId =
                    vehicle['_id']?.toString() ??
                    vehicle['id']?.toString() ??
                    "";
                final vehicleType =
                    vehicle['vehicleType']?.toString() ?? "";
                final vehicleSubType =
                    vehicle['vehicleSubType']?.toString() ?? "";
                final vehicleName =
                    vehicle['vehicleName']?.toString() ?? "";
                final vehicleNumber =
                    vehicle['vehicleNumber']?.toString() ?? "";

                if (vehicleId.isNotEmpty) {
                  await prefsInstance.setString("vehicle_id", vehicleId);
                }
                if (vehicleType.isNotEmpty) {
                  await prefsInstance.setString(
                    "vehicle_type_id",
                    vehicleType,
                  );
                }
                if (vehicleSubType.isNotEmpty) {
                  await prefsInstance.setString(
                    "vehicle_SubType",
                    vehicleSubType,
                  );
                }
                if (vehicleName.isNotEmpty) {
                  await prefsInstance.setString(
                    "vehicle_name",
                    vehicleName,
                  );
                }
                if (vehicleNumber.isNotEmpty) {
                  await prefsInstance.setString(
                    "vehicle_number",
                    vehicleNumber,
                  );
                }
              }
            }
          }
        }
      }
    } catch (e) {
      AppLogger.w('⚠️ Background profile sync in SocketClient: $e');
    }
  }

  Future<void> goOffline() async {
    try {
      if (_socket != null && _isConnected) {
        const secureStorage = FlutterSecureStorage();
        final phone = await secureStorage.read(key: 'driver_phone') ?? '';
        _socket!.emit(SocketEvents.goOffline, {
          'driverId': phone,
          'timestamp': DateTime.now().toIso8601String(),
        });
        await Future.delayed(const Duration(milliseconds: 300));
      }

      _isOnDuty = false;
      _setProcessingOnline(false);
      _isRideInProgress = false;
      _activeRideId = null;
      _currentRide = null;
      _cancelReconnect();

      await _saveOnlineStatus(false);
      await _saveRideState();
      _dutyStreamController.add(false);
      _cleanupSocket();
      await _stopNativeService();
    } catch (e) {
      AppLogger.e('Error going offline: $e');
    }
  }

  Future<void> logoutAndDisconnect() async {
    AppLogger.i('🛑 [SocketClient] Logging out and tearing down socket connection...');
    try {
      if (_socket != null && _isConnected) {
        const secureStorage = FlutterSecureStorage();
        final phone = await secureStorage.read(key: 'driver_phone') ?? '';
        _socket!.emit(SocketEvents.goOffline, {
          'driverId': phone,
          'timestamp': DateTime.now().toIso8601String(),
        });
        await Future.delayed(const Duration(milliseconds: 300));
      }

      _isOnDuty = false;
      _isProcessingOnline = false;
      _isRideInProgress = false;
      _activeRideId = null;
      _currentRide = null;

      _stopLocationUpdates();
      stopLocationWatch();
      _cancelReconnect();

      await _saveOnlineStatus(false);
      await _saveRideState();
      await _clearPendingRideRequestPreferences();

      _dutyStreamController.add(false);
      _cleanupSocket();
      await _stopNativeService();
    } catch (e) {
      AppLogger.e('Error during socket logout and disconnect: $e');
    }
  }

  // ==================== RIDE ACTIONS ====================
  Future<void> acceptRideFromNotification(String orderId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final lastRideJson = prefs.getString('last_ride_request');
      AppLogger.d(
        '🚕 [SocketClient] acceptRideFromNotification: orderId = "$orderId", lastRideJson = "$lastRideJson"',
      );
      if (lastRideJson != null) {
        final parsed = jsonDecode(lastRideJson);
        final mapped = _mapRideData(parsed);
        AppLogger.d(
          '🚕 [SocketClient] acceptRideFromNotification: mapped orderId = "${mapped['orderId']}"',
        );
        if (mapped['orderId'] == orderId) {
          // Call REST API to transition status to 'Accepted' in DB
          const secureStorage = FlutterSecureStorage();
          final token = await secureStorage.read(key: 'auth_token');
          final vehicleId = prefs.getString("vehicle_id") ?? "";

          if (token != null && token.isNotEmpty) {
            try {
              final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
              dio.options.headers['Authorization'] = 'Bearer $token';
              final path = '/order/update/$orderId';
              AppLogger.d(
                '📡 [SocketClient] Updating ride status via REST API: $path',
              );
              final response = await dio.patch(
                path,
                data: {
                  "orderId": orderId,
                  "vehicleId": vehicleId,
                  "orderStatus": "Accepted",
                },
              );
              AppLogger.d(
                '📡 [SocketClient] REST API Response: ${response.data}',
              );
            } catch (apiErr) {
              AppLogger.e(
                '❌ [SocketClient] REST API call failed to accept ride: $apiErr',
              );
            }
          } else {
            AppLogger.w(
              '⚠️ [SocketClient] No auth token found, cannot call REST API to accept ride',
            );
          }

          final accepted = acceptRide(mapped);
          AppLogger.d('🚕 [SocketClient] acceptRide result = $accepted');
          return;
        } else {
          AppLogger.w(
            '🚕 [SocketClient] acceptRideFromNotification: orderId mismatch! "${mapped['orderId']}" vs "$orderId"',
          );
        }
      } else {
        AppLogger.w(
          '🚕 [SocketClient] acceptRideFromNotification: lastRideJson is null!',
        );
      }
    } catch (e) {
      AppLogger.e('Error accepting ride from notification: $e');
    }
  }

  bool acceptRide(Map<String, dynamic> rideData) {
    if (_socket == null || !_isConnected) return false;
    final orderId =
        rideData['orderId'] ?? rideData['rideId'] ?? rideData['_id'];
    if (orderId == null) return false;

    _clearPendingRideRequestPreferences();
    _activeRideId = orderId.toString();
    _isRideInProgress = true;

    // Create a mutable copy of rideData and set the status to 'accepted' so that OrderController
    // handleOrderRedirection immediately navigates to /arriving_client
    final updatedRide = Map<String, dynamic>.from(rideData);
    updatedRide['status'] = 'accepted';
    updatedRide['orderStatus'] = 'accepted';

    _currentRide = updatedRide;
    _saveRideState();

    const secureStorage = FlutterSecureStorage();
    secureStorage.read(key: 'auth_token').then((token) {
      String driverId = '';
      if (token != null && token.isNotEmpty) {
        try {
          final decodedToken = JwtDecoder.decode(token);
          driverId = decodedToken['id'] ?? decodedToken['_id'] ?? '';
        } catch (e) {
          AppLogger.e('Error decoding JWT token in acceptRide: $e');
        }
      }
      secureStorage.read(key: 'driver_phone').then((phone) {
        if (driverId.isEmpty) driverId = phone ?? '';
        final payload = {
          'orderId': orderId,
          'driverId': driverId,
          'acceptedAt': DateTime.now().toIso8601String(),
          'location': {
            'latitude': _currentLatitude,
            'longitude': _currentLongitude,
          },
        };
        _socket!.emit(SocketEvents.acceptRide, payload);
      });
    });

    return true;
  }

  bool declineRide(String orderId, {String reason = ''}) {
    if (_socket == null || !_isConnected) return false;

    _clearPendingRideRequestPreferences();
    const secureStorage = FlutterSecureStorage();
    secureStorage.read(key: 'auth_token').then((token) {
      String driverId = '';
      if (token != null && token.isNotEmpty) {
        try {
          final decodedToken = JwtDecoder.decode(token);
          driverId = decodedToken['id'] ?? decodedToken['_id'] ?? '';
        } catch (e) {
          AppLogger.e('Error decoding JWT token in declineRide: $e');
        }
      }
      secureStorage.read(key: 'driver_phone').then((phone) {
        if (driverId.isEmpty) driverId = phone ?? '';
        final payload = {
          'orderId': orderId,
          'driverId': driverId,
          'reason': reason,
          'declinedAt': DateTime.now().toIso8601String(),
        };
        _socket!.emit(SocketEvents.declineRide, payload);
      });
    });

    if (_activeRideId == orderId) {
      _completeRide();
    }
    return true;
  }

  void completeRide() {
    _completeRide();
  }

  void _completeRide() {
    _activeRideId = null;
    _isRideInProgress = false;
    _currentRide = null;
    _saveRideState();
    _clearPendingRideRequestPreferences();
    _updateNativeNotification('You are Online', 'Waiting for orders...');
  }

  Future<void> _clearPendingRideRequestPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('last_ride_request');
      await prefs.remove('last_ride_request_ts');
      await prefs.remove('pending_ride_from_killed');
      AppLogger.d(
        '🧹 [SocketClient] Cleared pending ride request SharedPreferences keys',
      );
    } catch (e) {
      AppLogger.e('Error clearing pending ride request SharedPreferences: $e');
    }
  }

  // ==================== STATE PERSISTENCE ====================
  Future<void> _saveOnlineStatus(bool isOnline) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("driver_is_online", isOnline);
  }

  Future<void> _saveRideState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("is_ride_in_progress", _isRideInProgress);
    await prefs.setString("active_ride_id", _activeRideId ?? "");
  }

  // ==================== LOCATION & HEALTH ====================
  void _startLocationUpdates() {
    _stopLocationUpdates();
    _locationUpdateTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_socket != null && _isConnected && _isOnDuty) {
        if (_currentLatitude != 0.0 && _currentLongitude != 0.0) {
          _sendLocationUpdate();
        }
      }
    });
    _startHealthCheck();
  }

  void _stopLocationUpdates() {
    _locationUpdateTimer?.cancel();
    _locationUpdateTimer = null;
    _cancelHealthCheck();
  }

  void _sendLocationUpdate() {
    if (_socket == null || !_isConnected) return;
    final isRideActive = _isRideInProgress && _activeRideId != null;

    if (isRideActive) {
      _socket!.emit(SocketEvents.updateRideLocation, {
        'rideId': _activeRideId,
        'location': {
          'latitude': _currentLatitude,
          'longitude': _currentLongitude,
          'lat': _currentLatitude,
          'lng': _currentLongitude,
          'timestamp': DateTime.now().toIso8601String(),
        },
      });
    } else {
      SharedPreferences.getInstance().then((p) {
        final vehicleType = p.getString("vehicle_type_id") ?? "";
        final vehicleSubType = p.getString("vehicle_SubType") ?? "";
        final vehicleId = p.getString("vehicle_id") ?? "";
        final vehicleImage = p.getString("driver_image");
        final fleetId = p.getString("fleet_id");

        _socket!.emit(SocketEvents.updateDriverLocation, {
          'latitude': _currentLatitude,
          'longitude': _currentLongitude,
          'role': 'Driver',
          'vehicleType': vehicleType,
          'vehicleSubType': vehicleSubType,
          'vehicleId': vehicleId,
          if (vehicleImage != null) 'vehicleImage': vehicleImage,
          if (fleetId != null) 'fleetId': fleetId,
          'timestamp': DateTime.now().toIso8601String(),
        });
      });
    }
    _lastLocationUpdate = DateTime.now();
  }

  void startLocationWatch() {
    if (_positionStreamSubscription != null) return;
    _positionStreamSubscription =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.best,
            distanceFilter: 5,
          ),
        ).listen(
          (pos) {
            _currentLatitude = pos.latitude;
            _currentLongitude = pos.longitude;
            _lastLocationUpdate = DateTime.now();
          },
          onError: (error) {
            AppLogger.e('❌ Error in location watch stream: $error');
          },
        );
  }

  void stopLocationWatch() {
    _positionStreamSubscription?.cancel();
    _positionStreamSubscription = null;
  }

  void updateLocation(double lat, double lng) {
    _currentLatitude = lat;
    _currentLongitude = lng;
    _lastLocationUpdate = DateTime.now();
  }

  void _scheduleReconnect({bool force = false}) {
    _cancelReconnect();
    _reconnectTimer = Timer(const Duration(seconds: 5), () async {
      if (!_isOnDuty) return;
      if (_isConnected && !force) return;
      if (force) {
        AppLogger.w('🔄 [SocketClient] Forcing clean socket teardown and reconnection...');
        _cleanupSocket();
      }
      final connected = await connectSocket();
      if (connected && _isOnDuty) {
        await goOnline(force: true);
      } else if (_isOnDuty) {
        _scheduleReconnect();
      }
    });
  }

  void _cancelReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
  }

  void _startHealthCheck() {
    _cancelHealthCheck();
    _healthCheckTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (_isOnDuty) {
        final lastUpdate = _lastLocationUpdate;
        if (lastUpdate != null) {
          final diff = DateTime.now().difference(lastUpdate).inMilliseconds;
          if (diff > 90000) { // 90 seconds
            AppLogger.w(
              '⚠️ Socket health check failed (Location stale: ${diff}ms). Forcing reconnection...',
            );
            _scheduleReconnect(force: true);
          }
        }
      }
    });
  }

  void _cancelHealthCheck() {
    _healthCheckTimer?.cancel();
    _healthCheckTimer = null;
  }

  // ==================== NATIVE BRIDGING ====================
  Future<void> _startNativeService() async {
    try {
      await _platform.invokeMethod('startService');
    } catch (e) {
      AppLogger.e('Failed starting native service: $e');
    }
  }

  Future<void> _stopNativeService() async {
    try {
      await _platform.invokeMethod('stopService');
    } catch (e) {
      AppLogger.e('Failed stopping native service: $e');
    }
  }

  Future<void> _updateNativeNotification(String title, String body) async {
    try {
      await _platform.invokeMethod('updateNotification', {
        'title': title,
        'body': body,
      });
    } catch (e) {
      AppLogger.e('Failed updating native notification: $e');
    }
  }

  Future<void> setNativeAppState(String state) async {
    try {
      await _platform.invokeMethod('setAppState', {'state': state});
      if (state == 'Background') {
        // Pause Flutter's timer in background; native Kotlin service takes over GPS emissions
        _stopLocationUpdates();
      } else if (state == 'Foreground' && _isOnDuty) {
        AppLogger.i('🔄 [SocketClient] Resumed to Foreground: ensuring Flutter socket & streams');
        if (!_isConnected || _socket == null) {
          connectSocket().then((connected) {
            if (connected && _isOnDuty) goOnline(force: true);
          });
        } else {
          _startLocationUpdates();
          startLocationWatch();
        }
        _processPendingNativeNotificationActions();
      }
    } catch (e) {
      AppLogger.e('Failed updating app state: $e');
    }
  }

  // ==================== MAPPING HELPERS ====================
  Map<String, dynamic> _mapRideData(dynamic data) {
    if (data is! Map) return {};
    final Map<String, dynamic> rideData = Map<String, dynamic>.from(data);

    Map<String, dynamic>? pickupCoords;
    if (rideData['pickup'] is Map) {
      final pickup = Map<String, dynamic>.from(rideData['pickup']);
      if (pickup['latitude'] != null) {
        pickupCoords = {
          'latitude': double.parse(pickup['latitude'].toString()),
          'longitude': double.parse(pickup['longitude'].toString()),
        };
      }
    }

    Map<String, dynamic>? dropoffCoords;
    if (rideData['destination'] is Map) {
      final destination = Map<String, dynamic>.from(rideData['destination']);
      if (destination['latitude'] != null) {
        dropoffCoords = {
          'latitude': double.parse(destination['latitude'].toString()),
          'longitude': double.parse(destination['longitude'].toString()),
        };
      }
    }

    return {
      ...rideData,
      'orderId': rideData['orderId'] ?? rideData['rideId'] ?? rideData['_id'],
      'pickup': pickupCoords,
      'destination': dropoffCoords,
      'riderName':
          rideData['riderName'] ?? rideData['rider']?['name'] ?? 'Customer',
      'totalFare': (rideData['totalFare'] ?? rideData['estimatedFare'] ?? '0')
          .toString(),
      'distance': (rideData['distance'] ?? '0').toString(),
      'estimatedTime': (rideData['estimatedTime'] ?? '15').toString(),
    };
  }

  // ==================== IN-RIDE CHAT ACTIONS ====================
  void joinRideChat(String rideId) {
    if (_socket != null && _isConnected) {
      AppLogger.d('📤 Emitting chat:join for ride: $rideId');
      _socket!.emit(SocketEvents.chatJoin, {'rideId': rideId});
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot join chat room.');
    }
  }

  void leaveRideChat(String rideId, {String? chatId}) {
    if (_socket != null && _isConnected) {
      AppLogger.d('📤 Emitting chat:leave for ride: $rideId');
      _socket!.emit(SocketEvents.chatLeave, {
        'rideId': rideId,
        if (chatId != null) 'chatId': chatId,
      });
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot leave chat room.');
    }
  }

  void sendRideChatMessage({
    required String rideId,
    required String message,
    String? chatId,
    String messageType = 'text',
    Map<String, dynamic>? metadata,
  }) {
    if (_socket != null && _isConnected) {
      final payload = {
        'chatId': chatId ?? rideId,
        'rideId': rideId,
        'message': message,
        'messageType': messageType,
        'metadata': metadata ?? {},
      };
      _socket!.emit(SocketEvents.chatSendMessage, payload);
      AppLogger.d('📤 Emitted chat:sendMessage with payload: $payload');
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot send chat message.');
    }
  }

  void getRideChatHistory(String rideId, {String? chatId}) {
    if (_socket != null && _isConnected) {
      final payload = {'rideId': rideId, if (chatId != null) 'chatId': chatId};
      _socket!.emit(SocketEvents.chatGetHistory, payload);
      AppLogger.d('📤 Emitted chat:getHistory with payload: $payload');
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot fetch chat history.');
    }
  }

  void sendRideChatTypingStatus(
    String rideId,
    bool isTyping, {
    String? chatId,
  }) {
    if (_socket != null && _isConnected) {
      final payload = {
        'rideId': rideId,
        if (chatId != null) 'chatId': chatId,
        'isTyping': isTyping,
      };
      _socket!.emit(SocketEvents.chatTypingEmit, payload);
    }
  }

  // New API Emitters
  void joinRoom(String roomName) {
    if (_socket != null && _isConnected) {
      final payload = {'roomName': roomName};
      _socket!.emit('join:room', payload);
      AppLogger.d('📤 Emitted join:room with payload: $payload');
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot join room $roomName.');
    }
  }

  void joinChat({required String rideId, required String chatId}) {
    if (_socket != null && _isConnected) {
      final payload = {'rideId': rideId, 'orderId': rideId, 'chatId': chatId};
      _socket!.emit('join:chat', payload);
      AppLogger.d('📤 Emitted join:chat with payload: $payload');
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot join chat room $chatId.');
    }
  }

  void sendChatMessage({
    required String chatId,
    required String rideId,
    required String message,
    required String senderId,
    required String receiverId,
    String messageType = 'text',
  }) {
    if (_socket != null && _isConnected) {
      final payload = {
        'chatId': chatId,
        'rideId': rideId,
        'message': message,
        'messageType': messageType,
        'senderId': senderId,
        'receiverId': receiverId,
        'timestamp': DateTime.now().toUtc().toIso8601String(),
      };
      _socket!.emit('chat:sendMessage', payload);
      AppLogger.d('📤 Emitted chat:sendMessage with payload: $payload');
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot send chat message.');
    }
  }

  void markChatRead(String chatId) {
    if (_socket != null && _isConnected) {
      final payload = {'chatId': chatId};
      _socket!.emit('chat:markRead', payload);
      AppLogger.d('📤 Emitted chat:markRead with payload: $payload');
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot mark chat read.');
    }
  }

  void leaveChat(String rideId) {
    if (_socket != null && _isConnected) {
      final payload = {'rideId': rideId};
      _socket!.emit('leave:chat', payload);
      AppLogger.d('📤 Emitted leave:chat with payload: $payload');
    } else {
      AppLogger.w('⚠️ Socket not connected. Cannot leave chat.');
    }
  }

  void setOfflineState() {
    _isOnDuty = false;
    _isProcessingOnline = false;
    _dutyStreamController.add(false);
  }

  void dispose() {
    _cleanupSocket();
    _stopLocationUpdates();
    stopLocationWatch();
    _cancelReconnect();
  }
}
