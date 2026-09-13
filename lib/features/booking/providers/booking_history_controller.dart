import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/network/result.dart';
import '../repositories/booking_repository.dart';

part 'booking_history_controller.g.dart';

class BookingHistoryState {
  final List<Map<String, dynamic>> rides;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;
  final bool isRefreshing;
  final String? filterStatus;

  BookingHistoryState({
    required this.rides,
    required this.currentPage,
    required this.hasMore,
    required this.isLoadingMore,
    required this.isRefreshing,
    required this.filterStatus,
  });

  BookingHistoryState copyWith({
    List<Map<String, dynamic>>? rides,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
    bool? isRefreshing,
    String? filterStatus,
  }) {
    return BookingHistoryState(
      rides: rides ?? this.rides,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      filterStatus: filterStatus ?? this.filterStatus,
    );
  }
}

@riverpod
class BookingHistoryController extends _$BookingHistoryController {
  @override
  Future<BookingHistoryState> build() async {
    return _fetchInitial();
  }

  Future<BookingHistoryState> _fetchInitial({String? status}) async {
    final repository = ref.read(bookingRepositoryProvider);
    final result = await repository.getDriverHistory(
      page: 1,
      limit: 5,
      status: status,
    );

    switch (result) {
      case Success(:final data):
        if (data.success) {
          return BookingHistoryState(
            rides: data.data,
            currentPage: data.pagination.page,
            hasMore: data.pagination.page < data.pagination.pages,
            isLoadingMore: false,
            isRefreshing: false,
            filterStatus: status,
          );
        } else {
          throw Exception(data.message);
        }
      case Failure(:final error):
        throw Exception(NetworkExceptions.getErrorMessage(error));
    }
  }

  Future<void> fetchNextPage() async {
    final currentState = state.value;
    if (currentState == null || !currentState.hasMore || currentState.isLoadingMore) {
      return;
    }

    // Set loading more state
    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));

    try {
      final repository = ref.read(bookingRepositoryProvider);
      final nextPage = currentState.currentPage + 1;
      final result = await repository.getDriverHistory(
        page: nextPage,
        limit: 5,
        status: currentState.filterStatus,
      );

      state = switch (result) {
        Success(:final data) => (() {
            if (data.success) {
              return AsyncValue.data(currentState.copyWith(
                rides: [...currentState.rides, ...data.data],
                currentPage: data.pagination.page,
                hasMore: data.pagination.page < data.pagination.pages,
                isLoadingMore: false,
              ));
            } else {
              throw Exception(data.message);
            }
          })(),
        Failure(:final error) => throw Exception(NetworkExceptions.getErrorMessage(error)),
      };
    } catch (e) {
      state = AsyncValue.data(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> filterByStatus(String? status) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchInitial(status: status));
  }

  Future<void> refresh() async {
    final currentStatus = state.value?.filterStatus;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchInitial(status: currentStatus));
  }
}
