import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:reachu_driver/features/account/repositories/profile_repository.dart';
import 'package:reachu_driver/features/booking/repositories/booking_repository.dart';
import 'package:reachu_driver/core/network/api_endpoints.dart';
import 'package:reachu_driver/shared/widgets/app_cached_image.dart';
import 'package:reachu_driver/core/socket/socket_stream_manager.dart';
import 'package:reachu_driver/core/socket/socket_events.dart';
import 'package:reachu_driver/core/network/api_service.dart';
import 'package:reachu_driver/core/network/result.dart';
import 'package:reachu_driver/core/network/network_exceptions.dart';
import 'package:reachu_driver/core/utils/app_logger.dart';
import 'package:reachu_driver/core/utils/app_snackbar.dart';
import 'package:reachu_driver/app/theme/app_colors.dart';

class ArrivingClientScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? rideData;

  const ArrivingClientScreen({super.key, this.rideData});

  @override
  ConsumerState<ArrivingClientScreen> createState() =>
      _ArrivingClientScreenState();
}

class _ArrivingClientScreenState extends ConsumerState<ArrivingClientScreen>
    with TickerProviderStateMixin {
  static BitmapDescriptor? _cachedDriverIcon;

  // Stepper state:
  // 0 = Driving to Pickup ("Swipe to Arrive")
  // 1 = Arrived at Pickup (Enter OTP to "Start Trip")
  // 2 = On Trip ("Swipe to Complete")
  int _activeStep = 0;

  GoogleMapController? _mapController;
  LatLng? _driverLocation;
  LatLng? _pickupLocation;
  LatLng? _dropoffLocation;
  List<LatLng> _originalPolylineCoordinates = [];
  List<LatLng> _polylineCoordinates = [];

  // Marker animation for smooth motion
  AnimationController? _markerAnimationController;
  LatLng? _animFromLocation;
  LatLng? _animToLocation;
  double _driverBearing = 0.0;
  double? _animFromBearing;
  double? _animToBearing;

  BitmapDescriptor? _pickupIcon;
  BitmapDescriptor? _dropoffIcon;
  BitmapDescriptor? _driverIcon;
  final List<LatLng> _stopLocations = [];
  final Map<int, BitmapDescriptor> _stopIcons = {};
  String? _mapStyleString;

  StreamSubscription<Position>? _positionStreamSubscription;
  StreamSubscription? _rideLocationSubscription;
  StreamSubscription? _cancelRideSubscription;
  StreamSubscription? _rideStatusSubscription;
  StreamSubscription? _chatSubscription;
  bool _isFetchingDirections = false;
  bool _isUpdatingStatus = false;
  bool _markersLoaded = false;
  String? _fetchedUserImage;
  String? _fetchedRiderName;

  @override
  void initState() {
    super.initState();
    _initMarkerAnimationController();
    _parseCoordinates();
    _startLocationTracking();
    _loadCustomMarkers();
    _loadMapStyle();
    _fetchRiderDetailsFromChat();

    // Initialize active step based on orderStatus from payload
    final orderStatus =
        widget.rideData?['orderStatus']?.toString() ??
        widget.rideData?['status']?.toString() ??
        'Accepted';
    if (orderStatus == 'Arriving' || orderStatus == 'Arrived') {
      _activeStep = 1;
    } else if (orderStatus == 'Progress' || orderStatus == 'Started') {
      _activeStep = 2;
    } else {
      _activeStep = 0;
    }

    // Listen for ride cancellation events from socket
    final socketClient = ref.read(socketClientProvider);
    _cancelRideSubscription = socketClient.cancelRideStream.listen((eventData) {
      final rideId =
          (eventData['rideId'] ?? eventData['orderId'] ?? eventData['_id'])
              ?.toString();
      final currentActiveId =
          (widget.rideData?['rideId'] ??
                  widget.rideData?['orderId'] ??
                  widget.rideData?['_id'])
              ?.toString();
      if (rideId != null &&
          currentActiveId != null &&
          rideId == currentActiveId) {
        if (mounted) {
          AppSnackBar.showError(
            context: context,
            message: eventData['message'] ?? 'This order was cancelled.',
          );
          context.go('/home');
        }
      }
    });

    // Listen for ride status updates from socket
    _rideStatusSubscription = socketClient.rideStatusStream.listen((eventData) {
      AppLogger.d(
        "📬 [ArrivingClientScreen] Received ride status event: $eventData",
      );
      final status = (eventData['status']?.toString() ?? '').toLowerCase();
      final orderId = (eventData['orderId'] ?? eventData['id'])?.toString();
      final currentActiveId =
          (widget.rideData?['rideId'] ??
                  widget.rideData?['orderId'] ??
                  widget.rideData?['_id'])
              ?.toString();

      if (orderId == currentActiveId) {
        if (status == 'arriving') {
          if (mounted && _activeStep == 0) {
            setState(() {
              _activeStep = 1;
              _isUpdatingStatus = false;
            });
            _updatePolylinesAndRoute();
            AppSnackBar.showSuccess(
              context: context,
              message: 'Arrived at pickup location!',
            );
            _navigateToOtpScreen();
          }
        }
      }
    });

    // If already arrived, automatically present the separate OTP Verification Screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_activeStep == 1 && mounted) {
        _navigateToOtpScreen();
      }
    });

    // Listen for in-ride chat messages in the background
    _chatSubscription = socketClient.chatStream.listen((eventData) {
      if (!mounted) return;
      final event = eventData['event']?.toString();
      final data = eventData['data'];

      if (event == SocketEvents.chatReceiveMessage ||
          event == SocketEvents.chatMessage) {
        if (data is Map) {
          final payload = Map<String, dynamic>.from(data);
          final msgRideId = payload['rideId']?.toString();
          final currentActiveId =
              (widget.rideData?['rideId'] ??
                      widget.rideData?['orderId'] ??
                      widget.rideData?['_id'])
                  ?.toString();

          if (msgRideId == currentActiveId) {
            final messageData = payload['message'] is Map
                ? Map<String, dynamic>.from(payload['message'] as Map)
                : payload;
            final userRole = messageData['userRole']?.toString().toLowerCase();
            final messageText = messageData['message']?.toString() ?? '';

            if (userRole == 'user' && mounted) {
              final sender = widget.rideData?['senderDetails'] as Map?;
              final sName =
                  widget.rideData?['riderName']?.toString() ??
                  sender?['name']?.toString() ??
                  'Booker';

              AppSnackBar.show(
                context,
                title: 'New message from $sName',
                message: messageText,
                type: SnackBarType.info,
              );
            }
          }
        }
      }
    });

    AppLogger.d(
      '🏁 ArrivingClientScreen initialized for ride: ${widget.rideData?['orderId']}',
    );
  }

  void _initMarkerAnimationController() {
    _markerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..addListener(() {
        if (_animFromLocation != null && _animToLocation != null && mounted) {
          final double value = _markerAnimationController!.value;
          final double lat =
              _animFromLocation!.latitude +
              (_animToLocation!.latitude - _animFromLocation!.latitude) * value;
          final double lng =
              _animFromLocation!.longitude +
              (_animToLocation!.longitude - _animFromLocation!.longitude) * value;

          double currentBearing = _driverBearing;
          if (_animFromBearing != null && _animToBearing != null) {
            double diff = (_animToBearing! - _animFromBearing!) % 360;
            if (diff > 180) diff -= 360;
            if (diff < -180) diff += 360;
            currentBearing = (_animFromBearing! + diff * value) % 360;
            if (currentBearing < 0) currentBearing += 360;
          }

          setState(() {
            _driverLocation = LatLng(lat, lng);
            _driverBearing = currentBearing;
          });
        }
      });
  }

  Future<void> _fetchRiderDetailsFromChat() async {
    final rideId =
        (widget.rideData?['rideId'] ??
                widget.rideData?['orderId'] ??
                widget.rideData?['_id'])
            ?.toString();
    if (rideId == null || rideId.isEmpty) return;

    try {
      final apiService = ref.read(apiServiceProvider);
      final result = await apiService.get(
        '/chat/ride/$rideId',
        converter: (data) => data as Map<String, dynamic>,
      );

      switch (result) {
        case Success(:final data):
          if (data['success'] == true && data['data'] != null) {
            final chatData = data['data'] as Map;
            final riderInfo = chatData['riderId'] as Map?;
            if (riderInfo != null) {
              final img = riderInfo['image']?.toString();
              final name = riderInfo['name']?.toString();
              if (mounted) {
                setState(() {
                  if (img != null && img.isNotEmpty) {
                    _fetchedUserImage = img;
                  }
                  if (name != null && name.isNotEmpty) {
                    _fetchedRiderName = name;
                  }
                });
              }
            }
          }
          break;
        case Failure():
          break;
      }
    } catch (e) {
      AppLogger.e('Error fetching rider details from chat: $e');
    }
  }

  void _parseCoordinates() {
    final ride = widget.rideData;
    if (ride == null) return;

    // 1. Try socket format (ride['pickup'] / ride['destination'])
    if (ride['pickup'] is Map) {
      final p = ride['pickup'] as Map;
      if (p['latitude'] != null && p['longitude'] != null) {
        _pickupLocation = LatLng(
          double.parse(p['latitude'].toString()),
          double.parse(p['longitude'].toString()),
        );
      }
    }

    // 2. Try API format (ride['startLocation'])
    if (_pickupLocation == null && ride['startLocation'] is Map) {
      final sLoc = ride['startLocation'] as Map;
      if (sLoc['coordinates'] is List) {
        final coords = sLoc['coordinates'] as List;
        if (coords.length >= 2) {
          double lat = double.parse(coords[0].toString());
          double lng = double.parse(coords[1].toString());
          // India coordinate swap logic: longitude (68-97) is always greater than latitude (8-36)
          if (lat > lng) {
            final temp = lat;
            lat = lng;
            lng = temp;
          }
          _pickupLocation = LatLng(lat, lng);
        }
      }
    }

    if (ride['destination'] is Map) {
      final d = ride['destination'] as Map;
      if (d['latitude'] != null && d['longitude'] != null) {
        _dropoffLocation = LatLng(
          double.parse(d['latitude'].toString()),
          double.parse(d['longitude'].toString()),
        );
      }
    }

    // API format (ride['endLocation'])
    if (_dropoffLocation == null && ride['endLocation'] is Map) {
      final eLoc = ride['endLocation'] as Map;
      if (eLoc['coordinates'] is List) {
        final coords = eLoc['coordinates'] as List;
        if (coords.length >= 2) {
          double lat = double.parse(coords[0].toString());
          double lng = double.parse(coords[1].toString());
          if (lat > lng) {
            final temp = lat;
            lat = lng;
            lng = temp;
          }
          _dropoffLocation = LatLng(lat, lng);
        }
      }
    }

    // Parse stops
    _stopLocations.clear();
    final stopsList = ride['stops'] as List? ?? [];
    for (final stop in stopsList) {
      if (stop is Map) {
        if (stop['latitude'] != null && stop['longitude'] != null) {
          _stopLocations.add(
            LatLng(
              double.parse(stop['latitude'].toString()),
              double.parse(stop['longitude'].toString()),
            ),
          );
        } else if (stop['coordinates'] is List) {
          final coords = stop['coordinates'] as List;
          if (coords.length >= 2) {
            double lat = double.parse(coords[0].toString());
            double lng = double.parse(coords[1].toString());
            if (lat > lng) {
              final temp = lat;
              lat = lng;
              lng = temp;
            }
            _stopLocations.add(LatLng(lat, lng));
          }
        }
      }
    }
  }

  int get _nextUnverifiedStopIndex {
    final stops = widget.rideData?['stops'] as List? ?? [];
    for (int i = 0; i < stops.length; i++) {
      final stop = stops[i] as Map;
      final isVerified = stop['otpVerified'] == true;
      if (!isVerified) {
        return i;
      }
    }
    return -1; // All stops verified
  }

  LatLng? get _currentTargetLocation {
    if (_activeStep == 2) {
      final stopIdx = _nextUnverifiedStopIndex;
      if (stopIdx != -1 && stopIdx < _stopLocations.length) {
        return _stopLocations[stopIdx];
      }
      return _dropoffLocation;
    }
    return _pickupLocation;
  }

  Map<String, String> get _activeLegContact {
    final ride = widget.rideData ?? {};
    final sender = ride['senderDetails'] as Map?;
    final receiver = ride['receiverDetails'] as Map?;
    final senderName =
        ride['riderName']?.toString() ??
        sender?['name']?.toString() ??
        'Booker';
    final senderPhone =
        ride['riderPhone']?.toString() ?? sender?['phone']?.toString() ?? 'N/A';

    if (_activeStep < 2) {
      return {
        'name': senderName,
        'phone': senderPhone,
        'label': 'Pickup (Sender)',
      };
    }

    final stopIdx = _nextUnverifiedStopIndex;
    final stops = ride['stops'] as List? ?? [];
    if (stopIdx != -1 && stopIdx < stops.length) {
      final stop = stops[stopIdx] as Map;
      return {
        'name': stop['receiverName']?.toString() ?? 'Recipient',
        'phone': stop['receiverPhone']?.toString() ?? 'N/A',
        'label': 'Stop ${stopIdx + 1} Recipient',
      };
    }

    return {
      'name': receiver?['name']?.toString() ?? 'Receiver',
      'phone': receiver?['phone']?.toString() ?? 'N/A',
      'label': 'Dropoff Recipient',
    };
  }

  Future<void> _loadCustomMarkers() async {
    try {
      final pIcon = await _createCustomPinIcon(isPickup: true);
      final stops = widget.rideData?['stops'] as List? ?? [];
      final Map<int, BitmapDescriptor> stopIcons = {};
      for (int i = 0; i < stops.length; i++) {
        stopIcons[i] = await _createCustomPinIcon(isPickup: false, index: i);
      }
      final dIcon = await _createCustomPinIcon(
        isPickup: false,
        index: stops.isNotEmpty ? stops.length : null,
      );

      if (_cachedDriverIcon != null) {
        if (mounted) {
          setState(() {
            _pickupIcon = pIcon;
            _dropoffIcon = dIcon;
            _stopIcons.clear();
            _stopIcons.addAll(stopIcons);
            _driverIcon = _cachedDriverIcon;
            _markersLoaded = true;
          });
        }
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      String? mapImage = prefs.getString("vehicle_map_image");

      if (mapImage == null || mapImage.isEmpty) {
        try {
          final secureStorage = const FlutterSecureStorage();
          final token = await secureStorage.read(key: 'auth_token');
          if (token != null && token.isNotEmpty) {
            final decodedToken = JwtDecoder.decode(token);
            final userId = decodedToken['id'] ?? decodedToken['_id'];
            if (userId != null) {
              final repo = ref.read(profileRepositoryProvider);
              await repo.getDriverById(userId.toString());
              mapImage = prefs.getString("vehicle_map_image");
              AppLogger.d('Vehicle map image: $mapImage');
            }
          }
        } catch (e) {
          AppLogger.e("Error fetching driver profile for vehicleMapImage: $e");
        }
      }

      BitmapDescriptor? drIcon;
      if (mapImage != null && mapImage.isNotEmpty) {
        drIcon = await _downloadAndCreateVehicleMarker(mapImage);
      }

      drIcon ??= await _createDriverMarkerIcon();
      _cachedDriverIcon = drIcon; // Cache it globally in memory

      if (mounted) {
        setState(() {
          _pickupIcon = pIcon;
          _dropoffIcon = dIcon;
          _stopIcons.clear();
          _stopIcons.addAll(stopIcons);
          _driverIcon = drIcon;
          _markersLoaded = true;
        });
      }
    } catch (e) {
      AppLogger.e('Error loading custom map markers: $e');
      if (mounted) {
        setState(() {
          _markersLoaded = true;
        });
      }
    }
  }

  Future<BitmapDescriptor?> _downloadAndCreateVehicleMarker(String path) async {
    try {
      final imageUrl = ApiEndpoints.getImageUrl(path);

      AppLogger.d("Downloading vehicle map marker from URL: $imageUrl");
      final response = await Dio()
          .get<List<int>>(
            imageUrl,
            options: Options(
              responseType: ResponseType.bytes,
              sendTimeout: const Duration(seconds: 4),
              receiveTimeout: const Duration(seconds: 4),
            ),
          )
          .timeout(const Duration(seconds: 4));

      if (response.statusCode == 200 && response.data != null) {
        final Uint8List bytes = Uint8List.fromList(response.data!);
        final ui.Codec codec = await ui.instantiateImageCodec(
          bytes,
          targetWidth: 160,
          targetHeight: 160,
        );
        final ui.FrameInfo fi = await codec.getNextFrame();
        final ByteData? byteData = await fi.image.toByteData(
          format: ui.ImageByteFormat.png,
        );
        if (byteData != null) {
          return BitmapDescriptor.bytes(
            byteData.buffer.asUint8List(),
            imagePixelRatio: 4.0,
          );
        }
      }
    } catch (e) {
      AppLogger.e("Failed to download vehicleMapImage: $e");
    }
    return null;
  }

  Future<BitmapDescriptor> _createCustomPinIcon({
    required bool isPickup,
    int? index,
  }) async {
    const int size = 160; // 40 * 4.0
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final pinColor = isPickup ? const Color(0xFF10B981) : AppColors.mapDropPin;

    // Draw the Location Pin (Icons.location_on)
    final pinPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    pinPainter.text = TextSpan(
      text: String.fromCharCode(Icons.location_on.codePoint),
      style: TextStyle(
        fontSize: 144.0, // 36 * 4.0
        fontFamily: Icons.location_on.fontFamily,
        package: Icons.location_on.fontPackage,
        color: pinColor,
      ),
    );
    pinPainter.layout();

    final double pinX = (size - pinPainter.width) / 2;
    final double pinY = size - pinPainter.height - 8.0; // 2 * 4.0

    pinPainter.paint(canvas, Offset(pinX, pinY));

    // Draw the CircleAvatar index if it is a drop with an index
    if (!isPickup && index != null) {
      const double circleRadius = 40.0; // 10 * 4.0
      const Offset circleCenter = Offset(
        size / 2,
        24.0 + circleRadius,
      ); // 6 * 4.0

      // Draw background circle
      final Paint circlePaint = Paint()
        ..color = AppColors.mapDropPin
        ..style = PaintingStyle.fill;
      canvas.drawCircle(circleCenter, circleRadius, circlePaint);

      // Draw Text inside the circle
      final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.text = TextSpan(
        text: '${index + 1}',
        style: const TextStyle(
          fontSize: 48.0, // 12 * 4.0
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          circleCenter.dx - textPainter.width / 2,
          circleCenter.dy - textPainter.height / 2,
        ),
      );
    }

    final ui.Image image = await pictureRecorder.endRecording().toImage(
      size,
      size,
    );
    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return BitmapDescriptor.bytes(
      byteData!.buffer.asUint8List(),
      imagePixelRatio: 4.0,
    );
  }

  Future<BitmapDescriptor> _createDriverMarkerIcon() async {
    try {
      final ByteData byteData = await rootBundle.load(
        'assets/images/driver_marker.png',
      );
      final Uint8List rawBytes = byteData.buffer.asUint8List();
      final ui.Codec codec = await ui.instantiateImageCodec(
        rawBytes,
        targetWidth: 160,
        targetHeight: 160,
      );
      final ui.FrameInfo fi = await codec.getNextFrame();
      final ByteData? pngData = await fi.image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      if (pngData != null) {
        return BitmapDescriptor.bytes(
          pngData.buffer.asUint8List(),
          imagePixelRatio: 4.0,
        );
      }
    } catch (e) {
      AppLogger.e("Error loading asset fallback driver_marker.png: $e");
    }

    // Secondary Canvas circular fallback if asset fails to load
    const int size = 160;
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // Inner circle
    final Paint fillPaint = Paint()
      ..color = AppColors.mapDriverMarker
      ..style = PaintingStyle.fill;

    // Outer border (white ring for premium lookup)
    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0; // 3 * 4.0

    // Shadow
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.25)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16.0); // 4 * 4.0

    const Offset center = Offset(size / 2, size / 2);
    const double radius = 64.0; // 16 * 4.0

    canvas.drawCircle(center, radius + 8.0, shadowPaint);
    canvas.drawCircle(center, radius, fillPaint);
    canvas.drawCircle(center, radius, borderPaint);

    // Mini inner dot (like GPS navigation dot)
    final Paint innerDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 20.0, innerDotPaint); // 5 * 4.0

    final ui.Image image = await pictureRecorder.endRecording().toImage(
      size,
      size,
    );
    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    return BitmapDescriptor.bytes(
      byteData!.buffer.asUint8List(),
      imagePixelRatio: 4.0,
    );
  }

  void _startLocationTracking() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _driverLocation = LatLng(position.latitude, position.longitude);
      });
      _updatePolylinesAndRoute();

      // 1. Listen to local device GPS stream
      _positionStreamSubscription =
          Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
              distanceFilter: 3,
            ),
          ).listen((Position pos) {
            if (mounted) {
              final newLoc = LatLng(pos.latitude, pos.longitude);
              final double? b = pos.heading != 0 ? pos.heading : null;
              _animateDriverMarker(newLoc, bearing: b);
              _handleDriverLocationUpdate(newLoc);
            }
          });

      // 2. Listen to socket "ride:location" updates
      final socketClient = ref.read(socketClientProvider);
      _rideLocationSubscription = socketClient.rideLocationStream.listen((data) {
        if (!mounted) return;
        try {
          final loc = data['location'] as Map?;
          if (loc != null) {
            final lat = double.tryParse((loc['latitude'] ?? loc['lat']).toString());
            final lng = double.tryParse((loc['longitude'] ?? loc['lng']).toString());
            final double? bearing = data['bearing'] != null
                ? double.tryParse(data['bearing'].toString())
                : null;

            if (lat != null && lng != null) {
              final newLoc = LatLng(lat, lng);
              _animateDriverMarker(newLoc, bearing: bearing);
              _handleDriverLocationUpdate(newLoc);
            }
          }
        } catch (e) {
          AppLogger.e('Error processing ride:location socket update: $e');
        }
      });
    } catch (e) {
      AppLogger.e('Error getting location stream on accepted ride: $e');
    }
  }

  void _animateDriverMarker(LatLng newLoc, {double? bearing}) {
    if (_driverLocation == null) {
      setState(() {
        _driverLocation = newLoc;
        if (bearing != null) _driverBearing = bearing;
      });
      return;
    }

    final distance = Geolocator.distanceBetween(
      _driverLocation!.latitude,
      _driverLocation!.longitude,
      newLoc.latitude,
      newLoc.longitude,
    );

    double targetBearing = bearing ?? _driverBearing;
    if (bearing == null && distance > 0.5) {
      targetBearing = Geolocator.bearingBetween(
        _driverLocation!.latitude,
        _driverLocation!.longitude,
        newLoc.latitude,
        newLoc.longitude,
      );
    }

    if (distance < 0.2) return;

    _animFromLocation = _driverLocation;
    _animToLocation = newLoc;
    _animFromBearing = _driverBearing;
    _animToBearing = targetBearing;

    _markerAnimationController?.stop();
    _markerAnimationController?.reset();
    _markerAnimationController?.forward();
  }

  void _handleDriverLocationUpdate(LatLng newLoc) {
    if (_originalPolylineCoordinates.isEmpty) {
      _updatePolylinesAndRoute();
      return;
    }

    int closestIndex = 0;
    double minDistance = double.maxFinite;

    for (int i = 0; i < _originalPolylineCoordinates.length; i++) {
      final dist = Geolocator.distanceBetween(
        newLoc.latitude,
        newLoc.longitude,
        _originalPolylineCoordinates[i].latitude,
        _originalPolylineCoordinates[i].longitude,
      );
      if (dist < minDistance) {
        minDistance = dist;
        closestIndex = i;
      }
    }

    // Off-route rerouting check: threshold 150m
    const double kRerouteThresholdMeters = 150.0;
    if (minDistance > kRerouteThresholdMeters) {
      AppLogger.w(
        '🚙 Driver is off-route by ${minDistance.toStringAsFixed(1)}m. Re-calculating path from server...',
      );
      _updatePolylinesAndRoute();
      return;
    }

    // Trim polyline behind the driver locally to save API calls
    if (mounted) {
      setState(() {
        _polylineCoordinates = [
          newLoc,
          ..._originalPolylineCoordinates.sublist(closestIndex),
        ];
      });
    }
  }

  void _updatePolylinesAndRoute() {
    if (_driverLocation == null) return;

    final LatLng? target = _currentTargetLocation;
    if (target != null) {
      _fetchDirections(_driverLocation!, target);
    }
  }

  Future<void> _fetchDirections(LatLng origin, LatLng destination) async {
    if (_isFetchingDirections) return;
    _isFetchingDirections = true;

    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
    if (apiKey.isEmpty) {
      if (mounted) {
        setState(() {
          _originalPolylineCoordinates = [origin, destination];
          _polylineCoordinates = [origin, destination];
          _isFetchingDirections = false;
        });
      }
      return;
    }

    try {
      final url =
          'https://maps.googleapis.com/maps/api/directions/json'
          '?origin=${origin.latitude},${origin.longitude}'
          '&destination=${destination.latitude},${destination.longitude}'
          '&key=$apiKey';

      final response = await Dio().get(url);
      if (response.statusCode == 200 && response.data['status'] == 'OK') {
        final routes = response.data['routes'] as List;
        if (routes.isNotEmpty) {
          final points = _decodePolyline(
            routes[0]['overview_polyline']['points'],
          );
          if (mounted) {
            setState(() {
              _originalPolylineCoordinates = List<LatLng>.from(points);
              _polylineCoordinates = points;
            });
          }
        }
      }
    } catch (e) {
      AppLogger.e('Error fetching directions polyline: $e');
      if (mounted) {
        setState(() {
          _originalPolylineCoordinates = [origin, destination];
          _polylineCoordinates = [origin, destination];
        });
      }
    } finally {
      _isFetchingDirections = false;
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1e5, lng / 1e5));
    }
    return points;
  }

  Future<bool> _updateStatusOnServer(String status) async {
    final orderId =
        widget.rideData?['orderId'] ??
        widget.rideData?['rideId'] ??
        widget.rideData?['_id'] ??
        widget.rideData?['id'] ??
        '';
    if (orderId.isEmpty) return false;

    setState(() {
      _isUpdatingStatus = true;
    });

    final result = await ref
        .read(bookingRepositoryProvider)
        .updateOrderStatus(orderId: orderId, status: status);

    setState(() {
      _isUpdatingStatus = false;
    });

    switch (result) {
      case Success():
        AppLogger.i('Order status updated on server successfully to: $status');
        return true;
      case Failure(:final error):
        AppLogger.e(
          'Failed to update order status to $status: ${NetworkExceptions.getErrorMessage(error)}',
        );
        return false;
    }
  }

  Future<void> _navigateToOtpScreen() async {
    final verified = await context.push<bool>(
      '/ride_otp',
      extra: widget.rideData,
    );
    if (verified == true) {
      setState(() {
        _activeStep = 2; // Transition directly to On Trip!
      });
      _updatePolylinesAndRoute();
    }
  }

  Future<void> _navigateToStopOtpScreen() async {
    final stopIdx = _nextUnverifiedStopIndex;
    if (stopIdx == -1) return;

    final stops = widget.rideData?['stops'] as List? ?? [];
    final currentStop = stops[stopIdx] as Map;

    final stopData = {
      ...?widget.rideData,
      'otpType': 'stop',
      'stopIndex': stopIdx,
      'riderName': currentStop['receiverName'] ?? 'Recipient',
      'riderPhone': currentStop['receiverPhone'] ?? 'N/A',
      'userImage': null,
    };

    final verified = await context.push<bool>('/ride_otp', extra: stopData);
    if (verified == true) {
      if (mounted) {
        setState(() {
          currentStop['otpVerified'] = true;
        });
        _updatePolylinesAndRoute();
      }
    }
  }

  Future<void> _launchGoogleMapsNavigation() async {
    final LatLng? dest = _currentTargetLocation;
    if (dest == null) return;

    final lat = dest.latitude;
    final lng = dest.longitude;
    final uri = Uri.parse('google.navigation:q=$lat,$lng&mode=d');
    final fallbackUri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng&travelmode=driving',
    );

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      AppLogger.e('Error launching Google Maps: $e');
      if (mounted) {
        AppSnackBar.showError(
          context: context,
          message: 'Could not open Google Maps',
        );
      }
    }
  }

  void _onSwipeComplete() async {
    if (_activeStep == 0) {
      setState(() {
        _isUpdatingStatus = true;
      });
      final success = await _updateStatusOnServer('Arriving');
      if (!success) {
        setState(() {
          _isUpdatingStatus = false;
        });
        if (mounted) {
          AppSnackBar.showError(
            context: context,
            message: 'Failed to update status. Please try again.',
          );
        }
      }
      // If success, we wait for the socket status event (rideStatusStream) to transition!
    } else if (_activeStep == 2) {
      final stopIdx = _nextUnverifiedStopIndex;
      if (stopIdx != -1) {
        _navigateToStopOtpScreen();
      } else {
        // Must verify delivery OTP before completing
        final result = await context.push<dynamic>(
          '/ride_otp',
          extra: {...?widget.rideData, 'otpType': 'delivery'},
        );
        if (result == true || result is Map) {
          final Map<String, dynamic> updatedRide =
              (result is Map<String, dynamic>)
              ? result
              : (result is Map
                    ? Map<String, dynamic>.from(result)
                    : (widget.rideData ?? {}));
          if (mounted) {
            AppSnackBar.showSuccess(
              context: context,
              message: 'Trip completed successfully!',
            );
            context.go('/ride_payment', extra: updatedRide);
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _markerAnimationController?.dispose();
    _positionStreamSubscription?.cancel();
    _rideLocationSubscription?.cancel();
    _cancelRideSubscription?.cancel();
    _rideStatusSubscription?.cancel();
    _chatSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          AppSnackBar.show(
            context,
            message: 'Please complete the ride verification first',
            type: SnackBarType.warning,
          );
        }
      },
      child: Scaffold(
        backgroundColor: isDark ? AppColors.neutral950 : AppColors.neutral50,
        body: Stack(
          children: [
            // Map Section (55% height)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.55,
              child: _buildMapSection(isDark),
            ),

            // Bottom Info/Actions Section (47% height)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.47,
              child: _buildDetailsPanel(isDark),
            ),
          ],
        ),
      ),
    );
  }

  void _loadMapStyle() async {
    try {
      final style = await rootBundle.loadString('assets/json/map_style.json');
      if (mounted) {
        setState(() {
          _mapStyleString = style;
        });
      }
    } catch (e) {
      AppLogger.e('Error loading map style: $e');
    }
  }

  Widget _buildMapSection(bool isDark) {
    final initialLoc = _pickupLocation ?? const LatLng(23.2599, 77.4126);

    Set<Marker> markers = {};
    if (_markersLoaded) {
      if (_driverLocation != null) {
        markers.add(
          Marker(
            markerId: const MarkerId('driver'),
            position: _driverLocation!,
            rotation: _driverBearing,
            infoWindow: const InfoWindow(title: 'You (Driver)'),
            icon:
                _driverIcon ??
                BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure,
                ),
            anchor: const Offset(0.5, 0.5), // Center the custom circular marker
          ),
        );
      }
      if (_pickupLocation != null && _activeStep < 2) {
        markers.add(
          Marker(
            markerId: const MarkerId('pickup'),
            position: _pickupLocation!,
            infoWindow: const InfoWindow(title: 'Pickup Location'),
            icon:
                _pickupIcon ??
                BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange,
                ),
            anchor: const Offset(0.5, 1.0),
          ),
        );
      }

      // Add stops markers
      for (int i = 0; i < _stopLocations.length; i++) {
        final stopList = widget.rideData?['stops'] as List? ?? [];
        if (i < stopList.length) {
          final stop = stopList[i] as Map;
          final isVerified = stop['otpVerified'] == true;
          markers.add(
            Marker(
              markerId: MarkerId('stop_$i'),
              position: _stopLocations[i],
              infoWindow: InfoWindow(
                title: 'Stop ${i + 1} (${isVerified ? "Verified" : "Pending"})',
                snippet: stop['address']?.toString() ?? '',
              ),
              icon:
                  _stopIcons[i] ??
                  BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueYellow,
                  ),
              alpha: isVerified ? 0.6 : 1.0,
              anchor: const Offset(0.5, 1.0),
            ),
          );
        }
      }

      if (_dropoffLocation != null) {
        markers.add(
          Marker(
            markerId: const MarkerId('dropoff'),
            position: _dropoffLocation!,
            infoWindow: const InfoWindow(title: 'Dropoff Location'),
            icon:
                _dropoffIcon ??
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            anchor: const Offset(0.5, 1.0),
          ),
        );
      }
    }

    return Stack(
      children: [
        GoogleMap(
          style: _mapStyleString,
          initialCameraPosition: CameraPosition(
            target: _driverLocation ?? initialLoc,
            zoom: 14.5,
          ),
          onMapCreated: (controller) {
            _mapController = controller;
            if (_driverLocation != null) {
              _mapController?.animateCamera(
                CameraUpdate.newLatLngZoom(_driverLocation!, 15),
              );
            }
          },
          markers: markers,
          polylines: {
            if (_polylineCoordinates.isNotEmpty)
              Polyline(
                polylineId: const PolylineId('route'),
                points: _polylineCoordinates,
                color: AppColors.mapPolyline,
                width: 4,
              ),
          },
          trafficEnabled: true,
          myLocationEnabled: false,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),

        // Compact Directions Navigation Button (Google Maps Style)
        if (_activeStep != 1)
          Positioned(
            bottom: 32.h,
            right: 16.w,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2563EB), // Google Maps Blue
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.22),
                    blurRadius: 8.r,
                    spreadRadius: 1.r,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _launchGoogleMapsNavigation,
                  borderRadius: BorderRadius.circular(24.r),
                  child: Container(
                    width: 48.r,
                    height: 48.r,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.directions_rounded,
                      color: Colors.white,
                      size: 24.r,
                    ),
                  ),
                ),
              ),
            ),
          ).animate().scale(delay: 200.ms, duration: 300.ms),

        // Premium overlay during setup or route updates
        if (!_markersLoaded || _isFetchingDirections)
          Container(
            color: isDark
                ? AppColors.darkSurface01.withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.7),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 32.r,
                    height: 32.r,
                    child: CircularProgressIndicator(
                      color: AppColors.primary500,
                      strokeWidth: 3.w,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'Setting up navigation...',
                    style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black87,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(duration: 200.ms),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required Widget child,
    IconData? icon,
    Color? iconColor,
    bool isDark = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface02 : AppColors.lightSurface02,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDark ? AppColors.neutral800 : AppColors.neutral200,
          width: 0.8.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 16.r,
                  color: iconColor ?? AppColors.primary500,
                ),
                SizedBox(width: 8.w),
              ],
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                  color: AppColors.neutral500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          child,
        ],
      ),
    );
  }

  Widget _buildDetailsPanel(bool isDark) {
    final ride = widget.rideData ?? {};

    // Parse nested structure or flat fallback safely
    final sender = ride['senderDetails'] as Map?;
    final receiver = ride['receiverDetails'] as Map?;
    final goods = ride['goodsDetails'] as Map?;
    final stops = ride['stops'] as List? ?? [];

    final name =
        _fetchedRiderName ??
        ride['riderName'] ??
        sender?['name'] ??
        receiver?['name'] ??
        'Customer';
    final phone =
        ride['riderPhone'] ?? sender?['phone'] ?? receiver?['phone'] ?? 'N/A';

    final String? userImage =
        _fetchedUserImage ??
        ride['userImage']?.toString() ??
        ride['riderImage']?.toString() ??
        ride['profileImage']?.toString() ??
        (ride['riderId'] is Map
            ? ((ride['riderId'] as Map)['image'] ??
                      (ride['riderId'] as Map)['userImage'] ??
                      (ride['riderId'] as Map)['profileImage'])
                  ?.toString()
            : null) ??
        (ride['rider'] is Map
            ? ((ride['rider'] as Map)['image'] ??
                      (ride['rider'] as Map)['userImage'] ??
                      (ride['rider'] as Map)['profileImage'])
                  ?.toString()
            : null) ??
        (ride['userId'] is Map
            ? ((ride['userId'] as Map)['image'] ??
                      (ride['userId'] as Map)['userImage'] ??
                      (ride['userId'] as Map)['profileImage'])
                  ?.toString()
            : null) ??
        (ride['user'] is Map
            ? ((ride['user'] as Map)['image'] ??
                      (ride['user'] as Map)['userImage'] ??
                      (ride['user'] as Map)['profileImage'])
                  ?.toString()
            : null);

    AppLogger.d(
      "👤 [ArrivingClientScreen] Extracted userImage: $userImage (Keys: ${ride.keys.toList()})",
    );

    final startAddress = (ride['startLocation'] as Map?)?['address']
        ?.toString();
    final endAddress = (ride['endLocation'] as Map?)?['address']?.toString();
    final pickup =
        ride['pickupAddress'] ??
        ride['pickup_address'] ??
        startAddress ??
        'Pickup Address';
    final dest =
        ride['destinationAddress'] ??
        ride['drop_address'] ??
        endAddress ??
        'Destination Address';

    final rawFare =
        (ride['fareBreakdown'] is Map
            ? (ride['fareBreakdown'] as Map)['netPayable']
            : null) ??
        ride['totalFare'] ??
        0;
    final String fare = rawFare.toString();
    final paymentMethod = ride['paymentMethod'] ?? 'Cash';

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.neutral900 : Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            spreadRadius: 2,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag indicator bar
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 48.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: isDark ? AppColors.neutral700 : AppColors.neutral200,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Client card / Fixed Header
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(22.r),
                child:
                    (userImage != null &&
                        userImage.isNotEmpty &&
                        userImage != 'null')
                    ? AppCachedImage(
                        imageUrl: userImage,
                        width: 44.r,
                        height: 44.r,
                        fit: BoxFit.cover,
                        errorWidget: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: AppColors.primary50,
                          child: Icon(
                            Icons.person,
                            color: AppColors.primary600,
                            size: 24.r,
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 22.r,
                        backgroundColor: AppColors.primary50,
                        child: Icon(
                          Icons.person,
                          color: AppColors.primary600,
                          size: 24.r,
                        ),
                      ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booker: $name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppColors.neutral900,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '${_activeLegContact['label']}: ${_activeLegContact['name']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              // Call Button (High Visibility)
              if (phone != 'N/A') ...[
                GestureDetector(
                  onTap: () => _showCallSelectionBottomSheet(context, isDark),
                  child: Container(
                    width: 38.r,
                    height: 38.r,
                    decoration: BoxDecoration(
                      color: Color(0xFF10B981).withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF10B981).withValues(alpha: 0.35),
                        width: 1.2,
                      ),
                    ),
                    child: Icon(
                      Icons.phone_in_talk_rounded,
                      size: 18.r,
                      color: const Color(0xFF10B981),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
              ],
              // Chat Button (High Visibility)
              GestureDetector(
                onTap: () => _showChatSelectionBottomSheet(context, isDark),
                child: Container(
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.primary500.withValues(alpha: 0.12)
                        : AppColors.primary50,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark
                          ? AppColors.primary400.withValues(alpha: 0.3)
                          : AppColors.primary200,
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary500.withValues(
                          alpha: isDark ? 0.08 : 0.05,
                        ),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.chat_rounded,
                    size: 18.r,
                    color: AppColors.primary500,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              // Vertical Divider
              Container(
                width: 1.2.w,
                height: 24.h,
                color: isDark ? AppColors.neutral800 : AppColors.neutral200,
              ),

              // SizedBox(width: 12.w),
              // // Fare Display
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Text(
              //       '₹$fare',
              //       style: TextStyle(
              //         fontSize: 17.sp,
              //         fontWeight: FontWeight.w900,
              //         color: AppColors.primary500,
              //       ),
              //     ),
              //     Text(
              //       'Net Pay',
              //       style: TextStyle(
              //         fontSize: 10.sp,
              //         fontWeight: FontWeight.bold,
              //         color: AppColors.neutral500,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          Divider(
            height: 20.h,
            color: isDark ? AppColors.neutral800 : AppColors.neutral200,
          ),

          // Scrollable details section
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Active Status Pill Badge
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: _activeStep == 0
                              ? AppColors.primary500.withValues(alpha: 0.15)
                              : _activeStep == 1
                              ? AppColors.warningLight.withValues(alpha: 0.15)
                              : AppColors.successLight.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          _activeStep == 0
                              ? 'EN ROUTE TO PICKUP'
                              : _activeStep == 1
                              ? 'ARRIVED AT PICKUP'
                              : 'TRIP IN PROGRESS',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w900,
                            color: _activeStep == 0
                                ? AppColors.primary500
                                : _activeStep == 1
                                ? AppColors.warningDark
                                : AppColors.successDark,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 300.ms),
                  SizedBox(height: 12.h),

                  // Route Timeline
                  _buildSectionCard(
                    title: 'Timeline & Route',
                    isDark: isDark,
                    icon: Icons.alt_route_rounded,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAddressRow(
                          isPickup: true,
                          address: pickup,
                          isDark: isDark,
                        ),
                        if (stops.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.w,
                              top: 4.h,
                              bottom: 4.h,
                            ),
                            child: Container(
                              width: 2.w,
                              height: 12.h,
                              color: isDark
                                  ? AppColors.neutral700
                                  : AppColors.neutral300,
                            ),
                          ),
                          ...stops.asMap().entries.map((entry) {
                            final idx = entry.key;
                            final stop = entry.value as Map;
                            final stopAddress =
                                stop['address']?.toString() ??
                                'Intermediate Drop Point';
                            final isVerified = stop['otpVerified'] == true;
                            final isActive =
                                _activeStep == 2 &&
                                idx == _nextUnverifiedStopIndex;
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20.r,
                                    height: 20.r,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: isVerified
                                          ? const Color(
                                              0xFF10B981,
                                            ).withValues(alpha: 0.15)
                                          : isActive
                                          ? AppColors.primary500.withValues(
                                              alpha: 0.15,
                                            )
                                          : AppColors.neutral500.withValues(
                                              alpha: 0.15,
                                            ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: isVerified
                                        ? Icon(
                                            Icons.check_circle_rounded,
                                            size: 14.r,
                                            color: const Color(0xFF10B981),
                                          )
                                        : Text(
                                            '${idx + 1}',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              color: isActive
                                                  ? AppColors.primary500
                                                  : AppColors.neutral500,
                                            ),
                                          ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      stopAddress,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: isActive
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: isVerified
                                            ? AppColors.neutral400
                                            : isActive
                                            ? (isDark
                                                  ? Colors.white
                                                  : AppColors.neutral900)
                                            : AppColors.neutral500,
                                      ),
                                    ),
                                  ),
                                  if (isVerified) ...[
                                    SizedBox(width: 4.w),
                                    Text(
                                      'VERIFIED',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF10B981),
                                      ),
                                    ),
                                  ] else if (isActive) ...[
                                    SizedBox(width: 4.w),
                                    Text(
                                      'NEXT STOP',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary500,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          }),
                        ],
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.w,
                            top: 4.h,
                            bottom: 4.h,
                          ),
                          child: Container(
                            width: 2.w,
                            height: 12.h,
                            color: isDark
                                ? AppColors.neutral700
                                : AppColors.neutral300,
                          ),
                        ),
                        _buildAddressRow(
                          isPickup: false,
                          address: dest,
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),

                  // Goods Details Card
                  if (goods != null || ride['estimatedWeight'] != null) ...[
                    _buildSectionCard(
                      title: 'Goods specifications',
                      isDark: isDark,
                      icon: Icons.inventory_2_outlined,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  goods?['description'] ??
                                      ride['goodsType'] ??
                                      'Fragile & Electronic Goods',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? Colors.white
                                        : AppColors.neutral900,
                                  ),
                                ),
                              ),
                              if (goods?['isFragile'] == true ||
                                  ride['isFragile'] == true)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                    vertical: 2.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.errorLight.withValues(
                                      alpha: 0.15,
                                    ),
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(
                                      color: AppColors.errorLight.withValues(
                                        alpha: 0.3,
                                      ),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.warning_amber_rounded,
                                        color: AppColors.errorLight,
                                        size: 10.r,
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        'FRAGILE',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w900,
                                          color: AppColors.errorLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(
                                Icons.scale_outlined,
                                size: 14.r,
                                color: AppColors.neutral500,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Est. Weight: ${(double.tryParse(goods?['estimatedWeight']?.toString() ?? ride['estimatedWeight']?.toString() ?? '0') ?? 0).toInt()} kg',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.neutral500,
                                ),
                              ),
                              if (goods?['quantity'] != null) ...[
                                SizedBox(width: 16.w),
                                Icon(
                                  Icons.tag,
                                  size: 14.r,
                                  color: AppColors.neutral500,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Quantity: ${goods?['quantity'].toString()}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.neutral500,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Billing Details Card
                  _buildSectionCard(
                    title: 'Payment details',
                    isDark: isDark,
                    icon: Icons.payments_outlined,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              paymentMethod.toLowerCase() == 'cash'
                                  ? Icons.money_rounded
                                  : Icons.credit_card_rounded,
                              size: 18.r,
                              color: paymentMethod.toLowerCase() == 'cash'
                                  ? AppColors.successLight
                                  : AppColors.primary500,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              paymentMethod,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? Colors.white
                                    : AppColors.neutral900,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '₹$fare',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // Actions / Fixed Bottom
          SafeArea(
            top: false,
            child: _activeStep == 1
                ? ElevatedButton.icon(
                    onPressed: _navigateToOtpScreen,
                    icon: Icon(Icons.verified_user_rounded, size: 20.r),
                    label: Text(
                      'Enter Ride OTP',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary600,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                  )
                : SwipeButton(
                    text: _activeStep == 2
                        ? (_nextUnverifiedStopIndex != -1
                              ? 'Swipe to Arrive at Stop ${_nextUnverifiedStopIndex + 1}'
                              : 'Swipe to Complete Trip')
                        : 'Swipe to Confirm Arrival',
                    isDark: isDark,
                    isLoading: _isUpdatingStatus,
                    onSwiped: _onSwipeComplete,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressRow({
    required bool isPickup,
    required String address,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isPickup ? Icons.circle : Icons.location_on_rounded,
          color: isPickup ? const Color(0xFF10B981) : AppColors.errorLight,
          size: 16.r,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            address,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              color: isDark ? AppColors.neutral400 : AppColors.neutral600,
            ),
          ),
        ),
      ],
    );
  }

  void _showCallSelectionBottomSheet(BuildContext context, bool isDark) {
    final activeContact = _activeLegContact;
    final ride = widget.rideData ?? {};
    final sender = ride['senderDetails'] as Map?;
    final senderName =
        ride['riderName']?.toString() ??
        sender?['name']?.toString() ??
        'Booker';
    final senderPhone =
        ride['riderPhone']?.toString() ?? sender?['phone']?.toString() ?? 'N/A';

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.neutral900 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.neutral700 : AppColors.neutral200,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose Contact to Call',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.neutral900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary500.withValues(alpha: 0.1),
                  child: Icon(Icons.person, color: AppColors.primary500),
                ),
                title: Text(
                  'Call Booker (Sender)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
                subtitle: Text(
                  '$senderName • $senderPhone',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.neutral500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _makePhoneCall(senderPhone);
                },
              ),
              if (activeContact['phone'] != senderPhone &&
                  activeContact['phone'] != 'N/A')
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(
                      0xFF10B981,
                    ).withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.local_shipping_rounded,
                      color: Color(0xFF10B981),
                    ),
                  ),
                  title: Text(
                    'Call ${activeContact['label']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                  subtitle: Text(
                    '${activeContact['name']} • ${activeContact['phone']}',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.neutral500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _makePhoneCall(activeContact['phone']!);
                  },
                ),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }

  void _showChatSelectionBottomSheet(BuildContext context, bool isDark) {
    final activeContact = _activeLegContact;
    final ride = widget.rideData ?? {};
    final sender = ride['senderDetails'] as Map?;
    final senderName =
        ride['riderName']?.toString() ??
        sender?['name']?.toString() ??
        'Booker';
    final receiverPhone = activeContact['phone'] ?? 'N/A';

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.neutral900 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.neutral700 : AppColors.neutral200,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose Contact Method',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.neutral900,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary500.withValues(alpha: 0.1),
                  child: Icon(
                    Icons.chat_bubble_rounded,
                    color: AppColors.primary500,
                  ),
                ),
                title: Text(
                  'Chat with Booker (In-App)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
                subtitle: Text(
                  'Send in-app messages to $senderName',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.neutral500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  context.push('/ride_chat', extra: widget.rideData);
                },
              ),
              if (receiverPhone != 'N/A')
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(
                      0xFF10B981,
                    ).withValues(alpha: 0.1),
                    child: const Icon(
                      Icons.sms_rounded,
                      color: Color(0xFF10B981),
                    ),
                  ),
                  title: Text(
                    'Send SMS to ${activeContact['label']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                  subtitle: Text(
                    'Open standard SMS app to text ${activeContact['name']}',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.neutral500,
                    ),
                  ),
                  onTap: () async {
                    Navigator.pop(context);
                    final orderId =
                        widget.rideData?['orderId'] ??
                        widget.rideData?['_id'] ??
                        '';
                    final text = Uri.encodeComponent(
                      'Hi ${activeContact['name']}, this is your Reachu driver. I am en route with your parcel (Order #$orderId).',
                    );
                    final smsUri = Uri.parse('sms:$receiverPhone?body=$text');
                    try {
                      if (await canLaunchUrl(smsUri)) {
                        await launchUrl(smsUri);
                      } else {
                        throw 'Could not launch SMS application';
                      }
                    } catch (e) {
                      AppLogger.e('Error launching SMS app: $e');
                      if (context.mounted) {
                        AppSnackBar.showError(
                          context: context,
                          message: 'Could not open messaging application',
                        );
                      }
                    }
                  },
                ),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      }
    } catch (e) {
      AppLogger.e('Could not launch phone call to $phoneNumber: $e');
    }
  }
}

/// Custom premium swipe gesture slider button
class SwipeButton extends StatefulWidget {
  final String text;
  final bool isDark;
  final bool isLoading;
  final VoidCallback onSwiped;

  const SwipeButton({
    super.key,
    required this.text,
    required this.isDark,
    required this.isLoading,
    required this.onSwiped,
  });

  @override
  State<SwipeButton> createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  double _dragValue = 0.0;
  bool _isSwiped = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant SwipeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      setState(() {
        _dragValue = 0.0;
        _isSwiped = false;
      });
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final thumbWidth = 90.w;
        final thumbHeight = 46.h;
        final maxDragDistance = totalWidth - thumbWidth - 8.w;

        return AnimatedBuilder(
          animation: _pulseController,
          builder: (context, child) {
            final pulseVal = _pulseController.value;
            return Container(
              width: totalWidth,
              height: 56.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(
                  color: widget.isDark
                      ? Colors.white.withValues(alpha: 0.15)
                      : Colors.black.withValues(alpha: 0.08),
                  width: 1.5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.r),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // Dynamic Light Trace Progress Fill
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      width: _dragValue + thumbWidth / 2,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primary500.withValues(alpha: 0.05),
                              AppColors.primary500.withValues(alpha: 0.25),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),

                    // Centered Text Label in the remaining swiping space with Shimmer & Opacity Fade
                    Positioned.fill(
                      left: thumbWidth,
                      right: 0,
                      child: Center(
                        child: widget.isLoading
                            ? SizedBox(
                                width: 24.r,
                                height: 24.r,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: AppColors.primary500,
                                ),
                              )
                            : Opacity(
                                opacity: (1.0 - (_dragValue / maxDragDistance))
                                    .clamp(0.0, 1.0),
                                child: ShaderMask(
                                  shaderCallback: (bounds) {
                                    return LinearGradient(
                                      colors: widget.isDark
                                          ? [
                                              Colors.white.withValues(
                                                alpha: 0.45,
                                              ),
                                              Colors.white,
                                              Colors.white.withValues(
                                                alpha: 0.45,
                                              ),
                                            ]
                                          : [
                                              AppColors.neutral800.withValues(
                                                alpha: 0.45,
                                              ),
                                              AppColors.neutral900,
                                              AppColors.neutral800.withValues(
                                                alpha: 0.45,
                                              ),
                                            ],
                                      stops: const [0.0, 0.5, 1.0],
                                      transform: SlideGradientTransform(
                                        value: pulseVal,
                                      ),
                                    ).createShader(bounds);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.text,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ),

                    // Slidable Capsule Thumb
                    Positioned(
                      left: _dragValue + 4.w,
                      child: GestureDetector(
                        onPanUpdate: widget.isLoading
                            ? null
                            : (details) {
                                setState(() {
                                  _dragValue += details.delta.dx;
                                  if (_dragValue < 0.0) _dragValue = 0.0;
                                  if (_dragValue > maxDragDistance) {
                                    _dragValue = maxDragDistance;
                                  }
                                });
                              },
                        onPanEnd: widget.isLoading
                            ? null
                            : (details) {
                                if (_dragValue >= maxDragDistance * 0.75) {
                                  setState(() {
                                    _dragValue = maxDragDistance;
                                    _isSwiped = true;
                                  });
                                  widget.onSwiped();
                                  Future.delayed(
                                    const Duration(milliseconds: 1000),
                                    () {
                                      if (mounted) {
                                        setState(() {
                                          _dragValue = 0.0;
                                          _isSwiped = false;
                                        });
                                      }
                                    },
                                  );
                                } else {
                                  setState(() {
                                    _dragValue = 0.0;
                                  });
                                }
                              },
                        child: AnimatedContainer(
                          duration: _isSwiped
                              ? const Duration(milliseconds: 150)
                              : Duration.zero,
                          width: thumbWidth,
                          height: thumbHeight,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary500,
                                AppColors.primary700,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(23.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary500.withValues(
                                  alpha: 0.35 + (pulseVal * 0.1),
                                ),
                                blurRadius: 6.r + (pulseVal * 4.r),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.keyboard_double_arrow_right_rounded,
                                color: Colors.white,
                                size: 20.r,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'SWIPE',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

/// Custom Gradient Transform to handle Shimmer Animation translate
class SlideGradientTransform extends GradientTransform {
  final double value;
  const SlideGradientTransform({required this.value});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * (value - 0.5) * 2,
      0.0,
      0.0,
    );
  }
}
