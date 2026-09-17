// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tutorialRepository)
final tutorialRepositoryProvider = TutorialRepositoryProvider._();

final class TutorialRepositoryProvider
    extends
        $FunctionalProvider<
          TutorialRepository,
          TutorialRepository,
          TutorialRepository
        >
    with $Provider<TutorialRepository> {
  TutorialRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tutorialRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tutorialRepositoryHash();

  @$internal
  @override
  $ProviderElement<TutorialRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TutorialRepository create(Ref ref) {
    return tutorialRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TutorialRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TutorialRepository>(value),
    );
  }
}

String _$tutorialRepositoryHash() =>
    r'6427b7223893e2b4ec0bf621f9c829ce18849bd5';
