import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'maintenance_update_provider.freezed.dart';
part 'maintenance_update_provider.g.dart';

enum UpdateStatus {
  @JsonValue('NOTHING')
  nothing,
  @JsonValue('FORCED')
  forced,
  @JsonValue('FLEXIBLE')
  flexible,
}

enum UpdateType {
  @JsonValue('MAINTENANCE_UPDATE')
  maintenanceUpdate,
  @JsonValue('APPLICATION_UPDATE')
  applicationUpdate,
}

@freezed
abstract class MaintenanceUpdateState with _$MaintenanceUpdateState {
  const factory MaintenanceUpdateState({
    @Default(UpdateStatus.nothing) UpdateStatus updateStatus,
    String? appVersion,
    @Default(UpdateType.maintenanceUpdate) UpdateType type,
    @Default(false) bool maintenanceStatus,
    String? maintenanceEndTime,
    @Default(false) bool hasPromptedFlexibleUpdate,
  }) = _MaintenanceUpdateState;

  factory MaintenanceUpdateState.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceUpdateStateFromJson(json);
}

@Riverpod(keepAlive: true)
class MaintenanceUpdateNotifier extends _$MaintenanceUpdateNotifier {
  @override
  MaintenanceUpdateState build() {
    return const MaintenanceUpdateState();
  }

  void updateFromResponse(Map<String, dynamic> cacheJson) {
    try {
      final newState = MaintenanceUpdateState.fromJson(cacheJson);
      // Keep hasPromptedFlexibleUpdate if it was already prompted for this same version
      final keepPrompted = state.appVersion == newState.appVersion && state.hasPromptedFlexibleUpdate;
      state = newState.copyWith(hasPromptedFlexibleUpdate: keepPrompted);
    } catch (e) {
      // Gracefully handle parsing errors to not crash the app
    }
  }

  void dismissFlexiblePrompt() {
    state = state.copyWith(hasPromptedFlexibleUpdate: true);
  }
}
