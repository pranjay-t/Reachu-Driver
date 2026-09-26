// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get account => 'ଆକାଉଣ୍ଟ';

  @override
  String get editProfile => 'ପ୍ରୋଫାଇଲ୍ ସମ୍ପାଦନା କରନ୍ତୁ';

  @override
  String get logout => 'ଲଗଆଉଟ୍';

  @override
  String get language => 'ଭାଷା';

  @override
  String get selectLanguage => 'ଭାଷା ବାଛନ୍ତୁ';

  @override
  String get english => 'English (ଇଂରାଜୀ)';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'ଯାନ ବାଛନ୍ତୁ';

  @override
  String get selectAVehicle => 'ଗୋଟିଏ ଯାନ ବାଛନ୍ତୁ';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName ସହିତ ଆଗକୁ ବଢ଼ନ୍ତୁ';
  }

  @override
  String get addStop => 'ଷ୍ଟପ୍ ଯୋଡନ୍ତୁ';

  @override
  String get editLocations => 'ସ୍ଥାନ ସମ୍ପାଦନା କରନ୍ତୁ';

  @override
  String get noPickupLocationSet => 'କୌଣସି ପିକଅପ୍ ସ୍ଥାନ ସେଟ୍ ହୋଇନାହିଁ';

  @override
  String get noDropLocationSet => 'କୌଣସି ଡ୍ରପ୍ ସ୍ଥାନ ସେଟ୍ ହୋଇନାହିଁ';

  @override
  String get addDrop => 'ଡ୍ରପ୍ ଯୋଡନ୍ତୁ';

  @override
  String get errorLoadingVehicles => 'ଯାନ ଲୋଡ୍ କରିବାରେ ତ୍ରୁଟି';

  @override
  String get selectGoodsType => 'ମାଲର ପ୍ରକାର ବାଛନ୍ତୁ';

  @override
  String get whatAreYouShipping => 'ଆପଣ କଣ ପଠାଉଛନ୍ତି?';

  @override
  String get chooseCategoryBestMatches =>
      'ଯେଉଁ ବର୍ଗ ଆପଣଙ୍କ ମାଲ ସହିତ ସବୁଠାରୁ ମେଳ ଖାଏ ତାହା ବାଛନ୍ତୁ';

  @override
  String get editGoodsDetails => 'ମାଲର ବିବରଣୀ ସମ୍ପାଦନା କରନ୍ତୁ';

  @override
  String get weightKgMax90 => 'ଓଜନ (କି.ଗ୍ରା.) - ସର୍ବାଧିକ ୯୦ କି.ଗ୍ରା.';

  @override
  String get weightInvalidError => 'ଓଜନ ୧ ରୁ ୯୦ କି.ଗ୍ରା. ମଧ୍ୟରେ ହେବା ଉଚିତ';

  @override
  String get numberOfPackages => 'ପ୍ୟାକେଜ୍ ସଂଖ୍ୟା';

  @override
  String get worthValueRupees => 'ମୂଲ୍ୟ / ଦାମ (ଟଙ୍କା)';

  @override
  String get done => 'ହୋଇଗଲା';

  @override
  String get confirmGoodsDetails => 'ମାଲର ବିବରଣୀ ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get failedToLoadCategories => 'ବର୍ଗ ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get disclaimerTitle => 'ଅସ୍ୱୀକାର';

  @override
  String get disclaimerText =>
      'ଅସ୍ୱୀକାର: ମୁଁ ଘୋଷଣା କରୁଛି ଯେ ପରିବହନ କରାଯାଉଥିବା ମାଲ ଅଣ-ବିପଦଜନକ, ଆଇନଗତ ଏବଂ ବଛାଯାଇଥିବା ବର୍ଗର। ନିଷେଧିତ ବସ୍ତୁ ପରିବହନ ପାଇଁ କମ୍ପାନୀ ଦାୟୀ ନୁହେଁ। ଓଜନ ଯାନର ସର୍ବାଧିକ ଧାରଣ କ୍ଷମତା ଅତିକ୍ରମ କରିବା ଉଚିତ୍ ନୁହେଁ।';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight କି.ଗ୍ରା. • $packages ପ୍ୟାକେଜ୍ • ₹$worth';
  }

  @override
  String get welcome => 'ସ୍ୱାଗତ';

  @override
  String get enterMobileNumberToContinue =>
      'ଜାରି ରଖିବାକୁ ଆପଣଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର ଲେଖନ୍ତୁ';

  @override
  String get mobileNumber => 'ମୋବାଇଲ୍ ନମ୍ବର';

  @override
  String get agreeTermsText => 'ମୁଁ ସେବାର ସର୍ତ୍ତାବଳୀ ଏବଂ ଗୋପନୀୟତା ନୀତିରେ ସହମତ';

  @override
  String get sendOtp => 'OTP ପଠାନ୍ତୁ';

  @override
  String get verifyOtp => 'OTP ଯାଞ୍ଚ କରନ୍ତୁ';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber କୁ ପଠାଯାଇଥିବା ୪-ଅଙ୍କର କୋଡ୍ ଲେଖନ୍ତୁ';
  }

  @override
  String get verifyAndContinue => 'ଯାଞ୍ଚ କରନ୍ତୁ ଏବଂ ଜାରି ରଖନ୍ତୁ';

  @override
  String resendInSeconds(Object count) {
    return '$count ସେକେଣ୍ଡରେ ପୁଣି ପଠାନ୍ତୁ';
  }

  @override
  String get resendOtp => 'OTP ପୁଣି ପଠାନ୍ତୁ';

  @override
  String get changeNumber => 'ନମ୍ବର ବଦଳାନ୍ତୁ';

  @override
  String get mobileNumberRequired => 'ମୋବାଇଲ୍ ନମ୍ବର ଆବଶ୍ୟକ';

  @override
  String get enterValidMobileNumber => 'ଏକ ବୈଧ ୧୦-ଅଙ୍କର ମୋବାଇଲ୍ ନମ୍ବର ଲେଖନ୍ତୁ';

  @override
  String get enterCompleteOtpError => 'ଦୟାକରି ସମ୍ପୂର୍ଣ୍ଣ ୪-ଅଙ୍କର OTP ଲେଖନ୍ତୁ';

  @override
  String get otpResentSuccess => 'OTP ସଫଳତାର ସହିତ ପୁଣି ପଠାଯାଇଛି';

  @override
  String get fullName => 'ପୂର୍ଣ୍ଣ ନାମ';

  @override
  String get fullNameRequired => 'ପୂର୍ଣ୍ଣ ନାମ ଆବଶ୍ୟକ';

  @override
  String get nameMinLengthError => 'ନାମ ଅତି କମରେ ୨ ଅକ୍ଷରର ହେବା ଉଚିତ';

  @override
  String get email => 'ଇମେଲ୍';

  @override
  String get emailRequired => 'ଇମେଲ୍ ଆବଶ୍ୟକ';

  @override
  String get enterValidEmail => 'ଏକ ବୈଧ ଇମେଲ୍ ଠିକଣା ଲେଖନ୍ତୁ';

  @override
  String get referralCode => 'ରେଫରାଲ୍ କୋଡ୍';

  @override
  String get enterReferralCodeOptional => 'ରେଫରାଲ୍ କୋଡ୍ ଲେଖନ୍ତୁ (ବୈକଳ୍ପିକ)';

  @override
  String get createAccount => 'ଆକାଉଣ୍ଟ ତିଆରି କରନ୍ତୁ';

  @override
  String get completeProfileToGetStarted =>
      'ଆରମ୍ଭ କରିବାକୁ ଆପଣଙ୍କ ପ୍ରୋଫାଇଲ୍ ସମ୍ପୂର୍ଣ୍ଣ କରନ୍ତୁ';

  @override
  String get profileUpdatedSuccess => 'ପ୍ରୋଫାଇଲ୍ ସଫଳତାର ସହିତ ଅପଡେଟ୍ ହୋଇଛି!';

  @override
  String get updateProfilePicture => 'ପ୍ରୋଫାଇଲ୍ ଚିତ୍ର ଅପଡେଟ୍ କରନ୍ତୁ';

  @override
  String get camera => 'କ୍ୟାମେରା';

  @override
  String get gallery => 'ଗ୍ୟାଲେରୀ';

  @override
  String get cancel => 'ବାତିଲ୍';

  @override
  String get dateOfBirthOptional => 'ଜନ୍ମ ତାରିଖ (ବୈକଳ୍ପିକ)';

  @override
  String get gender => 'ଲିଙ୍ଗ';

  @override
  String get male => 'ପୁରୁଷ';

  @override
  String get female => 'ମହିଳା';

  @override
  String get other => 'ଅନ୍ୟ';

  @override
  String get updateProfile => 'ପ୍ରୋଫାଇଲ୍ ଅପଡେଟ୍ କରନ୍ତୁ';

  @override
  String profileUpdateFailed(Object error) {
    return 'ପ୍ରୋଫାଇଲ୍ ଅପଡେଟ୍ କରିବାରେ ବିଫଳ: $error';
  }

  @override
  String get goodMorning => 'ଶୁଭ ସକାଳ,';

  @override
  String get goodAfternoon => 'ଶୁଭ ଅପରାହ୍ନ,';

  @override
  String get goodEvening => 'ଶୁଭ ସନ୍ଧ୍ୟା,';

  @override
  String get pickupFrom => 'ଏଠାରୁ ପିକଅପ୍';

  @override
  String get currentLocation => 'ବର୍ତ୍ତମାନର ସ୍ଥାନ';

  @override
  String get fetchingLocation => 'ସ୍ଥାନ ଆଣାଯାଉଛି...';

  @override
  String get locationServicesDisabled => 'ସ୍ଥାନ ସେବା ନିଷ୍କ୍ରିୟ';

  @override
  String get locationPermissionNeeded => 'ସ୍ଥାନ ଅନୁମତି ଆବଶ୍ୟକ';

  @override
  String get locationAccessBlocked => 'ସ୍ଥାନ ପ୍ରବେଶ ଅବରୋଧିତ';

  @override
  String get couldNotFetchLocation => 'ସ୍ଥାନ ଆଣିହେଲା ନାହିଁ';

  @override
  String get enable => 'ସକ୍ରିୟ କରନ୍ତୁ';

  @override
  String get allow => 'ଅନୁମତି ଦିଅନ୍ତୁ';

  @override
  String get settings => 'ସେଟିଂସ୍';

  @override
  String get retry => 'ପୁଣି ଚେଷ୍ଟା କରନ୍ତୁ';

  @override
  String get turnOnLocationServices => 'ସ୍ଥାନ ସେବା ଚାଲୁ କରନ୍ତୁ';

  @override
  String get allowLocationAccess => 'ସ୍ଥାନ ପ୍ରବେଶର ଅନୁମତି ଦିଅନ୍ତୁ';

  @override
  String get gpsRequiredDescription =>
      'ଆପଣଙ୍କ ପିକଅପ୍ ସ୍ଥାନ ସଠିକ୍ ଭାବରେ ଚିହ୍ନିତ କରିବା ଏବଂ ନିକଟସ୍ଥ ଡ୍ରାଇଭରମାନଙ୍କୁ ଶୀଘ୍ର ଖୋଜିବା ପାଇଁ ଆମକୁ ଆପଣଙ୍କ ଡିଭାଇସ୍ GPS ଆବଶ୍ୟକ।';

  @override
  String get permissionRequiredDescription =>
      'ଦୟାକରି ଆପଣଙ୍କ ଆପ୍ ସେଟିଂସ୍ ରେ ସ୍ଥାନ ଅନୁମତି ଦିଅନ୍ତୁ ଯାହା ଦ୍ୱାରା ଆମେ ଆପଣଙ୍କ ପିକଅପ୍ ସ୍ଥାନ ସଠିକ୍ ଭାବରେ ଚିହ୍ନିତ କରିପାରିବୁ ଏବଂ ନିକଟସ୍ଥ ଡ୍ରାଇଭରମାନଙ୍କୁ ଶୀଘ୍ର ଖୋଜିପାରିବୁ।';

  @override
  String get goToLocationSettings => 'ସ୍ଥାନ ସେଟିଂସ୍ କୁ ଯାଆନ୍ତୁ';

  @override
  String get goToAppSettings => 'ଆପ୍ ସେଟିଂସ୍ କୁ ଯାଆନ୍ତୁ';

  @override
  String get enterAddressManually => 'ମୁଁ ମୋ ଠିକଣା ମାନୁଆଲ୍ ଭାବରେ ଲେଖିବି';

  @override
  String get taglineTitle => 'ଯାହା ଇଚ୍ଛା ନିଅନ୍ତୁ,\nଯେତେବେଳେ ଇଚ୍ଛା।';

  @override
  String get taglineSubtitle =>
      'ଦ୍ରୁତ ଡେଲିଭରୀ ଆପଣଙ୍କ ଆଙ୍ଗୁଳି ଟିପରେ। ସ୍ମାର୍ଟ ଭାବରେ ସ୍ଥାନାନ୍ତର କରନ୍ତୁ, ଆମର ପ୍ରିମିୟମ୍ ବେଡ଼ ସହିତ ଶୀଘ୍ର ଆଗକୁ ବଢ଼ନ୍ତୁ।';

  @override
  String get twoWheelers => 'ଦୁଇ ଚକିଆ';

  @override
  String get trucks => 'ଟ୍ରକ୍';

  @override
  String get specialOffer => 'ବିଶେଷ ଅଫର୍';

  @override
  String get promoBannerText => 'ଆପଣଙ୍କ ପ୍ରଥମ ରାଇଡ୍ ରେ\n୨୦% ଛାଡ଼ ପାଆନ୍ତୁ';

  @override
  String get whereIsYourPickup => 'ଆପଣଙ୍କ ପିକଅପ୍ କେଉଁଠି?';

  @override
  String get whereIsYourDrop => 'ଆପଣଙ୍କ ଡ୍ରପ୍ କେଉଁଠି?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'ଆପଣଙ୍କ ଡ୍ରପ୍ $index କେଉଁଠି?';
  }

  @override
  String get typeMinCharsToSearch =>
      'ଖୋଜିବା ଆରମ୍ଭ କରିବାକୁ ଅତି କମରେ ୪ ଅକ୍ଷର ଟାଇପ୍ କରନ୍ତୁ';

  @override
  String get selectOnMap => 'ମାନଚିତ୍ରରେ ବାଛନ୍ତୁ';

  @override
  String get pinpointExactLocation => 'ଆପଣଙ୍କ ସଠିକ୍ ସ୍ଥାନ ଚିହ୍ନିତ କରନ୍ତୁ';

  @override
  String get couldNotFindAddress => 'କ୍ଷମା କରନ୍ତୁ, ଆମେ ଏହି ଠିକଣା ପାଇଲୁ ନାହିଁ।';

  @override
  String get trySearchingNearbyLandmark =>
      'ନିକଟସ୍ଥ କୌଣସି ଲ୍ୟାଣ୍ଡମାର୍କ, ଅଞ୍ଚଳ କିମ୍ବା ଲୋକପ୍ରିୟ ସ୍ଥାନ ବ୍ୟବହାର କରି ଖୋଜିବାକୁ ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get anErrorOccurred => 'ଏକ ତ୍ରୁଟି ଘଟିଛି';

  @override
  String get locating => 'ସ୍ଥାନ ଖୋଜାଯାଉଛି...';

  @override
  String get fetchingDetails => 'ବିବରଣୀ ଆଣାଯାଉଛି...';

  @override
  String get confirmPickupLocation => 'ପିକଅପ୍ ସ୍ଥାନ ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get confirmDropLocation => 'ଡ୍ରପ୍ ସ୍ଥାନ ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get houseShopApartment => 'ଘର / ଦୋକାନ / ଆପାର୍ଟମେଣ୍ଟ';

  @override
  String get sendersName => 'ପଠାଇବା ବ୍ୟକ୍ତିଙ୍କ ନାମ';

  @override
  String get receiversName => 'ପାଇବା ବ୍ୟକ୍ତିଙ୍କ ନାମ';

  @override
  String get pleaseEnterName => 'ଦୟାକରି ନାମ ଲେଖନ୍ତୁ';

  @override
  String get sendersMobileNumber => 'ପଠାଇବା ବ୍ୟକ୍ତିଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର';

  @override
  String get receiversMobileNumber => 'ପାଇବା ବ୍ୟକ୍ତିଙ୍କ ମୋବାଇଲ୍ ନମ୍ବର';

  @override
  String get enterValidTenDigitNumber => 'ଏକ ବୈଧ ୧୦-ଅଙ୍କର ନମ୍ବର ଲେଖନ୍ତୁ';

  @override
  String get useMyMobileNumber => 'ମୋ ମୋବାଇଲ୍ ନମ୍ବର ବ୍ୟବହାର କରନ୍ତୁ';

  @override
  String get saveAsOptional => 'ଏହି ଭାବରେ ସଞ୍ଚୟ କରନ୍ତୁ (ବୈକଳ୍ପିକ):';

  @override
  String get home => 'ଘର';

  @override
  String get shop => 'ଦୋକାନ';

  @override
  String get confirmAndProceed => 'ନିଶ୍ଚିତ କରନ୍ତୁ ଏବଂ ଆଗକୁ ବଢ଼ନ୍ତୁ';

  @override
  String get selectDropLocation => 'ଡ୍ରପ୍ ସ୍ଥାନ ବାଛନ୍ତୁ';

  @override
  String get cannotSwapEmptyLocations =>
      'ଖାଲି ସ୍ଥାନଗୁଡ଼ିକୁ ଭରା ସ୍ଥାନ ସହିତ ବଦଳାଯାଇପାରିବ ନାହିଁ।';

  @override
  String get proceedToVehicleSelection => 'ଯାନ ଚୟନକୁ ଆଗକୁ ବଢ଼ନ୍ତୁ';

  @override
  String get permissionRequired => 'ଅନୁମତି ଆବଶ୍ୟକ';

  @override
  String get contactsPermissionDescription =>
      'ପଠାଇବା ବ୍ୟକ୍ତିଙ୍କ ଫୋନ୍ ନମ୍ବର ସହଜରେ ବାଛିବା ପାଇଁ ଗତି ଲୋଡର୍ କୁ ଆପଣଙ୍କ ସମ୍ପର୍କକୁ ପ୍ରବେଶ ଆବଶ୍ୟକ। ଦୟାକରି ଆପ୍ ସେଟିଂସ୍ ରେ ଏହା ସକ୍ରିୟ କରନ୍ତୁ।';

  @override
  String get openSettings => 'ସେଟିଂସ୍ ଖୋଲନ୍ତୁ';

  @override
  String get selectContact => 'ସମ୍ପର୍କ ବାଛନ୍ତୁ';

  @override
  String get contactPermissionDenied => 'ସମ୍ପର୍କ ଅନୁମତି ପ୍ରତ୍ୟାଖ୍ୟାନ କରାଯାଇଛି।';

  @override
  String get myProfile => 'ମୋ ପ୍ରୋଫାଇଲ୍';

  @override
  String selfFormat(String name) {
    return '$name (ନିଜେ)';
  }

  @override
  String get deviceContacts => 'ଡିଭାଇସ୍ ସମ୍ପର୍କ';

  @override
  String get rideHistory => 'ରାଇଡ୍ ଇତିହାସ';

  @override
  String get transactions => 'କାରବାର';

  @override
  String get noTransactionsFound => 'କୌଣସି କାରବାର ମିଳିଲା ନାହିଁ';

  @override
  String get failedToLoadTransactions => 'କାରବାର ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get addMoney => 'ଟଙ୍କା ଯୋଡନ୍ତୁ';

  @override
  String get enterAmountToAdd => 'ଯୋଡିବାକୁ ପରିମାଣ ଲେଖନ୍ତୁ';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay ଖୋଲିବାରେ ବିଫଳ: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'ପେମେଣ୍ଟ ଅର୍ଡର ତିଆରି କରିବାରେ ବିଫଳ: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'ଗତି କ୍ରେଡିଟ୍ ରେ ₹$amount ସଫଳତାର ସହିତ ଯୋଡାଯାଇଛି!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'ପେମେଣ୍ଟ ଯାଞ୍ଚ ବିଫଳ: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'ପେମେଣ୍ଟ ବିଫଳ ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'ବାହ୍ୟ ୱାଲେଟ୍ ବଛାଯାଇଛି: $walletName';
  }

  @override
  String get walletTopUp => 'ୱାଲେଟ୍ ଟପ୍-ଅପ୍';

  @override
  String get payments => 'ପେମେଣ୍ଟ';

  @override
  String get reachuCredits => 'ଗତି କ୍ରେଡିଟ୍';

  @override
  String get balance => 'ବାଲାନ୍ସ';

  @override
  String get errorLoadingBalance => 'ବାଲାନ୍ସ ଲୋଡ୍ କରିବାରେ ତ୍ରୁଟି';

  @override
  String get availableBalance => 'ଉପଲବ୍ଧ ବାଲାନ୍ସ';

  @override
  String get totalExpenses => 'ମୋଟ ଖର୍ଚ୍ଚ';

  @override
  String get recentTransactions => 'ସାମ୍ପ୍ରତିକ କାରବାର';

  @override
  String get viewMore => 'ଅଧିକ ଦେଖନ୍ତୁ';

  @override
  String get noTransactionsYet => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି କାରବାର ନାହିଁ';

  @override
  String get booking => 'ବୁକିଂ';

  @override
  String get earning => 'ଆୟ';

  @override
  String get support => 'ସହାୟତା';

  @override
  String get profile => 'ପ୍ରୋଫାଇଲ୍';

  @override
  String get pendingWithdrawals => 'ବିଚାରାଧୀନ ଉତ୍ତୋଳନ';

  @override
  String get driverDebt => 'ଡ୍ରାଇଭର ଋଣ';

  @override
  String minBalanceRequired(Object amount) {
    return 'ସର୍ବନିମ୍ନ ବାଲାନ୍ସ ଆବଶ୍ୟକ: ₹$amount';
  }

  @override
  String get insufficientBalance => 'ଉତ୍ତୋଳନ ପାଇଁ ଅପର୍ଯ୍ୟାପ୍ତ ବାଲାନ୍ସ';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'ସତର୍କତା: ଆପଣଙ୍କ ଉପଲବ୍ଧ ବାଲାନ୍ସ ନୂତନ ରାଇଡ୍ ଗ୍ରହଣ ପାଇଁ ଆବଶ୍ୟକ ସର୍ବନିମ୍ନ ସୀମା (₹$amount) ରୁ କମ୍। ଦୟାକରି ଆପଣଙ୍କ ୱାଲେଟ୍ ଟପ୍ ଅପ୍ କରନ୍ତୁ।';
  }

  @override
  String get moneyTransfer => 'ଟଙ୍କା ସ୍ଥାନାନ୍ତର କରନ୍ତୁ';

  @override
  String get withdrawMoney => 'ଟଙ୍କା ଉତ୍ତୋଳନ କରନ୍ତୁ';

  @override
  String get manageAccounts => 'ଆକାଉଣ୍ଟ ପରିଚାଳନା କରନ୍ତୁ';

  @override
  String get bankAccounts => 'ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟ ଏବଂ UPI';

  @override
  String get addAccount => 'ପେମେଣ୍ଟ ପଦ୍ଧତି ଯୋଡନ୍ତୁ';

  @override
  String get addBankAccount => 'ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟ ଯୋଡନ୍ତୁ';

  @override
  String get addUpiId => 'UPI ଆଇଡି ଯୋଡନ୍ତୁ';

  @override
  String get editBankAccount => 'ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟ ସମ୍ପାଦନା କରନ୍ତୁ';

  @override
  String get editUpiId => 'UPI ଆଇଡି ସମ୍ପାଦନା କରନ୍ତୁ';

  @override
  String get deleteAccount => 'ଆକାଉଣ୍ଟ ବିଲୋପ କରନ୍ତୁ';

  @override
  String get deleteAccountConfirm =>
      'ଆପଣ ନିଶ୍ଚିତ କି ଏହି ପେମେଣ୍ଟ ପଦ୍ଧତି ବିଲୋପ କରିବାକୁ ଚାହୁଁଛନ୍ତି?';

  @override
  String get accountHolderName => 'ଆକାଉଣ୍ଟ ଧାରକଙ୍କ ନାମ';

  @override
  String get accountHolderNameHint =>
      'Enter your full name as present on bank account';

  @override
  String get bankRegisteredPhone => 'Registered Mobile Number';

  @override
  String get bankRegisteredPhoneHint => 'Enter 10-digit mobile number';

  @override
  String get invalidPhoneNumber => 'Enter a valid 10-digit mobile number';

  @override
  String get bankName => 'ବ୍ୟାଙ୍କର ନାମ';

  @override
  String get accountNumber => 'ଆକାଉଣ୍ଟ ନମ୍ବର';

  @override
  String get confirmAccountNumber => 'ଆକାଉଣ୍ଟ ନମ୍ବର ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get ifscCode => 'IFSC କୋଡ୍';

  @override
  String get upiId => 'UPI ଆଇଡି';

  @override
  String get fieldRequired => 'ଏହି ଫିଲ୍ଡ ଆବଶ୍ୟକ';

  @override
  String get invalidUpi => 'ଏକ ବୈଧ UPI ଆଇଡି ଲେଖନ୍ତୁ (ଯେପରି name@upi)';

  @override
  String get invalidIfsc => 'ଏକ ବୈଧ ୧୧-ଅଙ୍କର IFSC କୋଡ୍ ଲେଖନ୍ତୁ';

  @override
  String get invalidAccountNumber => 'ଏକ ବୈଧ ଆକାଉଣ୍ଟ ନମ୍ବର ଲେଖନ୍ତୁ';

  @override
  String get accountNumbersDoNotMatch => 'ଆକାଉଣ୍ଟ ନମ୍ବର ମେଳ ଖାଉନାହିଁ';

  @override
  String get noPaymentMethods => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ପେମେଣ୍ଟ ପଦ୍ଧତି ଯୋଡାଯାଇନାହିଁ';

  @override
  String get addPaymentMethodSubtitle =>
      'ଆପଣଙ୍କ ଆୟ ଉତ୍ତୋଳନ ପାଇଁ ଏକ ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟ କିମ୍ବା UPI ଆଇଡି ଯୋଡନ୍ତୁ';

  @override
  String get confirmTransfer => 'ସ୍ଥାନାନ୍ତର ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get transferAmount => 'ସ୍ଥାନାନ୍ତର ପରିମାଣ';

  @override
  String get transferSuccess => 'ଉତ୍ତୋଳନ ଅନୁରୋଧ ସଫଳତାର ସହିତ ତିଆରି ହୋଇଛି';

  @override
  String get collectPayment => 'ପେମେଣ୍ଟ ସଂଗ୍ରହ କରନ୍ତୁ';

  @override
  String get collectCash => 'ନଗଦ ସଂଗ୍ରହ କରନ୍ତୁ';

  @override
  String get cashCollectedSuccess =>
      'ନଗଦ ପେମେଣ୍ଟ ସଫଳତାର ସହିତ ସମ୍ପୂର୍ଣ୍ଣ ହୋଇଛି!';

  @override
  String get displayQrCode => 'UPI QR କୋଡ୍ ଦେଖାନ୍ତୁ';

  @override
  String get customerScanQr =>
      'ଗ୍ରାହକଙ୍କୁ ପେମେଣ୍ଟ କରିବାକୁ ଏହି QR କୋଡ୍ ସ୍କାନ୍ କରିବାକୁ କୁହନ୍ତୁ';

  @override
  String get generatingQr => 'QR କୋଡ୍ ତିଆରି ହେଉଛି...';

  @override
  String get selectPaymentMethod => 'ପେମେଣ୍ଟ ପଦ୍ଧତି ବାଛନ୍ତୁ';

  @override
  String get beneficiary => 'ହିତାଧିକାରୀ';

  @override
  String get completed => 'ସମ୍ପୂର୍ଣ୍ଣ';

  @override
  String get pending => 'ବିଚାରାଧୀନ';

  @override
  String get failed => 'ବିଫଳ';

  @override
  String get failedToLoadAccounts => 'ପେମେଣ୍ଟ ପଦ୍ଧତି ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get accountDeletedSuccess => 'ପେମେଣ୍ଟ ପଦ୍ଧତି ସଫଳତାର ସହିତ ବିଲୋପ ହୋଇଛି';

  @override
  String get accountUpdatedSuccess => 'ପେମେଣ୍ଟ ପଦ୍ଧତି ସଫଳତାର ସହିତ ଅପଡେଟ୍ ହୋଇଛି';

  @override
  String get accountAddedSuccess => 'ପେମେଣ୍ଟ ପଦ୍ଧତି ସଫଳତାର ସହିତ ଯୋଡାଯାଇଛି';

  @override
  String get withdrawalAmount => 'ଉତ୍ତୋଳନ ପରିମାଣ';

  @override
  String get transferDestination => 'ସ୍ଥାନାନ୍ତର ଗନ୍ତବ୍ୟ';

  @override
  String get enterAmount => 'ପରିମାଣ ଲେଖନ୍ତୁ';

  @override
  String get selected => 'ବଛାଯାଇଛି';

  @override
  String get accountNumberLabel => 'ଆକାଉଣ୍ଟ ନମ୍ବର';

  @override
  String get errorLoadingAccounts => 'ପେମେଣ୍ଟ ପଦ୍ଧତି ଲୋଡ୍ କରିବାରେ ତ୍ରୁଟି';

  @override
  String get errorLoadingWallet => 'ୱାଲେଟ୍ ସୂଚନା ଲୋଡ୍ କରିବାରେ ତ୍ରୁଟି';

  @override
  String get enterAccountHolderName => 'ଆକାଉଣ୍ଟ ଧାରକଙ୍କ ନାମ ଲେଖନ୍ତୁ';

  @override
  String get bankNameHint => 'ଯେପରି ଷ୍ଟେଟ୍ ବ୍ୟାଙ୍କ ଅଫ୍ ଇଣ୍ଡିଆ';

  @override
  String get enterAccountNumber => 'ଆକାଉଣ୍ଟ ନମ୍ବର ଲେଖନ୍ତୁ';

  @override
  String get confirmAccountNumberHint => 'ଆକାଉଣ୍ଟ ନମ୍ବର ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get ifscCodeHint => 'ଯେପରି SBIN0001234';

  @override
  String get upiIdHint => 'ଯେପରି user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'ମୋଟ ଭଡ଼ା';

  @override
  String get hideQrCode => 'QR ଲୁଚାନ୍ତୁ';

  @override
  String get nameMinLengthRequired => 'ନାମ ଅତି କମରେ ୨ ଅକ୍ଷରର ହେବା ଉଚିତ';

  @override
  String get verifyBankAccount => 'Verify Bank Account';

  @override
  String get verifyingBankDetails => 'Verifying account details with bank...';

  @override
  String get bankVerificationSuccess => 'Bank Account Verified';

  @override
  String get bankVerificationSuccessDesc =>
      'Account details matched and verified with bank records.';

  @override
  String get bankVerificationFailed =>
      'Bank account verification failed. Please check your account number and IFSC code.';

  @override
  String nameMismatchWarning(String nameAtBank) {
    return 'The registered name at bank is \"$nameAtBank\", which differs from the entered name.';
  }

  @override
  String get branchLabel => 'Branch';

  @override
  String get cityLabel => 'City';

  @override
  String get verifiedBadge => 'VERIFIED';

  @override
  String get registeredNameAtBank => 'Registered Name at Bank';

  @override
  String get confirmAndSave => 'Confirm & Save Account';

  @override
  String get instantVerification => 'Instant Bank Verification';

  @override
  String get instantVerificationDesc =>
      'We verify your bank account instantly via official banking network to ensure secure payouts.';

  @override
  String get accountStatusLabel => 'Account Status';

  @override
  String get nameMatchResultLabel => 'Name Match';

  @override
  String get nameMatchScoreLabel => 'Match Score';

  @override
  String get reEnterDetails => 'Edit Details';

  @override
  String get proceedAnyway => 'Proceed Anyway';

  @override
  String orderNumber(String orderId) {
    return 'ଅର୍ଡର #$orderId';
  }

  @override
  String get personalInformation => 'ବ୍ୟକ୍ତିଗତ ସୂଚନା';

  @override
  String get online => 'ଅନଲାଇନ୍';

  @override
  String get offline => 'ଅଫଲାଇନ୍';

  @override
  String get onlineSuccessMessage =>
      'ଆପଣ ବର୍ତ୍ତମାନ ଅନଲାଇନ୍ ଏବଂ ଡ୍ୟୁଟିରେ ଅଛନ୍ତି।';

  @override
  String get offlineSuccessMessage => 'ଆପଣ ବର୍ତ୍ତମାନ ଅଫଲାଇନ୍ ଅଛନ୍ତି।';

  @override
  String get partnerSupport => 'ପାର୍ଟନର୍ ସହାୟତା';

  @override
  String get partnerSupportSubtitle =>
      'ନମସ୍କାର ପାର୍ଟନର୍! ଆପଣଙ୍କ ରାଇଡ୍, ପେମେଣ୍ଟ କିମ୍ବା ଆକାଉଣ୍ଟରେ ସାହାଯ୍ୟ ଦରକାର? ଆମେ ଆପଣଙ୍କ ୨୪/୭ ସହାୟତା ପାଇଁ ଏଠାରେ ଅଛୁ।';

  @override
  String get faqsAndHelp => 'ପ୍ରଶ୍ନୋତ୍ତର ଏବଂ ସହାୟତା';

  @override
  String get findQuickAnswers => 'ଶୀଘ୍ର ଉତ୍ତର ଖୋଜନ୍ତୁ';

  @override
  String get raiseSupportTicket => 'ଟିକେଟ୍ ଦାଖଲ କରନ୍ତୁ';

  @override
  String get contactSupportAgent => 'ସହାୟତା ଏଜେଣ୍ଟଙ୍କ ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ';

  @override
  String get recentTickets => 'ସାମ୍ପ୍ରତିକ ଟିକେଟ୍';

  @override
  String get noActiveTickets => 'କୌଣସି ସକ୍ରିୟ ସହାୟତା ଟିକେଟ୍ ନାହିଁ';

  @override
  String get submitTicketDescription =>
      'ଯଦି ଆପଣଙ୍କୁ କୌଣସି ସମସ୍ୟା ହୁଏ ତେବେ ଟିକେଟ୍ ଦାଖଲ କରନ୍ତୁ।';

  @override
  String get failedToLoadTickets => 'ସାମ୍ପ୍ରତିକ ଟିକେଟ୍ ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get contactSupport => 'ସହାୟତା ସହିତ ଯୋଗାଯୋଗ କରନ୍ତୁ';

  @override
  String get callUs => 'ଆମକୁ କଲ୍ କରନ୍ତୁ';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'ଆମ ସହିତ ଚାଟ୍ କରନ୍ତୁ';

  @override
  String get emailSupport => 'ଇମେଲ୍ ସହାୟତା';

  @override
  String get ticketStatusOpen => 'ଖୋଲା';

  @override
  String get ticketStatusInProgress => 'ଚାଲୁଛି';

  @override
  String get ticketStatusResolved => 'ସମାଧାନ ହୋଇଛି';

  @override
  String get ticketStatusClosed => 'ବନ୍ଦ';

  @override
  String get ticketCategoryRideIssue => 'ରାଇଡ୍ ସମସ୍ୟା';

  @override
  String get ticketCategoryPayment => 'ପେମେଣ୍ଟ';

  @override
  String get ticketCategoryAccount => 'ଆକାଉଣ୍ଟ';

  @override
  String get ticketCategoryDriverIssue => 'ଡ୍ରାଇଭର ସମସ୍ୟା';

  @override
  String get ticketCategoryOther => 'ଅନ୍ୟ';

  @override
  String get failedToLoadDashboard => 'ଡ୍ୟାସବୋର୍ଡ ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get todaysEarnings => 'ଆଜିର ଆୟ';

  @override
  String get cashCollected => 'ନଗଦ ସଂଗୃହୀତ';

  @override
  String get onlinePayment => 'ଅନଲାଇନ୍ ପେମେଣ୍ଟ';

  @override
  String get todaysRideStatus => 'ଆଜିର ଅର୍ଡର ସ୍ଥିତି';

  @override
  String get totalRides => 'ମୋଟ ଅର୍ଡର';

  @override
  String get cancelled => 'ବାତିଲ୍';

  @override
  String get dutyRating => 'ଡ୍ୟୁଟି ରେଟିଂ';

  @override
  String get noRidesFound => 'କୌଣସି ରାଇଡ୍ ମିଳିଲା ନାହିଁ';

  @override
  String get failedToLoadHistory => 'ଇତିହାସ ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get all => 'ସବୁ';

  @override
  String get paymentPending => 'ପେମେଣ୍ଟ ବିଚାରାଧୀନ';

  @override
  String stopsCount(int count) {
    return '$count ଷ୍ଟପ୍';
  }

  @override
  String get rideDetails => 'ରାଇଡ୍ ବିବରଣୀ';

  @override
  String get pickupLocation => 'ପିକଅପ୍ ସ୍ଥାନ';

  @override
  String get dropLocation => 'ଡ୍ରପ୍ ସ୍ଥାନ';

  @override
  String stopLocation(int number) {
    return 'ଷ୍ଟପ୍ $number';
  }

  @override
  String get fareBreakdown => 'ଭଡ଼ା ବିବରଣୀ';

  @override
  String get netPayable => 'ମୋଟ ଦେୟ ରାଶି';

  @override
  String get paymentMethod => 'ପେମେଣ୍ଟ ପଦ୍ଧତି';

  @override
  String get cash => 'ନଗଦ';

  @override
  String get customerDetails => 'ଗ୍ରାହକଙ୍କ ବିବରଣୀ';

  @override
  String get callCustomer => 'ଗ୍ରାହକଙ୍କୁ କଲ୍ କରନ୍ତୁ';

  @override
  String get goodsType => 'ମାଲର ପ୍ରକାର';

  @override
  String get quantity => 'ପରିମାଣ';

  @override
  String get weight => 'ଓଜନ';

  @override
  String get distance => 'ଦୂରତା';

  @override
  String get duration => 'ସମୟ';

  @override
  String get cancellationReason => 'ବାତିଲ୍ କାରଣ';

  @override
  String get routeTimeline => 'ରୁଟ୍ ସମୟରେଖା';

  @override
  String get goodsSpecifications => 'ମାଲର ବିବରଣୀ';

  @override
  String get vehicleMetadata => 'ଯାନର ବିବରଣୀ';

  @override
  String get description => 'ବିବରଣୀ';

  @override
  String get estimatedWeight => 'ଆନୁମାନିକ ଓଜନ';

  @override
  String get vehicleName => 'ଯାନର ନାମ';

  @override
  String get vehicleNumber => 'ଯାନ ନମ୍ବର';

  @override
  String get modelColor => 'ମଡେଲ୍ / ରଙ୍ଗ';

  @override
  String get baseFare => 'ମୂଳ ଭଡ଼ା';

  @override
  String get weatherSurcharge => 'ପାଣିପାଗ ସରଚାର୍ଜ';

  @override
  String get trafficSurcharge => 'ଟ୍ରାଫିକ୍ ସରଚାର୍ଜ';

  @override
  String get promoDiscount => 'ପ୍ରୋମୋ ଛାଡ଼';

  @override
  String get pickupSender => 'ପିକଅପ୍ (ପ୍ରେଷକ)';

  @override
  String get dropoffRecipient => 'ଡ୍ରପଅଫ୍ (ପ୍ରାପ୍ତକର୍ତ୍ତା)';

  @override
  String rideIdLabel(String id) {
    return 'ରାଇଡ୍ ଆଇଡି: $id';
  }

  @override
  String get todaysTotalEarnings => 'ଆଜିର ମୋଟ ଆୟ';

  @override
  String get failedToLoadEarnings => 'ଆୟର ତଥ୍ୟ ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get noTransactionsRecorded => 'କୌଣସି କାରବାର ଲିପିବଦ୍ଧ ହୋଇନାହିଁ';

  @override
  String get mySupportTickets => 'ମୋ ସହାୟତା ଟିକେଟ୍';

  @override
  String get newTicket => 'ନୂତନ ଟିକେଟ୍';

  @override
  String get noSupportTicketsRaised => 'କୌଣସି ସହାୟତା ଟିକେଟ୍ ଦାଖଲ ହୋଇନାହିଁ';

  @override
  String get tapNewTicketSubtitle =>
      'ସାହାଯ୍ୟ ପାଇବାକୁ \'ନୂତନ ଟିକେଟ୍\' ଉପରେ ଟ୍ୟାପ୍ କରନ୍ତୁ।';

  @override
  String get submitATicket => 'ଟିକେଟ୍ ଦାଖଲ କରନ୍ତୁ';

  @override
  String get explainIssueDetail =>
      'ଆପଣଙ୍କ ସମସ୍ୟାର ବିସ୍ତୃତ ବର୍ଣ୍ଣନା କରନ୍ତୁ। ସହାୟତା ଏଜେଣ୍ଟ ଶୀଘ୍ର ନିଶ୍ଚିତ କରି ଉତ୍ତର ଦେବେ।';

  @override
  String get categoryRequired => 'ବର୍ଗ*';

  @override
  String get selectIssueCategory => 'ସମସ୍ୟା ବର୍ଗ ବାଛନ୍ତୁ';

  @override
  String get pleaseSelectCategoryError => 'ଦୟାକରି ଏକ ସମସ୍ୟା ବର୍ଗ ବାଛନ୍ତୁ';

  @override
  String get subjectRequired => 'ବିଷୟ*';

  @override
  String get briefSummaryHint => 'ସମସ୍ୟାର ସଂକ୍ଷିପ୍ତ ବିବରଣୀ';

  @override
  String get subjectRequiredError => 'ବିଷୟ ବାଧ୍ୟତାମୂଳକ';

  @override
  String get subjectMinLengthError => 'ବିଷୟ ଅତି କମରେ ୫ ଅକ୍ଷରର ହେବା ଉଚିତ';

  @override
  String get descriptionRequired => 'ବିବରଣୀ / ବାର୍ତ୍ତା*';

  @override
  String get describeProblemHint => 'ଆପଣଙ୍କ ସମସ୍ୟାର ବିସ୍ତୃତ ବର୍ଣ୍ଣନା କରନ୍ତୁ...';

  @override
  String get messageRequiredError => 'ବାର୍ତ୍ତା ବିବରଣୀ ବାଧ୍ୟତାମୂଳକ';

  @override
  String get messageMinLengthError => 'ବାର୍ତ୍ତା ଅତି କମରେ ୧୦ ଅକ୍ଷରର ହେବା ଉଚିତ';

  @override
  String get submitTicket => 'ଟିକେଟ୍ ଦାଖଲ କରନ୍ତୁ';

  @override
  String get privacyPolicy => 'ଗୋପନୀୟତା ନୀତି';

  @override
  String get termsAndConditions => 'ନିୟମ ଏବଂ ସର୍ତ୍ତାବଳୀ';

  @override
  String get termsOfService => 'ସେବାର ସର୍ତ୍ତାବଳୀ';

  @override
  String get iAgreeTo => 'ମୁଁ ';

  @override
  String get and => ' ଏବଂ ';

  @override
  String get agreeSuffix => ' ରେ ସହମତ';

  @override
  String get darkTheme => 'ଡାର୍କ ଥିମ୍';

  @override
  String get failedToLoadDetails => 'ବିବରଣୀ ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>ଗୋପନୀୟତା ନୀତି</h1><p>Reachu ଡ୍ରାଇଭର ଆପ୍ ରେ ଆପଣଙ୍କୁ ସ୍ୱାଗତ। ଆପଣଙ୍କ ଗୋପନୀୟତା ଆମ ପାଇଁ ଗୁରୁତ୍ୱପୂର୍ଣ୍ଣ। ଏହି ଗୋପନୀୟତା ନୀତି ବ୍ୟାଖ୍ୟା କରେ ଯେ ଆମେ ଆପଣଙ୍କ ବ୍ୟକ୍ତିଗତ ସୂଚନା କିପରି ସଂଗ୍ରହ, ବ୍ୟବହାର ଏବଂ ସୁରକ୍ଷିତ କରୁ।</p><h2>୧. ଆମେ ଯେଉଁ ସୂଚନା ସଂଗ୍ରହ କରୁ</h2><p>ଆମେ ଆପଣଙ୍କ ନାମ, ଫୋନ୍ ନମ୍ବର, ଇମେଲ୍, ଯାନର ବିବରଣୀ, ସକ୍ରିୟ ଟ୍ରିପ୍ ସମୟରେ ସ୍ଥାନ ଡାଟା ଏବଂ କାରବାରର ବିବରଣୀ ସଂଗ୍ରହ କରୁ।</p><h2>୨. ଆମେ ଆପଣଙ୍କ ସୂଚନା କିପରି ବ୍ୟବହାର କରୁ</h2><p>ଆମେ ଆପଣଙ୍କ ସୂଚନା ବ୍ୟବହାର କରୁ ଡେଲିଭରୀ ରାଇଡ୍ ସହଜ କରିବା, ପେମେଣ୍ଟ ପ୍ରକ୍ରିୟା କରିବା, ସୁରକ୍ଷା ନିଶ୍ଚିତ କରିବା ଏବଂ ଡ୍ରାଇଭର ଅନୁଭୂତି ଉନ୍ନତ କରିବା ପାଇଁ।</p><h2>୩. ସ୍ଥାନ ଟ୍ରାକିଂ</h2><p>ଡ୍ୟୁଟିରେ ଥିବା ସମୟରେ ବ୍ୟାକଗ୍ରାଉଣ୍ଡ ସ୍ଥାନ ପ୍ରବେଶ ଆବଶ୍ୟକ ଯାହା ଦ୍ୱାରା ଆପଣଙ୍କୁ ନିକଟସ୍ଥ ଡେଲିଭରୀ ଅନୁରୋଧ ସହିତ ସଂଯୋଗ କରାଯାଇପାରେ ଏବଂ ଗ୍ରାହକମାନେ ଟ୍ରିପ୍ ର ପ୍ରଗତି ଦେଖିପାରନ୍ତି।</p><h2>୪. ଡାଟା ସୁରକ୍ଷା</h2><p>ଆମେ ଆପଣଙ୍କ ବ୍ୟକ୍ତିଗତ ସୂଚନାକୁ ଅନଧିକୃତ ପ୍ରବେଶରୁ ସୁରକ୍ଷିତ ରଖିବା ପାଇଁ କଠୋର ସୁରକ୍ଷା ବ୍ୟବସ୍ଥା ପ୍ରୟୋଗ କରୁ।</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>ନିୟମ ଏବଂ ସର୍ତ୍ତାବଳୀ</h1><p>Reachu ଡ୍ରାଇଭର ଆପ୍ଲିକେସନ୍ ବ୍ୟବହାର କରିବା ପୂର୍ବରୁ ଦୟାକରି ଏହି ନିୟମ ଏବଂ ସର୍ତ୍ତାବଳୀ ଧ୍ୟାନର ସହିତ ପଢ଼ନ୍ତୁ।</p><h2>୧. ସର୍ତ୍ତାବଳୀର ସ୍ୱୀକୃତି</h2><p>Reachu ରେ ଡ୍ରାଇଭର ପାର୍ଟନର୍ ଭାବରେ ପଞ୍ଜୀକରଣ କରି, ଆପଣ ସମସ୍ତ ପ୍ରଯୁଜ୍ୟ ସର୍ତ୍ତ, ନୀତି ଏବଂ ସ୍ଥାନୀୟ ପରିବହନ ନିୟମ ପାଳନ କରିବାକୁ ସହମତ ହୁଅନ୍ତି।</p><h2>୨. ଡ୍ରାଇଭରଙ୍କ ଦାୟିତ୍ୱ</h2><p>ଡ୍ରାଇଭରଙ୍କ ପାଖରେ ବୈଧ ଡ୍ରାଇଭିଂ ଲାଇସେନ୍ସ, ସଠିକ୍ ଯାନ ଡକ୍ୟୁମେଣ୍ଟ ଏବଂ ସୁରକ୍ଷିତ, ସମୟାନୁବର୍ତ୍ତୀ ଡେଲିଭରୀ ସେବା ପ୍ରଦାନ କରିବାର ଦାୟିତ୍ୱ ରହିବା ଉଚିତ।</p><h2>୩. ପେମେଣ୍ଟ ଏବଂ ଆୟ</h2><p>ଭଡ଼ା ପ୍ଲାଟଫର୍ମ ହାର ଅନୁଯାୟୀ ନିର୍ଦ୍ଧାରିତ ହୁଏ ଏବଂ ପ୍ରଯୁଜ୍ୟ ଚାର୍ଜ କାଟିବା ପରେ ଆପଣଙ୍କ ଯାଞ୍ଚିତ ବ୍ୟାଙ୍କ ଆକାଉଣ୍ଟକୁ ସ୍ଥାନାନ୍ତରିତ ହୁଏ।</p><h2>୪. ଆକାଉଣ୍ଟ ନିଲମ୍ବନ</h2><p>Reachu ପ୍ରତାରଣାମୂଳକ କାର୍ଯ୍ୟକଳାପ, ସୁରକ୍ଷା ଉଲ୍ଲଂଘନ କିମ୍ବା ନୀତି ଅମାନ୍ୟ କ୍ଷେତ୍ରରେ ଆକାଉଣ୍ଟ ନିଲମ୍ବିତ କରିବାର ଅଧିକାର ସଂରକ୍ଷିତ ରଖେ।</p>';

  @override
  String get reviewAndRating => 'ସମୀକ୍ଷା ଏବଂ ରେଟିଂ';

  @override
  String get noRatingsYet => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ରେଟିଂ ନାହିଁ';

  @override
  String ratedByCustomers(int count) {
    return '$count ଜଣ ଗ୍ରାହକ ଦ୍ୱାରା ରେଟିଂ ଦିଆଯାଇଛି';
  }

  @override
  String get noReviewsYet => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ସମୀକ୍ଷା ନାହିଁ';

  @override
  String get noReviewsDesc => 'ଆପଣ ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ସମୀକ୍ଷା ପାଇନାହାନ୍ତି।';

  @override
  String get noCommentProvided => 'କୌଣସି ମନ୍ତବ୍ୟ ଦିଆଯାଇନାହିଁ';

  @override
  String get ratingExcellent => 'ଉତ୍କୃଷ୍ଟ';

  @override
  String get ratingGood => 'ଭଲ';

  @override
  String get ratingAverage => 'ମଝାରି';

  @override
  String get ratingBelowAverage => 'ମଝାରି ତଳେ';

  @override
  String get ratingPoor => 'ଖରାପ';

  @override
  String get customer => 'ଗ୍ରାହକ';

  @override
  String get noInternetConnection => 'ଇଣ୍ଟରନେଟ୍ ସଂଯୋଗ ନାହିଁ';

  @override
  String get checkInternetConnection =>
      'ଦୟାକରି ଆପଣଙ୍କର ଇଣ୍ଟରନେଟ୍ ସଂଯୋଗ ଯାଞ୍ଚ କରନ୍ତୁ ଏବଂ ପୁନର୍ବାର ଚେଷ୍ଟା କରନ୍ତୁ।';

  @override
  String get internetRestored => 'ଇଣ୍ଟରନେଟ୍ ସଂଯୋଗ ପୁନରୁଦ୍ଧାର ହୋଇଛି';

  @override
  String get retryConnection => 'ପୁନର୍ବାର ଚେଷ୍ଟା କରନ୍ତୁ';

  @override
  String get connectionTimedOut =>
      'ସଂଯୋଗ ସମୟ ସମାପ୍ତ। ପୁନର୍ବାର ଚେଷ୍ଟା କରାଯାଉଛି...';

  @override
  String get newUpdateAvailable =>
      'ଏକ ନୂତନ ଅପଡେଟ୍ ଉପଲବ୍ଧ। ଜାରି ରଖିବା ପାଇଁ ଆପ୍ ଅପଡେଟ୍ କରନ୍ତୁ।';

  @override
  String get updateRequiredTitle => 'ଅପଡେଟ୍ ଆବଶ୍ୟକ';

  @override
  String updateRequiredDesc(String version) {
    return 'ଆପଣ Reachu Driver ର ଏକ ପୁରୁଣା ସଂସ୍କରଣ ବ୍ୟବହାର କରୁଛନ୍ତି। ରାଇଡ୍ ନେବା ଜାରି ରଖିବା ପାଇଁ ଦୟାକରି ସର୍ବଶେଷ ସଂସ୍କରଣକୁ ଅପଡେଟ୍ କରନ୍ତୁ।';
  }

  @override
  String get updateNow => 'ବର୍ତ୍ତମାନ ଅପଡେଟ୍ କରନ୍ତୁ';

  @override
  String get updateLater => 'ପରେ ଅପଡେଟ୍ କରନ୍ତୁ';

  @override
  String get underMaintenanceTitle => 'ରକ୍ଷଣାବେକ୍ଷଣ ଚାଲିଛି';

  @override
  String get underMaintenanceDesc =>
      'ଆପଣଙ୍କୁ ଭଲ ସେବା ଯୋଗାଇବା ପାଇଁ ଆମେ ସିଷ୍ଟମ୍ ଅପଡେଟ୍ କରୁଛୁ। ଦୟାକରି କିଛି ସମୟ ପରେ ପୁଣି ଯାଞ୍ଚ କରନ୍ତୁ।';

  @override
  String estimatedBackIn(Object time) {
    return 'ଆନୁମାନିକ $time ମଧ୍ୟରେ ଫେରିବ';
  }

  @override
  String get backOnlineSoon => 'ଆମେ ଶୀଘ୍ର ଅନଲାଇନ୍ ଫେରିବୁ!';

  @override
  String installedVersion(String version) {
    return 'ସ୍ଥାପିତ ସଂସ୍କରଣ: $version';
  }

  @override
  String get couldNotOpenStore => 'ଆପ୍ ଷ୍ଟୋର୍ ଖୋଲିପାରିଲା ନାହିଁ';

  @override
  String get detailedFareBreakdown => 'ବିସ୍ତୃତ ଭଡ଼ା ବିବରଣୀ';

  @override
  String get checkPaymentStatus => 'ପେମେଣ୍ଟ ସ୍ଥିତି ଯାଞ୍ଚ କରନ୍ତୁ';

  @override
  String get checkingStatus => 'ସ୍ଥିତି ଯାଞ୍ଚ କରାଯାଉଛି...';

  @override
  String get details => 'ବିବରଣୀ';

  @override
  String get hide => 'ଲୁଚାନ୍ତୁ';

  @override
  String get collectCashFromCustomer => 'ଗ୍ରାହକଙ୍କଠାରୁ ନଗଦ ଆଦାୟ କରନ୍ତୁ';

  @override
  String get customerOnlineFareDue => 'ଗ୍ରାହକଙ୍କ ଅନଲାଇନ୍ ଭଡ଼ା ଦେୟ';

  @override
  String get reachuWalletCredit => 'Reachu ୱାଲେଟ୍ କ୍ରେଡିଟ୍';

  @override
  String promoReimbursementNote(String amount) {
    return '*ଆପଣଙ୍କ ୱାଲେଟରେ ଜମା ହୋଇଥିବା Reachu ପ୍ରୋମୋ ପୁନରୁଦ୍ଧାର ଅନ୍ତର୍ଭୁକ୍ତ';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*ଅପେକ୍ଷା ସମୟ ପାଇଁ ୱେଟିଂ ଚାର୍ଜ ଅନ୍ତର୍ଭୁକ୍ତ';
  }

  @override
  String get paymentReceivedSuccess => 'ପେମେଣ୍ଟ ସଫଳତାର ସହିତ ପ୍ରାପ୍ତ ହେଲା!';

  @override
  String get paymentStillPending => 'ପେମେଣ୍ଟ ଏବେ ବି ବାକି ଅଛି';

  @override
  String get waitingCharge => 'ୱେଟିଂ ଚାର୍ଜ';

  @override
  String get rentalCharge => 'ରେଣ୍ଟାଲ୍ ଚାର୍ଜ';

  @override
  String get grossFare => 'ମୋଟ ଭଡ଼ା';

  @override
  String get pendingDue => 'ବାକି ପରିମାଣ';

  @override
  String get tollFee => 'ଟୋଲ୍ ଫି';

  @override
  String get cancellationFee => 'ବାତିଲ୍ ଫି';

  @override
  String get nightSurcharge => 'ନାଇଟ୍ ସରଚାର୍ଜ';

  @override
  String get surgeFee => 'ସର୍ଜ ଫି';

  @override
  String get taxAndFees => 'ଟିକସ ଏବଂ ଫି';

  @override
  String get platformFee => 'ପ୍ଲାଟଫର୍ମ ଫି';

  @override
  String get pressBackAgainToExit => 'ଆପରୁ ବାହାରିବା ପାଇଁ ପୁଣି ବ୍ୟାକ୍ ଦବାନ୍ତୁ';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'ବାହାରିବା ପୂର୍ବରୁ ଦୟାକରି ରାଇଡ୍ ଗ୍ରହଣ କିମ୍ବା ପ୍ରତ୍ୟାଖ୍ୟାନ କରନ୍ତୁ';

  @override
  String get cashPayment => 'ନଗଦ ପେମେଣ୍ଟ';

  @override
  String get onlineQr => 'ଅନଲାଇନ୍ କ୍ୟୁଆର୍';

  @override
  String get collectCashInstructions =>
      'ରାଇଡ୍ ସମାପ୍ତ କରିବା ପୂର୍ବରୁ ଦୟାକରି ଗ୍ରାହକଙ୍କଠାରୁ ନଗଦ ଟଙ୍କା ସଂଗ୍ରହ କରନ୍ତୁ।';

  @override
  String collectCashStep1(String amount) {
    return '୧. ଗ୍ରାହକଙ୍କଠାରୁ ସଠିକ୍ ନଗଦ ପରିମାଣ ସଂଗ୍ରହ କରନ୍ତୁ';
  }

  @override
  String get collectCashStep2 =>
      '୨. ତଳେ \'ନଗଦ ପ୍ରାପ୍ତ ନିଶ୍ଚିତ କରନ୍ତୁ\' ବଟନ୍ ଟ୍ୟାପ୍ କରନ୍ତୁ';

  @override
  String get verifyingCashDeposit => 'ନଗଦ ଜମା ଯାଞ୍ଚ କରାଯାଉଛି...';

  @override
  String get pleaseHoldClosingRide =>
      'ଆମେ ରାଇଡ୍ ବନ୍ଦ କରିବା ପର୍ଯ୍ୟନ୍ତ ଦୟାକରି ଅପେକ୍ଷା କରନ୍ତୁ';

  @override
  String get customerOnlinePayment => 'ଗ୍ରାହକ ଅନଲାଇନ୍ ପେମେଣ୍ଟ';

  @override
  String get generatingQrCode => 'କ୍ୟୁଆର୍ କୋଡ୍ ତିଆରି କରାଯାଉଛି...';

  @override
  String get failedToLoadQrCode => 'କ୍ୟୁଆର୍ କୋଡ୍ ଲୋଡ୍ କରିବାରେ ବିଫଳ';

  @override
  String get scanQrToPay =>
      'ଅନଲାଇନ୍ ପେମେଣ୍ଟ ପାଇଁ ଗ୍ରାହକଙ୍କୁ କ୍ୟୁଆର୍ କୋଡ୍ ସ୍କାନ୍ କରିବାକୁ କୁହନ୍ତୁ';

  @override
  String get pinchToZoomQr => 'କ୍ୟୁଆର୍ କୋଡ୍ ଜୁମ୍ କରିବା ପାଇଁ ପିଞ୍ଚ୍ କରନ୍ତୁ';

  @override
  String get tapToFullScreen =>
      'ଫୁଲ୍ ସ୍କ୍ରିନ୍ ଭ୍ୟୁ ପାଇଁ କ୍ୟୁଆର୍ କୋଡ୍ ଉପରେ ଟ୍ୟାପ୍ କରନ୍ତୁ';

  @override
  String get awaitingCustomerPayment =>
      'ଗ୍ରାହକଙ୍କ ପେମେଣ୍ଟ ପାଇଁ ଅପେକ୍ଷା କରାଯାଇଛି...';

  @override
  String get confirmCashReceived => 'ନଗଦ ପ୍ରାପ୍ତ ନିଶ୍ଚିତ କରନ୍ତୁ';

  @override
  String get paymentReceivedToast => 'ପେମେଣ୍ଟ ମିଳିଲା! ରାଇଡ୍ ବନ୍ଦ କରାଯାଉଛି...';

  @override
  String get invalidOrderIdError => 'ଅବୈଧ ଅର୍ଡର ଆଇଡି';

  @override
  String get cashPaymentRecordedWaiting =>
      'ନଗଦ ପେମେଣ୍ଟ ରେକର୍ଡ ହୋଇଛି। ରାଇଡ୍ ବନ୍ଦ କରାଯାଉଛି...';

  @override
  String get paymentReceivedTitle => 'ପେମେଣ୍ଟ ପ୍ରାପ୍ତ ହେଲା';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount ଟଙ୍କା ସଫଳତାର ସହିତ ପ୍ରଦାନ କରାଗଲା!';
  }

  @override
  String get rideClosedReturningHome =>
      'ରାଇଡ୍ ବନ୍ଦ ହେଲା। ହୋମ୍ ସ୍କ୍ରିନ୍ କୁ ଫେରୁଛି...';

  @override
  String get fragileGoods => 'ଭଙ୍ଗୁର ସାମଗ୍ରୀ';

  @override
  String get yes => 'ହଁ';

  @override
  String get no => 'ନାହିଁ';

  @override
  String contactLabel(String name, Object phone) {
    return 'ସମ୍ପର୍କ: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'ଅନୁମତି ଆବଶ୍ୟକ';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver ଅଫଲାଇନ୍ ଏବଂ ଅନଲାଇନ୍ ରେ ସଠିକ୍ କାର୍ଯ୍ୟ କରିବା ପାଇଁ ନିମ୍ନଲିଖିତ ଅନୁମତି ଆବଶ୍ୟକ କରେ।';

  @override
  String get locationAlwaysTitle => 'ସ୍ଥାନ (ସବୁବେଳେ ଅନୁମତି ଦିଅନ୍ତୁ)';

  @override
  String get locationAlwaysSubtitle =>
      'ଅର୍ଡର ଡିସପାଚ୍ ଏବଂ ବ୍ୟାକଗ୍ରାଉଣ୍ଡ ରାଇଡ୍ ଟ୍ରାକିଂ ପାଇଁ ଆବଶ୍ୟକ।';

  @override
  String get batteryUnrestrictedTitle => 'ବ୍ୟାଟେରୀ ଅପ୍ଟିମାଇଜେସନ୍ (ଅସୀମିତ)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'ବ୍ୟାକଗ୍ରାଉଣ୍ଡ ସକେଟ୍ ସଂଯୋଗ ଏବଂ ଆଲର୍ଟ ବନ୍ଦ ନହେବା ସୁନିଶ୍ଚିତ କରେ।';

  @override
  String get notificationsTitle => 'ବିଜ୍ଞପ୍ତି';

  @override
  String get notificationsSubtitle =>
      'ନୂତନ ରାଇଡ୍ ଅନୁରୋଧ ଏବଂ ଅର୍ଡର ଆଲର୍ଟ ପାଇଁ ଆବଶ୍ୟକ।';

  @override
  String get displayOverAppsTitle => 'ଅନ୍ୟ ଆପ୍ସ ଉପରେ ପ୍ରଦର୍ଶନ କରନ୍ତୁ';

  @override
  String get displayOverAppsSubtitle =>
      'ଫୁଲ୍-ସ୍କ୍ରିନ୍ ଆସୁଥିବା ଅର୍ଡର ପପ୍-ଅପ୍ ପାଇଁ ଆବଶ୍ୟକ।';

  @override
  String get locationUsedInBackground => 'ବ୍ୟାକଗ୍ରାଉଣ୍ଡରେ ବ୍ୟବହୃତ ସ୍ଥାନ';

  @override
  String get backgroundLocationDisclosureBody =>
      'ଆପ୍ ବନ୍ଦ ଥିବାବେଳେ କିମ୍ବା ବ୍ୟବହାରରେ ନଥିବାବେଳେ ବି ReachuDriver ସ୍ଥାନ ଡାଟା ସଂଗ୍ରହ କରେ।\n\nଏହା ନିମ୍ନ ପାଇଁ ବ୍ୟବହୃତ ହୁଏ:\n  • ଲୋଡର/ବ୍ୟବହାରକାରୀଙ୍କ ସହିତ ଆପଣଙ୍କର ସମୟ-ସ୍ଥିତି ସେୟାର କରିବା\n  • ଆପଣଙ୍କୁ ନିକଟତମ ବୁକିଂ ଅନୁରୋଧ ବଣ୍ଟନ କରିବା\n  • ଡ୍ୟୁଟିରେ ଥିବାବେଳେ ଡିସପାଚ୍ ସିଷ୍ଟମ ଅପଡେଟ୍ ରଖିବା\n\nସ୍ଥାନ ସଂଗ୍ରହ କେବଳ ଆପଣ ଅନଲାଇନ୍ (ଡ୍ୟୁଟିରେ) ଥିବାବେଳେ ଚାଲେ ଏବଂ ଅଫଲାଇନ୍ ଗଲେ ତୁରନ୍ତ ବନ୍ଦ ହୋଇଯାଏ।';

  @override
  String get changeInAppSettingsNote =>
      'ଆପଣ ଆପ୍ ସେଟିଂସରେ ଯେକୌଣସି ସମୟରେ ଏହାକୁ ପରିବର୍ତ୍ତନ କରିପାରିବେ।';

  @override
  String get iUnderstandContinue => 'ମୁଁ ବୁଝିଗଲି — ଜାରି ରଖନ୍ତୁ';

  @override
  String get notNow => 'ଏବେ ନୁହେଁ';

  @override
  String get lowWalletBalance => 'କମ୍ ୱାଲେଟ୍ ବାଲାନ୍ସ';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ଅର୍ଡର ପାଇବା ପାଇଁ ଦୟାକରି ସର୍ବନିମ୍ନ ₹$limit ର ୱାଲେଟ୍ ବାଲାନ୍ସ ରଖନ୍ତୁ | ଅର୍ଡର ପାଇବା ଜାରି ରଖିବା ପାଇଁ ଆପଣଙ୍କର ୱାଲେଟ୍ ଟପ୍ ଅପ୍ କରନ୍ତୁ |';
  }

  @override
  String get minimumRequiredBalance => 'ସର୍ବନିମ୍ନ ଆବଶ୍ୟକ ବାଲାନ୍ସ';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ଅର୍ଡର ପାଇବା ପାଇଁ ଦୟାକରି ଆପଣଙ୍କ ୱାଲେଟ୍‌ରେ ଅତି କମରେ ₹$limit ରଖନ୍ତୁ |';
  }

  @override
  String get activeForRides => 'ରାଇଡ୍ ପାଇଁ ସକ୍ରିୟ';

  @override
  String get lowBalanceStatus => 'କମ୍ ବାଲାନ୍ସ';

  @override
  String get minimumLimit => 'ସର୍ବନିମ୍ନ ସୀମା';

  @override
  String get eShramBenefitsTitle => 'ଇ-ଶ୍ରମ ଲାଭ';

  @override
  String get govtScheme => 'ସରକାରୀ ଯୋଜନା';

  @override
  String get eShramSubHeader => 'ସରକାରୀ ବିମା ଏବଂ ପେନସନ୍ ଯୋଜନା';

  @override
  String get eShramDescription =>
      'ଗିଗ୍ କର୍ମଚାରୀଙ୍କ ପାଇଁ ଦୁର୍ଘଟଣା ବିମା କଭର ଏବଂ ସାମାଜିକ ସୁରକ୍ଷା ଲାଭ ପାଇଁ ଅଫିସିଆଲ୍ ସରକାରୀ ଇ-ଶ୍ରମ ପୋର୍ଟାଲରେ ପଞ୍ଜିକରଣ କରନ୍ତୁ |';

  @override
  String get registerOnEShramPortal => 'ଇ-ଶ୍ରମ ପୋର୍ଟାଲରେ ପଞ୍ଜିକରଣ କରନ୍ତୁ';

  @override
  String get eShramGovtBenefitsMenu => 'ଇ-ଶ୍ରମ ସରକାରୀ ଲାଭ';

  @override
  String get dismiss => 'ଖାରଜ କରନ୍ତୁ';

  @override
  String get trainingVideos => 'ତାଲିମ ଭିଡିଓ';

  @override
  String get welcomeToReachU => 'ନମସ୍କାର, ReachU ରେ ଆପଣଙ୍କୁ ସ୍ୱାଗତ!';

  @override
  String get welcomeTrainingSubtitle =>
      'ଆସନ୍ତୁ ଆପଣଙ୍କର ଯାତ୍ରା ଆରମ୍ଭ କରିବା! ଆପ୍ କିପରି କାମ କରେ ତାହା ଜାଣିବା ପାଇଁ ଦୟାକରି ଏହି ଛୋଟ ତାଲିମ ଭିଡିଓ ଦେଖନ୍ତୁ।';

  @override
  String get trainingCompletedTitle => 'ତାଲିମ ସମ୍ପୂର୍ଣ୍ଣ ହେଲା!';

  @override
  String get trainingCompletedSubtitle =>
      'ବହୁତ ଭଲ! ଆପଣ ସଫଳତାର ସହିତ ସମସ୍ତ ଆବଶ୍ୟକୀୟ ତାଲିମ ସମ୍ପୂର୍ଣ୍ଣ କରିଛନ୍ତି। ଆପଣ ଏବେ ଡ୍ରାଇଭିଂ ଆରମ୍ଭ କରିବାକୁ ପ୍ରସ୍ତୁତ।';

  @override
  String get startDriving => 'ଡ୍ରାଇଭିଂ ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get iHaveReadAndConsent =>
      'ମୁଁ ପଢ଼ିଛି ଏବଂ ଏଥିପାଇଁ ମୋର ସମ୍ମତି ପ୍ରଦାନ କରୁଛି: ';

  @override
  String get tdsDeclaration => 'TDS ଘୋଷଣାନାମା';
}
