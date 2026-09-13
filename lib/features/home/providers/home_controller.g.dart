// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeController)
final homeControllerProvider = HomeControllerProvider._();

final class HomeControllerProvider
    extends $AsyncNotifierProvider<HomeController, HomeData> {
  HomeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeControllerHash();

  @$internal
  @override
  HomeController create() => HomeController();
}

String _$homeControllerHash() => r'9c7ccc7ebf0145bae1ceefcf75c51af3ced4850b';

abstract class _$HomeController extends $AsyncNotifier<HomeData> {
  FutureOr<HomeData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HomeData>, HomeData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeData>, HomeData>,
              AsyncValue<HomeData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
