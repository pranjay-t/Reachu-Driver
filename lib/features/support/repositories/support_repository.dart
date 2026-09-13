import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/result.dart';
import '../models/ticket_model.dart';
import '../models/support_message_model.dart';
import '../models/faq_category_responses.dart';
import '../models/get_by_category_response.dart';

part 'support_repository.g.dart';

@riverpod
SupportRepository supportRepository(Ref ref) {
  return SupportRepository(ref.watch(apiServiceProvider));
}

class SupportRepository {
  final ApiService _apiService;

  SupportRepository(this._apiService);

  Future<ApiResult<SupportTicketResponse>> createTicket({
    required String category,
    required String subject,
    String? relatedOrderId,
    String? message,
  }) async {
    final data = {
      'category': category,
      'subject': subject,
      if (relatedOrderId != null && relatedOrderId.isNotEmpty) 'relatedOrderId': relatedOrderId,
      if (message != null && message.isNotEmpty) 'message': message,
    };

    return _apiService.post(
      '/support/ticket',
      data: data,
      converter: (data) =>
          SupportTicketResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<SupportTicketListResponse>> getTickets({
    int page = 1,
    int limit = 20,
  }) async {
    return _apiService.get(
      '/support/tickets',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
      converter: (data) =>
          SupportTicketListResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<SupportMessageListResponse>> getMessages({
    required String ticketId,
    int page = 1,
    int limit = 50,
  }) async {
    return _apiService.get(
      '/support/ticket/messages/$ticketId',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
      converter: (data) =>
          SupportMessageListResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<bool>> rateTicket({
    required String ticketId,
    required double rating,
    String? comment,
  }) async {
    final data = {
      'rating': rating,
      if (comment != null && comment.isNotEmpty) 'comment': comment,
    };

    return _apiService.post(
      '/support/ticket/rate/$ticketId',
      data: data,
      converter: (data) {
        if (data is Map) {
          return data['success'] as bool? ?? false;
        }
        return false;
      },
    );
  }

  Future<ApiResult<bool>> sendMessageFallback({
    required String ticketId,
    required String message,
    String messageType = 'text',
  }) async {
    final data = {
      'message': message,
      'messageType': messageType,
    };

    return _apiService.post(
      '/support/ticket/message/$ticketId',
      data: data,
      converter: (data) {
        if (data is Map) {
          return data['success'] as bool? ?? false;
        }
        return false;
      },
    );
  }

  Future<ApiResult<FaqsCategoriesResponse>> getFaqCategories() async {
    return _apiService.get(
      ApiEndpoints.getAllCategories,
      converter: (data) =>
          FaqsCategoriesResponse.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<ApiResult<GetByCategoryResponse>> getFaqsByCategory(String category) async {
    return _apiService.get(
      ApiEndpoints.getByCategory(category),
      converter: (data) =>
          GetByCategoryResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
