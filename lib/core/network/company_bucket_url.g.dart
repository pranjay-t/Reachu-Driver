// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_bucket_url.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(companyBucketUrl)
final companyBucketUrlProvider = CompanyBucketUrlProvider._();

final class CompanyBucketUrlProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  CompanyBucketUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'companyBucketUrlProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$companyBucketUrlHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return companyBucketUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$companyBucketUrlHash() => r'4571e6cab9855757c41d629589119637b2725d93';
