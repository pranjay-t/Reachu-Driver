import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/company_bucket_url.dart';
import '../../../core/network/result.dart';
import '../models/company_model.dart';

part 'company_repository.g.dart';

@riverpod
CompanyRepository companyRepository(Ref ref) {
  return CompanyRepository(ref.watch(apiServiceProvider));
}

class CompanyRepository {
  final ApiService _apiService;

  CompanyRepository(this._apiService);

  Future<ApiResult<CompanyData>> getCompanyDetails() async {
    return _apiService.get(
      ApiEndpoints.getCompany, 
      converter: (data) {
        final Map<String, dynamic> responseMap = data as Map<String, dynamic>;
        final dataMap = (responseMap['data'] is Map<String, dynamic>)
            ? responseMap['data'] as Map<String, dynamic>
            : responseMap;
        final companyData = CompanyData.fromJson(dataMap);
        final bucketUrl = companyData.bucketUrl ??
            dataMap['bucketUrl']?.toString() ??
            dataMap['imageBaseUrl']?.toString();
        if (bucketUrl != null && bucketUrl.isNotEmpty) {
          CompanyBucketUrl.update(bucketUrl);
        }
        return companyData;
      },
    );
  }
}
