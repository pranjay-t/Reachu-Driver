// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletData {

 String get walletId;@JsonKey(fromJson: _doubleFromJson) double get walletBalance;@JsonKey(fromJson: _doubleFromJson) double get availableBalance;@JsonKey(fromJson: _doubleFromJson) double get pendingWithdrawals;@JsonKey(fromJson: _doubleFromJson) double get minimumBalanceForOrder;@JsonKey(fromJson: _doubleFromJson) double get totalExpenses;@JsonKey(fromJson: _doubleFromJson) double get driverDebtBalance;
/// Create a copy of WalletData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletDataCopyWith<WalletData> get copyWith => _$WalletDataCopyWithImpl<WalletData>(this as WalletData, _$identity);

  /// Serializes this WalletData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletData&&(identical(other.walletId, walletId) || other.walletId == walletId)&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.pendingWithdrawals, pendingWithdrawals) || other.pendingWithdrawals == pendingWithdrawals)&&(identical(other.minimumBalanceForOrder, minimumBalanceForOrder) || other.minimumBalanceForOrder == minimumBalanceForOrder)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.driverDebtBalance, driverDebtBalance) || other.driverDebtBalance == driverDebtBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletId,walletBalance,availableBalance,pendingWithdrawals,minimumBalanceForOrder,totalExpenses,driverDebtBalance);

@override
String toString() {
  return 'WalletData(walletId: $walletId, walletBalance: $walletBalance, availableBalance: $availableBalance, pendingWithdrawals: $pendingWithdrawals, minimumBalanceForOrder: $minimumBalanceForOrder, totalExpenses: $totalExpenses, driverDebtBalance: $driverDebtBalance)';
}


}

/// @nodoc
abstract mixin class $WalletDataCopyWith<$Res>  {
  factory $WalletDataCopyWith(WalletData value, $Res Function(WalletData) _then) = _$WalletDataCopyWithImpl;
@useResult
$Res call({
 String walletId,@JsonKey(fromJson: _doubleFromJson) double walletBalance,@JsonKey(fromJson: _doubleFromJson) double availableBalance,@JsonKey(fromJson: _doubleFromJson) double pendingWithdrawals,@JsonKey(fromJson: _doubleFromJson) double minimumBalanceForOrder,@JsonKey(fromJson: _doubleFromJson) double totalExpenses,@JsonKey(fromJson: _doubleFromJson) double driverDebtBalance
});




}
/// @nodoc
class _$WalletDataCopyWithImpl<$Res>
    implements $WalletDataCopyWith<$Res> {
  _$WalletDataCopyWithImpl(this._self, this._then);

  final WalletData _self;
  final $Res Function(WalletData) _then;

/// Create a copy of WalletData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? walletId = null,Object? walletBalance = null,Object? availableBalance = null,Object? pendingWithdrawals = null,Object? minimumBalanceForOrder = null,Object? totalExpenses = null,Object? driverDebtBalance = null,}) {
  return _then(_self.copyWith(
walletId: null == walletId ? _self.walletId : walletId // ignore: cast_nullable_to_non_nullable
as String,walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as double,availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,pendingWithdrawals: null == pendingWithdrawals ? _self.pendingWithdrawals : pendingWithdrawals // ignore: cast_nullable_to_non_nullable
as double,minimumBalanceForOrder: null == minimumBalanceForOrder ? _self.minimumBalanceForOrder : minimumBalanceForOrder // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,driverDebtBalance: null == driverDebtBalance ? _self.driverDebtBalance : driverDebtBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WalletData].
extension WalletDataPatterns on WalletData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletData value)  $default,){
final _that = this;
switch (_that) {
case _WalletData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletData value)?  $default,){
final _that = this;
switch (_that) {
case _WalletData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String walletId, @JsonKey(fromJson: _doubleFromJson)  double walletBalance, @JsonKey(fromJson: _doubleFromJson)  double availableBalance, @JsonKey(fromJson: _doubleFromJson)  double pendingWithdrawals, @JsonKey(fromJson: _doubleFromJson)  double minimumBalanceForOrder, @JsonKey(fromJson: _doubleFromJson)  double totalExpenses, @JsonKey(fromJson: _doubleFromJson)  double driverDebtBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletData() when $default != null:
return $default(_that.walletId,_that.walletBalance,_that.availableBalance,_that.pendingWithdrawals,_that.minimumBalanceForOrder,_that.totalExpenses,_that.driverDebtBalance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String walletId, @JsonKey(fromJson: _doubleFromJson)  double walletBalance, @JsonKey(fromJson: _doubleFromJson)  double availableBalance, @JsonKey(fromJson: _doubleFromJson)  double pendingWithdrawals, @JsonKey(fromJson: _doubleFromJson)  double minimumBalanceForOrder, @JsonKey(fromJson: _doubleFromJson)  double totalExpenses, @JsonKey(fromJson: _doubleFromJson)  double driverDebtBalance)  $default,) {final _that = this;
switch (_that) {
case _WalletData():
return $default(_that.walletId,_that.walletBalance,_that.availableBalance,_that.pendingWithdrawals,_that.minimumBalanceForOrder,_that.totalExpenses,_that.driverDebtBalance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String walletId, @JsonKey(fromJson: _doubleFromJson)  double walletBalance, @JsonKey(fromJson: _doubleFromJson)  double availableBalance, @JsonKey(fromJson: _doubleFromJson)  double pendingWithdrawals, @JsonKey(fromJson: _doubleFromJson)  double minimumBalanceForOrder, @JsonKey(fromJson: _doubleFromJson)  double totalExpenses, @JsonKey(fromJson: _doubleFromJson)  double driverDebtBalance)?  $default,) {final _that = this;
switch (_that) {
case _WalletData() when $default != null:
return $default(_that.walletId,_that.walletBalance,_that.availableBalance,_that.pendingWithdrawals,_that.minimumBalanceForOrder,_that.totalExpenses,_that.driverDebtBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalletData implements WalletData {
  const _WalletData({required this.walletId, @JsonKey(fromJson: _doubleFromJson) required this.walletBalance, @JsonKey(fromJson: _doubleFromJson) required this.availableBalance, @JsonKey(fromJson: _doubleFromJson) required this.pendingWithdrawals, @JsonKey(fromJson: _doubleFromJson) required this.minimumBalanceForOrder, @JsonKey(fromJson: _doubleFromJson) required this.totalExpenses, @JsonKey(fromJson: _doubleFromJson) this.driverDebtBalance = 0.0});
  factory _WalletData.fromJson(Map<String, dynamic> json) => _$WalletDataFromJson(json);

@override final  String walletId;
@override@JsonKey(fromJson: _doubleFromJson) final  double walletBalance;
@override@JsonKey(fromJson: _doubleFromJson) final  double availableBalance;
@override@JsonKey(fromJson: _doubleFromJson) final  double pendingWithdrawals;
@override@JsonKey(fromJson: _doubleFromJson) final  double minimumBalanceForOrder;
@override@JsonKey(fromJson: _doubleFromJson) final  double totalExpenses;
@override@JsonKey(fromJson: _doubleFromJson) final  double driverDebtBalance;

/// Create a copy of WalletData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletDataCopyWith<_WalletData> get copyWith => __$WalletDataCopyWithImpl<_WalletData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletData&&(identical(other.walletId, walletId) || other.walletId == walletId)&&(identical(other.walletBalance, walletBalance) || other.walletBalance == walletBalance)&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.pendingWithdrawals, pendingWithdrawals) || other.pendingWithdrawals == pendingWithdrawals)&&(identical(other.minimumBalanceForOrder, minimumBalanceForOrder) || other.minimumBalanceForOrder == minimumBalanceForOrder)&&(identical(other.totalExpenses, totalExpenses) || other.totalExpenses == totalExpenses)&&(identical(other.driverDebtBalance, driverDebtBalance) || other.driverDebtBalance == driverDebtBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,walletId,walletBalance,availableBalance,pendingWithdrawals,minimumBalanceForOrder,totalExpenses,driverDebtBalance);

@override
String toString() {
  return 'WalletData(walletId: $walletId, walletBalance: $walletBalance, availableBalance: $availableBalance, pendingWithdrawals: $pendingWithdrawals, minimumBalanceForOrder: $minimumBalanceForOrder, totalExpenses: $totalExpenses, driverDebtBalance: $driverDebtBalance)';
}


}

/// @nodoc
abstract mixin class _$WalletDataCopyWith<$Res> implements $WalletDataCopyWith<$Res> {
  factory _$WalletDataCopyWith(_WalletData value, $Res Function(_WalletData) _then) = __$WalletDataCopyWithImpl;
@override @useResult
$Res call({
 String walletId,@JsonKey(fromJson: _doubleFromJson) double walletBalance,@JsonKey(fromJson: _doubleFromJson) double availableBalance,@JsonKey(fromJson: _doubleFromJson) double pendingWithdrawals,@JsonKey(fromJson: _doubleFromJson) double minimumBalanceForOrder,@JsonKey(fromJson: _doubleFromJson) double totalExpenses,@JsonKey(fromJson: _doubleFromJson) double driverDebtBalance
});




}
/// @nodoc
class __$WalletDataCopyWithImpl<$Res>
    implements _$WalletDataCopyWith<$Res> {
  __$WalletDataCopyWithImpl(this._self, this._then);

  final _WalletData _self;
  final $Res Function(_WalletData) _then;

/// Create a copy of WalletData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? walletId = null,Object? walletBalance = null,Object? availableBalance = null,Object? pendingWithdrawals = null,Object? minimumBalanceForOrder = null,Object? totalExpenses = null,Object? driverDebtBalance = null,}) {
  return _then(_WalletData(
walletId: null == walletId ? _self.walletId : walletId // ignore: cast_nullable_to_non_nullable
as String,walletBalance: null == walletBalance ? _self.walletBalance : walletBalance // ignore: cast_nullable_to_non_nullable
as double,availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,pendingWithdrawals: null == pendingWithdrawals ? _self.pendingWithdrawals : pendingWithdrawals // ignore: cast_nullable_to_non_nullable
as double,minimumBalanceForOrder: null == minimumBalanceForOrder ? _self.minimumBalanceForOrder : minimumBalanceForOrder // ignore: cast_nullable_to_non_nullable
as double,totalExpenses: null == totalExpenses ? _self.totalExpenses : totalExpenses // ignore: cast_nullable_to_non_nullable
as double,driverDebtBalance: null == driverDebtBalance ? _self.driverDebtBalance : driverDebtBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$WalletBalanceResponse {

 bool get success; String get message; WalletData get data;
/// Create a copy of WalletBalanceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletBalanceResponseCopyWith<WalletBalanceResponse> get copyWith => _$WalletBalanceResponseCopyWithImpl<WalletBalanceResponse>(this as WalletBalanceResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalletBalanceResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'WalletBalanceResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $WalletBalanceResponseCopyWith<$Res>  {
  factory $WalletBalanceResponseCopyWith(WalletBalanceResponse value, $Res Function(WalletBalanceResponse) _then) = _$WalletBalanceResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, WalletData data
});


$WalletDataCopyWith<$Res> get data;

}
/// @nodoc
class _$WalletBalanceResponseCopyWithImpl<$Res>
    implements $WalletBalanceResponseCopyWith<$Res> {
  _$WalletBalanceResponseCopyWithImpl(this._self, this._then);

  final WalletBalanceResponse _self;
  final $Res Function(WalletBalanceResponse) _then;

/// Create a copy of WalletBalanceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as WalletData,
  ));
}
/// Create a copy of WalletBalanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletDataCopyWith<$Res> get data {
  
  return $WalletDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [WalletBalanceResponse].
extension WalletBalanceResponsePatterns on WalletBalanceResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalletBalanceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalletBalanceResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalletBalanceResponse value)  $default,){
final _that = this;
switch (_that) {
case _WalletBalanceResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalletBalanceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WalletBalanceResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  WalletData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalletBalanceResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  WalletData data)  $default,) {final _that = this;
switch (_that) {
case _WalletBalanceResponse():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  WalletData data)?  $default,) {final _that = this;
switch (_that) {
case _WalletBalanceResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _WalletBalanceResponse implements WalletBalanceResponse {
  const _WalletBalanceResponse({required this.success, required this.message, required this.data});
  

@override final  bool success;
@override final  String message;
@override final  WalletData data;

/// Create a copy of WalletBalanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletBalanceResponseCopyWith<_WalletBalanceResponse> get copyWith => __$WalletBalanceResponseCopyWithImpl<_WalletBalanceResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalletBalanceResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'WalletBalanceResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$WalletBalanceResponseCopyWith<$Res> implements $WalletBalanceResponseCopyWith<$Res> {
  factory _$WalletBalanceResponseCopyWith(_WalletBalanceResponse value, $Res Function(_WalletBalanceResponse) _then) = __$WalletBalanceResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, WalletData data
});


@override $WalletDataCopyWith<$Res> get data;

}
/// @nodoc
class __$WalletBalanceResponseCopyWithImpl<$Res>
    implements _$WalletBalanceResponseCopyWith<$Res> {
  __$WalletBalanceResponseCopyWithImpl(this._self, this._then);

  final _WalletBalanceResponse _self;
  final $Res Function(_WalletBalanceResponse) _then;

/// Create a copy of WalletBalanceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_WalletBalanceResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as WalletData,
  ));
}

/// Create a copy of WalletBalanceResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WalletDataCopyWith<$Res> get data {
  
  return $WalletDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RazorpayOrderData {

 String get razorpayKeyId;@JsonKey(fromJson: _intFromJson) int get amount; String get currency; String get orderId;
/// Create a copy of RazorpayOrderData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RazorpayOrderDataCopyWith<RazorpayOrderData> get copyWith => _$RazorpayOrderDataCopyWithImpl<RazorpayOrderData>(this as RazorpayOrderData, _$identity);

  /// Serializes this RazorpayOrderData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RazorpayOrderData&&(identical(other.razorpayKeyId, razorpayKeyId) || other.razorpayKeyId == razorpayKeyId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,razorpayKeyId,amount,currency,orderId);

@override
String toString() {
  return 'RazorpayOrderData(razorpayKeyId: $razorpayKeyId, amount: $amount, currency: $currency, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $RazorpayOrderDataCopyWith<$Res>  {
  factory $RazorpayOrderDataCopyWith(RazorpayOrderData value, $Res Function(RazorpayOrderData) _then) = _$RazorpayOrderDataCopyWithImpl;
@useResult
$Res call({
 String razorpayKeyId,@JsonKey(fromJson: _intFromJson) int amount, String currency, String orderId
});




}
/// @nodoc
class _$RazorpayOrderDataCopyWithImpl<$Res>
    implements $RazorpayOrderDataCopyWith<$Res> {
  _$RazorpayOrderDataCopyWithImpl(this._self, this._then);

  final RazorpayOrderData _self;
  final $Res Function(RazorpayOrderData) _then;

/// Create a copy of RazorpayOrderData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? razorpayKeyId = null,Object? amount = null,Object? currency = null,Object? orderId = null,}) {
  return _then(_self.copyWith(
razorpayKeyId: null == razorpayKeyId ? _self.razorpayKeyId : razorpayKeyId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RazorpayOrderData].
extension RazorpayOrderDataPatterns on RazorpayOrderData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RazorpayOrderData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RazorpayOrderData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RazorpayOrderData value)  $default,){
final _that = this;
switch (_that) {
case _RazorpayOrderData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RazorpayOrderData value)?  $default,){
final _that = this;
switch (_that) {
case _RazorpayOrderData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String razorpayKeyId, @JsonKey(fromJson: _intFromJson)  int amount,  String currency,  String orderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RazorpayOrderData() when $default != null:
return $default(_that.razorpayKeyId,_that.amount,_that.currency,_that.orderId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String razorpayKeyId, @JsonKey(fromJson: _intFromJson)  int amount,  String currency,  String orderId)  $default,) {final _that = this;
switch (_that) {
case _RazorpayOrderData():
return $default(_that.razorpayKeyId,_that.amount,_that.currency,_that.orderId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String razorpayKeyId, @JsonKey(fromJson: _intFromJson)  int amount,  String currency,  String orderId)?  $default,) {final _that = this;
switch (_that) {
case _RazorpayOrderData() when $default != null:
return $default(_that.razorpayKeyId,_that.amount,_that.currency,_that.orderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RazorpayOrderData implements RazorpayOrderData {
  const _RazorpayOrderData({required this.razorpayKeyId, @JsonKey(fromJson: _intFromJson) required this.amount, required this.currency, required this.orderId});
  factory _RazorpayOrderData.fromJson(Map<String, dynamic> json) => _$RazorpayOrderDataFromJson(json);

@override final  String razorpayKeyId;
@override@JsonKey(fromJson: _intFromJson) final  int amount;
@override final  String currency;
@override final  String orderId;

/// Create a copy of RazorpayOrderData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RazorpayOrderDataCopyWith<_RazorpayOrderData> get copyWith => __$RazorpayOrderDataCopyWithImpl<_RazorpayOrderData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RazorpayOrderDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RazorpayOrderData&&(identical(other.razorpayKeyId, razorpayKeyId) || other.razorpayKeyId == razorpayKeyId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,razorpayKeyId,amount,currency,orderId);

@override
String toString() {
  return 'RazorpayOrderData(razorpayKeyId: $razorpayKeyId, amount: $amount, currency: $currency, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$RazorpayOrderDataCopyWith<$Res> implements $RazorpayOrderDataCopyWith<$Res> {
  factory _$RazorpayOrderDataCopyWith(_RazorpayOrderData value, $Res Function(_RazorpayOrderData) _then) = __$RazorpayOrderDataCopyWithImpl;
@override @useResult
$Res call({
 String razorpayKeyId,@JsonKey(fromJson: _intFromJson) int amount, String currency, String orderId
});




}
/// @nodoc
class __$RazorpayOrderDataCopyWithImpl<$Res>
    implements _$RazorpayOrderDataCopyWith<$Res> {
  __$RazorpayOrderDataCopyWithImpl(this._self, this._then);

  final _RazorpayOrderData _self;
  final $Res Function(_RazorpayOrderData) _then;

/// Create a copy of RazorpayOrderData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? razorpayKeyId = null,Object? amount = null,Object? currency = null,Object? orderId = null,}) {
  return _then(_RazorpayOrderData(
razorpayKeyId: null == razorpayKeyId ? _self.razorpayKeyId : razorpayKeyId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$CreateRazorpayOrderResponse {

 bool get success; String get message; RazorpayOrderData get data;
/// Create a copy of CreateRazorpayOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateRazorpayOrderResponseCopyWith<CreateRazorpayOrderResponse> get copyWith => _$CreateRazorpayOrderResponseCopyWithImpl<CreateRazorpayOrderResponse>(this as CreateRazorpayOrderResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateRazorpayOrderResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CreateRazorpayOrderResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateRazorpayOrderResponseCopyWith<$Res>  {
  factory $CreateRazorpayOrderResponseCopyWith(CreateRazorpayOrderResponse value, $Res Function(CreateRazorpayOrderResponse) _then) = _$CreateRazorpayOrderResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, RazorpayOrderData data
});


$RazorpayOrderDataCopyWith<$Res> get data;

}
/// @nodoc
class _$CreateRazorpayOrderResponseCopyWithImpl<$Res>
    implements $CreateRazorpayOrderResponseCopyWith<$Res> {
  _$CreateRazorpayOrderResponseCopyWithImpl(this._self, this._then);

  final CreateRazorpayOrderResponse _self;
  final $Res Function(CreateRazorpayOrderResponse) _then;

/// Create a copy of CreateRazorpayOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RazorpayOrderData,
  ));
}
/// Create a copy of CreateRazorpayOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RazorpayOrderDataCopyWith<$Res> get data {
  
  return $RazorpayOrderDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateRazorpayOrderResponse].
extension CreateRazorpayOrderResponsePatterns on CreateRazorpayOrderResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateRazorpayOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateRazorpayOrderResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateRazorpayOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateRazorpayOrderResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateRazorpayOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateRazorpayOrderResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  RazorpayOrderData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateRazorpayOrderResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  RazorpayOrderData data)  $default,) {final _that = this;
switch (_that) {
case _CreateRazorpayOrderResponse():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  RazorpayOrderData data)?  $default,) {final _that = this;
switch (_that) {
case _CreateRazorpayOrderResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _CreateRazorpayOrderResponse implements CreateRazorpayOrderResponse {
  const _CreateRazorpayOrderResponse({required this.success, required this.message, required this.data});
  

@override final  bool success;
@override final  String message;
@override final  RazorpayOrderData data;

/// Create a copy of CreateRazorpayOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateRazorpayOrderResponseCopyWith<_CreateRazorpayOrderResponse> get copyWith => __$CreateRazorpayOrderResponseCopyWithImpl<_CreateRazorpayOrderResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateRazorpayOrderResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CreateRazorpayOrderResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CreateRazorpayOrderResponseCopyWith<$Res> implements $CreateRazorpayOrderResponseCopyWith<$Res> {
  factory _$CreateRazorpayOrderResponseCopyWith(_CreateRazorpayOrderResponse value, $Res Function(_CreateRazorpayOrderResponse) _then) = __$CreateRazorpayOrderResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, RazorpayOrderData data
});


@override $RazorpayOrderDataCopyWith<$Res> get data;

}
/// @nodoc
class __$CreateRazorpayOrderResponseCopyWithImpl<$Res>
    implements _$CreateRazorpayOrderResponseCopyWith<$Res> {
  __$CreateRazorpayOrderResponseCopyWithImpl(this._self, this._then);

  final _CreateRazorpayOrderResponse _self;
  final $Res Function(_CreateRazorpayOrderResponse) _then;

/// Create a copy of CreateRazorpayOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_CreateRazorpayOrderResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RazorpayOrderData,
  ));
}

/// Create a copy of CreateRazorpayOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RazorpayOrderDataCopyWith<$Res> get data {
  
  return $RazorpayOrderDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$VerifyPaymentResponse {

 bool get success; String get message;
/// Create a copy of VerifyPaymentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyPaymentResponseCopyWith<VerifyPaymentResponse> get copyWith => _$VerifyPaymentResponseCopyWithImpl<VerifyPaymentResponse>(this as VerifyPaymentResponse, _$identity);

  /// Serializes this VerifyPaymentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyPaymentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'VerifyPaymentResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $VerifyPaymentResponseCopyWith<$Res>  {
  factory $VerifyPaymentResponseCopyWith(VerifyPaymentResponse value, $Res Function(VerifyPaymentResponse) _then) = _$VerifyPaymentResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$VerifyPaymentResponseCopyWithImpl<$Res>
    implements $VerifyPaymentResponseCopyWith<$Res> {
  _$VerifyPaymentResponseCopyWithImpl(this._self, this._then);

  final VerifyPaymentResponse _self;
  final $Res Function(VerifyPaymentResponse) _then;

/// Create a copy of VerifyPaymentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyPaymentResponse].
extension VerifyPaymentResponsePatterns on VerifyPaymentResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyPaymentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyPaymentResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyPaymentResponse value)  $default,){
final _that = this;
switch (_that) {
case _VerifyPaymentResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyPaymentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyPaymentResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyPaymentResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message)  $default,) {final _that = this;
switch (_that) {
case _VerifyPaymentResponse():
return $default(_that.success,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message)?  $default,) {final _that = this;
switch (_that) {
case _VerifyPaymentResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyPaymentResponse implements VerifyPaymentResponse {
  const _VerifyPaymentResponse({required this.success, required this.message});
  factory _VerifyPaymentResponse.fromJson(Map<String, dynamic> json) => _$VerifyPaymentResponseFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of VerifyPaymentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyPaymentResponseCopyWith<_VerifyPaymentResponse> get copyWith => __$VerifyPaymentResponseCopyWithImpl<_VerifyPaymentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyPaymentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyPaymentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'VerifyPaymentResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$VerifyPaymentResponseCopyWith<$Res> implements $VerifyPaymentResponseCopyWith<$Res> {
  factory _$VerifyPaymentResponseCopyWith(_VerifyPaymentResponse value, $Res Function(_VerifyPaymentResponse) _then) = __$VerifyPaymentResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$VerifyPaymentResponseCopyWithImpl<$Res>
    implements _$VerifyPaymentResponseCopyWith<$Res> {
  __$VerifyPaymentResponseCopyWithImpl(this._self, this._then);

  final _VerifyPaymentResponse _self;
  final $Res Function(_VerifyPaymentResponse) _then;

/// Create a copy of VerifyPaymentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_VerifyPaymentResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TransactionModel {

@JsonKey(name: '_id') String get id; String get title; String get description;@JsonKey(fromJson: _doubleFromJson) double get amount; String get type;// 'credit' or 'debit'
 String get transactionType;// 'wallet_recharge', 'ride_fare', etc.
 String get status;// 'completed', etc.
 String get createdAt;
/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionModelCopyWith<TransactionModel> get copyWith => _$TransactionModelCopyWithImpl<TransactionModel>(this as TransactionModel, _$identity);

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,amount,type,transactionType,status,createdAt);

@override
String toString() {
  return 'TransactionModel(id: $id, title: $title, description: $description, amount: $amount, type: $type, transactionType: $transactionType, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TransactionModelCopyWith<$Res>  {
  factory $TransactionModelCopyWith(TransactionModel value, $Res Function(TransactionModel) _then) = _$TransactionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String title, String description,@JsonKey(fromJson: _doubleFromJson) double amount, String type, String transactionType, String status, String createdAt
});




}
/// @nodoc
class _$TransactionModelCopyWithImpl<$Res>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._self, this._then);

  final TransactionModel _self;
  final $Res Function(TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? amount = null,Object? type = null,Object? transactionType = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionModel].
extension TransactionModelPatterns on TransactionModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String title,  String description, @JsonKey(fromJson: _doubleFromJson)  double amount,  String type,  String transactionType,  String status,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.amount,_that.type,_that.transactionType,_that.status,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String title,  String description, @JsonKey(fromJson: _doubleFromJson)  double amount,  String type,  String transactionType,  String status,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TransactionModel():
return $default(_that.id,_that.title,_that.description,_that.amount,_that.type,_that.transactionType,_that.status,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String title,  String description, @JsonKey(fromJson: _doubleFromJson)  double amount,  String type,  String transactionType,  String status,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TransactionModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.amount,_that.type,_that.transactionType,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionModel implements TransactionModel {
  const _TransactionModel({@JsonKey(name: '_id') required this.id, required this.title, required this.description, @JsonKey(fromJson: _doubleFromJson) required this.amount, required this.type, required this.transactionType, required this.status, required this.createdAt});
  factory _TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String title;
@override final  String description;
@override@JsonKey(fromJson: _doubleFromJson) final  double amount;
@override final  String type;
// 'credit' or 'debit'
@override final  String transactionType;
// 'wallet_recharge', 'ride_fare', etc.
@override final  String status;
// 'completed', etc.
@override final  String createdAt;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionModelCopyWith<_TransactionModel> get copyWith => __$TransactionModelCopyWithImpl<_TransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,amount,type,transactionType,status,createdAt);

@override
String toString() {
  return 'TransactionModel(id: $id, title: $title, description: $description, amount: $amount, type: $type, transactionType: $transactionType, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionModelCopyWith<$Res> implements $TransactionModelCopyWith<$Res> {
  factory _$TransactionModelCopyWith(_TransactionModel value, $Res Function(_TransactionModel) _then) = __$TransactionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String title, String description,@JsonKey(fromJson: _doubleFromJson) double amount, String type, String transactionType, String status, String createdAt
});




}
/// @nodoc
class __$TransactionModelCopyWithImpl<$Res>
    implements _$TransactionModelCopyWith<$Res> {
  __$TransactionModelCopyWithImpl(this._self, this._then);

  final _TransactionModel _self;
  final $Res Function(_TransactionModel) _then;

/// Create a copy of TransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? amount = null,Object? type = null,Object? transactionType = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_TransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaginationData {

 int get total; int get page; int get limit; int get pages;
/// Create a copy of PaginationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginationDataCopyWith<PaginationData> get copyWith => _$PaginationDataCopyWithImpl<PaginationData>(this as PaginationData, _$identity);

  /// Serializes this PaginationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginationData&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.pages, pages) || other.pages == pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,pages);

@override
String toString() {
  return 'PaginationData(total: $total, page: $page, limit: $limit, pages: $pages)';
}


}

/// @nodoc
abstract mixin class $PaginationDataCopyWith<$Res>  {
  factory $PaginationDataCopyWith(PaginationData value, $Res Function(PaginationData) _then) = _$PaginationDataCopyWithImpl;
@useResult
$Res call({
 int total, int page, int limit, int pages
});




}
/// @nodoc
class _$PaginationDataCopyWithImpl<$Res>
    implements $PaginationDataCopyWith<$Res> {
  _$PaginationDataCopyWithImpl(this._self, this._then);

  final PaginationData _self;
  final $Res Function(PaginationData) _then;

/// Create a copy of PaginationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? pages = null,}) {
  return _then(_self.copyWith(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginationData].
extension PaginationDataPatterns on PaginationData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginationData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginationData value)  $default,){
final _that = this;
switch (_that) {
case _PaginationData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginationData value)?  $default,){
final _that = this;
switch (_that) {
case _PaginationData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int pages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginationData() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.pages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int total,  int page,  int limit,  int pages)  $default,) {final _that = this;
switch (_that) {
case _PaginationData():
return $default(_that.total,_that.page,_that.limit,_that.pages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int total,  int page,  int limit,  int pages)?  $default,) {final _that = this;
switch (_that) {
case _PaginationData() when $default != null:
return $default(_that.total,_that.page,_that.limit,_that.pages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginationData implements PaginationData {
  const _PaginationData({required this.total, required this.page, required this.limit, required this.pages});
  factory _PaginationData.fromJson(Map<String, dynamic> json) => _$PaginationDataFromJson(json);

@override final  int total;
@override final  int page;
@override final  int limit;
@override final  int pages;

/// Create a copy of PaginationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginationDataCopyWith<_PaginationData> get copyWith => __$PaginationDataCopyWithImpl<_PaginationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginationData&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.pages, pages) || other.pages == pages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,total,page,limit,pages);

@override
String toString() {
  return 'PaginationData(total: $total, page: $page, limit: $limit, pages: $pages)';
}


}

/// @nodoc
abstract mixin class _$PaginationDataCopyWith<$Res> implements $PaginationDataCopyWith<$Res> {
  factory _$PaginationDataCopyWith(_PaginationData value, $Res Function(_PaginationData) _then) = __$PaginationDataCopyWithImpl;
@override @useResult
$Res call({
 int total, int page, int limit, int pages
});




}
/// @nodoc
class __$PaginationDataCopyWithImpl<$Res>
    implements _$PaginationDataCopyWith<$Res> {
  __$PaginationDataCopyWithImpl(this._self, this._then);

  final _PaginationData _self;
  final $Res Function(_PaginationData) _then;

/// Create a copy of PaginationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? total = null,Object? page = null,Object? limit = null,Object? pages = null,}) {
  return _then(_PaginationData(
total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TransactionsResponse {

 bool get success; String get message; List<TransactionModel> get data; PaginationData get pagination;
/// Create a copy of TransactionsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsResponseCopyWith<TransactionsResponse> get copyWith => _$TransactionsResponseCopyWithImpl<TransactionsResponse>(this as TransactionsResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'TransactionsResponse(success: $success, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $TransactionsResponseCopyWith<$Res>  {
  factory $TransactionsResponseCopyWith(TransactionsResponse value, $Res Function(TransactionsResponse) _then) = _$TransactionsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<TransactionModel> data, PaginationData pagination
});


$PaginationDataCopyWith<$Res> get pagination;

}
/// @nodoc
class _$TransactionsResponseCopyWithImpl<$Res>
    implements $TransactionsResponseCopyWith<$Res> {
  _$TransactionsResponseCopyWithImpl(this._self, this._then);

  final TransactionsResponse _self;
  final $Res Function(TransactionsResponse) _then;

/// Create a copy of TransactionsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationData,
  ));
}
/// Create a copy of TransactionsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationDataCopyWith<$Res> get pagination {
  
  return $PaginationDataCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionsResponse].
extension TransactionsResponsePatterns on TransactionsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionsResponse value)  $default,){
final _that = this;
switch (_that) {
case _TransactionsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  List<TransactionModel> data,  PaginationData pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  List<TransactionModel> data,  PaginationData pagination)  $default,) {final _that = this;
switch (_that) {
case _TransactionsResponse():
return $default(_that.success,_that.message,_that.data,_that.pagination);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  List<TransactionModel> data,  PaginationData pagination)?  $default,) {final _that = this;
switch (_that) {
case _TransactionsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionsResponse implements TransactionsResponse {
  const _TransactionsResponse({required this.success, required this.message, required final  List<TransactionModel> data, required this.pagination}): _data = data;
  

@override final  bool success;
@override final  String message;
 final  List<TransactionModel> _data;
@override List<TransactionModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationData pagination;

/// Create a copy of TransactionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionsResponseCopyWith<_TransactionsResponse> get copyWith => __$TransactionsResponseCopyWithImpl<_TransactionsResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'TransactionsResponse(success: $success, message: $message, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$TransactionsResponseCopyWith<$Res> implements $TransactionsResponseCopyWith<$Res> {
  factory _$TransactionsResponseCopyWith(_TransactionsResponse value, $Res Function(_TransactionsResponse) _then) = __$TransactionsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<TransactionModel> data, PaginationData pagination
});


@override $PaginationDataCopyWith<$Res> get pagination;

}
/// @nodoc
class __$TransactionsResponseCopyWithImpl<$Res>
    implements _$TransactionsResponseCopyWith<$Res> {
  __$TransactionsResponseCopyWithImpl(this._self, this._then);

  final _TransactionsResponse _self;
  final $Res Function(_TransactionsResponse) _then;

/// Create a copy of TransactionsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,Object? pagination = null,}) {
  return _then(_TransactionsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TransactionModel>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationData,
  ));
}

/// Create a copy of TransactionsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationDataCopyWith<$Res> get pagination {
  
  return $PaginationDataCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// @nodoc
mixin _$BankAccountData {

@JsonKey(name: '_id') String get id;@JsonKey(fromJson: _driverIdFromJson) String get driverId; String get type;// "BankAccount" or "UPI"
 String? get bankName; String? get accountNumber; String? get accountHolderName; String? get ifscCode; String? get upiId;
/// Create a copy of BankAccountData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankAccountDataCopyWith<BankAccountData> get copyWith => _$BankAccountDataCopyWithImpl<BankAccountData>(this as BankAccountData, _$identity);

  /// Serializes this BankAccountData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankAccountData&&(identical(other.id, id) || other.id == id)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.type, type) || other.type == type)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.ifscCode, ifscCode) || other.ifscCode == ifscCode)&&(identical(other.upiId, upiId) || other.upiId == upiId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,driverId,type,bankName,accountNumber,accountHolderName,ifscCode,upiId);

@override
String toString() {
  return 'BankAccountData(id: $id, driverId: $driverId, type: $type, bankName: $bankName, accountNumber: $accountNumber, accountHolderName: $accountHolderName, ifscCode: $ifscCode, upiId: $upiId)';
}


}

/// @nodoc
abstract mixin class $BankAccountDataCopyWith<$Res>  {
  factory $BankAccountDataCopyWith(BankAccountData value, $Res Function(BankAccountData) _then) = _$BankAccountDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(fromJson: _driverIdFromJson) String driverId, String type, String? bankName, String? accountNumber, String? accountHolderName, String? ifscCode, String? upiId
});




}
/// @nodoc
class _$BankAccountDataCopyWithImpl<$Res>
    implements $BankAccountDataCopyWith<$Res> {
  _$BankAccountDataCopyWithImpl(this._self, this._then);

  final BankAccountData _self;
  final $Res Function(BankAccountData) _then;

/// Create a copy of BankAccountData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? driverId = null,Object? type = null,Object? bankName = freezed,Object? accountNumber = freezed,Object? accountHolderName = freezed,Object? ifscCode = freezed,Object? upiId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,ifscCode: freezed == ifscCode ? _self.ifscCode : ifscCode // ignore: cast_nullable_to_non_nullable
as String?,upiId: freezed == upiId ? _self.upiId : upiId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BankAccountData].
extension BankAccountDataPatterns on BankAccountData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankAccountData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankAccountData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankAccountData value)  $default,){
final _that = this;
switch (_that) {
case _BankAccountData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankAccountData value)?  $default,){
final _that = this;
switch (_that) {
case _BankAccountData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(fromJson: _driverIdFromJson)  String driverId,  String type,  String? bankName,  String? accountNumber,  String? accountHolderName,  String? ifscCode,  String? upiId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankAccountData() when $default != null:
return $default(_that.id,_that.driverId,_that.type,_that.bankName,_that.accountNumber,_that.accountHolderName,_that.ifscCode,_that.upiId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(fromJson: _driverIdFromJson)  String driverId,  String type,  String? bankName,  String? accountNumber,  String? accountHolderName,  String? ifscCode,  String? upiId)  $default,) {final _that = this;
switch (_that) {
case _BankAccountData():
return $default(_that.id,_that.driverId,_that.type,_that.bankName,_that.accountNumber,_that.accountHolderName,_that.ifscCode,_that.upiId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id, @JsonKey(fromJson: _driverIdFromJson)  String driverId,  String type,  String? bankName,  String? accountNumber,  String? accountHolderName,  String? ifscCode,  String? upiId)?  $default,) {final _that = this;
switch (_that) {
case _BankAccountData() when $default != null:
return $default(_that.id,_that.driverId,_that.type,_that.bankName,_that.accountNumber,_that.accountHolderName,_that.ifscCode,_that.upiId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BankAccountData implements BankAccountData {
  const _BankAccountData({@JsonKey(name: '_id') required this.id, @JsonKey(fromJson: _driverIdFromJson) required this.driverId, required this.type, this.bankName, this.accountNumber, this.accountHolderName, this.ifscCode, this.upiId});
  factory _BankAccountData.fromJson(Map<String, dynamic> json) => _$BankAccountDataFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey(fromJson: _driverIdFromJson) final  String driverId;
@override final  String type;
// "BankAccount" or "UPI"
@override final  String? bankName;
@override final  String? accountNumber;
@override final  String? accountHolderName;
@override final  String? ifscCode;
@override final  String? upiId;

/// Create a copy of BankAccountData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankAccountDataCopyWith<_BankAccountData> get copyWith => __$BankAccountDataCopyWithImpl<_BankAccountData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BankAccountDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankAccountData&&(identical(other.id, id) || other.id == id)&&(identical(other.driverId, driverId) || other.driverId == driverId)&&(identical(other.type, type) || other.type == type)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.ifscCode, ifscCode) || other.ifscCode == ifscCode)&&(identical(other.upiId, upiId) || other.upiId == upiId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,driverId,type,bankName,accountNumber,accountHolderName,ifscCode,upiId);

@override
String toString() {
  return 'BankAccountData(id: $id, driverId: $driverId, type: $type, bankName: $bankName, accountNumber: $accountNumber, accountHolderName: $accountHolderName, ifscCode: $ifscCode, upiId: $upiId)';
}


}

/// @nodoc
abstract mixin class _$BankAccountDataCopyWith<$Res> implements $BankAccountDataCopyWith<$Res> {
  factory _$BankAccountDataCopyWith(_BankAccountData value, $Res Function(_BankAccountData) _then) = __$BankAccountDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(fromJson: _driverIdFromJson) String driverId, String type, String? bankName, String? accountNumber, String? accountHolderName, String? ifscCode, String? upiId
});




}
/// @nodoc
class __$BankAccountDataCopyWithImpl<$Res>
    implements _$BankAccountDataCopyWith<$Res> {
  __$BankAccountDataCopyWithImpl(this._self, this._then);

  final _BankAccountData _self;
  final $Res Function(_BankAccountData) _then;

/// Create a copy of BankAccountData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? driverId = null,Object? type = null,Object? bankName = freezed,Object? accountNumber = freezed,Object? accountHolderName = freezed,Object? ifscCode = freezed,Object? upiId = freezed,}) {
  return _then(_BankAccountData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,driverId: null == driverId ? _self.driverId : driverId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,accountNumber: freezed == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String?,accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,ifscCode: freezed == ifscCode ? _self.ifscCode : ifscCode // ignore: cast_nullable_to_non_nullable
as String?,upiId: freezed == upiId ? _self.upiId : upiId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$GetBankAccountsResponse {

 bool get success; String get message; List<BankAccountData> get data;
/// Create a copy of GetBankAccountsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetBankAccountsResponseCopyWith<GetBankAccountsResponse> get copyWith => _$GetBankAccountsResponseCopyWithImpl<GetBankAccountsResponse>(this as GetBankAccountsResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetBankAccountsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GetBankAccountsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetBankAccountsResponseCopyWith<$Res>  {
  factory $GetBankAccountsResponseCopyWith(GetBankAccountsResponse value, $Res Function(GetBankAccountsResponse) _then) = _$GetBankAccountsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<BankAccountData> data
});




}
/// @nodoc
class _$GetBankAccountsResponseCopyWithImpl<$Res>
    implements $GetBankAccountsResponseCopyWith<$Res> {
  _$GetBankAccountsResponseCopyWithImpl(this._self, this._then);

  final GetBankAccountsResponse _self;
  final $Res Function(GetBankAccountsResponse) _then;

/// Create a copy of GetBankAccountsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<BankAccountData>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetBankAccountsResponse].
extension GetBankAccountsResponsePatterns on GetBankAccountsResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetBankAccountsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetBankAccountsResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetBankAccountsResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetBankAccountsResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetBankAccountsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetBankAccountsResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  List<BankAccountData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetBankAccountsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  List<BankAccountData> data)  $default,) {final _that = this;
switch (_that) {
case _GetBankAccountsResponse():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  List<BankAccountData> data)?  $default,) {final _that = this;
switch (_that) {
case _GetBankAccountsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _GetBankAccountsResponse implements GetBankAccountsResponse {
  const _GetBankAccountsResponse({required this.success, required this.message, required final  List<BankAccountData> data}): _data = data;
  

@override final  bool success;
@override final  String message;
 final  List<BankAccountData> _data;
@override List<BankAccountData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of GetBankAccountsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetBankAccountsResponseCopyWith<_GetBankAccountsResponse> get copyWith => __$GetBankAccountsResponseCopyWithImpl<_GetBankAccountsResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetBankAccountsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetBankAccountsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetBankAccountsResponseCopyWith<$Res> implements $GetBankAccountsResponseCopyWith<$Res> {
  factory _$GetBankAccountsResponseCopyWith(_GetBankAccountsResponse value, $Res Function(_GetBankAccountsResponse) _then) = __$GetBankAccountsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<BankAccountData> data
});




}
/// @nodoc
class __$GetBankAccountsResponseCopyWithImpl<$Res>
    implements _$GetBankAccountsResponseCopyWith<$Res> {
  __$GetBankAccountsResponseCopyWithImpl(this._self, this._then);

  final _GetBankAccountsResponse _self;
  final $Res Function(_GetBankAccountsResponse) _then;

/// Create a copy of GetBankAccountsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_GetBankAccountsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<BankAccountData>,
  ));
}


}

/// @nodoc
mixin _$BankAccountAddResp {

 bool get success; String get message; BankAccountData get data;
/// Create a copy of BankAccountAddResp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankAccountAddRespCopyWith<BankAccountAddResp> get copyWith => _$BankAccountAddRespCopyWithImpl<BankAccountAddResp>(this as BankAccountAddResp, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankAccountAddResp&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BankAccountAddResp(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $BankAccountAddRespCopyWith<$Res>  {
  factory $BankAccountAddRespCopyWith(BankAccountAddResp value, $Res Function(BankAccountAddResp) _then) = _$BankAccountAddRespCopyWithImpl;
@useResult
$Res call({
 bool success, String message, BankAccountData data
});


$BankAccountDataCopyWith<$Res> get data;

}
/// @nodoc
class _$BankAccountAddRespCopyWithImpl<$Res>
    implements $BankAccountAddRespCopyWith<$Res> {
  _$BankAccountAddRespCopyWithImpl(this._self, this._then);

  final BankAccountAddResp _self;
  final $Res Function(BankAccountAddResp) _then;

/// Create a copy of BankAccountAddResp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BankAccountData,
  ));
}
/// Create a copy of BankAccountAddResp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BankAccountDataCopyWith<$Res> get data {
  
  return $BankAccountDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BankAccountAddResp].
extension BankAccountAddRespPatterns on BankAccountAddResp {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankAccountAddResp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankAccountAddResp() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankAccountAddResp value)  $default,){
final _that = this;
switch (_that) {
case _BankAccountAddResp():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankAccountAddResp value)?  $default,){
final _that = this;
switch (_that) {
case _BankAccountAddResp() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  BankAccountData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankAccountAddResp() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  BankAccountData data)  $default,) {final _that = this;
switch (_that) {
case _BankAccountAddResp():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  BankAccountData data)?  $default,) {final _that = this;
switch (_that) {
case _BankAccountAddResp() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _BankAccountAddResp implements BankAccountAddResp {
  const _BankAccountAddResp({required this.success, required this.message, required this.data});
  

@override final  bool success;
@override final  String message;
@override final  BankAccountData data;

/// Create a copy of BankAccountAddResp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankAccountAddRespCopyWith<_BankAccountAddResp> get copyWith => __$BankAccountAddRespCopyWithImpl<_BankAccountAddResp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankAccountAddResp&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BankAccountAddResp(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BankAccountAddRespCopyWith<$Res> implements $BankAccountAddRespCopyWith<$Res> {
  factory _$BankAccountAddRespCopyWith(_BankAccountAddResp value, $Res Function(_BankAccountAddResp) _then) = __$BankAccountAddRespCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, BankAccountData data
});


@override $BankAccountDataCopyWith<$Res> get data;

}
/// @nodoc
class __$BankAccountAddRespCopyWithImpl<$Res>
    implements _$BankAccountAddRespCopyWith<$Res> {
  __$BankAccountAddRespCopyWithImpl(this._self, this._then);

  final _BankAccountAddResp _self;
  final $Res Function(_BankAccountAddResp) _then;

/// Create a copy of BankAccountAddResp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_BankAccountAddResp(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BankAccountData,
  ));
}

/// Create a copy of BankAccountAddResp
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BankAccountDataCopyWith<$Res> get data {
  
  return $BankAccountDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CommonResponse {

 bool get success; String get message;
/// Create a copy of CommonResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommonResponseCopyWith<CommonResponse> get copyWith => _$CommonResponseCopyWithImpl<CommonResponse>(this as CommonResponse, _$identity);

  /// Serializes this CommonResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommonResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'CommonResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $CommonResponseCopyWith<$Res>  {
  factory $CommonResponseCopyWith(CommonResponse value, $Res Function(CommonResponse) _then) = _$CommonResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$CommonResponseCopyWithImpl<$Res>
    implements $CommonResponseCopyWith<$Res> {
  _$CommonResponseCopyWithImpl(this._self, this._then);

  final CommonResponse _self;
  final $Res Function(CommonResponse) _then;

/// Create a copy of CommonResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CommonResponse].
extension CommonResponsePatterns on CommonResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommonResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommonResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommonResponse value)  $default,){
final _that = this;
switch (_that) {
case _CommonResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommonResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CommonResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommonResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message)  $default,) {final _that = this;
switch (_that) {
case _CommonResponse():
return $default(_that.success,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message)?  $default,) {final _that = this;
switch (_that) {
case _CommonResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommonResponse implements CommonResponse {
  const _CommonResponse({required this.success, required this.message});
  factory _CommonResponse.fromJson(Map<String, dynamic> json) => _$CommonResponseFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of CommonResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommonResponseCopyWith<_CommonResponse> get copyWith => __$CommonResponseCopyWithImpl<_CommonResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommonResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommonResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'CommonResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CommonResponseCopyWith<$Res> implements $CommonResponseCopyWith<$Res> {
  factory _$CommonResponseCopyWith(_CommonResponse value, $Res Function(_CommonResponse) _then) = __$CommonResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$CommonResponseCopyWithImpl<$Res>
    implements _$CommonResponseCopyWith<$Res> {
  __$CommonResponseCopyWithImpl(this._self, this._then);

  final _CommonResponse _self;
  final $Res Function(_CommonResponse) _then;

/// Create a copy of CommonResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_CommonResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
