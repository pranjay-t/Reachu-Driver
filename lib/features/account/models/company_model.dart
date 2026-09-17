class CompanyData {
  final String id;
  final String companyName;
  final String aboutUs;
  final String privacyPolicy;
  final String termAndCondition;
  final String contactNumber;
  final String whatsappNumber;
  final String supportEmail;
  final String timing;
  final String website;
  final String address;
  final String? insuranceLink;
  final String? bucketUrl;
  final String? tdsDeclaration;

  CompanyData({
    required this.id,
    required this.companyName,
    required this.aboutUs,
    required this.privacyPolicy,
    required this.termAndCondition,
    required this.contactNumber,
    required this.whatsappNumber,
    required this.supportEmail,
    required this.timing,
    required this.website,
    required this.address,
    this.insuranceLink,
    this.bucketUrl,
    this.tdsDeclaration,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      id: (json['_id'] ?? '').toString(),
      companyName: (json['companyName'] ?? '').toString(),
      aboutUs: (json['aboutUs'] ?? '').toString(),
      privacyPolicy: (json['privacyPolicy'] ?? '').toString(),
      termAndCondition: (json['termAndCondition'] ?? '').toString(),
      contactNumber: (json['contactNumber'] ?? '').toString(),
      whatsappNumber: (json['whatsappNumber'] ?? json['contactNumber'] ?? '').toString(),
      supportEmail: (json['supportEmail'] ?? '').toString(),
      timing: (json['timing'] ?? '').toString(),
      website: (json['website'] ?? '').toString(),
      address: (json['address'] ?? '').toString(),
      insuranceLink: json['insuranceLink']?.toString(),
      bucketUrl: (json['bucketUrl'] ?? json['imageBaseUrl'] ?? json['cdnUrl'])?.toString(),
      tdsDeclaration: json['tdsDeclaration']?.toString(),
    );
  }
}
