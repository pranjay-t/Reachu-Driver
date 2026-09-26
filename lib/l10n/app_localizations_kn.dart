// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get account => 'ಖಾತೆ';

  @override
  String get editProfile => 'ಪ್ರೊಫೈಲ್ ಸಂಪಾದಿಸಿ';

  @override
  String get logout => 'ಲಾಗ್ ಔಟ್';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get selectLanguage => 'ಭಾಷೆ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get english => 'English (ಇಂಗ್ಲಿಷ್)';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'ವಾಹನ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get selectAVehicle => 'ಒಂದು ವಾಹನ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName ಜೊತೆ ಮುಂದುವರಿಯಿರಿ';
  }

  @override
  String get addStop => 'ನಿಲುಗಡೆ ಸೇರಿಸಿ';

  @override
  String get editLocations => 'ಸ್ಥಳಗಳನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get noPickupLocationSet => 'ಪಿಕಪ್ ಸ್ಥಳ ಹೊಂದಿಸಲಾಗಿಲ್ಲ';

  @override
  String get noDropLocationSet => 'ಡ್ರಾಪ್ ಸ್ಥಳ ಹೊಂದಿಸಲಾಗಿಲ್ಲ';

  @override
  String get addDrop => 'ಡ್ರಾಪ್ ಸೇರಿಸಿ';

  @override
  String get errorLoadingVehicles => 'ವಾಹನಗಳನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get selectGoodsType => 'ಸರಕಿನ ಪ್ರಕಾರ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get whatAreYouShipping => 'ನೀವು ಏನನ್ನು ಕಳುಹಿಸುತ್ತಿದ್ದೀರಿ?';

  @override
  String get chooseCategoryBestMatches =>
      'ನಿಮ್ಮ ಸರಕಿಗೆ ಹೆಚ್ಚು ಹೊಂದುವ ವರ್ಗವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get editGoodsDetails => 'ಸರಕು ವಿವರಗಳನ್ನು ಸಂಪಾದಿಸಿ';

  @override
  String get weightKgMax90 => 'ತೂಕ (ಕೆಜಿ) - ಗರಿಷ್ಠ 90 ಕೆಜಿ';

  @override
  String get weightInvalidError => 'ತೂಕ 1 ರಿಂದ 90 ಕೆಜಿ ನಡುವೆ ಇರಬೇಕು';

  @override
  String get numberOfPackages => 'ಪ್ಯಾಕೇಜ್‌ಗಳ ಸಂಖ್ಯೆ';

  @override
  String get worthValueRupees => 'ಮೌಲ್ಯ / ಬೆಲೆ (ರೂಪಾಯಿ)';

  @override
  String get done => 'ಮುಗಿಯಿತು';

  @override
  String get confirmGoodsDetails => 'ಸರಕು ವಿವರಗಳನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get failedToLoadCategories => 'ವರ್ಗಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get disclaimerTitle => 'ಹಕ್ಕುತ್ಯಾಗ';

  @override
  String get disclaimerText =>
      'ಹಕ್ಕುತ್ಯಾಗ: ಸಾಗಿಸಲಾಗುತ್ತಿರುವ ಸರಕು ಅಪಾಯಕಾರಿಯಲ್ಲದ, ಕಾನೂನುಬದ್ಧ ಮತ್ತು ಆಯ್ಕೆಮಾಡಿದ ವರ್ಗಕ್ಕೆ ಸೇರಿದೆ ಎಂದು ನಾನು ಘೋಷಿಸುತ್ತೇನೆ. ನಿಷೇಧಿತ ವಸ್ತುಗಳ ಸಾಗಣೆಗೆ ಕಂಪನಿ ಹೊಣೆಯಲ್ಲ. ತೂಕ ವಾಹನದ ಗರಿಷ್ಠ ಸಾಮರ್ಥ್ಯವನ್ನು ಮೀರಬಾರದು.';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight ಕೆಜಿ • $packages ಪ್ಯಾಕೇಜ್ • ₹$worth';
  }

  @override
  String get welcome => 'ಸ್ವಾಗತ';

  @override
  String get enterMobileNumberToContinue =>
      'ಮುಂದುವರಿಯಲು ನಿಮ್ಮ ಮೊಬೈಲ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get mobileNumber => 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get agreeTermsText =>
      'ನಾನು ಸೇವಾ ನಿಯಮಗಳು ಮತ್ತು ಗೌಪ್ಯತಾ ನೀತಿಗೆ ಒಪ್ಪುತ್ತೇನೆ';

  @override
  String get sendOtp => 'OTP ಕಳುಹಿಸಿ';

  @override
  String get verifyOtp => 'OTP ಪರಿಶೀಲಿಸಿ';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber ಗೆ ಕಳುಹಿಸಿದ 4-ಅಂಕಿಯ ಕೋಡ್ ನಮೂದಿಸಿ';
  }

  @override
  String get verifyAndContinue => 'ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಮುಂದುವರಿಯಿರಿ';

  @override
  String resendInSeconds(Object count) {
    return '$count ಸೆಕೆಂಡ್‌ಗಳಲ್ಲಿ ಮರುಕಳುಹಿಸಿ';
  }

  @override
  String get resendOtp => 'OTP ಮರುಕಳುಹಿಸಿ';

  @override
  String get changeNumber => 'ಸಂಖ್ಯೆ ಬದಲಾಯಿಸಿ';

  @override
  String get mobileNumberRequired => 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ಅಗತ್ಯವಿದೆ';

  @override
  String get enterValidMobileNumber =>
      'ಮಾನ್ಯವಾದ 10-ಅಂಕಿಯ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get enterCompleteOtpError => 'ದಯವಿಟ್ಟು ಸಂಪೂರ್ಣ 4-ಅಂಕಿಯ OTP ನಮೂದಿಸಿ';

  @override
  String get otpResentSuccess => 'OTP ಯಶಸ್ವಿಯಾಗಿ ಮರುಕಳುಹಿಸಲಾಗಿದೆ';

  @override
  String get fullName => 'ಪೂರ್ಣ ಹೆಸರು';

  @override
  String get fullNameRequired => 'ಪೂರ್ಣ ಹೆಸರು ಅಗತ್ಯವಿದೆ';

  @override
  String get nameMinLengthError => 'ಹೆಸರು ಕನಿಷ್ಠ 2 ಅಕ್ಷರಗಳಾಗಿರಬೇಕು';

  @override
  String get email => 'ಇಮೇಲ್';

  @override
  String get emailRequired => 'ಇಮೇಲ್ ಅಗತ್ಯವಿದೆ';

  @override
  String get enterValidEmail => 'ಮಾನ್ಯವಾದ ಇಮೇಲ್ ವಿಳಾಸ ನಮೂದಿಸಿ';

  @override
  String get referralCode => 'ರೆಫರಲ್ ಕೋಡ್';

  @override
  String get enterReferralCodeOptional => 'ರೆಫರಲ್ ಕೋಡ್ ನಮೂದಿಸಿ (ಐಚ್ಛಿಕ)';

  @override
  String get createAccount => 'ಖಾತೆ ರಚಿಸಿ';

  @override
  String get completeProfileToGetStarted =>
      'ಪ್ರಾರಂಭಿಸಲು ನಿಮ್ಮ ಪ್ರೊಫೈಲ್ ಪೂರ್ಣಗೊಳಿಸಿ';

  @override
  String get profileUpdatedSuccess => 'ಪ್ರೊಫೈಲ್ ಯಶಸ್ವಿಯಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ!';

  @override
  String get updateProfilePicture => 'ಪ್ರೊಫೈಲ್ ಚಿತ್ರ ನವೀಕರಿಸಿ';

  @override
  String get camera => 'ಕ್ಯಾಮೆರಾ';

  @override
  String get gallery => 'ಗ್ಯಾಲರಿ';

  @override
  String get cancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get dateOfBirthOptional => 'ಹುಟ್ಟಿದ ದಿನಾಂಕ (ಐಚ್ಛಿಕ)';

  @override
  String get gender => 'ಲಿಂಗ';

  @override
  String get male => 'ಪುರುಷ';

  @override
  String get female => 'ಮಹಿಳೆ';

  @override
  String get other => 'ಇತರೆ';

  @override
  String get updateProfile => 'ಪ್ರೊಫೈಲ್ ನವೀಕರಿಸಿ';

  @override
  String profileUpdateFailed(Object error) {
    return 'ಪ್ರೊಫೈಲ್ ನವೀಕರಿಸಲು ವಿಫಲವಾಯಿತು: $error';
  }

  @override
  String get goodMorning => 'ಶುಭೋದಯ,';

  @override
  String get goodAfternoon => 'ಶುಭ ಮಧ್ಯಾಹ್ನ,';

  @override
  String get goodEvening => 'ಶುಭ ಸಂಜೆ,';

  @override
  String get pickupFrom => 'ಇಲ್ಲಿಂದ ಪಿಕಪ್';

  @override
  String get currentLocation => 'ಪ್ರಸ್ತುತ ಸ್ಥಳ';

  @override
  String get fetchingLocation => 'ಸ್ಥಳ ಪಡೆಯಲಾಗುತ್ತಿದೆ...';

  @override
  String get locationServicesDisabled => 'ಸ್ಥಳ ಸೇವೆ ನಿಷ್ಕ್ರಿಯಗೊಂಡಿದೆ';

  @override
  String get locationPermissionNeeded => 'ಸ್ಥಳ ಅನುಮತಿ ಅಗತ್ಯವಿದೆ';

  @override
  String get locationAccessBlocked => 'ಸ್ಥಳ ಪ್ರವೇಶ ನಿರ್ಬಂಧಿಸಲಾಗಿದೆ';

  @override
  String get couldNotFetchLocation => 'ಸ್ಥಳ ಪಡೆಯಲಾಗಲಿಲ್ಲ';

  @override
  String get enable => 'ಸಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get allow => 'ಅನುಮತಿಸಿ';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get turnOnLocationServices => 'ಸ್ಥಳ ಸೇವೆಗಳನ್ನು ಆನ್ ಮಾಡಿ';

  @override
  String get allowLocationAccess => 'ಸ್ಥಳ ಪ್ರವೇಶ ಅನುಮತಿಸಿ';

  @override
  String get gpsRequiredDescription =>
      'ನಿಮ್ಮ ಪಿಕಪ್ ಸ್ಥಳವನ್ನು ನಿಖರವಾಗಿ ಗುರುತಿಸಲು ಮತ್ತು ಹತ್ತಿರದ ಚಾಲಕರನ್ನು ತ್ವರಿತವಾಗಿ ಹುಡುಕಲು ನಿಮ್ಮ ಸಾಧನ GPS ಅಗತ್ಯವಿದೆ.';

  @override
  String get permissionRequiredDescription =>
      'ನಿಮ್ಮ ಪಿಕಪ್ ಸ್ಥಳವನ್ನು ನಿಖರವಾಗಿ ಗುರುತಿಸಲು ಮತ್ತು ಹತ್ತಿರದ ಚಾಲಕರನ್ನು ತ್ವರಿತವಾಗಿ ಹುಡುಕಲು ದಯವಿಟ್ಟು ಆ್ಯಪ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಸ್ಥಳ ಅನುಮತಿಗಳನ್ನು ಅನುಮತಿಸಿ.';

  @override
  String get goToLocationSettings => 'ಸ್ಥಳ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಹೋಗಿ';

  @override
  String get goToAppSettings => 'ಆ್ಯಪ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಿಗೆ ಹೋಗಿ';

  @override
  String get enterAddressManually =>
      'ನಾನು ನನ್ನ ವಿಳಾಸವನ್ನು ಹಸ್ತಚಾಲಿತವಾಗಿ ನಮೂದಿಸುತ್ತೇನೆ';

  @override
  String get taglineTitle => 'ಏನು ಬೇಕಾದರೂ ಸಾಗಿಸಿ,\nಯಾವಾಗ ಬೇಕಾದರೂ.';

  @override
  String get taglineSubtitle =>
      'ವೇಗದ ವಿತರಣೆ ನಿಮ್ಮ ಬೆರಳ ತುದಿಯಲ್ಲಿ. ಸ್ಮಾರ್ಟ್ ಆಗಿ ಶಿಫ್ಟ್ ಮಾಡಿ, ನಮ್ಮ ಪ್ರೀಮಿಯಂ ಫ್ಲೀಟ್‌ನೊಂದಿಗೆ ವೇಗವಾಗಿ ಮುಂದುವರಿಯಿರಿ.';

  @override
  String get twoWheelers => 'ಎರಡು ಚಕ್ರ ವಾಹನಗಳು';

  @override
  String get trucks => 'ಟ್ರಕ್‌ಗಳು';

  @override
  String get specialOffer => 'ವಿಶೇಷ ಆಫರ್';

  @override
  String get promoBannerText => 'ನಿಮ್ಮ ಮೊದಲ ಸವಾರಿಯಲ್ಲಿ\n20% ರಿಯಾಯಿತಿ ಪಡೆಯಿರಿ';

  @override
  String get whereIsYourPickup => 'ನಿಮ್ಮ ಪಿಕಪ್ ಎಲ್ಲಿದೆ?';

  @override
  String get whereIsYourDrop => 'ನಿಮ್ಮ ಡ್ರಾಪ್ ಎಲ್ಲಿದೆ?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'ನಿಮ್ಮ ಡ್ರಾಪ್ $index ಎಲ್ಲಿದೆ?';
  }

  @override
  String get typeMinCharsToSearch =>
      'ಹುಡುಕಾಟ ಪ್ರಾರಂಭಿಸಲು ಕನಿಷ್ಠ 4 ಅಕ್ಷರಗಳನ್ನು ಟೈಪ್ ಮಾಡಿ';

  @override
  String get selectOnMap => 'ನಕ್ಷೆಯಲ್ಲಿ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get pinpointExactLocation => 'ನಿಮ್ಮ ನಿಖರವಾದ ಸ್ಥಳವನ್ನು ಗುರುತಿಸಿ';

  @override
  String get couldNotFindAddress => 'ಕ್ಷಮಿಸಿ, ಈ ವಿಳಾಸ ಸಿಗಲಿಲ್ಲ.';

  @override
  String get trySearchingNearbyLandmark =>
      'ಹತ್ತಿರದ ಲ್ಯಾಂಡ್‌ಮಾರ್ಕ್, ಪ್ರದೇಶ ಅಥವಾ ಜನಪ್ರಿಯ ಸ್ಥಳವನ್ನು ಬಳಸಿ ಹುಡುಕಲು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get anErrorOccurred => 'ಒಂದು ದೋಷ ಸಂಭವಿಸಿದೆ';

  @override
  String get locating => 'ಸ್ಥಳ ಹುಡುಕಲಾಗುತ್ತಿದೆ...';

  @override
  String get fetchingDetails => 'ವಿವರಗಳನ್ನು ಪಡೆಯಲಾಗುತ್ತಿದೆ...';

  @override
  String get confirmPickupLocation => 'ಪಿಕಪ್ ಸ್ಥಳ ದೃಢೀಕರಿಸಿ';

  @override
  String get confirmDropLocation => 'ಡ್ರಾಪ್ ಸ್ಥಳ ದೃಢೀಕರಿಸಿ';

  @override
  String get houseShopApartment => 'ಮನೆ / ಅಂಗಡಿ / ಅಪಾರ್ಟ್‌ಮೆಂಟ್';

  @override
  String get sendersName => 'ಕಳುಹಿಸುವವರ ಹೆಸರು';

  @override
  String get receiversName => 'ಸ್ವೀಕರಿಸುವವರ ಹೆಸರು';

  @override
  String get pleaseEnterName => 'ದಯವಿಟ್ಟು ಹೆಸರು ನಮೂದಿಸಿ';

  @override
  String get sendersMobileNumber => 'ಕಳುಹಿಸುವವರ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get receiversMobileNumber => 'ಸ್ವೀಕರಿಸುವವರ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ';

  @override
  String get enterValidTenDigitNumber => 'ಮಾನ್ಯವಾದ 10-ಅಂಕಿಯ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get useMyMobileNumber => 'ನನ್ನ ಮೊಬೈಲ್ ಸಂಖ್ಯೆ ಬಳಸಿ';

  @override
  String get saveAsOptional => 'ಹೀಗೆ ಉಳಿಸಿ (ಐಚ್ಛಿಕ):';

  @override
  String get home => 'ಮನೆ';

  @override
  String get shop => 'ಅಂಗಡಿ';

  @override
  String get confirmAndProceed => 'ದೃಢೀಕರಿಸಿ ಮತ್ತು ಮುಂದುವರಿಯಿರಿ';

  @override
  String get selectDropLocation => 'ಡ್ರಾಪ್ ಸ್ಥಳ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get cannotSwapEmptyLocations =>
      'ಖಾಲಿ ಸ್ಥಳಗಳನ್ನು ತುಂಬಿದ ಸ್ಥಳಗಳೊಂದಿಗೆ ಬದಲಾಯಿಸಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get proceedToVehicleSelection => 'ವಾಹನ ಆಯ್ಕೆಗೆ ಮುಂದುವರಿಯಿರಿ';

  @override
  String get permissionRequired => 'ಅನುಮತಿ ಅಗತ್ಯವಿದೆ';

  @override
  String get contactsPermissionDescription =>
      'ಕಳುಹಿಸುವವರ ಫೋನ್ ಸಂಖ್ಯೆಯನ್ನು ಸುಲಭವಾಗಿ ಆಯ್ಕೆಮಾಡಲು Reachu ಗೆ ನಿಮ್ಮ ಸಂಪರ್ಕಗಳಿಗೆ ಪ್ರವೇಶ ಅಗತ್ಯವಿದೆ. ದಯವಿಟ್ಟು ಆ್ಯಪ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಇದನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String get openSettings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳನ್ನು ತೆರೆಯಿರಿ';

  @override
  String get selectContact => 'ಸಂಪರ್ಕ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get contactPermissionDenied => 'ಸಂಪರ್ಕ ಅನುಮತಿ ನಿರಾಕರಿಸಲಾಗಿದೆ.';

  @override
  String get myProfile => 'ನನ್ನ ಪ್ರೊಫೈಲ್';

  @override
  String selfFormat(String name) {
    return '$name (ಸ್ವಯಂ)';
  }

  @override
  String get deviceContacts => 'ಸಾಧನ ಸಂಪರ್ಕಗಳು';

  @override
  String get rideHistory => 'ರೈಡ್ ಇತಿಹಾಸ';

  @override
  String get transactions => 'ವಹಿವಾಟುಗಳು';

  @override
  String get noTransactionsFound => 'ಯಾವುದೇ ವಹಿವಾಟುಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get failedToLoadTransactions => 'ವಹಿವಾಟುಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get addMoney => 'ಹಣ ಸೇರಿಸಿ';

  @override
  String get enterAmountToAdd => 'ಸೇರಿಸಬೇಕಾದ ಮೊತ್ತ ನಮೂದಿಸಿ';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay ತೆರೆಯಲು ವಿಫಲವಾಯಿತು: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'ಪಾವತಿ ಆರ್ಡರ್ ರಚಿಸಲು ವಿಫಲವಾಯಿತು: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'Reachu ಕ್ರೆಡಿಟ್‌ಗಳಿಗೆ ₹$amount ಯಶಸ್ವಿಯಾಗಿ ಸೇರಿಸಲಾಗಿದೆ!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'ಪಾವತಿ ಪರಿಶೀಲನೆ ವಿಫಲವಾಯಿತು: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'ಪಾವತಿ ವಿಫಲವಾಯಿತು ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'ಬಾಹ್ಯ ವಾಲೆಟ್ ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ: $walletName';
  }

  @override
  String get walletTopUp => 'ವಾಲೆಟ್ ಟಾಪ್-ಅಪ್';

  @override
  String get payments => 'ಪಾವತಿಗಳು';

  @override
  String get reachuCredits => 'Reachu ಕ್ರೆಡಿಟ್‌ಗಳು';

  @override
  String get balance => 'ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String get errorLoadingBalance => 'ಬ್ಯಾಲೆನ್ಸ್ ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get availableBalance => 'ಲಭ್ಯವಿರುವ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String get totalExpenses => 'ಒಟ್ಟು ಖರ್ಚುಗಳು';

  @override
  String get recentTransactions => 'ಇತ್ತೀಚಿನ ವಹಿವಾಟುಗಳು';

  @override
  String get viewMore => 'ಇನ್ನಷ್ಟು ನೋಡಿ';

  @override
  String get noTransactionsYet => 'ಇನ್ನೂ ಯಾವುದೇ ವಹಿವಾಟುಗಳಿಲ್ಲ';

  @override
  String get booking => 'ಬುಕಿಂಗ್';

  @override
  String get earning => 'ಗಳಿಕೆ';

  @override
  String get support => 'ಸಹಾಯ';

  @override
  String get profile => 'ಪ್ರೊಫೈಲ್';

  @override
  String get pendingWithdrawals => 'ಬಾಕಿ ಹಿಂಪಡೆಯುವಿಕೆಗಳು';

  @override
  String get driverDebt => 'ಚಾಲಕ ಸಾಲ';

  @override
  String minBalanceRequired(Object amount) {
    return 'ಕನಿಷ್ಠ ಬ್ಯಾಲೆನ್ಸ್ ಅಗತ್ಯ: ₹$amount';
  }

  @override
  String get insufficientBalance => 'ಹಿಂಪಡೆಯಲು ಸಾಕಷ್ಟು ಬ್ಯಾಲೆನ್ಸ್ ಇಲ್ಲ';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'ಎಚ್ಚರಿಕೆ: ನಿಮ್ಮ ಲಭ್ಯವಿರುವ ಬ್ಯಾಲೆನ್ಸ್ ಹೊಸ ರೈಡ್‌ಗಳನ್ನು ಸ್ವೀಕರಿಸಲು ಅಗತ್ಯವಿರುವ ಕನಿಷ್ಠ ಮಿತಿಗಿಂತ (₹$amount) ಕಡಿಮೆಯಾಗಿದೆ. ದಯವಿಟ್ಟು ನಿಮ್ಮ ವಾಲೆಟ್ ಟಾಪ್ ಅಪ್ ಮಾಡಿ.';
  }

  @override
  String get moneyTransfer => 'ಹಣ ವರ್ಗಾಯಿಸಿ';

  @override
  String get withdrawMoney => 'ಹಣ ಹಿಂಪಡೆಯಿರಿ';

  @override
  String get manageAccounts => 'ಖಾತೆಗಳನ್ನು ನಿರ್ವಹಿಸಿ';

  @override
  String get bankAccounts => 'ಬ್ಯಾಂಕ್ ಖಾತೆಗಳು ಮತ್ತು UPI';

  @override
  String get addAccount => 'ಪಾವತಿ ವಿಧಾನ ಸೇರಿಸಿ';

  @override
  String get addBankAccount => 'ಬ್ಯಾಂಕ್ ಖಾತೆ ಸೇರಿಸಿ';

  @override
  String get addUpiId => 'UPI ಐಡಿ ಸೇರಿಸಿ';

  @override
  String get editBankAccount => 'ಬ್ಯಾಂಕ್ ಖಾತೆ ಸಂಪಾದಿಸಿ';

  @override
  String get editUpiId => 'UPI ಐಡಿ ಸಂಪಾದಿಸಿ';

  @override
  String get deleteAccount => 'ಖಾತೆ ಅಳಿಸಿ';

  @override
  String get deleteAccountConfirm =>
      'ಈ ಪಾವತಿ ವಿಧಾನವನ್ನು ಅಳಿಸಲು ನೀವು ಖಚಿತವಾಗಿ ಬಯಸುವಿರಾ?';

  @override
  String get accountHolderName => 'ಖಾತೆದಾರರ ಹೆಸರು';

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
  String get bankName => 'ಬ್ಯಾಂಕ್ ಹೆಸರು';

  @override
  String get accountNumber => 'ಖಾತೆ ಸಂಖ್ಯೆ';

  @override
  String get confirmAccountNumber => 'ಖಾತೆ ಸಂಖ್ಯೆ ದೃಢೀಕರಿಸಿ';

  @override
  String get ifscCode => 'IFSC ಕೋಡ್';

  @override
  String get upiId => 'UPI ಐಡಿ';

  @override
  String get fieldRequired => 'ಈ ಕ್ಷೇತ್ರ ಅಗತ್ಯವಿದೆ';

  @override
  String get invalidUpi => 'ಮಾನ್ಯವಾದ UPI ಐಡಿ ನಮೂದಿಸಿ (ಉದಾ: name@upi)';

  @override
  String get invalidIfsc => 'ಮಾನ್ಯವಾದ 11-ಅಂಕಿಯ IFSC ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get invalidAccountNumber => 'ಮಾನ್ಯವಾದ ಖಾತೆ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get accountNumbersDoNotMatch => 'ಖಾತೆ ಸಂಖ್ಯೆಗಳು ಹೊಂದಿಕೆಯಾಗುವುದಿಲ್ಲ';

  @override
  String get noPaymentMethods => 'ಇನ್ನೂ ಯಾವುದೇ ಪಾವತಿ ವಿಧಾನಗಳನ್ನು ಸೇರಿಸಲಾಗಿಲ್ಲ';

  @override
  String get addPaymentMethodSubtitle =>
      'ನಿಮ್ಮ ಗಳಿಕೆಯನ್ನು ಹಿಂಪಡೆಯಲು ಬ್ಯಾಂಕ್ ಖಾತೆ ಅಥವಾ UPI ಐಡಿ ಸೇರಿಸಿ';

  @override
  String get confirmTransfer => 'ವರ್ಗಾವಣೆ ದೃಢೀಕರಿಸಿ';

  @override
  String get transferAmount => 'ವರ್ಗಾವಣೆ ಮೊತ್ತ';

  @override
  String get transferSuccess => 'ಹಿಂಪಡೆಯುವಿಕೆ ವಿನಂತಿ ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲಾಗಿದೆ';

  @override
  String get collectPayment => 'ಪಾವತಿ ಸಂಗ್ರಹಿಸಿ';

  @override
  String get collectCash => 'ನಗದು ಸಂಗ್ರಹಿಸಿ';

  @override
  String get cashCollectedSuccess => 'ನಗದು ಪಾವತಿ ಯಶಸ್ವಿಯಾಗಿ ಪೂರ್ಣಗೊಂಡಿದೆ!';

  @override
  String get displayQrCode => 'UPI QR ಕೋಡ್ ತೋರಿಸಿ';

  @override
  String get customerScanQr =>
      'ಪಾವತಿ ಮಾಡಲು ಗ್ರಾಹಕರಿಗೆ ಈ QR ಕೋಡ್ ಸ್ಕ್ಯಾನ್ ಮಾಡಲು ಹೇಳಿ';

  @override
  String get generatingQr => 'QR ಕೋಡ್ ರಚಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get selectPaymentMethod => 'ಪಾವತಿ ವಿಧಾನ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get beneficiary => 'ಫಲಾನುಭವಿ';

  @override
  String get completed => 'ಪೂರ್ಣಗೊಂಡಿದೆ';

  @override
  String get pending => 'ಬಾಕಿ ಇದೆ';

  @override
  String get failed => 'ವಿಫಲವಾಗಿದೆ';

  @override
  String get failedToLoadAccounts => 'ಪಾವತಿ ವಿಧಾನಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get accountDeletedSuccess => 'ಪಾವತಿ ವಿಧಾನ ಯಶಸ್ವಿಯಾಗಿ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get accountUpdatedSuccess => 'ಪಾವತಿ ವಿಧಾನ ಯಶಸ್ವಿಯಾಗಿ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get accountAddedSuccess => 'ಪಾವತಿ ವಿಧಾನ ಯಶಸ್ವಿಯಾಗಿ ಸೇರಿಸಲಾಗಿದೆ';

  @override
  String get withdrawalAmount => 'ಹಿಂಪಡೆಯುವಿಕೆ ಮೊತ್ತ';

  @override
  String get transferDestination => 'ವರ್ಗಾವಣೆ ಗಮ್ಯಸ್ಥಾನ';

  @override
  String get enterAmount => 'ಮೊತ್ತ ನಮೂದಿಸಿ';

  @override
  String get selected => 'ಆಯ್ಕೆಮಾಡಲಾಗಿದೆ';

  @override
  String get accountNumberLabel => 'ಖಾತೆ ಸಂಖ್ಯೆ';

  @override
  String get errorLoadingAccounts => 'ಪಾವತಿ ವಿಧಾನಗಳನ್ನು ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get errorLoadingWallet => 'ವಾಲೆಟ್ ಮಾಹಿತಿ ಲೋಡ್ ಮಾಡುವಲ್ಲಿ ದೋಷ';

  @override
  String get enterAccountHolderName => 'ಖಾತೆದಾರರ ಹೆಸರು ನಮೂದಿಸಿ';

  @override
  String get bankNameHint => 'ಉದಾ: ಸ್ಟೇಟ್ ಬ್ಯಾಂಕ್ ಆಫ್ ಇಂಡಿಯಾ';

  @override
  String get enterAccountNumber => 'ಖಾತೆ ಸಂಖ್ಯೆ ನಮೂದಿಸಿ';

  @override
  String get confirmAccountNumberHint => 'ಖಾತೆ ಸಂಖ್ಯೆ ದೃಢೀಕರಿಸಿ';

  @override
  String get ifscCodeHint => 'ಉದಾ: SBIN0001234';

  @override
  String get upiIdHint => 'ಉದಾ: user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'ಒಟ್ಟು ದರ';

  @override
  String get hideQrCode => 'QR ಮರೆಮಾಡಿ';

  @override
  String get nameMinLengthRequired => 'ಹೆಸರು ಕನಿಷ್ಠ 2 ಅಕ್ಷರಗಳಾಗಿರಬೇಕು';

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
    return 'ಆರ್ಡರ್ #$orderId';
  }

  @override
  String get personalInformation => 'ವೈಯಕ್ತಿಕ ಮಾಹಿತಿ';

  @override
  String get online => 'ಆನ್‌ಲೈನ್';

  @override
  String get offline => 'ಆಫ್‌ಲೈನ್';

  @override
  String get onlineSuccessMessage =>
      'ನೀವು ಈಗ ಆನ್‌ಲೈನ್ ಮತ್ತು ಡ್ಯೂಟಿಯಲ್ಲಿದ್ದೀರಿ.';

  @override
  String get offlineSuccessMessage => 'ನೀವು ಈಗ ಆಫ್‌ಲೈನ್ ಆಗಿದ್ದೀರಿ.';

  @override
  String get partnerSupport => 'ಪಾಲುದಾರ ಬೆಂಬಲ';

  @override
  String get partnerSupportSubtitle =>
      'ನಮಸ್ಕಾರ ಪಾಲುದಾರರೇ! ನಿಮ್ಮ ಸವಾರಿ, ಪಾವತಿ ಅಥವಾ ಖಾತೆಯಲ್ಲಿ ಸಹಾಯ ಬೇಕೇ? ನಾವು 24/7 ನಿಮ್ಮನ್ನು ಬೆಂಬಲಿಸಲು ಇಲ್ಲಿದ್ದೇವೆ.';

  @override
  String get faqsAndHelp => 'ಪದೇಪದೇ ಕೇಳುವ ಪ್ರಶ್ನೆಗಳು ಮತ್ತು ಸಹಾಯ';

  @override
  String get findQuickAnswers => 'ತ್ವರಿತ ಉತ್ತರಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get raiseSupportTicket => 'ಟಿಕೆಟ್ ಸಲ್ಲಿಸಿ';

  @override
  String get contactSupportAgent => 'ಬೆಂಬಲ ಏಜೆಂಟ್ ಅನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get recentTickets => 'ಇತ್ತೀಚಿನ ಟಿಕೆಟ್‌ಗಳು';

  @override
  String get noActiveTickets => 'ಯಾವುದೇ ಸಕ್ರಿಯ ಬೆಂಬಲ ಟಿಕೆಟ್‌ಗಳಿಲ್ಲ';

  @override
  String get submitTicketDescription =>
      'ಯಾವುದೇ ಸಮಸ್ಯೆ ಎದುರಾದರೆ ಟಿಕೆಟ್ ಸಲ್ಲಿಸಿ.';

  @override
  String get failedToLoadTickets =>
      'ಇತ್ತೀಚಿನ ಟಿಕೆಟ್‌ಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get contactSupport => 'ಬೆಂಬಲವನ್ನು ಸಂಪರ್ಕಿಸಿ';

  @override
  String get callUs => 'ನಮಗೆ ಕರೆ ಮಾಡಿ';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'ನಮ್ಮೊಂದಿಗೆ ಚಾಟ್ ಮಾಡಿ';

  @override
  String get emailSupport => 'ಇಮೇಲ್ ಬೆಂಬಲ';

  @override
  String get ticketStatusOpen => 'ತೆರೆದಿದೆ';

  @override
  String get ticketStatusInProgress => 'ಪ್ರಗತಿಯಲ್ಲಿದೆ';

  @override
  String get ticketStatusResolved => 'ಪರಿಹರಿಸಲಾಗಿದೆ';

  @override
  String get ticketStatusClosed => 'ಮುಚ್ಚಲಾಗಿದೆ';

  @override
  String get ticketCategoryRideIssue => 'ಸವಾರಿ ಸಮಸ್ಯೆ';

  @override
  String get ticketCategoryPayment => 'ಪಾವತಿ';

  @override
  String get ticketCategoryAccount => 'ಖಾತೆ';

  @override
  String get ticketCategoryDriverIssue => 'ಚಾಲಕ ಸಮಸ್ಯೆ';

  @override
  String get ticketCategoryOther => 'ಇತರೆ';

  @override
  String get failedToLoadDashboard => 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get todaysEarnings => 'ಇಂದಿನ ಗಳಿಕೆ';

  @override
  String get cashCollected => 'ಸಂಗ್ರಹಿಸಿದ ನಗದು';

  @override
  String get onlinePayment => 'ಆನ್‌ಲೈನ್ ಪಾವತಿ';

  @override
  String get todaysRideStatus => 'ಇಂದಿನ ಆರ್ಡರ್ ಸ್ಥಿತಿ';

  @override
  String get totalRides => 'ಒಟ್ಟು ಆರ್ಡರ್‌ಗಳು';

  @override
  String get cancelled => 'ರದ್ದುಗೊಳಿಸಲಾಗಿದೆ';

  @override
  String get dutyRating => 'ಡ್ಯೂಟಿ ರೇಟಿಂಗ್';

  @override
  String get noRidesFound => 'ಯಾವುದೇ ರೈಡ್‌ಗಳು ಕಂಡುಬಂದಿಲ್ಲ';

  @override
  String get failedToLoadHistory => 'ಇತಿಹಾಸ ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get all => 'ಎಲ್ಲಾ';

  @override
  String get paymentPending => 'ಪಾವತಿ ಬಾಕಿ ಇದೆ';

  @override
  String stopsCount(int count) {
    return '$count ನಿಲುಗಡೆ';
  }

  @override
  String get rideDetails => 'ರೈಡ್ ವಿವರಗಳು';

  @override
  String get pickupLocation => 'ಪಿಕಪ್ ಸ್ಥಳ';

  @override
  String get dropLocation => 'ಡ್ರಾಪ್ ಸ್ಥಳ';

  @override
  String stopLocation(int number) {
    return 'ನಿಲುಗಡೆ $number';
  }

  @override
  String get fareBreakdown => 'ದರ ವಿವರ';

  @override
  String get netPayable => 'ಒಟ್ಟು ಪಾವತಿಸಬೇಕಾದ ಮೊತ್ತ';

  @override
  String get paymentMethod => 'ಪಾವತಿ ವಿಧಾನ';

  @override
  String get cash => 'ನಗದು';

  @override
  String get customerDetails => 'ಗ್ರಾಹಕರ ವಿವರಗಳು';

  @override
  String get callCustomer => 'ಗ್ರಾಹಕರಿಗೆ ಕರೆ ಮಾಡಿ';

  @override
  String get goodsType => 'ಸರಕಿನ ಪ್ರಕಾರ';

  @override
  String get quantity => 'ಪ್ರಮಾಣ';

  @override
  String get weight => 'ತೂಕ';

  @override
  String get distance => 'ದೂರ';

  @override
  String get duration => 'ಸಮಯ';

  @override
  String get cancellationReason => 'ರದ್ದುಪಡಿಸುವ ಕಾರಣ';

  @override
  String get routeTimeline => 'ಮಾರ್ಗ ಕಾಲರೇಖೆ';

  @override
  String get goodsSpecifications => 'ಸರಕು ವಿವರಣೆ';

  @override
  String get vehicleMetadata => 'ವಾಹನ ವಿವರಣೆ';

  @override
  String get description => 'ವಿವರಣೆ';

  @override
  String get estimatedWeight => 'ಅಂದಾಜು ತೂಕ';

  @override
  String get vehicleName => 'ವಾಹನದ ಹೆಸರು';

  @override
  String get vehicleNumber => 'ವಾಹನ ಸಂಖ್ಯೆ';

  @override
  String get modelColor => 'ಮಾದರಿ / ಬಣ್ಣ';

  @override
  String get baseFare => 'ಮೂಲ ದರ';

  @override
  String get weatherSurcharge => 'ಹವಾಮಾನ ಹೆಚ್ಚುವರಿ ಶುಲ್ಕ';

  @override
  String get trafficSurcharge => 'ಟ್ರಾಫಿಕ್ ಹೆಚ್ಚುವರಿ ಶುಲ್ಕ';

  @override
  String get promoDiscount => 'ಪ್ರೊಮೋ ರಿಯಾಯಿತಿ';

  @override
  String get pickupSender => 'ಪಿಕಪ್ (ಕಳುಹಿಸುವವರು)';

  @override
  String get dropoffRecipient => 'ಡ್ರಾಪ್‌ಆಫ್ (ಸ್ವೀಕರಿಸುವವರು)';

  @override
  String rideIdLabel(String id) {
    return 'ರೈಡ್ ಐಡಿ: $id';
  }

  @override
  String get todaysTotalEarnings => 'ಇಂದಿನ ಒಟ್ಟು ಗಳಿಕೆ';

  @override
  String get failedToLoadEarnings =>
      'ಗಳಿಕೆಯ ಅಂಕಿಅಂಶಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get noTransactionsRecorded => 'ಯಾವುದೇ ವಹಿವಾಟುಗಳನ್ನು ದಾಖಲಿಸಲಾಗಿಲ್ಲ';

  @override
  String get mySupportTickets => 'ನನ್ನ ಸಪೋರ್ಟ್ ಟಿಕೆಟ್‌ಗಳು';

  @override
  String get newTicket => 'ಹೊಸ ಟಿಕೆಟ್';

  @override
  String get noSupportTicketsRaised =>
      'ಯಾವುದೇ ಸಪೋರ್ಟ್ ಟಿಕೆಟ್‌ಗಳನ್ನು ಸಲ್ಲಿಸಲಾಗಿಲ್ಲ';

  @override
  String get tapNewTicketSubtitle =>
      'ಸಹಾಯ ಪಡೆಯಲು \'ಹೊಸ ಟಿಕೆಟ್\' ಮೇಲೆ ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get submitATicket => 'ಟಿಕೆಟ್ ಸಲ್ಲಿಸಿ';

  @override
  String get explainIssueDetail =>
      'ನಿಮ್ಮ ಸಮಸ್ಯೆಯನ್ನು ವಿವರವಾಗಿ ವಿವರಿಸಿ. ಬೆಂಬಲ ಏಜೆಂಟ್ ಶೀಘ್ರದಲ್ಲೇ ದೃಢೀಕರಿಸಿ ಉತ್ತರಿಸುತ್ತಾರೆ.';

  @override
  String get categoryRequired => 'ವರ್ಗ*';

  @override
  String get selectIssueCategory => 'ಸಮಸ್ಯೆ ವರ್ಗ ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get pleaseSelectCategoryError =>
      'ದಯವಿಟ್ಟು ಒಂದು ಸಮಸ್ಯೆ ವರ್ಗವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get subjectRequired => 'ವಿಷಯ*';

  @override
  String get briefSummaryHint => 'ಸಮಸ್ಯೆಯ ಸಂಕ್ಷಿಪ್ತ ವಿವರಣೆ';

  @override
  String get subjectRequiredError => 'ವಿಷಯ ಕಡ್ಡಾಯವಾಗಿದೆ';

  @override
  String get subjectMinLengthError => 'ವಿಷಯ ಕನಿಷ್ಠ 5 ಅಕ್ಷರಗಳಾಗಿರಬೇಕು';

  @override
  String get descriptionRequired => 'ವಿವರಣೆ / ಸಂದೇಶ*';

  @override
  String get describeProblemHint => 'ನಿಮ್ಮ ಸಮಸ್ಯೆಯನ್ನು ವಿವರವಾಗಿ ವಿವರಿಸಿ...';

  @override
  String get messageRequiredError => 'ಸಂದೇಶ ವಿವರಣೆ ಕಡ್ಡಾಯವಾಗಿದೆ';

  @override
  String get messageMinLengthError => 'ಸಂದೇಶ ಕನಿಷ್ಠ 10 ಅಕ್ಷರಗಳಾಗಿರಬೇಕು';

  @override
  String get submitTicket => 'ಟಿಕೆಟ್ ಸಲ್ಲಿಸಿ';

  @override
  String get privacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get termsAndConditions => 'ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳು';

  @override
  String get termsOfService => 'ಸೇವಾ ನಿಯಮಗಳು';

  @override
  String get iAgreeTo => 'ನಾನು ';

  @override
  String get and => ' ಮತ್ತು ';

  @override
  String get agreeSuffix => ' ಗೆ ಒಪ್ಪುತ್ತೇನೆ';

  @override
  String get darkTheme => 'ಡಾರ್ಕ್ ಥೀಮ್';

  @override
  String get failedToLoadDetails => 'ವಿವರಗಳನ್ನು ಲೋಡ್ ಮಾಡಲು ವಿಫಲವಾಯಿತು';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>ಗೌಪ್ಯತಾ ನೀತಿ</h1><p>Reachu ಡ್ರೈವರ್ ಆ್ಯಪ್‌ಗೆ ಸ್ವಾಗತ. ನಿಮ್ಮ ಗೌಪ್ಯತೆ ನಮಗೆ ಮುಖ್ಯವಾಗಿದೆ. ಈ ಗೌಪ್ಯತಾ ನೀತಿ ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿಯನ್ನು ನಾವು ಹೇಗೆ ಸಂಗ್ರಹಿಸುತ್ತೇವೆ, ಬಳಸುತ್ತೇವೆ ಮತ್ತು ರಕ್ಷಿಸುತ್ತೇವೆ ಎಂಬುದನ್ನು ವಿವರಿಸುತ್ತದೆ.</p><h2>1. ನಾವು ಸಂಗ್ರಹಿಸುವ ಮಾಹಿತಿ</h2><p>ನಿಮ್ಮ ಹೆಸರು, ಫೋನ್ ಸಂಖ್ಯೆ, ಇಮೇಲ್, ವಾಹನ ವಿವರಗಳು, ಸಕ್ರಿಯ ಟ್ರಿಪ್‌ಗಳ ಸಮಯದಲ್ಲಿ ಸ್ಥಳ ಡೇಟಾ ಮತ್ತು ವಹಿವಾಟು ವಿವರಗಳನ್ನು ನಾವು ಸಂಗ್ರಹಿಸುತ್ತೇವೆ.</p><h2>2. ನಿಮ್ಮ ಮಾಹಿತಿಯನ್ನು ನಾವು ಹೇಗೆ ಬಳಸುತ್ತೇವೆ</h2><p>ಡೆಲಿವರಿ ರೈಡ್‌ಗಳನ್ನು ಸುಗಮಗೊಳಿಸಲು, ಪಾವತಿಗಳನ್ನು ಪ್ರಕ್ರಿಯೆಗೊಳಿಸಲು, ಸುರಕ್ಷತೆ ಖಚಿತಪಡಿಸಲು ಮತ್ತು ಚಾಲಕ ಅನುಭವವನ್ನು ಸುಧಾರಿಸಲು ನಾವು ನಿಮ್ಮ ಮಾಹಿತಿಯನ್ನು ಬಳಸುತ್ತೇವೆ.</p><h2>3. ಸ್ಥಳ ಟ್ರ್ಯಾಕಿಂಗ್</h2><p>ಆನ್-ಡ್ಯೂಟಿ ಸಮಯದಲ್ಲಿ ನಿಮ್ಮನ್ನು ಹತ್ತಿರದ ಡೆಲಿವರಿ ವಿನಂತಿಗಳೊಂದಿಗೆ ಸಂಪರ್ಕಿಸಲು ಮತ್ತು ಗ್ರಾಹಕರು ಟ್ರಿಪ್ ಪ್ರಗತಿಯನ್ನು ನೋಡಲು ಬ್ಯಾಕ್‌ಗ್ರೌಂಡ್ ಸ್ಥಳ ಪ್ರವೇಶ ಅಗತ್ಯವಿದೆ.</p><h2>4. ಡೇಟಾ ಸುರಕ್ಷತೆ</h2><p>ನಿಮ್ಮ ವೈಯಕ್ತಿಕ ಮಾಹಿತಿಯನ್ನು ಅನಧಿಕೃತ ಪ್ರವೇಶದಿಂದ ರಕ್ಷಿಸಲು ನಾವು ಕಠಿಣ ಭದ್ರತಾ ಕ್ರಮಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುತ್ತೇವೆ.</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳು</h1><p>Reachu ಡ್ರೈವರ್ ಅಪ್ಲಿಕೇಶನ್ ಬಳಸುವ ಮೊದಲು ಈ ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳನ್ನು ಎಚ್ಚರಿಕೆಯಿಂದ ಓದಿ.</p><h2>1. ನಿಯಮಗಳ ಸ್ವೀಕಾರ</h2><p>Reachu ನಲ್ಲಿ ಚಾಲಕ ಪಾಲುದಾರರಾಗಿ ನೋಂದಾಯಿಸುವ ಮೂಲಕ, ನೀವು ಎಲ್ಲಾ ಅನ್ವಯವಾಗುವ ನಿಯಮಗಳು, ನೀತಿಗಳು ಮತ್ತು ಸ್ಥಳೀಯ ಸಾರಿಗೆ ನಿಯಮಗಳನ್ನು ಪಾಲಿಸಲು ಒಪ್ಪುತ್ತೀರಿ.</p><h2>2. ಚಾಲಕರ ಜವಾಬ್ದಾರಿಗಳು</h2><p>ಚಾಲಕರು ಮಾನ್ಯವಾದ ಡ್ರೈವಿಂಗ್ ಲೈಸೆನ್ಸ್, ನಿಖರವಾದ ವಾಹನ ದಾಖಲೆಗಳು ಮತ್ತು ಸುರಕ್ಷಿತ, ಸಮಯೋಚಿತ ಡೆಲಿವರಿ ಸೇವೆ ನೀಡುವ ಹೊಣೆಗಾರಿಕೆಯನ್ನು ಹೊಂದಿರಬೇಕು.</p><h2>3. ಪಾವತಿ ಮತ್ತು ಗಳಿಕೆ</h2><p>ದರವನ್ನು ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ದರಗಳ ಪ್ರಕಾರ ನಿಗದಿಪಡಿಸಲಾಗುತ್ತದೆ ಮತ್ತು ಅನ್ವಯವಾಗುವ ಶುಲ್ಕಗಳ ನಂತರ ನಿಮ್ಮ ಪರಿಶೀಲಿಸಿದ ಬ್ಯಾಂಕ್ ಖಾತೆಗೆ ವರ್ಗಾಯಿಸಲಾಗುತ್ತದೆ.</p><h2>4. ಖಾತೆ ಅಮಾನತು</h2><p>ವಂಚನೆ ಚಟುವಟಿಕೆಗಳು, ಸುರಕ್ಷತಾ ಉಲ್ಲಂಘನೆಗಳು ಅಥವಾ ನೀತಿ ಪಾಲನೆ ಮಾಡದ ಸಂದರ್ಭದಲ್ಲಿ ಖಾತೆಯನ್ನು ಅಮಾನತುಗೊಳಿಸುವ ಹಕ್ಕನ್ನು Reachu ಕಾಯ್ದಿರಿಸಿಕೊಂಡಿದೆ.</p>';

  @override
  String get reviewAndRating => 'ವಿಮರ್ಶೆ ಮತ್ತು ರೇಟಿಂಗ್';

  @override
  String get noRatingsYet => 'ಇನ್ನೂ ಯಾವುದೇ ರೇಟಿಂಗ್‌ಗಳಿಲ್ಲ';

  @override
  String ratedByCustomers(int count) {
    return '$count ಗ್ರಾಹಕರಿಂದ ರೇಟ್ ಮಾಡಲಾಗಿದೆ';
  }

  @override
  String get noReviewsYet => 'ಇನ್ನೂ ಯಾವುದೇ ವಿಮರ್ಶೆಗಳಿಲ್ಲ';

  @override
  String get noReviewsDesc => 'ನೀವು ಇನ್ನೂ ಯಾವುದೇ ವಿಮರ್ಶೆಗಳನ್ನು ಪಡೆದಿಲ್ಲ.';

  @override
  String get noCommentProvided => 'ಯಾವುದೇ ಕಾಮೆಂಟ್ ನೀಡಲಾಗಿಲ್ಲ';

  @override
  String get ratingExcellent => 'ಅತ್ಯುತ್ತಮ';

  @override
  String get ratingGood => 'ಉತ್ತಮ';

  @override
  String get ratingAverage => 'ಸರಾಸರಿ';

  @override
  String get ratingBelowAverage => 'ಸರಾಸರಿಗಿಂತ ಕಡಿಮೆ';

  @override
  String get ratingPoor => 'ಕಳಪೆ';

  @override
  String get customer => 'ಗ್ರಾಹಕ';

  @override
  String get noInternetConnection => 'ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವಿಲ್ಲ';

  @override
  String get checkInternetConnection =>
      'ದಯವಿಟ್ಟು ನಿಮ್ಮ ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕವನ್ನು ಪರಿಶೀಲಿಸಿ ಮತ್ತು ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get internetRestored => 'ಇಂಟರ್ನೆಟ್ ಸಂಪರ್ಕ ಮರುಸ್ಥಾಪಿಸಲಾಗಿದೆ';

  @override
  String get retryConnection => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get connectionTimedOut =>
      'ಸಂಪರ್ಕ ಸಮಯ ಮೀರಿದೆ. ಮರುಪ್ರಯತ್ನಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get newUpdateAvailable =>
      'ಹೊಸ ಅಪ್‌ಡೇಟ್ ಲಭ್ಯವಿದೆ. ಮುಂದುವರಿಯಲು ಆ್ಯಪ್ ಅಪ್‌ಡೇಟ್ ಮಾಡಿ.';

  @override
  String get updateRequiredTitle => 'ಅಪ್‌ಡೇಟ್ ಅಗತ್ಯವಿದೆ';

  @override
  String updateRequiredDesc(String version) {
    return 'ನೀವು Reachu Driver ನ ಹಳೆಯ ಆವೃತ್ತಿಯನ್ನು ಬಳಸುತ್ತಿದ್ದೀರಿ. ಸವಾರಿಗಳನ್ನು ಸ್ವೀಕರಿಸಲು ಮುಂದುವರಿಯಲು ಇತ್ತೀಚಿನ ಆವೃತ್ತಿಗೆ ಅಪ್‌ಡೇಟ್ ಮಾಡಿ.';
  }

  @override
  String get updateNow => 'ಈಗಲೇ ಅಪ್‌ಡೇಟ್ ಮಾಡಿ';

  @override
  String get updateLater => 'ನಂತರ ಅಪ್‌ಡೇಟ್ ಮಾಡಿ';

  @override
  String get underMaintenanceTitle => 'ನಿರ್ವಹಣೆಯಲ್ಲಿದೆ';

  @override
  String get underMaintenanceDesc =>
      'ನಿಮಗೆ ಉತ್ತಮ ಸೇವೆ ನೀಡಲು ನಾವು ನಮ್ಮ ಸಿಸ್ಟಮ್‌ಗಳನ್ನು ಅಪ್‌ಡೇಟ್ ಮಾಡುತ್ತಿದ್ದೇವೆ. ದಯವಿಟ್ಟು ಸ್ವಲ್ಪ ಸಮಯದ ನಂತರ ಪರಿಶೀಲಿಸಿ.';

  @override
  String estimatedBackIn(Object time) {
    return '$time ಒಳಗೆ ನಿರೀಕ್ಷಿತ ಮರುಪ್ರಾರಂಭ';
  }

  @override
  String get backOnlineSoon => 'ನಾವು ಶೀಘ್ರದಲ್ಲೇ ಆನ್‌ಲೈನ್‌ಗೆ ಹಿಂತಿರುಗುತ್ತೇವೆ!';

  @override
  String installedVersion(String version) {
    return 'ಸ್ಥಾಪಿಸಲಾದ ಆವೃತ್ತಿ: $version';
  }

  @override
  String get couldNotOpenStore => 'ಆ್ಯಪ್ ಸ್ಟೋರ್ ತೆರೆಯಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get detailedFareBreakdown => 'ವಿವರವಾದ ದರದ ವಿವರಣೆ';

  @override
  String get checkPaymentStatus => 'ಪಾವತಿ ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಿ';

  @override
  String get checkingStatus => 'ಸ್ಥಿತಿಯನ್ನು ಪರಿಶೀಲಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get details => 'ವಿವರಗಳು';

  @override
  String get hide => 'ಮರೆಮಾಡಿ';

  @override
  String get collectCashFromCustomer => 'ಗ್ರಾಹಕರಿಂದ ನಗದು ಸಂಗ್ರಹಿಸಿ';

  @override
  String get customerOnlineFareDue => 'ಗ್ರಾಹಕರ ಆನ್‌ಲೈನ್ ದರ ಬಾಕಿ';

  @override
  String get reachuWalletCredit => 'Reachu ವ್ಯಾಲೆಟ್ ಕ್ರೆಡಿಟ್';

  @override
  String promoReimbursementNote(String amount) {
    return '*ನಿಮ್ಮ ವ್ಯಾಲೆಟ್‌ಗೆ ಜಮಾ ಮಾಡಲಾದ Reachu ಪ್ರೋಮೋ ಮರುಪಾವತಿಯನ್ನು ಒಳಗೊಂಡಿದೆ';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*ಕಾದುನೋಡುವ ಸಮಯಕ್ಕಾಗಿ ವೇಟಿಂಗ್ ಶುಲ್ಕವನ್ನು ಒಳಗೊಂಡಿದೆ';
  }

  @override
  String get paymentReceivedSuccess => 'ಪಾವತಿ ಯಶಸ್ವಿಯಾಗಿ ಸ್ವೀಕರಿಸಲಾಗಿದೆ!';

  @override
  String get paymentStillPending => 'ಪಾವತಿ ಇನ್ನೂ ಬಾಕಿ ಇದೆ';

  @override
  String get waitingCharge => 'ವೇಟಿಂಗ್ ಶುಲ್ಕ';

  @override
  String get rentalCharge => 'ರೇಂಟಲ್ ಶುಲ್ಕ';

  @override
  String get grossFare => 'ಒಟ್ಟು ದರ';

  @override
  String get pendingDue => 'ಬಾಕಿ ಮೊತ್ತ';

  @override
  String get tollFee => 'ಟೋಲ್ ಶುಲ್ಕ';

  @override
  String get cancellationFee => 'ರದ್ದತಿ ಶುಲ್ಕ';

  @override
  String get nightSurcharge => 'ನೈಟ್ ಸರ್ಚಾರ್ಜ್';

  @override
  String get surgeFee => 'ಸರ್ಜ್ ಶುಲ್ಕ';

  @override
  String get taxAndFees => 'ತೆರಿಗೆ ಮತ್ತು ಶುಲ್ಕಗಳು';

  @override
  String get platformFee => 'ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಶುಲ್ಕ';

  @override
  String get pressBackAgainToExit =>
      'ಆ್ಯಪ್‌ನಿಂದ ನಿರ್ಗಮಿಸಲು ಮತ್ತೆ ಹಿಂತಿರುಗಿ ಬಟನ್ ಒತ್ತಿ';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'ನಿರ್ಗಮಿಸುವ ಮೊದಲು ದಯವಿಟ್ಟು ಸವಾರಿಯನ್ನು ಸ್ವೀಕರಿಸಿ ಅಥವಾ ತಿರಸ್ಕರಿಸಿ';

  @override
  String get cashPayment => 'ನಗದು ಪಾವತಿ';

  @override
  String get onlineQr => 'ಆನ್‌ಲೈನ್ ಕ್ಯೂಆರ್';

  @override
  String get collectCashInstructions =>
      'ಸವಾರಿಯನ್ನು ಮುಕ್ತಾಯಗೊಳಿಸುವ ಮೊದಲು ದಯವಿಟ್ಟು ಗ್ರಾಹಕರಿಂದ ನಗದು ಹಣವನ್ನು ಸಂಗ್ರಹಿಸಿ.';

  @override
  String collectCashStep1(String amount) {
    return '೧. ಗ್ರಾಹಕರಿಂದ ನಿಖರವಾದ ನಗದು ಮೊತ್ತವನ್ನು ಸಂಗ್ರಹಿಸಿ';
  }

  @override
  String get collectCashStep2 =>
      '೨. ಕೆಳಗಿನ \'ನಗದು ಸ್ವೀಕರಿಸಲಾಗಿದೆ ಎಂದು ದೃಢೀಕರಿಸಿ\' ಬಟನ್ ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get verifyingCashDeposit => 'ನಗದು ಪಾವತಿಯನ್ನು ಪರಿಶೀಲಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get pleaseHoldClosingRide =>
      'ನಾವು ಸವಾರಿಯನ್ನು ಮುಕ್ತಾಯಗೊಳಿಸುವವರೆಗೆ ದಯವಿಟ್ಟು ನಿರೀಕ್ಷಿಸಿ';

  @override
  String get customerOnlinePayment => 'ಗ್ರಾಹಕರ ಆನ್‌ಲೈನ್ ಪಾವತಿ';

  @override
  String get generatingQrCode => 'ಕ್ಯೂಆರ್ ಕೋಡ್ ಉತ್ಪಾದಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get failedToLoadQrCode => 'ಕ್ಯೂಆರ್ ಕೋಡ್ ಲೋಡ್ ಮಾಡಲು ಸಾಧ್ಯವಾಗಲಿಲ್ಲ';

  @override
  String get scanQrToPay =>
      'ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ಪಾವತಿಸಲು ಕ್ಯೂಆರ್ ಕೋಡ್ ಸ್ಕ್ಯಾನ್ ಮಾಡಲು ಗ್ರಾಹಕರಿಗೆ ತಿಳಿಸಿ';

  @override
  String get pinchToZoomQr => 'ಕ್ಯೂಆರ್ ಕೋಡ್ ಝೂಮ್ ಮಾಡಲು ಪಿಂಚ್ ಮಾಡಿ';

  @override
  String get tapToFullScreen =>
      'ಪೂರ್ಣ ಪರದೆಯ ವೀಕ್ಷಣೆಗಾಗಿ ಕ್ಯೂಆರ್ ಕೋಡ್ ಟ್ಯಾಪ್ ಮಾಡಿ';

  @override
  String get awaitingCustomerPayment => 'ಗ್ರಾಹಕರ ಪಾವತಿಗಾಗಿ ಕಾಯಲಾಗುತ್ತಿದೆ...';

  @override
  String get confirmCashReceived => 'ನಗದು ಸ್ವೀಕರಿಸಲಾಗಿದೆ ಎಂದು ದೃಢೀಕರಿಸಿ';

  @override
  String get paymentReceivedToast =>
      'ಪಾವತಿ ಸ್ವೀಕರಿಸಲಾಗಿದೆ! ಸವಾರಿ ಮುಕ್ತಾಯಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get invalidOrderIdError => 'ಅಮಾನ್ಯ ಆರ್ಡರ್ ಐಡಿ';

  @override
  String get cashPaymentRecordedWaiting =>
      'ನಗದು ಪಾವತಿ ದಾಖಲಾಗಿದೆ. ಸವಾರಿ ಮುಕ್ತಾಯಗೊಳಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get paymentReceivedTitle => 'ಪಾವತಿ ಸ್ವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount ಮೊತ್ತವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಪಾವತಿಸಲಾಗಿದೆ!';
  }

  @override
  String get rideClosedReturningHome =>
      'ಸವಾರಿ ಮುಕ್ತಾಯವಾಗಿದೆ. ಹೋಮ್ ಸ್ಕ್ರೀನ್‌ಗೆ ಹಿಂತಿರುಗಲಾಗುತ್ತಿದೆ...';

  @override
  String get fragileGoods => 'ಸೂಕ್ಷ್ಮ/ಹಾನಿಗೊಳಗಾಗುವ ಸರಕುಗಳು';

  @override
  String get yes => 'ಹೌದು';

  @override
  String get no => 'ಇಲ್ಲ';

  @override
  String contactLabel(String name, Object phone) {
    return 'ಸಂಪರ್ಕ: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'ಅನುಮತಿಗಳು ಅಗತ್ಯವಿದೆ';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver ಆಫ್‌ಲೈನ್ ಮತ್ತು ಆನ್‌ಲೈನ್‌ನಲ್ಲಿ ನಿಖರವಾಗಿ ಕೆಲಸ ಮಾಡಲು ಕೆಳಗಿನ ಅನುಮತಿಗಳ ಅಗತ್ಯವಿದೆ.';

  @override
  String get locationAlwaysTitle => 'ಸ್ಥಳ (ಯಾವಾಗಲೂ ಅನುಮತಿಸಿ)';

  @override
  String get locationAlwaysSubtitle =>
      'ಆರ್ಡರ್ ಡಿಸ್ಪ್ಯಾಚ್ ಮತ್ತು ಬ್ಯಾಕ್‌ಗ್ರೌಂಡ್ ಸವಾರಿ ಟ್ರ್ಯಾಕಿಂಗ್‌ಗೆ ಅಗತ್ಯವಿದೆ.';

  @override
  String get batteryUnrestrictedTitle => 'ಬ್ಯಾಟರಿ ಆಪ್ಟಿಮೈಸೇಶನ್ (ಅನಿಯಂತ್ರಿತ)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'ಬ್ಯಾಕ್‌ಗ್ರೌಂಡ್ ಸಾಕೆಟ್ ಸಂಪರ್ಕ ಮತ್ತು ಸವಾರಿ ಎಚ್ಚರಿಕೆಗಳು ನಿಲ್ಲುವುದಿಲ್ಲ ಎಂದು ಖಚಿತಪಡಿಸುತ್ತದೆ.';

  @override
  String get notificationsTitle => 'ಸೂಚನೆಗಳು';

  @override
  String get notificationsSubtitle =>
      'ಹೊಸ ಸವಾರಿ ವಿನಂತಿಗಳು ಮತ್ತು ಆರ್ಡರ್ ಎಚ್ಚರಿಕೆಗಳಿಗೆ ಅಗತ್ಯವಿದೆ.';

  @override
  String get displayOverAppsTitle => 'ಇತರ ಆ್ಯಪ್‌ಗಳ ಮೇಲೆ ಪ್ರದರ್ಶಿಸಿ';

  @override
  String get displayOverAppsSubtitle =>
      'ಪೂರ್ಣ ಪರದೆಯ ಒಳಬರುವ ಆರ್ಡರ್ ಪಾಪ್‌ಅಪ್‌ಗೆ ಅಗತ್ಯವಿದೆ.';

  @override
  String get locationUsedInBackground => 'ಹಿನ್ನೆಲೆಯಲ್ಲಿ ಬಳಸಲಾಗುವ ಸ್ಥಳ';

  @override
  String get backgroundLocationDisclosureBody =>
      'ಆ್ಯಪ್ ಮುಚ್ಚಿದ್ದಾಗ ಅಥವಾ ಬಳಕೆಯಲ್ಲಿಲ್ಲದಿದ್ದಾಗಲೂ ReachuDriver ಸ್ಥಳದ ಡೇಟಾವನ್ನು ಸಂಗ್ರಹಿಸುತ್ತದೆ.\n\nಇದನ್ನು ಕೆಳಗಿನವುಗಳಿಗಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ:\n  • ಲೋಡರ್‌ಗಳು/ಬಳಕೆದಾರರೊಂದಿಗೆ ನಿಮ್ಮ ನೈಜ-ಸಮಯದ ಸ್ಥಿತಿಯನ್ನು ಹಂಚಿಕೊಳ್ಳಲು\n  • ನಿಮಗೆ ಹತ್ತಿರದ ಬುಕಿಂಗ್ ವಿನಂತಿಗಳನ್ನು ನಿಯೋಜಿಸಲು\n  • ನೀವು ಕರ್ತವ್ಯದಲ್ಲಿದ್ದಾಗ ಡಿಸ್ಪ್ಯಾಚ್ ಸಿಸ್ಟಮ್ ನವೀಕೃತವಾಗಿರಿಸಲು\n\nಸ್ಥಳ ಸಂಗ್ರಹಣೆಯು ನೀವು ಆನ್‌ಲೈನ್‌ನಲ್ಲಿದ್ದಾಗ (ಕರ್ತವ್ಯದಲ್ಲಿದ್ದಾಗ) ಮಾತ್ರ ಚಾಲನೆಯಾಗುತ್ತದೆ ಮತ್ತು ಆಫ್‌ಲೈನ್‌ಗೆ ಹೋದಾಗ ತಕ್ಷಣ ನಿಲ್ಲುತ್ತದೆ.';

  @override
  String get changeInAppSettingsNote =>
      'ಆ್ಯಪ್ ಸೆಟ್ಟಿಂಗ್ಸ್‌ನಲ್ಲಿ ನೀವು ಯಾವಾಗ ಬೇಕಾದರೂ ಇದನ್ನು ಬದಲಾಯಿಸಬಹುದು.';

  @override
  String get iUnderstandContinue => 'ನನಗೆ ಅರ್ಥವಾಯಿತು — ಮುಂದುವರಿಯಿರಿ';

  @override
  String get notNow => 'ಈಗ ಬೇಡ';

  @override
  String get lowWalletBalance => 'ಕಡಿಮೆ ವಾಲೆಟ್ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ಆರ್ಡರ್‌ಗಳನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ಕನಿಷ್ಠ ₹$limit ವಾಲೆಟ್ ಬ್ಯಾಲೆನ್ಸ್ ಅನ್ನು ಕಾಯ್ದುಕೊಳ್ಳಿ. ಆರ್ಡರ್‌ಗಳನ್ನು ಪಡೆಯುವುದನ್ನು ಮುಂದುವರಿಸಲು ನಿಮ್ಮ ವಾಲೆಟ್ ಅನ್ನು ಟಾಪ್ ಅಪ್ ಮಾಡಿ.';
  }

  @override
  String get minimumRequiredBalance => 'ಕನಿಷ್ಠ ಅಗತ್ಯವಿರುವ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ಆರ್ಡರ್‌ಗಳನ್ನು ಸ್ವೀಕರಿಸಲು ದಯವಿಟ್ಟು ನಿಮ್ಮ ವಾಲೆಟ್‌ನಲ್ಲಿ ಕನಿಷ್ಠ ₹$limit ಕಾಯ್ದುಕೊಳ್ಳಿ.';
  }

  @override
  String get activeForRides => 'ರೈಡ್‌ಗಳಿಗಾಗಿ ಸಕ್ರಿಯ';

  @override
  String get lowBalanceStatus => 'ಕಡಿಮೆ ಬ್ಯಾಲೆನ್ಸ್';

  @override
  String get minimumLimit => 'ಕನಿಷ್ಠ ಮಿತಿ';

  @override
  String get eShramBenefitsTitle => 'ಈ-ಶ್ರಮ್ ಸೌಲಭ್ಯಗಳು';

  @override
  String get govtScheme => 'ಸರ್ಕಾರಿ ಯೋಜನೆ';

  @override
  String get eShramSubHeader => 'ಸರ್ಕಾರಿ ವಿಮೆ ಮತ್ತು ಪಿಂಚಣಿ ಯೋಜನೆ';

  @override
  String get eShramDescription =>
      'ಗಿಗ್ ಕಾರ್ಮಿಕರಿಗಾಗಿ ಅಪಘಾತ ವಿಮೆ ಮತ್ತು ಸಾಮಾಜಿಕ ಭದ್ರತಾ ಸೌಲಭ್ಯಗಳನ್ನು ಪಡೆಯಲು ಅಧಿಕೃತ ಸರ್ಕಾರಿ ಈ-ಶ್ರಮ್ ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ನೋಂದಾಯಿಸಿ.';

  @override
  String get registerOnEShramPortal => 'ಈ-ಶ್ರಮ್ ಪೋರ್ಟಲ್‌ನಲ್ಲಿ ನೋಂದಾಯಿಸಿ';

  @override
  String get eShramGovtBenefitsMenu => 'ಈ-ಶ್ರಮ್ ಸರ್ಕಾರಿ ಸೌಲಭ್ಯಗಳು';

  @override
  String get dismiss => 'ವಜಾಗೊಳಿಸಿ';

  @override
  String get trainingVideos => 'ತರಬೇತಿ ವೀಡಿಯೊಗಳು';

  @override
  String get welcomeToReachU => 'ನಮಸ್ಕಾರ, ReachU ಗೆ ಸುಸ್ವಾಗತ!';

  @override
  String get welcomeTrainingSubtitle =>
      'ನಿಮ್ಮ ಪ್ರಯಾಣವನ್ನು ಪ್ರಾರಂಭಿಸೋಣ! ಆ್ಯಪ್ ಹೇಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ ಎಂದು ತಿಳಿಯಲು ದಯವಿಟ್ಟು ಈ ತ್ವರಿತ ತರಬೇತಿ ವೀಡಿಯೊವನ್ನು ವೀಕ್ಷಿಸಿ.';

  @override
  String get trainingCompletedTitle => 'ತರಬೇತಿ ಪೂರ್ಣಗೊಂಡಿದೆ!';

  @override
  String get trainingCompletedSubtitle =>
      'ಅದ್ಭುತ! ನೀವು ಅಗತ್ಯವಿರುವ ಎಲ್ಲಾ ತರಬೇತಿಯನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಪೂರ್ಣಗೊಳಿಸಿದ್ದೀರಿ. ನೀವು ಈಗ ಚಾಲನೆ ಮಾಡಲು ಸಿದ್ಧರಿದ್ದೀರಿ.';

  @override
  String get startDriving => 'ಚಾಲನೆ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get iHaveReadAndConsent =>
      'ನಾನು ಓದಿದ್ದೇನೆ ಮತ್ತು ಇದರ ಮೇಲೆ ನನ್ನ ಒಪ್ಪಿಗೆಯನ್ನು ನೀಡುತ್ತಿದ್ದೇನೆ: ';

  @override
  String get tdsDeclaration => 'TDS ಘೋಷಣೆ';
}
