// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get account => 'ਖਾਤਾ';

  @override
  String get editProfile => 'ਪ੍ਰੋਫਾਈਲ ਸੋਧੋ';

  @override
  String get logout => 'ਲਾਗਆਉਟ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get selectLanguage => 'ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get english => 'English (ਅੰਗਰੇਜ਼ੀ)';

  @override
  String get hindi => 'ਹਿੰਦੀ (Hindi)';

  @override
  String get selectVehicle => 'ਵਾਹਨ ਚੁਣੋ';

  @override
  String get selectAVehicle => 'ਇੱਕ ਵਾਹਨ ਚੁਣੋ';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName ਨਾਲ ਅੱਗੇ ਵਧੋ';
  }

  @override
  String get addStop => 'ਸਟਾਪ ਜੋੜੋ';

  @override
  String get editLocations => 'ਸਥਾਨ ਸੋਧੋ';

  @override
  String get noPickupLocationSet => 'ਕੋਈ ਪਿਕਅੱਪ ਸਥਾਨ ਸੈੱਟ ਨਹੀਂ ਹੈ';

  @override
  String get noDropLocationSet => 'ਕੋਈ ਡ੍ਰੌਪ ਸਥਾਨ ਸੈੱਟ ਨਹੀਂ ਹੈ';

  @override
  String get addDrop => 'ਡ੍ਰੌਪ ਜੋੜੋ';

  @override
  String get errorLoadingVehicles => 'ਵਾਹਨ ਲੋਡ ਕਰਨ ਵਿੱਚ ਗਲਤੀ';

  @override
  String get selectGoodsType => 'ਮਾਲ ਦੀ ਕਿਸਮ ਚੁਣੋ';

  @override
  String get whatAreYouShipping => 'ਤੁਸੀਂ ਕੀ ਭੇਜ ਰਹੇ ਹੋ?';

  @override
  String get chooseCategoryBestMatches => 'ਉਹ ਸ਼੍ਰੇਣੀ ਚੁਣੋ ਜੋ ਤੁਹਾਡੇ ਮਾਲ ਨਾਲ ਸਭ ਤੋਂ ਵੱਧ ਮੇਲ ਖਾਂਦੀ ਹੋਵੇ';

  @override
  String get editGoodsDetails => 'ਮਾਲ ਦੇ ਵੇਰਵੇ ਸੋਧੋ';

  @override
  String get weightKgMax90 => 'ਭਾਰ (ਕਿਲੋ) - ਵੱਧ ਤੋਂ ਵੱਧ 90 ਕਿਲੋ';

  @override
  String get weightInvalidError => 'ਭਾਰ 1 ਤੋਂ 90 ਕਿਲੋ ਵਿਚਕਾਰ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get numberOfPackages => 'ਪੈਕੇਜਾਂ ਦੀ ਗਿਣਤੀ';

  @override
  String get worthValueRupees => 'ਮੁੱਲ / ਕੀਮਤ (ਰੁਪਏ)';

  @override
  String get done => 'ਹੋ ਗਿਆ';

  @override
  String get confirmGoodsDetails => 'ਮਾਲ ਦੇ ਵੇਰਵਿਆਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get failedToLoadCategories => 'ਸ਼੍ਰੇਣੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get disclaimerTitle => 'ਬੇਦਾਅਵਾ';

  @override
  String get disclaimerText => 'ਬੇਦਾਅਵਾ: ਮੈਂ ਘੋਸ਼ਣਾ ਕਰਦਾ ਹਾਂ ਕਿ ਆਵਾਜਾਈ ਕੀਤਾ ਜਾ ਰਿਹਾ ਮਾਲ ਗੈਰ-ਖਤਰਨਾਕ, ਕਾਨੂੰਨੀ ਹੈ ਅਤੇ ਚੁਣੀ ਗਈ ਸ਼੍ਰੇਣੀ ਦਾ ਹੈ। ਪਾਬੰਦੀਸ਼ੁਦਾ ਚੀਜ਼ਾਂ ਦੀ ਆਵਾਜਾਈ ਲਈ ਕੰਪਨੀ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹੈ। ਭਾਰ ਵਾਹਨ ਦੀ ਵੱਧ ਤੋਂ ਵੱਧ ਸਮਰੱਥਾ ਤੋਂ ਵੱਧ ਨਹੀਂ ਹੋਣਾ ਚਾਹੀਦਾ।';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight ਕਿਲੋ • $packages ਪੈਕੇਜ • ₹$worth';
  }

  @override
  String get welcome => 'ਸਵਾਗਤ ਹੈ';

  @override
  String get enterMobileNumberToContinue => 'ਜਾਰੀ ਰੱਖਣ ਲਈ ਆਪਣਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get mobileNumber => 'ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get agreeTermsText => 'ਮੈਂ ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ ਅਤੇ ਗੋਪਨੀਯਤਾ ਨੀਤੀ ਨਾਲ ਸਹਿਮਤ ਹਾਂ';

  @override
  String get sendOtp => 'OTP ਭੇਜੋ';

  @override
  String get verifyOtp => 'OTP ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber ਤੇ ਭੇਜਿਆ ਗਿਆ 4-ਅੰਕਾਂ ਵਾਲਾ ਕੋਡ ਦਰਜ ਕਰੋ';
  }

  @override
  String get verifyAndContinue => 'ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ ਜਾਰੀ ਰੱਖੋ';

  @override
  String resendInSeconds(Object count) {
    return '$count ਸਕਿੰਟਾਂ ਵਿੱਚ ਦੁਬਾਰਾ ਭੇਜੋ';
  }

  @override
  String get resendOtp => 'OTP ਦੁਬਾਰਾ ਭੇਜੋ';

  @override
  String get changeNumber => 'ਨੰਬਰ ਬਦਲੋ';

  @override
  String get mobileNumberRequired => 'ਮੋਬਾਈਲ ਨੰਬਰ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get enterValidMobileNumber => 'ਇੱਕ ਵੈਧ 10-ਅੰਕਾਂ ਵਾਲਾ ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get enterCompleteOtpError => 'ਕਿਰਪਾ ਕਰਕੇ ਪੂਰਾ 4-ਅੰਕਾਂ ਵਾਲਾ OTP ਦਰਜ ਕਰੋ';

  @override
  String get otpResentSuccess => 'OTP ਸਫਲਤਾਪੂਰਵਕ ਦੁਬਾਰਾ ਭੇਜਿਆ ਗਿਆ';

  @override
  String get fullName => 'ਪੂਰਾ ਨਾਮ';

  @override
  String get fullNameRequired => 'ਪੂਰਾ ਨਾਮ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get nameMinLengthError => 'ਨਾਮ ਘੱਟੋ-ਘੱਟ 2 ਅੱਖਰਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get email => 'ਈਮੇਲ';

  @override
  String get emailRequired => 'ਈਮੇਲ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get enterValidEmail => 'ਇੱਕ ਵੈਧ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰੋ';

  @override
  String get referralCode => 'ਰੈਫਰਲ ਕੋਡ';

  @override
  String get enterReferralCodeOptional => 'ਰੈਫਰਲ ਕੋਡ ਦਰਜ ਕਰੋ (ਵਿਕਲਪਿਕ)';

  @override
  String get createAccount => 'ਖਾਤਾ ਬਣਾਓ';

  @override
  String get completeProfileToGetStarted => 'ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਆਪਣੀ ਪ੍ਰੋਫਾਈਲ ਪੂਰੀ ਕਰੋ';

  @override
  String get profileUpdatedSuccess => 'ਪ੍ਰੋਫਾਈਲ ਸਫਲਤਾਪੂਰਵਕ ਅੱਪਡੇਟ ਹੋ ਗਈ!';

  @override
  String get updateProfilePicture => 'ਪ੍ਰੋਫਾਈਲ ਤਸਵੀਰ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get camera => 'ਕੈਮਰਾ';

  @override
  String get gallery => 'ਗੈਲਰੀ';

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get dateOfBirthOptional => 'ਜਨਮ ਤਾਰੀਖ (ਵਿਕਲਪਿਕ)';

  @override
  String get gender => 'ਲਿੰਗ';

  @override
  String get male => 'ਪੁਰਸ਼';

  @override
  String get female => 'ਇਸਤਰੀ';

  @override
  String get other => 'ਹੋਰ';

  @override
  String get updateProfile => 'ਪ੍ਰੋਫਾਈਲ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String profileUpdateFailed(Object error) {
    return 'ਪ੍ਰੋਫਾਈਲ ਅੱਪਡੇਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String get goodMorning => 'ਸ਼ੁਭ ਸਵੇਰ,';

  @override
  String get goodAfternoon => 'ਸ਼ੁਭ ਦੁਪਹਿਰ,';

  @override
  String get goodEvening => 'ਸ਼ੁਭ ਸ਼ਾਮ,';

  @override
  String get pickupFrom => 'ਇੱਥੋਂ ਪਿਕਅੱਪ';

  @override
  String get currentLocation => 'ਮੌਜੂਦਾ ਸਥਾਨ';

  @override
  String get fetchingLocation => 'ਸਥਾਨ ਪ੍ਰਾਪਤ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get locationServicesDisabled => 'ਸਥਾਨ ਸੇਵਾਵਾਂ ਅਯੋਗ ਹਨ';

  @override
  String get locationPermissionNeeded => 'ਸਥਾਨ ਇਜਾਜ਼ਤ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get locationAccessBlocked => 'ਸਥਾਨ ਪਹੁੰਚ ਰੋਕੀ ਗਈ ਹੈ';

  @override
  String get couldNotFetchLocation => 'ਸਥਾਨ ਪ੍ਰਾਪਤ ਨਹੀਂ ਕੀਤਾ ਜਾ ਸਕਿਆ';

  @override
  String get enable => 'ਸਮਰੱਥ ਕਰੋ';

  @override
  String get allow => 'ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get turnOnLocationServices => 'ਸਥਾਨ ਸੇਵਾਵਾਂ ਚਾਲੂ ਕਰੋ';

  @override
  String get allowLocationAccess => 'ਸਥਾਨ ਪਹੁੰਚ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ';

  @override
  String get gpsRequiredDescription => 'ਤੁਹਾਡੇ ਪਿਕਅੱਪ ਸਥਾਨ ਨੂੰ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਨਿਸ਼ਾਨਾ ਲਗਾਉਣ ਅਤੇ ਨੇੜਲੇ ਡਰਾਈਵਰਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਲੱਭਣ ਲਈ ਸਾਨੂੰ ਤੁਹਾਡੇ ਡਿਵਾਈਸ GPS ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get permissionRequiredDescription => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣੀਆਂ ਐਪ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਸਥਾਨ ਇਜਾਜ਼ਤਾਂ ਦੀ ਇਜਾਜ਼ਤ ਦਿਓ ਤਾਂ ਜੋ ਅਸੀਂ ਤੁਹਾਡੇ ਪਿਕਅੱਪ ਸਥਾਨ ਨੂੰ ਸਹੀ ਤਰੀਕੇ ਨਾਲ ਨਿਸ਼ਾਨਾ ਲਗਾ ਸਕੀਏ ਅਤੇ ਨੇੜਲੇ ਡਰਾਈਵਰਾਂ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਲੱਭ ਸਕੀਏ।';

  @override
  String get goToLocationSettings => 'ਸਥਾਨ ਸੈਟਿੰਗਾਂ ਤੇ ਜਾਓ';

  @override
  String get goToAppSettings => 'ਐਪ ਸੈਟਿੰਗਾਂ ਤੇ ਜਾਓ';

  @override
  String get enterAddressManually => 'ਮੈਂ ਆਪਣਾ ਪਤਾ ਖੁਦ ਦਰਜ ਕਰਾਂਗਾ';

  @override
  String get taglineTitle => 'ਕੁਝ ਵੀ ਲੈ ਜਾਓ,\nਕਦੇ ਵੀ।';

  @override
  String get taglineSubtitle => 'ਤੇਜ਼ ਡਿਲਿਵਰੀ ਤੁਹਾਡੀਆਂ ਉਂਗਲਾਂ ਤੇ। ਸਮਾਰਟ ਤਰੀਕੇ ਨਾਲ ਸ਼ਿਫਟ ਕਰੋ, ਸਾਡੇ ਪ੍ਰੀਮੀਅਮ ਫਲੀਟ ਨਾਲ ਤੇਜ਼ੀ ਨਾਲ ਅੱਗੇ ਵਧੋ।';

  @override
  String get twoWheelers => 'ਦੋ ਪਹੀਏ';

  @override
  String get trucks => 'ਟਰੱਕ';

  @override
  String get specialOffer => 'ਵਿਸ਼ੇਸ਼ ਆਫਰ';

  @override
  String get promoBannerText => 'ਆਪਣੀ ਪਹਿਲੀ ਰਾਈਡ ਤੇ\n20% ਦੀ ਛੋਟ ਪ੍ਰਾਪਤ ਕਰੋ';

  @override
  String get whereIsYourPickup => 'ਤੁਹਾਡਾ ਪਿਕਅੱਪ ਕਿੱਥੇ ਹੈ?';

  @override
  String get whereIsYourDrop => 'ਤੁਹਾਡਾ ਡ੍ਰੌਪ ਕਿੱਥੇ ਹੈ?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'ਤੁਹਾਡਾ ਡ੍ਰੌਪ $index ਕਿੱਥੇ ਹੈ?';
  }

  @override
  String get typeMinCharsToSearch => 'ਖੋਜ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਘੱਟੋ-ਘੱਟ 4 ਅੱਖਰ ਟਾਈਪ ਕਰੋ';

  @override
  String get selectOnMap => 'ਨਕਸ਼ੇ ਤੇ ਚੁਣੋ';

  @override
  String get pinpointExactLocation => 'ਆਪਣੇ ਸਹੀ ਸਥਾਨ ਨੂੰ ਨਿਸ਼ਾਨਾ ਲਗਾਓ';

  @override
  String get couldNotFindAddress => 'ਮਾਫ਼ ਕਰੋ, ਸਾਨੂੰ ਇਹ ਪਤਾ ਨਹੀਂ ਮਿਲਿਆ।';

  @override
  String get trySearchingNearbyLandmark => 'ਕਿਸੇ ਨੇੜਲੇ ਲੈਂਡਮਾਰਕ, ਇਲਾਕੇ ਜਾਂ ਪ੍ਰਸਿੱਧ ਸਥਾਨ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਖੋਜਣ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get anErrorOccurred => 'ਇੱਕ ਗਲਤੀ ਹੋਈ';

  @override
  String get locating => 'ਸਥਾਨ ਲੱਭਿਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get fetchingDetails => 'ਵੇਰਵੇ ਪ੍ਰਾਪਤ ਕੀਤੇ ਜਾ ਰਹੇ ਹਨ...';

  @override
  String get confirmPickupLocation => 'ਪਿਕਅੱਪ ਸਥਾਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get confirmDropLocation => 'ਡ੍ਰੌਪ ਸਥਾਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get houseShopApartment => 'ਘਰ / ਦੁਕਾਨ / ਅਪਾਰਟਮੈਂਟ';

  @override
  String get sendersName => 'ਭੇਜਣ ਵਾਲੇ ਦਾ ਨਾਮ';

  @override
  String get receiversName => 'ਪ੍ਰਾਪਤ ਕਰਨ ਵਾਲੇ ਦਾ ਨਾਮ';

  @override
  String get pleaseEnterName => 'ਕਿਰਪਾ ਕਰਕੇ ਨਾਮ ਦਰਜ ਕਰੋ';

  @override
  String get sendersMobileNumber => 'ਭੇਜਣ ਵਾਲੇ ਦਾ ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get receiversMobileNumber => 'ਪ੍ਰਾਪਤ ਕਰਨ ਵਾਲੇ ਦਾ ਮੋਬਾਈਲ ਨੰਬਰ';

  @override
  String get enterValidTenDigitNumber => 'ਇੱਕ ਵੈਧ 10-ਅੰਕਾਂ ਵਾਲਾ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get useMyMobileNumber => 'ਮੇਰਾ ਮੋਬਾਈਲ ਨੰਬਰ ਵਰਤੋ';

  @override
  String get saveAsOptional => 'ਇਸ ਰੂਪ ਵਿੱਚ ਸੇਵ ਕਰੋ (ਵਿਕਲਪਿਕ):';

  @override
  String get home => 'ਘਰ';

  @override
  String get shop => 'ਦੁਕਾਨ';

  @override
  String get confirmAndProceed => 'ਪੁਸ਼ਟੀ ਕਰੋ ਅਤੇ ਅੱਗੇ ਵਧੋ';

  @override
  String get selectDropLocation => 'ਡ੍ਰੌਪ ਸਥਾਨ ਚੁਣੋ';

  @override
  String get cannotSwapEmptyLocations => 'ਖਾਲੀ ਸਥਾਨਾਂ ਨੂੰ ਭਰੇ ਹੋਏ ਸਥਾਨਾਂ ਨਾਲ ਬਦਲਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ।';

  @override
  String get proceedToVehicleSelection => 'ਵਾਹਨ ਚੋਣ ਤੇ ਅੱਗੇ ਵਧੋ';

  @override
  String get permissionRequired => 'ਇਜਾਜ਼ਤ ਲੋੜੀਂਦੀ ਹੈ';

  @override
  String get contactsPermissionDescription => 'ਭੇਜਣ ਵਾਲੇ ਦਾ ਫੋਨ ਨੰਬਰ ਆਸਾਨੀ ਨਾਲ ਚੁਣਨ ਲਈ Reachu ਨੂੰ ਤੁਹਾਡੇ ਸੰਪਰਕਾਂ ਤੱਕ ਪਹੁੰਚ ਦੀ ਲੋੜ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਇਸ ਨੂੰ ਐਪ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਸਮਰੱਥ ਕਰੋ।';

  @override
  String get openSettings => 'ਸੈਟਿੰਗਾਂ ਖੋਲ੍ਹੋ';

  @override
  String get selectContact => 'ਸੰਪਰਕ ਚੁਣੋ';

  @override
  String get contactPermissionDenied => 'ਸੰਪਰਕ ਇਜਾਜ਼ਤ ਇਨਕਾਰ ਕਰ ਦਿੱਤੀ ਗਈ।';

  @override
  String get myProfile => 'ਮੇਰੀ ਪ੍ਰੋਫਾਈਲ';

  @override
  String selfFormat(String name) {
    return '$name (ਖੁਦ)';
  }

  @override
  String get deviceContacts => 'ਡਿਵਾਈਸ ਸੰਪਰਕ';

  @override
  String get rideHistory => 'ਰਾਈਡ ਦਾ ਇਤਿਹਾਸ';

  @override
  String get transactions => 'ਲੈਣ-ਦੇਣ';

  @override
  String get noTransactionsFound => 'ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get failedToLoadTransactions => 'ਲੈਣ-ਦੇਣ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get addMoney => 'ਪੈਸੇ ਜੋੜੋ';

  @override
  String get enterAmountToAdd => 'ਜੋੜਨ ਲਈ ਰਕਮ ਦਰਜ ਕਰੋ';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay ਖੋਲ੍ਹਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'ਭੁਗਤਾਨ ਆਰਡਰ ਬਣਾਉਣ ਵਿੱਚ ਅਸਫਲ: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'Reachu ਕ੍ਰੈਡਿਟ ਵਿੱਚ ₹$amount ਸਫਲਤਾਪੂਰਵਕ ਜੋੜੇ ਗਏ!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'ਭੁਗਤਾਨ ਪੁਸ਼ਟੀ ਅਸਫਲ: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'ਭੁਗਤਾਨ ਅਸਫਲ ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'ਬਾਹਰੀ ਵਾਲਿਟ ਚੁਣਿਆ ਗਿਆ: $walletName';
  }

  @override
  String get walletTopUp => 'ਵਾਲਿਟ ਟਾਪ-ਅੱਪ';

  @override
  String get payments => 'ਭੁਗਤਾਨ';

  @override
  String get reachuCredits => 'Reachu ਕ੍ਰੈਡਿਟ';

  @override
  String get balance => 'ਬਕਾਇਆ';

  @override
  String get errorLoadingBalance => 'ਬਕਾਇਆ ਲੋਡ ਕਰਨ ਵਿੱਚ ਗਲਤੀ';

  @override
  String get availableBalance => 'ਉਪਲਬਧ ਬਕਾਇਆ';

  @override
  String get totalExpenses => 'ਕੁੱਲ ਖਰਚ';

  @override
  String get recentTransactions => 'ਹਾਲੀਆ ਲੈਣ-ਦੇਣ';

  @override
  String get viewMore => 'ਹੋਰ ਵੇਖੋ';

  @override
  String get noTransactionsYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਲੈਣ-ਦੇਣ ਨਹੀਂ';

  @override
  String get booking => 'ਬੁਕਿੰਗ';

  @override
  String get earning => 'ਕਮਾਈ';

  @override
  String get support => 'ਸਹਾਇਤਾ';

  @override
  String get profile => 'ਪ੍ਰੋਫਾਈਲ';

  @override
  String get pendingWithdrawals => 'ਲੰਬਿਤ ਨਿਕਾਸੀਆਂ';

  @override
  String get driverDebt => 'ਡਰਾਈਵਰ ਕਰਜ਼ਾ';

  @override
  String minBalanceRequired(Object amount) {
    return 'ਘੱਟੋ-ਘੱਟ ਬਕਾਇਆ ਲੋੜੀਂਦਾ: ₹$amount';
  }

  @override
  String get insufficientBalance => 'ਨਿਕਾਸੀ ਲਈ ਨਾਕਾਫ਼ੀ ਬਕਾਇਆ';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'ਚੇਤਾਵਨੀ: ਤੁਹਾਡਾ ਉਪਲਬਧ ਬਕਾਇਆ ਨਵੀਆਂ ਰਾਈਡਾਂ ਸਵੀਕਾਰ ਕਰਨ ਲਈ ਲੋੜੀਂਦੀ ਘੱਟੋ-ਘੱਟ ਸੀਮਾ (₹$amount) ਤੋਂ ਘੱਟ ਹੈ। ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਵਾਲਿਟ ਟਾਪ ਅੱਪ ਕਰੋ।';
  }

  @override
  String get moneyTransfer => 'ਪੈਸੇ ਟ੍ਰਾਂਸਫਰ ਕਰੋ';

  @override
  String get withdrawMoney => 'ਪੈਸੇ ਕਢਵਾਓ';

  @override
  String get manageAccounts => 'ਖਾਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰੋ';

  @override
  String get bankAccounts => 'ਬੈਂਕ ਖਾਤੇ ਅਤੇ UPI';

  @override
  String get addAccount => 'ਭੁਗਤਾਨ ਵਿਧੀ ਜੋੜੋ';

  @override
  String get addBankAccount => 'ਬੈਂਕ ਖਾਤਾ ਜੋੜੋ';

  @override
  String get addUpiId => 'UPI ID ਜੋੜੋ';

  @override
  String get editBankAccount => 'ਬੈਂਕ ਖਾਤਾ ਸੋਧੋ';

  @override
  String get editUpiId => 'UPI ID ਸੋਧੋ';

  @override
  String get deleteAccount => 'ਖਾਤਾ ਮਿਟਾਓ';

  @override
  String get deleteAccountConfirm => 'ਕੀ ਤੁਸੀਂ ਸੱਚਮੁੱਚ ਇਸ ਭੁਗਤਾਨ ਵਿਧੀ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?';

  @override
  String get accountHolderName => 'ਖਾਤਾ ਧਾਰਕ ਦਾ ਨਾਮ';

  @override
  String get bankName => 'ਬੈਂਕ ਦਾ ਨਾਮ';

  @override
  String get accountNumber => 'ਖਾਤਾ ਨੰਬਰ';

  @override
  String get confirmAccountNumber => 'ਖਾਤਾ ਨੰਬਰ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get ifscCode => 'IFSC ਕੋਡ';

  @override
  String get upiId => 'UPI ID';

  @override
  String get fieldRequired => 'ਇਹ ਖੇਤਰ ਲੋੜੀਂਦਾ ਹੈ';

  @override
  String get invalidUpi => 'ਇੱਕ ਵੈਧ UPI ID ਦਰਜ ਕਰੋ (ਜਿਵੇਂ name@upi)';

  @override
  String get invalidIfsc => 'ਇੱਕ ਵੈਧ 11-ਅੱਖਰਾਂ ਵਾਲਾ IFSC ਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get invalidAccountNumber => 'ਇੱਕ ਵੈਧ ਖਾਤਾ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get accountNumbersDoNotMatch => 'ਖਾਤਾ ਨੰਬਰ ਮੇਲ ਨਹੀਂ ਖਾਂਦੇ';

  @override
  String get noPaymentMethods => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਭੁਗਤਾਨ ਵਿਧੀ ਨਹੀਂ ਜੋੜੀ ਗਈ';

  @override
  String get addPaymentMethodSubtitle => 'ਆਪਣੀ ਕਮਾਈ ਕਢਵਾਉਣ ਲਈ ਇੱਕ ਬੈਂਕ ਖਾਤਾ ਜਾਂ UPI ID ਜੋੜੋ';

  @override
  String get confirmTransfer => 'ਟ੍ਰਾਂਸਫਰ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get transferAmount => 'ਟ੍ਰਾਂਸਫਰ ਰਕਮ';

  @override
  String get transferSuccess => 'ਨਿਕਾਸੀ ਬੇਨਤੀ ਸਫਲਤਾਪੂਰਵਕ ਬਣਾਈ ਗਈ';

  @override
  String get collectPayment => 'ਭੁਗਤਾਨ ਇਕੱਠਾ ਕਰੋ';

  @override
  String get collectCash => 'ਨਕਦ ਇਕੱਠਾ ਕਰੋ';

  @override
  String get cashCollectedSuccess => 'ਨਕਦ ਭੁਗਤਾਨ ਸਫਲਤਾਪੂਰਵਕ ਪੂਰਾ ਹੋਇਆ!';

  @override
  String get displayQrCode => 'UPI QR ਕੋਡ ਦਿਖਾਓ';

  @override
  String get customerScanQr => 'ਭੁਗਤਾਨ ਕਰਨ ਲਈ ਇਸ QR ਕੋਡ ਨੂੰ ਸਕੈਨ ਕਰਨ ਲਈ ਗਾਹਕ ਨੂੰ ਕਹੋ';

  @override
  String get generatingQr => 'QR ਕੋਡ ਬਣਾਇਆ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get selectPaymentMethod => 'ਭੁਗਤਾਨ ਵਿਧੀ ਚੁਣੋ';

  @override
  String get beneficiary => 'ਲਾਭਪਾਤਰੀ';

  @override
  String get completed => 'ਪੂਰਾ ਹੋਇਆ';

  @override
  String get pending => 'ਲੰਬਿਤ';

  @override
  String get failed => 'ਅਸਫਲ';

  @override
  String get failedToLoadAccounts => 'ਭੁਗਤਾਨ ਵਿਧੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get accountDeletedSuccess => 'ਭੁਗਤਾਨ ਵਿਧੀ ਸਫਲਤਾਪੂਰਵਕ ਮਿਟਾਈ ਗਈ';

  @override
  String get accountUpdatedSuccess => 'ਭੁਗਤਾਨ ਵਿਧੀ ਸਫਲਤਾਪੂਰਵਕ ਅੱਪਡੇਟ ਹੋਈ';

  @override
  String get accountAddedSuccess => 'ਭੁਗਤਾਨ ਵਿਧੀ ਸਫਲਤਾਪੂਰਵਕ ਜੋੜੀ ਗਈ';

  @override
  String get withdrawalAmount => 'ਨਿਕਾਸੀ ਰਕਮ';

  @override
  String get transferDestination => 'ਟ੍ਰਾਂਸਫਰ ਮੰਜ਼ਿਲ';

  @override
  String get enterAmount => 'ਰਕਮ ਦਰਜ ਕਰੋ';

  @override
  String get selected => 'ਚੁਣਿਆ ਗਿਆ';

  @override
  String get accountNumberLabel => 'ਖਾਤਾ ਨੰਬਰ';

  @override
  String get errorLoadingAccounts => 'ਭੁਗਤਾਨ ਵਿਧੀਆਂ ਲੋਡ ਕਰਨ ਵਿੱਚ ਗਲਤੀ';

  @override
  String get errorLoadingWallet => 'ਵਾਲਿਟ ਜਾਣਕਾਰੀ ਲੋਡ ਕਰਨ ਵਿੱਚ ਗਲਤੀ';

  @override
  String get enterAccountHolderName => 'ਖਾਤਾ ਧਾਰਕ ਦਾ ਨਾਮ ਦਰਜ ਕਰੋ';

  @override
  String get bankNameHint => 'ਜਿਵੇਂ ਸਟੇਟ ਬੈਂਕ ਆਫ ਇੰਡੀਆ';

  @override
  String get enterAccountNumber => 'ਖਾਤਾ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get confirmAccountNumberHint => 'ਖਾਤਾ ਨੰਬਰ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get ifscCodeHint => 'ਜਿਵੇਂ SBIN0001234';

  @override
  String get upiIdHint => 'ਜਿਵੇਂ user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'ਕੁੱਲ ਕਿਰਾਇਆ';

  @override
  String get hideQrCode => 'QR ਲੁਕਾਓ';

  @override
  String get nameMinLengthRequired => 'ਨਾਮ ਘੱਟੋ-ਘੱਟ 2 ਅੱਖਰਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String orderNumber(String orderId) {
    return 'ਆਰਡਰ #$orderId';
  }

  @override
  String get personalInformation => 'ਨਿੱਜੀ ਜਾਣਕਾਰੀ';

  @override
  String get online => 'ਆਨਲਾਈਨ';

  @override
  String get offline => 'ਆਫਲਾਈਨ';

  @override
  String get onlineSuccessMessage => 'ਹੁਣ ਤੁਸੀਂ ਆਨਲਾਈਨ ਅਤੇ ਡਿਊਟੀ ਤੇ ਹੋ।';

  @override
  String get offlineSuccessMessage => 'ਹੁਣ ਤੁਸੀਂ ਆਫਲਾਈਨ ਹੋ।';

  @override
  String get partnerSupport => 'ਪਾਰਟਨਰ ਸਹਾਇਤਾ';

  @override
  String get partnerSupportSubtitle => 'ਸਤਿ ਸ੍ਰੀ ਅਕਾਲ ਪਾਰਟਨਰ! ਕੀ ਤੁਹਾਨੂੰ ਆਪਣੀ ਰਾਈਡ, ਭੁਗਤਾਨ ਜਾਂ ਖਾਤੇ ਵਿੱਚ ਮਦਦ ਚਾਹੀਦੀ ਹੈ? ਅਸੀਂ ਇੱਥੇ ਤੁਹਾਡੀ 24/7 ਸਹਾਇਤਾ ਲਈ ਹਾਂ।';

  @override
  String get faqsAndHelp => 'ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ ਅਤੇ ਸਹਾਇਤਾ';

  @override
  String get findQuickAnswers => 'ਤੇਜ਼ ਜਵਾਬ ਲੱਭੋ';

  @override
  String get raiseSupportTicket => 'ਟਿਕਟ ਦਰਜ ਕਰੋ';

  @override
  String get contactSupportAgent => 'ਸਹਾਇਤਾ ਏਜੰਟ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get recentTickets => 'ਹਾਲੀਆ ਟਿਕਟ';

  @override
  String get noActiveTickets => 'ਕੋਈ ਸਰਗਰਮ ਸਹਾਇਤਾ ਟਿਕਟ ਨਹੀਂ ਹੈ';

  @override
  String get submitTicketDescription => 'ਜੇ ਤੁਹਾਨੂੰ ਕੋਈ ਸਮੱਸਿਆ ਆਉਂਦੀ ਹੈ ਤਾਂ ਟਿਕਟ ਸਬਮਿਟ ਕਰੋ।';

  @override
  String get failedToLoadTickets => 'ਹਾਲੀਆ ਟਿਕਟ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get contactSupport => 'ਸਹਾਇਤਾ ਨਾਲ ਸੰਪਰਕ ਕਰੋ';

  @override
  String get callUs => 'ਸਾਨੂੰ ਕਾਲ ਕਰੋ';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'ਸਾਡੇ ਨਾਲ ਚੈਟ ਕਰੋ';

  @override
  String get emailSupport => 'ਈਮੇਲ ਸਹਾਇਤਾ';

  @override
  String get ticketStatusOpen => 'ਖੁੱਲ੍ਹਾ ਹੈ';

  @override
  String get ticketStatusInProgress => 'ਤਰੱਕੀ ਤੇ ਹੈ';

  @override
  String get ticketStatusResolved => 'ਹੱਲ ਹੋ ਗਿਆ ਹੈ';

  @override
  String get ticketStatusClosed => 'ਬੰਦ ਹੈ';

  @override
  String get ticketCategoryRideIssue => 'ਰਾਈਡ ਦੀ ਸਮੱਸਿਆ';

  @override
  String get ticketCategoryPayment => 'ਭੁਗਤਾਨ';

  @override
  String get ticketCategoryAccount => 'ਖਾਤਾ';

  @override
  String get ticketCategoryDriverIssue => 'ਡਰਾਈਵਰ ਦੀ ਸਮੱਸਿਆ';

  @override
  String get ticketCategoryOther => 'ਹੋਰ';

  @override
  String get failedToLoadDashboard => 'ਡੈਸ਼ਬੋਰਡ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get todaysEarnings => 'ਅੱਜ ਦੀ ਕਮਾਈ';

  @override
  String get cashCollected => 'ਇਕੱਠੀ ਕੀਤੀ ਨਕਦੀ';

  @override
  String get onlinePayment => 'ਆਨਲਾਈਨ ਭੁਗਤਾਨ';

  @override
  String get todaysRideStatus => 'ਅੱਜ ਦੀ ਰਾਈਡ ਦੀ ਸਥਿਤੀ';

  @override
  String get totalRides => 'ਕੁੱਲ ਰਾਈਡਾਂ';

  @override
  String get cancelled => 'ਰੱਦ ਕੀਤੀ';

  @override
  String get dutyRating => 'ਡਿਊਟੀ ਰੇਟਿੰਗ';

  @override
  String get noRidesFound => 'ਕੋਈ ਰਾਈਡ ਨਹੀਂ ਮਿਲੀ';

  @override
  String get failedToLoadHistory => 'ਇਤਿਹਾਸ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get all => 'ਸਾਰੇ';

  @override
  String get paymentPending => 'ਭੁਗਤਾਨ ਲੰਬਿਤ';

  @override
  String stopsCount(int count) {
    return '$count ਸਟਾਪ';
  }

  @override
  String get rideDetails => 'ਰਾਈਡ ਦੇ ਵੇਰਵੇ';

  @override
  String get pickupLocation => 'ਪਿਕਅੱਪ ਸਥਾਨ';

  @override
  String get dropLocation => 'ਡ੍ਰੌਪ ਸਥਾਨ';

  @override
  String stopLocation(int number) {
    return 'ਸਟਾਪ $number';
  }

  @override
  String get fareBreakdown => 'ਕਿਰਾਇਏ ਦਾ ਵੇਰਵਾ';

  @override
  String get netPayable => 'ਕੁੱਲ ਅਦਾਇਗੀ ਰਕਮ';

  @override
  String get paymentMethod => 'ਭੁਗਤਾਨ ਦਾ ਤਰੀਕਾ';

  @override
  String get cash => 'ਨਕਦ';

  @override
  String get customerDetails => 'ਗਾਹਕ ਦੇ ਵੇਰਵੇ';

  @override
  String get callCustomer => 'ਗਾਹਕ ਨੂੰ ਕਾਲ ਕਰੋ';

  @override
  String get goodsType => 'ਮਾਲ ਦੀ ਕਿਸਮ';

  @override
  String get quantity => 'ਮਾਤਰਾ';

  @override
  String get weight => 'ਭਾਰ';

  @override
  String get distance => 'ਦੂਰੀ';

  @override
  String get duration => 'ਸਮਾਂ';

  @override
  String get cancellationReason => 'ਰੱਦ ਕਰਨ ਦਾ ਕਾਰਨ';

  @override
  String get routeTimeline => 'ਰਸਤਾ ਸਮਾਂਰੇਖਾ';

  @override
  String get goodsSpecifications => 'ਮਾਲ ਦਾ ਵੇਰਵਾ';

  @override
  String get vehicleMetadata => 'ਵਾਹਨ ਦਾ ਵੇਰਵਾ';

  @override
  String get description => 'ਵਰਣਨ';

  @override
  String get estimatedWeight => 'ਅਨੁਮਾਨਿਤ ਭਾਰ';

  @override
  String get vehicleName => 'ਵਾਹਨ ਦਾ ਨਾਮ';

  @override
  String get vehicleNumber => 'ਵਾਹਨ ਨੰਬਰ';

  @override
  String get modelColor => 'ਮਾਡਲ / ਰੰਗ';

  @override
  String get baseFare => 'ਮੂਲ ਕਿਰਾਇਆ';

  @override
  String get weatherSurcharge => 'ਮੌਸਮ ਸਰਚਾਰਜ';

  @override
  String get trafficSurcharge => 'ਟ੍ਰੈਫਿਕ ਸਰਚਾਰਜ';

  @override
  String get promoDiscount => 'ਪ੍ਰੋਮੋ ਛੋਟ';

  @override
  String get pickupSender => 'ਪਿਕਅੱਪ (ਭੇਜਣ ਵਾਲਾ)';

  @override
  String get dropoffRecipient => 'ਡ੍ਰੌਪਆਫ (ਪ੍ਰਾਪਤਕਰਤਾ)';

  @override
  String rideIdLabel(String id) {
    return 'ਰਾਈਡ ID: $id';
  }

  @override
  String get todaysTotalEarnings => 'ਅੱਜ ਦੀ ਕੁੱਲ ਕਮਾਈ';

  @override
  String get failedToLoadEarnings => 'ਕਮਾਈ ਦੇ ਅੰਕੜੇ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get noTransactionsRecorded => 'ਕੋਈ ਲੈਣ-ਦੇਣ ਦਰਜ ਨਹੀਂ ਕੀਤਾ ਗਿਆ';

  @override
  String get mySupportTickets => 'ਮੇਰੀਆਂ ਸਪੋਰਟ ਟਿਕਟਾਂ';

  @override
  String get newTicket => 'ਨਵੀਂ ਟਿਕਟ';

  @override
  String get noSupportTicketsRaised => 'ਕੋਈ ਸਪੋਰਟ ਟਿਕਟ ਦਰਜ ਨਹੀਂ ਹੈ';

  @override
  String get tapNewTicketSubtitle => 'ਸਹਾਇਤਾ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ \'ਨਵੀਂ ਟਿਕਟ\' ਤੇ ਟੈਪ ਕਰੋ।';

  @override
  String get submitATicket => 'ਟਿਕਟ ਦਰਜ ਕਰੋ';

  @override
  String get explainIssueDetail => 'ਆਪਣੀ ਸਮੱਸਿਆ ਦਾ ਵਿਸਤਾਰ ਨਾਲ ਵਰਣਨ ਕਰੋ। ਸਹਾਇਤਾ ਏਜੰਟ ਜਲਦੀ ਇਸ ਦੀ ਪੁਸ਼ਟੀ ਕਰਕੇ ਜਵਾਬ ਦੇਵੇਗਾ।';

  @override
  String get categoryRequired => 'ਸ਼੍ਰੇਣੀ*';

  @override
  String get selectIssueCategory => 'ਸਮੱਸਿਆ ਸ਼੍ਰੇਣੀ ਚੁਣੋ';

  @override
  String get pleaseSelectCategoryError => 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਸਮੱਸਿਆ ਸ਼੍ਰੇਣੀ ਚੁਣੋ';

  @override
  String get subjectRequired => 'ਵਿਸ਼ਾ*';

  @override
  String get briefSummaryHint => 'ਸਮੱਸਿਆ ਦਾ ਸੰਖੇਪ ਵਰਣਨ';

  @override
  String get subjectRequiredError => 'ਵਿਸ਼ਾ ਲਾਜ਼ਮੀ ਹੈ';

  @override
  String get subjectMinLengthError => 'ਵਿਸ਼ਾ ਘੱਟੋ-ਘੱਟ 5 ਅੱਖਰਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get descriptionRequired => 'ਵਰਣਨ / ਸੰਦੇਸ਼*';

  @override
  String get describeProblemHint => 'ਆਪਣੀ ਸਮੱਸਿਆ ਦਾ ਵਿਸਤਾਰ ਨਾਲ ਵਰਣਨ ਕਰੋ...';

  @override
  String get messageRequiredError => 'ਸੰਦੇਸ਼ ਵਰਣਨ ਲਾਜ਼ਮੀ ਹੈ';

  @override
  String get messageMinLengthError => 'ਸੰਦੇਸ਼ ਘੱਟੋ-ਘੱਟ 10 ਅੱਖਰਾਂ ਦਾ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get submitTicket => 'ਟਿਕਟ ਜਮ੍ਹਾਂ ਕਰੋ';

  @override
  String get privacyPolicy => 'ਗੋਪਨੀਯਤਾ ਨੀਤੀ';

  @override
  String get termsAndConditions => 'ਨਿਯਮ ਅਤੇ ਸ਼ਰਤਾਂ';

  @override
  String get termsOfService => 'ਸੇਵਾ ਦੀਆਂ ਸ਼ਰਤਾਂ';

  @override
  String get iAgreeTo => 'ਮੈਂ ';

  @override
  String get and => ' ਅਤੇ ';

  @override
  String get agreeSuffix => ' ਨਾਲ ਸਹਿਮਤ ਹਾਂ';

  @override
  String get darkTheme => 'ਡਾਰਕ ਥੀਮ';

  @override
  String get failedToLoadDetails => 'ਵੇਰਵੇ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get defaultPrivacyPolicyHtml => '<h1>ਗੋਪਨੀਯਤਾ ਨੀਤੀ</h1><p>Reachu ਡਰਾਈਵਰ ਐਪ ਵਿੱਚ ਤੁਹਾਡਾ ਸਵਾਗਤ ਹੈ। ਤੁਹਾਡੀ ਗੋਪਨੀਯਤਾ ਸਾਡੇ ਲਈ ਮਹੱਤਵਪੂਰਨ ਹੈ। ਇਹ ਗੋਪਨੀਯਤਾ ਨੀਤੀ ਦੱਸਦੀ ਹੈ ਕਿ ਅਸੀਂ ਤੁਹਾਡੀ ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਕਿਵੇਂ ਇਕੱਠੀ, ਵਰਤੋਂ ਅਤੇ ਸੁਰੱਖਿਅਤ ਕਰਦੇ ਹਾਂ।</p><h2>1. ਅਸੀਂ ਜੋ ਜਾਣਕਾਰੀ ਇਕੱਠੀ ਕਰਦੇ ਹਾਂ</h2><p>ਅਸੀਂ ਤੁਹਾਡਾ ਨਾਮ, ਫੋਨ ਨੰਬਰ, ਈਮੇਲ, ਵਾਹਨ ਦੇ ਵੇਰਵੇ, ਸਰਗਰਮ ਟ੍ਰਿਪ ਦੌਰਾਨ ਸਥਾਨ ਡਾਟਾ ਅਤੇ ਲੈਣ-ਦੇਣ ਦੇ ਵੇਰਵੇ ਇਕੱਠੇ ਕਰਦੇ ਹਾਂ।</p><h2>2. ਅਸੀਂ ਤੁਹਾਡੀ ਜਾਣਕਾਰੀ ਦੀ ਵਰਤੋਂ ਕਿਵੇਂ ਕਰਦੇ ਹਾਂ</h2><p>ਅਸੀਂ ਤੁਹਾਡੀ ਜਾਣਕਾਰੀ ਦੀ ਵਰਤੋਂ ਡਿਲਿਵਰੀ ਰਾਈਡਾਂ ਨੂੰ ਆਸਾਨ ਬਣਾਉਣ, ਭੁਗਤਾਨ ਪ੍ਰਕਿਰਿਆ ਕਰਨ, ਸੁਰੱਖਿਆ ਯਕੀਨੀ ਬਣਾਉਣ ਅਤੇ ਡਰਾਈਵਰ ਅਨੁਭਵ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣ ਲਈ ਕਰਦੇ ਹਾਂ।</p><h2>3. ਸਥਾਨ ਟ੍ਰੈਕਿੰਗ</h2><p>ਆਨ-ਡਿਊਟੀ ਦੌਰਾਨ ਬੈਕਗ੍ਰਾਊਂਡ ਸਥਾਨ ਪਹੁੰਚ ਲੋੜੀਂਦੀ ਹੈ ਤਾਂ ਜੋ ਤੁਹਾਨੂੰ ਨੇੜਲੀਆਂ ਡਿਲਿਵਰੀ ਬੇਨਤੀਆਂ ਨਾਲ ਜੋੜਿਆ ਜਾ ਸਕੇ ਅਤੇ ਗਾਹਕ ਟ੍ਰਿਪ ਦੀ ਤਰੱਕੀ ਵੇਖ ਸਕਣ।</p><h2>4. ਡਾਟਾ ਸੁਰੱਖਿਆ</h2><p>ਅਸੀਂ ਤੁਹਾਡੀ ਨਿੱਜੀ ਜਾਣਕਾਰੀ ਨੂੰ ਅਣਅਧਿਕਾਰਤ ਪਹੁੰਚ ਤੋਂ ਸੁਰੱਖਿਅਤ ਰੱਖਣ ਲਈ ਸਖ਼ਤ ਸੁਰੱਖਿਆ ਉਪਾਅ ਲਾਗੂ ਕਰਦੇ ਹਾਂ।</p>';

  @override
  String get defaultTermsAndConditionsHtml => '<h1>ਨਿਯਮ ਅਤੇ ਸ਼ਰਤਾਂ</h1><p>ਕਿਰਪਾ ਕਰਕੇ Reachu ਡਰਾਈਵਰ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਵਰਤੋਂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਇਨ੍ਹਾਂ ਨਿਯਮਾਂ ਅਤੇ ਸ਼ਰਤਾਂ ਨੂੰ ਧਿਆਨ ਨਾਲ ਪੜ੍ਹੋ।</p><h2>1. ਸ਼ਰਤਾਂ ਦੀ ਸਵੀਕ੍ਰਿਤੀ</h2><p>Reachu ਤੇ ਇੱਕ ਡਰਾਈਵਰ ਪਾਰਟਨਰ ਵਜੋਂ ਰਜਿਸਟਰ ਕਰਕੇ, ਤੁਸੀਂ ਸਾਰੀਆਂ ਲਾਗੂ ਸ਼ਰਤਾਂ, ਨੀਤੀਆਂ ਅਤੇ ਸਥਾਨਕ ਆਵਾਜਾਈ ਨਿਯਮਾਂ ਦੀ ਪਾਲਣਾ ਕਰਨ ਲਈ ਸਹਿਮਤ ਹੁੰਦੇ ਹੋ।</p><h2>2. ਡਰਾਈਵਰ ਦੀਆਂ ਜ਼ਿੰਮੇਵਾਰੀਆਂ</h2><p>ਡਰਾਈਵਰ ਕੋਲ ਵੈਧ ਡਰਾਈਵਿੰਗ ਲਾਇਸੈਂਸ, ਸਹੀ ਵਾਹਨ ਦਸਤਾਵੇਜ਼ ਹੋਣੇ ਚਾਹੀਦੇ ਹਨ ਅਤੇ ਸੁਰੱਖਿਤ, ਸਮੇਂ ਸਿਰ ਡਿਲਿਵਰੀ ਸੇਵਾ ਪ੍ਰਦਾਨ ਕਰਨ ਦੀ ਜ਼ਿੰਮੇਵਾਰੀ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ।</p><h2>3. ਭੁਗਤਾਨ ਅਤੇ ਕਮਾਈ</h2><p>ਕਿਰਾਇਆ ਪਲੇਟਫਾਰਮ ਦਰਾਂ ਅਨੁਸਾਰ ਤੈਅ ਕੀਤਾ ਜਾਂਦਾ ਹੈ ਅਤੇ ਲਾਗੂ ਫੀਸਾਂ ਤੋਂ ਬਾਅਦ ਤੁਹਾਡੇ ਪੁਸ਼ਟੀਸ਼ੁਦਾ ਬੈਂਕ ਖਾਤੇ ਵਿੱਚ ਟ੍ਰਾਂਸਫਰ ਕੀਤਾ ਜਾਂਦਾ ਹੈ।</p><h2>4. ਖਾਤਾ ਮੁਅੱਤਲੀ</h2><p>ਧੋਖਾਧੜੀ ਗਤੀਵਿਧੀਆਂ, ਸੁਰੱਖਿਆ ਉਲੰਘਣਾਵਾਂ ਜਾਂ ਨੀਤੀ ਦੀ ਪਾਲਣਾ ਨਾ ਕਰਨ ਦੀ ਸਥਿਤੀ ਵਿੱਚ ਖਾਤਾ ਮੁਅੱਤਲ ਕਰਨ ਦਾ ਅਧਿਕਾਰ Reachu ਕੋਲ ਰਾਖਵਾਂ ਹੈ।</p>';

  @override
  String get reviewAndRating => 'ਸਮੀਖਿਆ ਅਤੇ ਰੇਟਿੰਗ';

  @override
  String get noRatingsYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਰੇਟਿੰਗ ਨਹੀਂ';

  @override
  String ratedByCustomers(int count) {
    return '$count ਗਾਹਕਾਂ ਵੱਲੋਂ ਰੇਟਿੰਗ ਦਿੱਤੀ ਗਈ';
  }

  @override
  String get noReviewsYet => 'ਹਾਲੇ ਤੱਕ ਕੋਈ ਸਮੀਖਿਆ ਨਹੀਂ';

  @override
  String get noReviewsDesc => 'ਤੁਹਾਨੂੰ ਹਾਲੇ ਤੱਕ ਕੋਈ ਸਮੀਖਿਆ ਪ੍ਰਾਪਤ ਨਹੀਂ ਹੋਈ।';

  @override
  String get noCommentProvided => 'ਕੋਈ ਟਿੱਪਣੀ ਨਹੀਂ ਦਿੱਤੀ ਗਈ';

  @override
  String get ratingExcellent => 'ਸ਼ਾਨਦਾਰ';

  @override
  String get ratingGood => 'ਚੰਗਾ';

  @override
  String get ratingAverage => 'ਔਸਤ';

  @override
  String get ratingBelowAverage => 'ਔਸਤ ਤੋਂ ਘੱਟ';

  @override
  String get ratingPoor => 'ਮਾੜਾ';

  @override
  String get customer => 'ਗਾਹਕ';

  @override
  String get noInternetConnection => 'ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਨਹੀਂ ਹੈ';

  @override
  String get checkInternetConnection => 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣਾ ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਚੈੱਕ ਕਰੋ ਅਤੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ।';

  @override
  String get internetRestored => 'ਇੰਟਰਨੈੱਟ ਕਨੈਕਸ਼ਨ ਬਹਾਲ ਹੋ ਗਿਆ';

  @override
  String get retryConnection => 'ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get connectionTimedOut => 'ਕਨੈਕਸ਼ਨ ਦਾ ਸਮਾਂ ਸਮਾਪਤ। ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get newUpdateAvailable => 'ਇੱਕ ਨਵਾਂ ਅੱਪਡੇਟ ਉਪਲਬਧ ਹੈ। ਜਾਰੀ ਰੱਖਣ ਲਈ ਐਪ ਅੱਪਡੇਟ ਕਰੋ।';

  @override
  String get updateRequiredTitle => 'ਅੱਪਡੇਟ ਲਾਜ਼ਮੀ ਹੈ';

  @override
  String updateRequiredDesc(String version) {
    return 'ਤੁਸੀਂ Reachu Driver ਦਾ ਪੁਰਾਣਾ ਵਰਜ਼ਨ ਵਰਤ ਰਹੇ ਹੋ। ਰਾਈਡਾਂ ਲੈਣਾ ਜਾਰੀ ਰੱਖਣ ਲਈ ਕਿਰਪਾ ਕਰਕੇ ਨਵੇਂ ਵਰਜ਼ਨ ਵਿੱਚ ਅੱਪਡੇਟ ਕਰੋ।';
  }

  @override
  String get updateNow => 'ਹੁਣੇ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get updateLater => 'ਬਾਅਦ ਵਿੱਚ ਅੱਪਡੇਟ ਕਰੋ';

  @override
  String get underMaintenanceTitle => 'ਮਰੰਮਤ ਹੇਠ ਹੈ';

  @override
  String get underMaintenanceDesc => 'ਤੁਹਾਨੂੰ ਬਿਹਤਰ ਸੇਵਾ ਦੇਣ ਲਈ ਅਸੀਂ ਆਪਣੇ ਸਿਸਟਮ ਅੱਪਡੇਟ ਕਰ ਰਹੇ ਹਾਂ। ਕਿਰਪਾ ਕਰਕੇ ਕੁਝ ਸਮੇਂ ਬਾਅਦ ਚੈੱਕ ਕਰੋ।';

  @override
  String estimatedBackIn(Object time) {
    return 'ਅੰਦਾਜ਼ਨ $time ਵਿੱਚ ਵਾਪਸੀ';
  }

  @override
  String get backOnlineSoon => 'ਅਸੀਂ ਜਲਦੀ ਹੀ ਆਨਲਾਈਨ ਵਾਪਸ ਆਵਾਂਗੇ!';

  @override
  String installedVersion(String version) {
    return 'ਇੰਸਟਾਲ ਕੀਤਾ ਵਰਜ਼ਨ: $version';
  }

  @override
  String get couldNotOpenStore => 'ਐਪ ਸਟੋਰ ਨਹੀਂ ਖੋਲ੍ਹਿਆ ਜਾ ਸਕਿਆ';

  @override
  String get detailedFareBreakdown => 'ਵਿਸਤ੍ਰਿਤ ਕਿਰਾਏ ਦਾ ਵੇਰਵਾ';

  @override
  String get checkPaymentStatus => 'ਭੁਗਤਾਨ ਦੀ ਸਥਿਤੀ ਚੈੱਕ ਕਰੋ';

  @override
  String get checkingStatus => 'ਸਥਿਤੀ ਚੈੱਕ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get details => 'ਵੇਰਵੇ';

  @override
  String get hide => 'ਛੁਪਾਓ';

  @override
  String get collectCashFromCustomer => 'ਗਾਹਕ ਤੋਂ ਨਕਦ ਰਕਮ ਇਕੱਠੀ ਕਰੋ';

  @override
  String get customerOnlineFareDue => 'ਗਾਹਕ ਦਾ ਆਨਲਾਈਨ ਕਿਰਾਇਆ ਬਾਕੀ';

  @override
  String get reachuWalletCredit => 'Reachu ਵਾਲਿਟ ਕ੍ਰੈਡਿਟ';

  @override
  String promoReimbursementNote(String amount) {
    return '*ਤੁਹਾਡੇ ਵਾਲਿਟ ਵਿੱਚ ਜਮ੍ਹਾਂ Reachu ਪ੍ਰੋਮੋ ਰਕਮ ਸ਼ਾਮਲ ਹੈ';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*ਇੰਤਜ਼ਾਰ ਦੇ ਸਮੇਂ ਲਈ ਵੇਟਿੰਗ ਚਾਰਜ ਸ਼ਾਮਲ ਹੈ';
  }

  @override
  String get paymentReceivedSuccess => 'ਭੁਗਤਾਨ ਸਫਲਤਾਪੂਰਵਕ ਪ੍ਰਾਪਤ ਹੋਇਆ!';

  @override
  String get paymentStillPending => 'ਭੁਗਤਾਨ ਅਜੇ ਵੀ ਬਾਕੀ ਹੈ';

  @override
  String get waitingCharge => 'ਵੇਟਿੰਗ ਚਾਰਜ';

  @override
  String get rentalCharge => 'ਰੈਂਟਲ ਚਾਰਜ';

  @override
  String get grossFare => 'ਕੁੱਲ ਕਿਰਾਇਆ';

  @override
  String get pendingDue => 'ਬਾਕੀ ਰਕਮ';

  @override
  String get tollFee => 'ਟੋਲ ਫੀਸ';

  @override
  String get cancellationFee => 'ਰੱਦ ਕਰਨ ਦੀ ਫੀਸ';

  @override
  String get nightSurcharge => 'ਨਾਈਟ ਸਰਚਾਰਜ';

  @override
  String get surgeFee => 'ਸਰਜ ਫੀਸ';

  @override
  String get taxAndFees => 'ਟੈਕਸ ਅਤੇ ਫੀਸਾਂ';

  @override
  String get platformFee => 'ਪਲੇਟਫਾਰਮ ਫੀਸ';

  @override
  String get pressBackAgainToExit => 'ਐਪ ਤੋਂ ਬਾਹਰ ਜਾਣ ਲਈ ਦੁਬਾਰਾ ਬੈਕ ਦਬਾਓ';

  @override
  String get pleaseAcceptOrDeclineRide => 'ਬਾਹਰ ਜਾਣ ਤੋਂ ਪਹਿਲਾਂ ਕਿਰਪਾ ਕਰਕੇ ਰਾਈਡ ਸਵੀਕਾਰ ਜਾਂ ਅਸਵੀਕਾਰ ਕਰੋ';

  @override
  String get cashPayment => 'ਨਕਦ ਭੁਗਤਾਨ';

  @override
  String get onlineQr => 'ਆਨਲਾਈਨ ਕਿਊਆਰ';

  @override
  String get collectCashInstructions => 'ਰਾਈਡ ਖਤਮ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਕਿਰਪਾ ਕਰਕੇ ਗਾਹਕ ਤੋਂ ਨਕਦ ਰਕਮ ਪ੍ਰਾਪਤ ਕਰੋ।';

  @override
  String collectCashStep1(String amount) {
    return '੧. ਗਾਹਕ ਤੋਂ ਸਹੀ ਨਕਦ ਰਕਮ ਇਕੱਠੀ ਕਰੋ';
  }

  @override
  String get collectCashStep2 => '੨. ਹੇਠਾਂ \'ਨਕਦ ਮਿਲਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ\' ਬਟਨ ਦਬਾਓ';

  @override
  String get verifyingCashDeposit => 'ਨਕਦ ਜਮ੍ਹਾਂ ਦੀ ਜਾਂਚ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get pleaseHoldClosingRide => 'ਜਦੋਂ ਤੱਕ ਅਸੀਂ ਰਾਈਡ ਬੰਦ ਕਰਦੇ ਹਾਂ ਕਿਰਪਾ ਕਰਕੇ ਇੰਤਜ਼ਾਰ ਕਰੋ';

  @override
  String get customerOnlinePayment => 'ਗਾਹਕ ਆਨਲਾਈਨ ਭੁਗਤਾਨ';

  @override
  String get generatingQrCode => 'ਕਿਊਆਰ ਕੋਡ ਤਿਆਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ...';

  @override
  String get failedToLoadQrCode => 'ਕਿਊਆਰ ਕੋਡ ਲੋਡ ਕਰਨ ਵਿੱਚ ਅਸਫਲ';

  @override
  String get scanQrToPay => 'ਆਨਲਾਈਨ ਭੁਗਤਾਨ ਲਈ ਗਾਹਕ ਨੂੰ ਕਿਊਆਰ ਕੋਡ ਸਕੈਨ ਕਰਨ ਲਈ ਕਹੋ';

  @override
  String get pinchToZoomQr => 'ਕਿਊਆਰ ਕੋਡ ਜ਼ੂਮ ਕਰਨ ਲਈ ਪਿੰਚ ਕਰੋ';

  @override
  String get tapToFullScreen => 'ਫੁੱਲ ਸਕ੍ਰੀਨ ਦੇਖਣ ਲਈ ਕਿਊਆਰ ਕੋਡ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String get awaitingCustomerPayment => 'ਗਾਹਕ ਦੇ ਭੁਗਤਾਨ ਦੀ ਉਡੀਕ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get confirmCashReceived => 'ਨਕਦ ਮਿਲਣ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get paymentReceivedToast => 'ਭੁਗਤਾਨ ਪ੍ਰਾਪਤ ਹੋਇਆ! ਰਾਈਡ ਬੰਦ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get invalidOrderIdError => 'ਅਮਾਨਯੋਗ ਆਰਡਰ ਆਈਡੀ';

  @override
  String get cashPaymentRecordedWaiting => 'ਨਕਦ ਭੁਗਤਾਨ ਦਰਜ ਹੋਇਆ। ਰਾਈਡ ਬੰਦ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ...';

  @override
  String get paymentReceivedTitle => 'ਭੁਗਤਾਨ ਪ੍ਰਾਪਤ ਹੋਇਆ';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount ਦੀ ਰਕਮ ਸਫਲਤਾਪੂਰਵਕ ਅਦਾ ਕੀਤੀ ਗਈ!';
  }

  @override
  String get rideClosedReturningHome => 'ਰਾਈਡ ਬੰਦ ਹੋ ਗਈ। ਹੋਮ ਸਕ੍ਰੀਨ \'ਤੇ ਵਾਪਸ ਜਾ ਰਹੇ ਹਾਂ...';

  @override
  String get fragileGoods => 'ਨਾਜ਼ੁਕ ਸਮਾਨ';

  @override
  String get yes => 'ਹਾਂ';

  @override
  String get no => 'ਨਹੀਂ';

  @override
  String contactLabel(String name, Object phone) {
    return 'ਸੰਪਰਕ: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'ਮਨਜ਼ੂਰੀਆਂ ਦੀ ਲੋੜ ਹੈ';

  @override
  String get enableAllPermissionsSubtitle => 'ReachuDriver ਨੂੰ ਆਫਲਾਈਨ ਅਤੇ ਆਨਲਾਈਨ ਸਹੀ ਢੰਗ ਨਾਲ ਕੰਮ ਕਰਨ ਲਈ ਹੇਠ ਲਿਖੀਆਂ ਮਨਜ਼ੂਰੀਆਂ ਦੀ ਲੋੜ ਹੈ।';

  @override
  String get locationAlwaysTitle => 'ਲੋਕੇਸ਼ਨ (ਹਮੇਸ਼ਾ ਮਨਜ਼ੂਰ ਕਰੋ)';

  @override
  String get locationAlwaysSubtitle => 'ਆਰਡਰ ਡਿਸਪੈਚ ਅਤੇ ਬੈਕਗ੍ਰਾਊਂਡ ਰਾਈਡ ਟਰੈਕਿੰਗ ਲਈ ਜ਼ਰੂਰੀ।';

  @override
  String get batteryUnrestrictedTitle => 'ਬੈਟਰੀ ਆਪਟੀਮਾਈਜ਼ੇਸ਼ਨ (ਅਸੀਮਤ)';

  @override
  String get batteryUnrestrictedSubtitle => 'ਯਕੀਨੀ ਬਣਾਉਂਦਾ ਹੈ ਕਿ ਬੈਕਗ੍ਰਾਊਂਡ ਸਾਕਟ ਕਨੈਕਸ਼ਨ ਬੰਦ ਨਾ ਹੋਵੇ।';

  @override
  String get notificationsTitle => 'ਨੋਟੀਫਿਕੇਸ਼ਨ';

  @override
  String get notificationsSubtitle => 'ਨਵੀਆਂ ਰਾਈਡ ਬੇਨਤੀਆਂ ਅਤੇ ਆਰਡਰ ਅਲਰਟ ਲਈ ਜ਼ਰੂਰੀ।';

  @override
  String get displayOverAppsTitle => 'ਹੋਰ ਐਪਾਂ ਉੱਪਰ ਦਿਖਾਓ';

  @override
  String get displayOverAppsSubtitle => 'ਫੁੱਲ-ਸਕ੍ਰੀਨ ਆਉਣ ਵਾਲੇ ਆਰਡਰ ਪੌਪਅੱਪ ਲਈ ਜ਼ਰੂਰੀ।';

  @override
  String get locationUsedInBackground => 'ਬੈਕਗ੍ਰਾਊਂਡ ਵਿੱਚ ਵਰਤੀ ਜਾਂਦੀ ਲੋਕੇਸ਼ਨ';

  @override
  String get backgroundLocationDisclosureBody => 'ਐਪ ਬੰਦ ਹੋਣ ਜਾਂ ਵਰਤੋਂ ਵਿੱਚ ਨਾ ਹੋਣ \'ਤੇ ਵੀ ReachuDriver ਲੋਕੇਸ਼ਨ ਡਾਟਾ ਇਕੱਠਾ ਕਰਦਾ ਹੈ।\n\nਇਹ ਹੇਠ ਲਿਖੇ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ:\n  • ਲੋਡਰਾਂ/ਵਰਤੋਂਕਾਰਾਂ ਨਾਲ ਆਪਣੀ ਸਥਿਤੀ ਸਾਂਝੀ ਕਰਨ ਲਈ\n  • ਤੁਹਾਨੂੰ ਨੇੜਲੀਆਂ ਬੁਕਿੰਗਾਂ ਦੇਣ ਲਈ\n  • ਡਿਊਟੀ ਦੌਰਾਨ ਸਿਸਟਮ ਨੂੰ ਅੱਪਡੇਟ ਰੱਖਣ ਲਈ\n\nਲੋਕੇਸ਼ਨ ਸਿਰਫ਼ ਉਦੋਂ ਇਕੱਠੀ ਹੁੰਦੀ ਹੈ ਜਦੋਂ ਤੁਸੀਂ ਆਨਲਾਈਨ (ਡਿਊਟੀ \'ਤੇ) ਹੁੰਦੇ ਹੋ।';

  @override
  String get changeInAppSettingsNote => 'ਤੁਸੀਂ ਐਪ ਸੈਟਿੰਗਾਂ ਵਿੱਚ ਕਿਸੇ ਵੀ ਸਮੇਂ ਇਸਨੂੰ ਬਦਲ ਸਕਦੇ ਹੋ।';

  @override
  String get iUnderstandContinue => 'ਮੈਨੂੰ ਸਮਝ ਆ ਗਿਆ — ਜਾਰੀ ਰੱਖੋ';

  @override
  String get notNow => 'ਹੁਣੇ ਨਹੀਂ';

  @override
  String get lowWalletBalance => 'ਘੱਟ ਵਾਲਿਟ ਬੈਲੇਂਸ';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ਆਰਡਰ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਕਿਰਪਾ ਕਰਕੇ ਘੱਟੋ-ਘੱਟ ₹$limit ਵਾਲਿਟ ਬੈਲੇਂਸ ਬਣਾ ਕੇ ਰੱਖੋ। ਆਰਡਰ ਪ੍ਰਾਪਤ ਕਰਨਾ ਜਾਰੀ ਰੱਖਣ ਲਈ ਆਪਣਾ ਵਾਲਿਟ ਟੌਪ ਅੱਪ ਕਰੋ।';
  }

  @override
  String get minimumRequiredBalance => 'ਘੱਟੋ-ਘੱਟ ਲੋੜੀਂਦਾ ਬੈਲੇਂਸ';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ਆਰਡਰ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਕਿਰਪਾ ਕਰਕੇ ਆਪਣੇ ਵਾਲਿਟ ਵਿੱਚ ਘੱਟੋ-ਘੱਟ ₹$limit ਬਣਾ ਕੇ ਰੱਖੋ।';
  }

  @override
  String get activeForRides => 'ਰਾਈਡਾਂ ਲਈ ਸਰਗਰਮ';

  @override
  String get lowBalanceStatus => 'ਘੱਟ ਬੈਲੇਂਸ';

  @override
  String get minimumLimit => 'ਘੱਟੋ-ਘੱਟ ਸੀਮਾ';

  @override
  String get eShramBenefitsTitle => 'ਈ-ਸ਼੍ਰਮ ਲਾਭ';

  @override
  String get govtScheme => 'ਸਰਕਾਰੀ ਯੋਜਨਾ';

  @override
  String get eShramSubHeader => 'ਸਰਕਾਰੀ ਬੀਮਾ ਅਤੇ ਪੈਨਸ਼ਨ ਯੋਜਨਾ';

  @override
  String get eShramDescription => 'ਗਿਗ ਵਰਕਰਾਂ ਲਈ ਹਾਦਸਾ ਬੀਮਾ ਅਤੇ ਸਮਾਜਿਕ ਸੁਰੱਖਿਆ ਲਾਭ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ ਅਧਿਕਾਰਤ ਸਰਕਾਰੀ ਈ-ਸ਼੍ਰਮ ਪੋਰਟਲ \'ਤੇ ਰਜਿਸਟਰ ਕਰੋ।';

  @override
  String get registerOnEShramPortal => 'ਈ-ਸ਼੍ਰਮ ਪੋਰਟਲ \'ਤੇ ਰਜਿਸਟਰ ਕਰੋ';

  @override
  String get eShramGovtBenefitsMenu => 'ਈ-ਸ਼੍ਰਮ ਸਰਕਾਰੀ ਲਾਭ';

  @override
  String get dismiss => 'ਰੱਦ ਕਰੋ';
}
