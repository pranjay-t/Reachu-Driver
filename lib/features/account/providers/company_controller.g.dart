// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(companyController)
final companyControllerProvider = CompanyControllerProvider._();

final class CompanyControllerProvider
    extends
        $FunctionalProvider<
          AsyncValue<CompanyData>,
          CompanyData,
          FutureOr<CompanyData>
        >
    with $FutureModifier<CompanyData>, $FutureProvider<CompanyData> {
  CompanyControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyControllerHash();

  @$internal
  @override
  $FutureProviderElement<CompanyData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CompanyData> create(Ref ref) {
    return companyController(ref);
  }
}

String _$companyControllerHash() => r'01fa33e97c434decdccb6b2cd862a70203063cea';
