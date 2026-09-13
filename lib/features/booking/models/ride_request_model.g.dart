// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LatLngModel _$LatLngModelFromJson(Map<String, dynamic> json) => _LatLngModel(
  latitude: _doubleFromJson(json['latitude']),
  longitude: _doubleFromJson(json['longitude']),
);

Map<String, dynamic> _$LatLngModelToJson(_LatLngModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_LocationDetailsModel _$LocationDetailsModelFromJson(
  Map<String, dynamic> json,
) => _LocationDetailsModel(
  address: json['address'] as String,
  type: json['type'] as String,
  coordinates: (json['coordinates'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$LocationDetailsModelToJson(
  _LocationDetailsModel instance,
) => <String, dynamic>{
  'address': instance.address,
  'type': instance.type,
  'coordinates': instance.coordinates,
};

_FareBreakdownModel _$FareBreakdownModelFromJson(Map<String, dynamic> json) =>
    _FareBreakdownModel(
      currency: json['currency'] as String,
      baseFare: _doubleFromJson(json['baseFare']),
      weatherSurcharge: _doubleFromJson(json['weatherSurcharge']),
      trafficSurcharge: _doubleFromJson(json['trafficSurcharge']),
      waitingCharge: _doubleFromJson(json['waitingCharge']),
      rental: (json['rental'] as num?)?.toDouble(),
      grossFare: _doubleFromJson(json['grossFare']),
      promoCode: json['promoCode'] as String?,
      promoCodeDiscount: _doubleFromJson(json['promoCodeDiscount']),
      pendingDue: _doubleFromJson(json['pendingDue']),
      netPayable: _doubleFromJson(json['netPayable']),
    );

Map<String, dynamic> _$FareBreakdownModelToJson(_FareBreakdownModel instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'baseFare': instance.baseFare,
      'weatherSurcharge': instance.weatherSurcharge,
      'trafficSurcharge': instance.trafficSurcharge,
      'waitingCharge': instance.waitingCharge,
      'rental': instance.rental,
      'grossFare': instance.grossFare,
      'promoCode': instance.promoCode,
      'promoCodeDiscount': instance.promoCodeDiscount,
      'pendingDue': instance.pendingDue,
      'netPayable': instance.netPayable,
    };

_GoodsDetailsModel _$GoodsDetailsModelFromJson(Map<String, dynamic> json) =>
    _GoodsDetailsModel(
      goodsType: json['goodsType'] as String,
      description: json['description'] as String,
      estimatedWeight: _doubleFromJson(json['estimatedWeight']),
      quantity: _doubleFromJson(json['quantity']),
      worth: _doubleFromJson(json['worth']),
      isFragile: json['isFragile'] as bool,
    );

Map<String, dynamic> _$GoodsDetailsModelToJson(_GoodsDetailsModel instance) =>
    <String, dynamic>{
      'goodsType': instance.goodsType,
      'description': instance.description,
      'estimatedWeight': instance.estimatedWeight,
      'quantity': instance.quantity,
      'worth': instance.worth,
      'isFragile': instance.isFragile,
    };

_StopModel _$StopModelFromJson(Map<String, dynamic> json) => _StopModel(
  address: json['address'] as String,
  type: json['type'] as String,
  coordinates: (json['coordinates'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  receiverName: json['receiverName'] as String,
  receiverPhone: _stringFromJson(json['receiverPhone']),
  instructions: json['instructions'] as String,
  otp: json['otp'] as String,
  otpVerified: json['otpVerified'] as bool,
  id: json['_id'] as String,
);

Map<String, dynamic> _$StopModelToJson(_StopModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'type': instance.type,
      'coordinates': instance.coordinates,
      'receiverName': instance.receiverName,
      'receiverPhone': instance.receiverPhone,
      'instructions': instance.instructions,
      'otp': instance.otp,
      'otpVerified': instance.otpVerified,
      '_id': instance.id,
    };

_ContactDetailsModel _$ContactDetailsModelFromJson(Map<String, dynamic> json) =>
    _ContactDetailsModel(
      name: json['name'] as String,
      phone: _stringFromJson(json['phone']),
      instructions: json['instructions'] as String,
    );

Map<String, dynamic> _$ContactDetailsModelToJson(
  _ContactDetailsModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'instructions': instance.instructions,
};

_RideRequestModel _$RideRequestModelFromJson(Map<String, dynamic> json) =>
    _RideRequestModel(
      rideId: json['rideId'] as String,
      riderId: json['riderId'] as String,
      riderName: json['riderName'] as String,
      riderNumber: _stringFromJson(json['riderNumber']),
      pickup: LatLngModel.fromJson(json['pickup'] as Map<String, dynamic>),
      destination: LatLngModel.fromJson(
        json['destination'] as Map<String, dynamic>,
      ),
      rideType: json['rideType'] as String,
      driverDistance: _doubleFromJson(json['driverDistance']),
      timestamp: _intFromJson(json['timestamp']),
      timeout: _intFromJson(json['timeout']),
      startLocation: LocationDetailsModel.fromJson(
        json['startLocation'] as Map<String, dynamic>,
      ),
      endLocation: LocationDetailsModel.fromJson(
        json['endLocation'] as Map<String, dynamic>,
      ),
      totalFare: _doubleFromJson(json['totalFare']),
      distance: _doubleFromJson(json['distance']),
      isScheduled: json['isScheduled'] as bool,
      scheduledStartTime: json['scheduledStartTime'] == null
          ? null
          : DateTime.parse(json['scheduledStartTime'] as String),
      pendingDue: _doubleFromJson(json['pendingDue']),
      rentalDurationHours: (json['rentalDurationHours'] as num?)?.toInt(),
      goodsType: json['goodsType'] as String,
      estimatedWeight: _doubleFromJson(json['estimatedWeight']),
      isFragile: json['isFragile'] as bool,
      stopsCount: _intFromJson(json['stopsCount']),
      senderName: json['senderName'] as String,
      receiverName: json['receiverName'] as String,
      fareBreakdown: FareBreakdownModel.fromJson(
        json['fareBreakdown'] as Map<String, dynamic>,
      ),
      goodsDetails: GoodsDetailsModel.fromJson(
        json['goodsDetails'] as Map<String, dynamic>,
      ),
      stops: (json['stops'] as List<dynamic>)
          .map((e) => StopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      senderDetails: ContactDetailsModel.fromJson(
        json['senderDetails'] as Map<String, dynamic>,
      ),
      receiverDetails: ContactDetailsModel.fromJson(
        json['receiverDetails'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$RideRequestModelToJson(_RideRequestModel instance) =>
    <String, dynamic>{
      'rideId': instance.rideId,
      'riderId': instance.riderId,
      'riderName': instance.riderName,
      'riderNumber': instance.riderNumber,
      'pickup': instance.pickup,
      'destination': instance.destination,
      'rideType': instance.rideType,
      'driverDistance': instance.driverDistance,
      'timestamp': instance.timestamp,
      'timeout': instance.timeout,
      'startLocation': instance.startLocation,
      'endLocation': instance.endLocation,
      'totalFare': instance.totalFare,
      'distance': instance.distance,
      'isScheduled': instance.isScheduled,
      'scheduledStartTime': instance.scheduledStartTime?.toIso8601String(),
      'pendingDue': instance.pendingDue,
      'rentalDurationHours': instance.rentalDurationHours,
      'goodsType': instance.goodsType,
      'estimatedWeight': instance.estimatedWeight,
      'isFragile': instance.isFragile,
      'stopsCount': instance.stopsCount,
      'senderName': instance.senderName,
      'receiverName': instance.receiverName,
      'fareBreakdown': instance.fareBreakdown,
      'goodsDetails': instance.goodsDetails,
      'stops': instance.stops,
      'senderDetails': instance.senderDetails,
      'receiverDetails': instance.receiverDetails,
    };
