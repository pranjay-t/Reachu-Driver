// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider to check if there are pending tutorials for the driver

@ProviderFor(PendingTutorialsNotifier)
final pendingTutorialsProvider = PendingTutorialsNotifierProvider._();

/// Provider to check if there are pending tutorials for the driver
final class PendingTutorialsNotifierProvider
    extends $AsyncNotifierProvider<PendingTutorialsNotifier, bool> {
  /// Provider to check if there are pending tutorials for the driver
  PendingTutorialsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingTutorialsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingTutorialsNotifierHash();

  @$internal
  @override
  PendingTutorialsNotifier create() => PendingTutorialsNotifier();
}

String _$pendingTutorialsNotifierHash() =>
    r'fa53bd20f0c9181c1936d24fbbed875da6bcbbdc';

/// Provider to check if there are pending tutorials for the driver

abstract class _$PendingTutorialsNotifier extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Controller managing mandatory tutorials list and watch actions

@ProviderFor(TutorialsController)
final tutorialsControllerProvider = TutorialsControllerProvider._();

/// Controller managing mandatory tutorials list and watch actions
final class TutorialsControllerProvider
    extends $AsyncNotifierProvider<TutorialsController, List<TutorialModel>> {
  /// Controller managing mandatory tutorials list and watch actions
  TutorialsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tutorialsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tutorialsControllerHash();

  @$internal
  @override
  TutorialsController create() => TutorialsController();
}

String _$tutorialsControllerHash() =>
    r'ddebb8994bf8710949beb7acbca9a8ce5446192d';

/// Controller managing mandatory tutorials list and watch actions

abstract class _$TutorialsController
    extends $AsyncNotifier<List<TutorialModel>> {
  FutureOr<List<TutorialModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<TutorialModel>>, List<TutorialModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TutorialModel>>, List<TutorialModel>>,
              AsyncValue<List<TutorialModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
