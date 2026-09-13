import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/localization/locale_provider.dart';

class RideDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> ride;

  const RideDetailsScreen({super.key, required this.ride});

  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  bool _markersLoaded = false;

  BitmapDescriptor? _pickupIcon;
  BitmapDescriptor? _dropoffIcon;
  final Map<int, BitmapDescriptor> _stopIcons = {};

  @override
  void initState() {
    super.initState();
    _loadCustomMarkers();
  }

  LatLng? _parseCoordinates(Map<String, dynamic>? location) {
    if (location == null) return null;
    final coordinates = location['coordinates'];
    if (coordinates is List && coordinates.length >= 2) {
      final double val0 = double.tryParse(coordinates[0].toString()) ?? 0.0;
      final double val1 = double.tryParse(coordinates[1].toString()) ?? 0.0;
      if (val0 > 40.0) {
        return LatLng(val1, val0);
      } else {
        return LatLng(val0, val1);
      }
    }
    return null;
  }

  Future<void> _loadCustomMarkers() async {
    try {
      final pIcon = await _createCustomPinIcon(isPickup: true);
      final stops = widget.ride['stops'] as List? ?? [];
      final Map<int, BitmapDescriptor> stopIcons = {};
      for (int i = 0; i < stops.length; i++) {
        stopIcons[i] = await _createCustomPinIcon(isPickup: false, index: i);
      }
      final dIcon = await _createCustomPinIcon(
        isPickup: false,
        index: stops.isNotEmpty ? stops.length : null,
      );

      if (mounted) {
        setState(() {
          _pickupIcon = pIcon;
          _dropoffIcon = dIcon;
          _stopIcons.clear();
          _stopIcons.addAll(stopIcons);
          _markersLoaded = true;
        });
        _buildMapElements();
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _markersLoaded = true;
        });
      }
    }
  }

  Future<BitmapDescriptor> _createCustomPinIcon({
    required bool isPickup,
    int? index,
  }) async {
    const int size = 160; // 40 * 4.0
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final pinColor = isPickup ? const Color(0xFF10B981) : AppColors.mapDropPin;

    final pinPainter = TextPainter(
      textDirection: ui.TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    pinPainter.text = TextSpan(
      text: String.fromCharCode(Icons.location_on.codePoint),
      style: TextStyle(
        fontSize: 144.0,
        fontFamily: Icons.location_on.fontFamily,
        package: Icons.location_on.fontPackage,
        color: pinColor,
      ),
    );
    pinPainter.layout();

    final double pinX = (size - pinPainter.width) / 2;
    final double pinY = size - pinPainter.height - 8.0;

    pinPainter.paint(canvas, Offset(pinX, pinY));

    if (!isPickup && index != null) {
      const double circleRadius = 40.0;
      const Offset circleCenter = Offset(size / 2, 24.0 + circleRadius);

      final Paint circlePaint = Paint()
        ..color = AppColors.mapDropPin
        ..style = PaintingStyle.fill;
      canvas.drawCircle(circleCenter, circleRadius, circlePaint);

      final textPainter = TextPainter(
        textDirection: ui.TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.text = TextSpan(
        text: '${index + 1}',
        style: const TextStyle(
          fontSize: 48.0,
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

  void _buildMapElements() {
    final startLatLng = _parseCoordinates(widget.ride['startLocation']);
    final endLatLng = _parseCoordinates(widget.ride['endLocation']);
    final stopsList = widget.ride['stops'] as List? ?? [];

    final List<LatLng> polyPoints = [];

    _markers.clear();

    if (startLatLng != null) {
      polyPoints.add(startLatLng);
      _markers.add(
        Marker(
          markerId: const MarkerId('pickup'),
          position: startLatLng,
          icon:
              _pickupIcon ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: const InfoWindow(title: 'Pickup Location'),
        ),
      );
    }

    for (int i = 0; i < stopsList.length; i++) {
      final stop = stopsList[i] as Map;
      final stopLatLng = _parseCoordinates(stop as Map<String, dynamic>);
      if (stopLatLng != null) {
        polyPoints.add(stopLatLng);
        _markers.add(
          Marker(
            markerId: MarkerId('stop_$i'),
            position: stopLatLng,
            icon:
                _stopIcons[i] ??
                BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueOrange,
                ),
            infoWindow: InfoWindow(
              title: 'Stop ${i + 1} Recipient: ${stop['receiverName']}',
            ),
          ),
        );
      }
    }

    if (endLatLng != null) {
      polyPoints.add(endLatLng);
      _markers.add(
        Marker(
          markerId: const MarkerId('dropoff'),
          position: endLatLng,
          icon:
              _dropoffIcon ??
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: const InfoWindow(title: 'Dropoff Location'),
        ),
      );
    }

    if (polyPoints.length >= 2) {
      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route_path'),
          points: polyPoints,
          color: AppColors.mapPolyline,
          width: 4,
        ),
      );
    }

    setState(() {});
    _fitMapBounds();
  }

  void _fitMapBounds() {
    if (_mapController == null || _markers.isEmpty) return;
    double? minLat, maxLat, minLng, maxLng;
    for (final marker in _markers) {
      final lat = marker.position.latitude;
      final lng = marker.position.longitude;
      if (minLat == null || lat < minLat) minLat = lat;
      if (maxLat == null || lat > maxLat) maxLat = lat;
      if (minLng == null || lng < minLng) minLng = lng;
      if (maxLng == null || lng > maxLng) maxLng = lng;
    }
    if (minLat != null && maxLat != null && minLng != null && maxLng != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(minLat, minLng),
            northeast: LatLng(maxLat, maxLng),
          ),
          60.0.r,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final mutedTextColor = isDark ? AppColors.neutral400 : AppColors.neutral500;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final borderColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    final String status = widget.ride['orderStatus']?.toString() ?? 'Pending';
    final String rideId = widget.ride['_id']?.toString() ?? 'N/A';

    // Format Date
    String dateStr = 'N/A';
    final createdAt = widget.ride['createdAt'];
    if (createdAt != null) {
      try {
        final parsedDate = DateTime.parse(createdAt.toString()).toLocal();
        final locale = Localizations.localeOf(context).languageCode;
        dateStr = DateFormat('dd MMM yyyy, hh:mm a', locale).format(parsedDate);
      } catch (_) {}
    }

    // Status chip colors
    final isCompleted = status.toLowerCase() == 'completed';
    final isCancelled = status.toLowerCase() == 'cancelled';
    final isPaid = widget.ride['isPaid'] == true || widget.ride['isPaid']?.toString().toLowerCase() == 'true';

    final String displayStatus;
    final Color statusColor;
    final IconData statusIcon;

    if (isCompleted) {
      if (isPaid) {
        displayStatus = context.l10n.completed;
        statusColor = const Color(0xFF10B981);
        statusIcon = Icons.check_circle_rounded;
      } else {
        displayStatus = context.l10n.paymentPending;
        statusColor = const Color(0xFFF59E0B);
        statusIcon = Icons.warning_amber_rounded;
      }
    } else if (isCancelled) {
      displayStatus = context.l10n.cancelled;
      statusColor = const Color(0xFFEF4444);
      statusIcon = Icons.cancel_rounded;
    } else {
      displayStatus = status;
      statusColor = AppColors.primary500;
      statusIcon = Icons.pending_rounded;
    }

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          context.l10n.rideDetails,
          style: AppTextStyles.titleMedium.copyWith(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ride Header Info
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: cardBgColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.rideIdLabel(rideId.toUpperCase().substring(rideId.length.clamp(0, 8))),
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            dateStr,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: mutedTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            statusIcon,
                            color: statusColor,
                            size: 14.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            displayStatus,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // Cancellation Reason Section (if Cancelled)
              if (isCancelled && widget.ride['cancellationReason'] != null) ...[
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444).withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: const Color(0xFFEF4444).withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: const Color(0xFFEF4444),
                        size: 20.sp,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.cancellationReason,
                              style: TextStyle(
                                color: const Color(0xFFEF4444),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              widget.ride['cancellationReason'].toString(),
                              style: TextStyle(
                                color: primaryTextColor,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
              ],

              // Map Section
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: borderColor),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: !_markersLoaded
                      ? const Center(child: CircularProgressIndicator())
                      : GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target:
                                _parseCoordinates(
                                  widget.ride['startLocation'],
                                ) ??
                                const LatLng(23.25, 77.46),
                            zoom: 14.0,
                          ),
                          markers: _markers,
                          polylines: _polylines,
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: false,
                          onMapCreated: (controller) {
                            _mapController = controller;
                            _fitMapBounds();
                          },
                        ),
                ),
              ),
              SizedBox(height: 20.h),

              // Route Timeline
              _buildSectionTitle(context.l10n.routeTimeline),
              _buildTimelineSection(
                isDark,
                cardBgColor,
                borderColor,
                primaryTextColor,
                mutedTextColor,
              ),
              SizedBox(height: 20.h),

              // Goods specifications
              _buildSectionTitle(context.l10n.goodsSpecifications),
              _buildGoodsSection(
                cardBgColor,
                borderColor,
                primaryTextColor,
                mutedTextColor,
              ),
              SizedBox(height: 20.h),

              // Vehicle & Driver specifications
              _buildSectionTitle(context.l10n.vehicleMetadata),
              _buildVehicleSection(
                cardBgColor,
                borderColor,
                primaryTextColor,
                mutedTextColor,
              ),
              SizedBox(height: 20.h),

              // Pricing breakdown
              _buildSectionTitle(context.l10n.fareBreakdown),
              _buildFareSection(
                cardBgColor,
                borderColor,
                primaryTextColor,
                mutedTextColor,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, left: 4.w),
      child: Text(
        title,
        style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTimelineSection(
    bool isDark,
    Color bg,
    Color border,
    Color textPrimary,
    Color textMuted,
  ) {
    final sender = widget.ride['senderDetails'] as Map?;
    final receiver = widget.ride['receiverDetails'] as Map?;
    final startAddr =
        widget.ride['startLocation']?['address']?.toString() ?? 'N/A';
    final endAddr = widget.ride['endLocation']?['address']?.toString() ?? 'N/A';
    final stopsList = widget.ride['stops'] as List? ?? [];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pickup node
          _buildTimelineNode(
            icon: Icons.radio_button_checked_rounded,
            iconColor: const Color(0xFF10B981),
            title: context.l10n.pickupSender,
            address: startAddr,
            contactName: sender?['name']?.toString() ?? 'N/A',
            contactPhone: sender?['phone']?.toString() ?? 'N/A',
            textPrimary: textPrimary,
            textMuted: textMuted,
            isLast: stopsList.isEmpty && endAddr.isEmpty,
          ),

          // Intermediate Stops
          for (int i = 0; i < stopsList.length; i++) ...[
            _buildTimelineNode(
              icon: Icons.offline_pin_rounded,
              iconColor: const Color(0xFFF59E0B),
              title: context.l10n.stopLocation(i + 1),
              address: stopsList[i]['address']?.toString() ?? 'N/A',
              contactName: stopsList[i]['receiverName']?.toString() ?? 'N/A',
              contactPhone: stopsList[i]['receiverPhone']?.toString() ?? 'N/A',
              textPrimary: textPrimary,
              textMuted: textMuted,
              isLast: i == stopsList.length - 1 && endAddr.isEmpty,
              badge: stopsList[i]['otpVerified'] == true
                  ? 'Verified'
                  : 'Unverified',
            ),
          ],

          // Dropoff node
          if (endAddr.isNotEmpty)
            _buildTimelineNode(
              icon: Icons.location_on_rounded,
              iconColor: const Color(0xFFEF4444),
              title: context.l10n.dropoffRecipient,
              address: endAddr,
              contactName: receiver?['name']?.toString() ?? 'N/A',
              contactPhone: receiver?['phone']?.toString() ?? 'N/A',
              textPrimary: textPrimary,
              textMuted: textMuted,
              isLast: true,
            ),
        ],
      ),
    );
  }

  Widget _buildTimelineNode({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String address,
    required String contactName,
    required String contactPhone,
    required Color textPrimary,
    required Color textMuted,
    bool isLast = false,
    String? badge,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: iconColor, size: 20.sp),
            if (!isLast)
              Container(
                width: 1.5,
                height: 72.h,
                color: textMuted.withValues(alpha: 0.3),
              ),
          ],
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                    ),
                  ),
                  if (badge != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color:
                            (badge == 'Verified'
                                    ? const Color(0xFF10B981)
                                    : AppColors.primary500)
                                .withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                          color: badge == 'Verified'
                              ? const Color(0xFF10B981)
                              : AppColors.primary500,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                address,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: textPrimary,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                'Contact: $contactName',
                style: AppTextStyles.bodySmall.copyWith(color: textMuted),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ],
    );
  }

  String _camelCaseToTitleCase(String text) {
    if (text.isEmpty) return text;
    final result = text.replaceAllMapped(
      RegExp(r'(^|[a-z])([A-Z])'),
      (Match m) => '${m[1]} ${m[2]}',
    );
    return result[0].toUpperCase() + result.substring(1);
  }

  IconData _getFareIcon(String key) {
    switch (key) {
      case 'baseFare':
        return Icons.directions_car_rounded;
      case 'weatherSurcharge':
        return Icons.thunderstorm_rounded;
      case 'trafficSurcharge':
        return Icons.traffic_rounded;
      case 'waitingCharge':
        return Icons.schedule_rounded;
      case 'rental':
        return Icons.timer_rounded;
      case 'promoCodeDiscount':
      case 'discount':
        return Icons.local_offer_rounded;
      case 'tollFee':
        return Icons.toll_rounded;
      case 'nightSurcharge':
        return Icons.nights_stay_rounded;
      case 'surgeFee':
        return Icons.bolt_rounded;
      case 'tax':
      case 'platformFee':
        return Icons.receipt_long_rounded;
      default:
        return Icons.payments_rounded;
    }
  }

  Widget _buildGoodsSection(
    Color bg,
    Color border,
    Color textPrimary,
    Color textMuted,
  ) {
    final goods = widget.ride['goodsDetails'] as Map?;
    final String description =
        goods?['description']?.toString() ?? 'Standard Freight';
    final double weight =
        double.tryParse(goods?['estimatedWeight']?.toString() ?? '0') ?? 0.0;
    final double quantity =
        double.tryParse(goods?['quantity']?.toString() ?? '0') ?? 0.0;
    final bool isFragile = goods?['isFragile'] == true;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          _buildDetailRow(context.l10n.description, description, textPrimary, textMuted),
          Divider(height: 16.h, color: border),
          _buildDetailRow(
            context.l10n.estimatedWeight,
            '${weight.toStringAsFixed(0)} kg',
            textPrimary,
            textMuted,
          ),
          Divider(height: 16.h, color: border),
          _buildDetailRow(
            context.l10n.quantity,
            '${quantity.toStringAsFixed(0)} items',
            textPrimary,
            textMuted,
          ),
          Divider(height: 16.h, color: border),
          _buildDetailRow(
            context.l10n.fragileGoods,
            isFragile ? context.l10n.yes : context.l10n.no,
            isFragile ? const Color(0xFFEF4444) : textPrimary,
            textMuted,
            fontWeight: isFragile ? FontWeight.bold : FontWeight.w500,
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleSection(
    Color bg,
    Color border,
    Color textPrimary,
    Color textMuted,
  ) {
    final vehicle = widget.ride['vehicleId'] as Map?;
    final String vName = vehicle?['vehicleName']?.toString() ?? 'Tata ACE';
    final String vNumber = vehicle?['vehicleNumber']?.toString() ?? 'N/A';
    final String vColor = vehicle?['vehicleColor']?.toString() ?? 'N/A';
    final String vModel = vehicle?['vehicleModel']?.toString() ?? 'N/A';

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          _buildDetailRow(context.l10n.vehicleName, vName, textPrimary, textMuted),
          Divider(height: 16.h, color: border),
          _buildDetailRow(
            context.l10n.vehicleNumber,
            vNumber.toUpperCase(),
            textPrimary,
            textMuted,
          ),
          Divider(height: 16.h, color: border),
          _buildDetailRow(
            context.l10n.modelColor,
            '$vModel ($vColor)',
            textPrimary,
            textMuted,
          ),
        ],
      ),
    );
  }

  Widget _buildFareSection(
    Color bg,
    Color border,
    Color textPrimary,
    Color textMuted,
  ) {
    final fareBreakdown = widget.ride['fareBreakdown'] as Map?;
    final num netPayable = fareBreakdown?['netPayable'] ?? widget.ride['totalFare'] ?? 0;
    final String rawMethod = widget.ride['paymentMethod']?.toString() ?? 'Cash';
    final String pMethod = rawMethod.toLowerCase() == 'cash' ? context.l10n.cash : rawMethod;

    final List<Widget> fareRows = [];

    if (fareBreakdown != null && fareBreakdown.isNotEmpty) {
      final knownLabels = <String, String>{
        'baseFare': context.l10n.baseFare,
        'weatherSurcharge': context.l10n.weatherSurcharge,
        'trafficSurcharge': context.l10n.trafficSurcharge,
        'waitingCharge': context.l10n.waitingCharge,
        'rental': context.l10n.rentalCharge,
        'grossFare': context.l10n.grossFare,
        'promoCodeDiscount': context.l10n.promoDiscount,
        'pendingDue': context.l10n.pendingDue,
        'tollFee': context.l10n.tollFee,
        'cancellationFee': context.l10n.cancellationFee,
        'nightSurcharge': context.l10n.nightSurcharge,
        'surgeFee': context.l10n.surgeFee,
        'tax': context.l10n.taxAndFees,
        'platformFee': context.l10n.platformFee,
      };

      final discountKeys = {'promoCodeDiscount', 'discount', 'couponDiscount'};
      final skipKeys = {'netPayable', 'currency', 'promoCode', '_id', 'id'};

      fareBreakdown.forEach((key, rawVal) {
        if (skipKeys.contains(key)) return;

        final double? val = double.tryParse(rawVal?.toString() ?? '');
        if (val == null || val == 0) return; // Skip if null or zero

        final isDiscount = discountKeys.contains(key) || val < 0;
        final displayVal = isDiscount ? -val.abs() : val;
        final color = isDiscount ? const Color(0xFF10B981) : textPrimary;
        final label = knownLabels[key] ?? _camelCaseToTitleCase(key.toString());
        final icon = _getFareIcon(key.toString());

        if (fareRows.isNotEmpty) {
          fareRows.add(Divider(height: 18.h, color: border.withValues(alpha: 0.5)));
        }

        fareRows.add(_buildFareRow(label, displayVal, color, textPrimary, icon));

        if (discountKeys.contains(key)) {
          fareRows.add(Divider(height: 18.h, color: border.withValues(alpha: 0.5)));
          fareRows.add(_buildFareRow(
            context.l10n.reachuWalletCredit,
            val.abs(),
            const Color(0xFF10B981),
            const Color(0xFF10B981),
            Icons.account_balance_wallet_rounded,
          ));
        }
      });
    }

    if (fareRows.isEmpty) {
      final double totalFare = double.tryParse(widget.ride['totalFare']?.toString() ?? '0') ?? 0.0;
      fareRows.add(_buildFareRow(
        context.l10n.baseFare,
        totalFare,
        textPrimary,
        textPrimary,
        Icons.directions_car_rounded,
      ));
    }

    final double promoDiscount = double.tryParse(fareBreakdown?['promoCodeDiscount']?.toString() ?? '0') ?? 0.0;
    final double waitingCharge = double.tryParse(fareBreakdown?['waitingCharge']?.toString() ?? '0') ?? 0.0;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: border),
      ),
      child: Column(
        children: [
          ...fareRows,
          if (promoDiscount > 0 || waitingCharge > 0) ...[
            Divider(height: 24.h, color: border.withValues(alpha: 0.6)),
            if (promoDiscount > 0) ...[
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border(
                    left: BorderSide(color: const Color(0xFF10B981), width: 3.5.w),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard_rounded, size: 15.sp, color: const Color(0xFF10B981)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        context.l10n.promoReimbursementNote('₹${promoDiscount.toStringAsFixed(2)}'),
                        style: TextStyle(
                          color: const Color(0xFF10B981),
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (waitingCharge > 0) SizedBox(height: 8.h),
            ],
            if (waitingCharge > 0) ...[
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border(
                    left: BorderSide(color: const Color(0xFFD97706), width: 3.5.w),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.schedule_rounded, size: 15.sp, color: const Color(0xFFD97706)),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        context.l10n.waitingChargeNote('₹${waitingCharge.toStringAsFixed(2)}'),
                        style: TextStyle(
                          color: const Color(0xFFD97706),
                          fontSize: 11.5.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
          Divider(height: 24.h, color: border),
          _buildFareRow(
            context.l10n.netPayable,
            netPayable.toDouble(),
            textPrimary,
            textPrimary,
            Icons.receipt_long_rounded,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.paymentMethod,
                style: TextStyle(color: textMuted, fontSize: 12.sp),
              ),
              Text(
                pMethod,
                style: TextStyle(
                  color: textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFareRow(String title, double val, Color valueColor, Color titleColor, IconData icon) {
    final bool isDiscount = val < 0;
    final String prefix = isDiscount ? '-' : '';
    final double absoluteValue = val.abs();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: isDiscount
                      ? const Color(0xFF10B981).withValues(alpha: 0.1)
                      : AppColors.primary500.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 14.sp,
                  color: isDiscount ? const Color(0xFF10B981) : AppColors.primary500,
                ),
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: isDiscount
                ? const Color(0xFF10B981).withValues(alpha: 0.1)
                : titleColor.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isDiscount
                  ? const Color(0xFF10B981).withValues(alpha: 0.25)
                  : Colors.transparent,
              width: 1.w,
            ),
          ),
          child: Text(
            '$prefix₹${absoluteValue.toStringAsFixed(2)}',
            style: TextStyle(
              color: isDiscount ? const Color(0xFF10B981) : valueColor,
              fontWeight: FontWeight.w800,
              fontSize: 13.5.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    Color valColor,
    Color labelColor, {
    double? fontSize,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: fontSize ?? 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valColor,
            fontSize: fontSize ?? 13.sp,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
