import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/result.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/socket/socket_stream_manager.dart';
import '../repositories/order_repository.dart';

part 'order_controller.g.dart';

@riverpod
class OrderController extends _$OrderController {
  @override
  void build() {}

  Map<String, dynamic>? _asMap(dynamic val) {
    if (val == null) return null;
    if (val is Map) return Map<String, dynamic>.from(val);
    try {
      return (val as dynamic).toJson() as Map<String, dynamic>?;
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> normalizeOrderData(Map<String, dynamic> rawOrder) {
    final Map<String, dynamic> order = Map<String, dynamic>.from(rawOrder);

    // Normalize nested models if passed as model instances
    if (order['senderDetails'] != null && order['senderDetails'] is! Map) {
      order['senderDetails'] = _asMap(order['senderDetails']);
    }
    if (order['receiverDetails'] != null && order['receiverDetails'] is! Map) {
      order['receiverDetails'] = _asMap(order['receiverDetails']);
    }
    if (order['goodsDetails'] != null && order['goodsDetails'] is! Map) {
      order['goodsDetails'] = _asMap(order['goodsDetails']);
    }
    if (order['fareBreakdown'] != null && order['fareBreakdown'] is! Map) {
      order['fareBreakdown'] = _asMap(order['fareBreakdown']);
    }
    if (order['startLocation'] != null && order['startLocation'] is! Map) {
      order['startLocation'] = _asMap(order['startLocation']);
    }
    if (order['endLocation'] != null && order['endLocation'] is! Map) {
      order['endLocation'] = _asMap(order['endLocation']);
    }
    if (order['stops'] is List) {
      order['stops'] = (order['stops'] as List)
          .map((s) => s is Map ? s : (_asMap(s) ?? s))
          .toList();
    }

    // Map startLocation to pickup
    final startLocation = _asMap(order['startLocation']);
    if (startLocation != null) {
      final coords = startLocation['coordinates'];
      if (coords is List && coords.length >= 2) {
        order['pickup'] = {
          'latitude': coords[0],
          'longitude': coords[1],
          'address': startLocation['address'] ?? '',
        };
      }
    }

    // Map endLocation to dropoff / destination
    final endLocation = _asMap(order['endLocation']);
    if (endLocation != null) {
      final coords = endLocation['coordinates'];
      if (coords is List && coords.length >= 2) {
        final destinationMap = {
          'latitude': coords[0],
          'longitude': coords[1],
          'address': endLocation['address'] ?? '',
        };
        order['dropoff'] = destinationMap;
        order['destination'] = destinationMap;
      }
    }

    // Standardize driver and vehicle mapping
    final driverData = order['driverId'] ?? order['driver'];
    if (driverData is Map) {
      order['driver'] = Map<String, dynamic>.from(driverData);
    } else {
      order['driver'] ??= <String, dynamic>{};
    }

    final vehicleData = order['vehicleId'] ?? order['vehicle'];
    if (vehicleData != null) {
      if (order['driver'] is Map) {
        if (vehicleData is Map) {
          order['driver']['vehicle'] = Map<String, dynamic>.from(vehicleData);
        } else {
          order['driver']['vehicle'] = {
            '_id': vehicleData.toString(),
          };
        }
      }
    }

    // Map orderId
    order['orderId'] ??= order['_id'] ?? order['id'] ?? order['rideId'];

    // Map rider information
    final riderInfo = order['riderId'] ?? order['rider'] ?? order['userId'] ?? order['user'];
    if (riderInfo is Map) {
      order['riderName'] ??= riderInfo['name']?.toString() ?? 'Customer';
      final img = riderInfo['image']?.toString() ??
                  riderInfo['userImage']?.toString() ??
                  riderInfo['riderImage']?.toString() ??
                  riderInfo['profileImage']?.toString() ??
                  '';
      if (img.isNotEmpty) {
        order['riderImage'] ??= img;
        order['userImage'] ??= img;
      }
    }

    // Map other strings
    order['totalFare'] = (order['totalFare'] ?? order['estimatedFare'] ?? '0').toString();
    order['distance'] = (order['distance'] ?? '0').toString();
    order['estimatedTime'] = (order['estimatedTime'] ?? '15').toString();

    return order;
  }

  void handleOrderRedirection(BuildContext context, Map<String, dynamic> rawOrder) {
    final normalized = normalizeOrderData(rawOrder);
    final status = (normalized['orderStatus'] ?? normalized['status'] ?? '').toString().toLowerCase();
    final isPaid = normalized['isPaid'] as bool? ?? false;

    AppLogger.d('🔄 Reconnection handler: Status = $status, Paid = $isPaid');

    if (status == 'accepted' ||
        status == 'arrived' ||
        status == 'progress' ||
        status == 'intransit' ||
        status == 'stopdropped') {
      context.go('/arriving_client', extra: normalized);
    } else if ((status == 'completed' || status == 'delivered') && !isPaid) {
      context.go('/ride_payment', extra: normalized);
    } else {
      AppLogger.d('🔄 Reconnection handler: Remaining on Home Screen.');
    }
  }

  Future<void> checkActiveOrder(BuildContext context) async {
    try {
      // 1. Check if the socket has already received the active ride
      final socketClient = ref.read(socketClientProvider);
      if (socketClient.isRideInProgress && socketClient.currentRide != null) {
        AppLogger.i('🔄 Active ride found in socket cache. Redirecting...');
        handleOrderRedirection(context, socketClient.currentRide!);
        return;
      }

      // 2. Otherwise, check the REST API
      final repository = ref.read(orderRepositoryProvider);
      final result = await repository.getCurrentOrder();

      if (!context.mounted) return;

      switch (result) {
        case Success(:final data):
          if (data['success'] == true && data['data'] != null) {
            final orderData = data['data'] as Map<String, dynamic>;
            handleOrderRedirection(context, orderData);
          }
          break;
        case Failure():
          AppLogger.w('⚠️ Reconnection check: Failed to retrieve current order or none active.');
          break;
      }
    } catch (e) {
      AppLogger.e('❌ Error in reconnection check: $e');
    }
  }
}
