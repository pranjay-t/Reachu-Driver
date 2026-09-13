// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_update_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceUpdateState _$MaintenanceUpdateStateFromJson(
  Map<String, dynamic> json,
) => _MaintenanceUpdateState(
  updateStatus:
      $enumDecodeNullable(_$UpdateStatusEnumMap, json['updateStatus']) ??
      UpdateStatus.nothing,
  appVersion: json['appVersion'] as String?,
  type:
      $enumDecodeNullable(_$UpdateTypeEnumMap, json['type']) ??
      UpdateType.maintenanceUpdate,
  maintenanceStatus: json['maintenanceStatus'] as bool? ?? false,
  maintenanceEndTime: json['maintenanceEndTime'] as String?,
  hasPromptedFlexibleUpdate:
      json['hasPromptedFlexibleUpdate'] as bool? ?? false,
);

Map<String, dynamic> _$MaintenanceUpdateStateToJson(
  _MaintenanceUpdateState instance,
) => <String, dynamic>{
  'updateStatus': _$UpdateStatusEnumMap[instance.updateStatus]!,
  'appVersion': instance.appVersion,
  'type': _$UpdateTypeEnumMap[instance.type]!,
  'maintenanceStatus': instance.maintenanceStatus,
  'maintenanceEndTime': instance.maintenanceEndTime,
  'hasPromptedFlexibleUpdate': instance.hasPromptedFlexibleUpdate,
};

const _$UpdateStatusEnumMap = {
  UpdateStatus.nothing: 'NOTHING',
  UpdateStatus.forced: 'FORCED',
  UpdateStatus.flexible: 'FLEXIBLE',
};

const _$UpdateTypeEnumMap = {
  UpdateType.maintenanceUpdate: 'MAINTENANCE_UPDATE',
  UpdateType.applicationUpdate: 'APPLICATION_UPDATE',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MaintenanceUpdateNotifier)
final maintenanceUpdateProvider = MaintenanceUpdateNotifierProvider._();

final class MaintenanceUpdateNotifierProvider
    extends
        $NotifierProvider<MaintenanceUpdateNotifier, MaintenanceUpdateState> {
  MaintenanceUpdateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'maintenanceUpdateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$maintenanceUpdateNotifierHash();

  @$internal
  @override
  MaintenanceUpdateNotifier create() => MaintenanceUpdateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MaintenanceUpdateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MaintenanceUpdateState>(value),
    );
  }
}

String _$maintenanceUpdateNotifierHash() =>
    r'4fc4307a8e4d24b1ec3d6555ed8aa039af0cd8e2';

abstract class _$MaintenanceUpdateNotifier
    extends $Notifier<MaintenanceUpdateState> {
  MaintenanceUpdateState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<MaintenanceUpdateState, MaintenanceUpdateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MaintenanceUpdateState, MaintenanceUpdateState>,
              MaintenanceUpdateState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
