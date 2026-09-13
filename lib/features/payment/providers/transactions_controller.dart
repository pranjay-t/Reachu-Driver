import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/network_exceptions.dart';
import '../../../core/network/result.dart';
import '../../account/providers/profile_controller.dart';
import '../models/payment_models.dart';
import '../repositories/payment_repository.dart';

part 'transactions_controller.g.dart';

class TransactionsState {
  final List<TransactionModel> transactions;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;
  final bool isRefreshing;

  TransactionsState({
    required this.transactions,
    required this.currentPage,
    required this.hasMore,
    required this.isLoadingMore,
    required this.isRefreshing,
  });

  TransactionsState copyWith({
    List<TransactionModel>? transactions,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
    bool? isRefreshing,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isRefreshing: isRefreshing ?? this.isRefreshing,
    );
  }
}

@riverpod
class TransactionsController extends _$TransactionsController {
  @override
  Future<TransactionsState> build() async {
    return _fetchInitial();
  }

  Future<TransactionsState> _fetchInitial() async {
    try {
      print('DEBUG: TransactionsController._fetchInitial started');
      final profile = await ref.read(profileControllerProvider.future);
      print('DEBUG: TransactionsController: Profile loaded with ID: ${profile.id}');
      
      final repository = ref.read(paymentRepositoryProvider);
      print('DEBUG: TransactionsController: Fetching transactions from repository...');
      final result = await repository.getTransactions(
        userId: profile.id,
        page: 1,
        limit: 15,
      );
      print('DEBUG: TransactionsController: Repository getTransactions result: $result');

      switch (result) {
        case Success(:final data):
          print('DEBUG: TransactionsController: Success fetching data, count: ${data.data.length}');
          if (data.success) {
            return TransactionsState(
              transactions: data.data,
              currentPage: data.pagination.page,
              hasMore: data.pagination.page < data.pagination.pages,
              isLoadingMore: false,
              isRefreshing: false,
            );
          } else {
            throw Exception(data.message);
          }
        case Failure(:final error):
          final errorMessage = NetworkExceptions.getErrorMessage(error);
          print('DEBUG: TransactionsController: Failure with error: $errorMessage');
          throw Exception(errorMessage);
      }
    } catch (e, stack) {
      print('DEBUG: TransactionsController: Exception in _fetchInitial: $e\n$stack');
      rethrow;
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
      final profile = await ref.read(profileControllerProvider.future);
      final repository = ref.read(paymentRepositoryProvider);
      
      final nextPage = currentState.currentPage + 1;
      final result = await repository.getTransactions(
        userId: profile.id,
        page: nextPage,
        limit: 15,
      );

      state = switch (result) {
        Success(:final data) => (() {
            if (data.success) {
              return AsyncValue.data(currentState.copyWith(
                transactions: [...currentState.transactions, ...data.data],
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

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchInitial());
  }
}
