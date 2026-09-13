// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_history_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookingHistoryController)
final bookingHistoryControllerProvider = BookingHistoryControllerProvider._();

final class BookingHistoryControllerProvider
    extends
        $AsyncNotifierProvider<BookingHistoryController, BookingHistoryState> {
  BookingHistoryControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bookingHistoryControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bookingHistoryControllerHash();

  @$internal
  @override
  BookingHistoryController create() => BookingHistoryController();
}

String _$bookingHistoryControllerHash() =>
    r'96e78a27a3af6a3d23dcc6cb7779df4a33d7536a';

abstract class _$BookingHistoryController
    extends $AsyncNotifier<BookingHistoryState> {
  FutureOr<BookingHistoryState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<BookingHistoryState>, BookingHistoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BookingHistoryState>, BookingHistoryState>,
              AsyncValue<BookingHistoryState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
