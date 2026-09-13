import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/company_model.dart';
import '../repositories/company_repository.dart';
import '../../../core/network/result.dart';
import '../../../core/network/network_exceptions.dart';

part 'company_controller.g.dart';

@riverpod
Future<CompanyData> companyController(Ref ref) async {
  final repository = ref.watch(companyRepositoryProvider);
  final result = await repository.getCompanyDetails();

  switch (result) {
    case Success(:final data):
      return data;
    case Failure(:final error):
      throw Exception(NetworkExceptions.getErrorMessage(error));
  }
}
