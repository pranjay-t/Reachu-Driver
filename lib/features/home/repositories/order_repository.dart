import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/result.dart';

part 'order_repository.g.dart';

@riverpod
OrderRepository orderRepository(Ref ref) {
  return OrderRepository(ref.watch(apiServiceProvider));
}

class OrderRepository {
  final ApiService _apiService;

  OrderRepository(this._apiService);

  Future<ApiResult<Map<String, dynamic>>> getCurrentOrder() async {
    return _apiService.get(
      ApiPath.getCurrentOrder,
      converter: (data) => data as Map<String, dynamic>,
    );
  }
}
