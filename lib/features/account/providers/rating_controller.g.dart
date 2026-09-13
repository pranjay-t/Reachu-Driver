// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RatingController)
final ratingControllerProvider = RatingControllerProvider._();

final class RatingControllerProvider
    extends $AsyncNotifierProvider<RatingController, List<ReviewRating>> {
  RatingControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ratingControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ratingControllerHash();

  @$internal
  @override
  RatingController create() => RatingController();
}

String _$ratingControllerHash() => r'8d42068111cced012e588fdbd68a95d790e77be4';

abstract class _$RatingController extends $AsyncNotifier<List<ReviewRating>> {
  FutureOr<List<ReviewRating>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ReviewRating>>, List<ReviewRating>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ReviewRating>>, List<ReviewRating>>,
              AsyncValue<List<ReviewRating>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
