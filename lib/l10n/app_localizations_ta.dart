// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get account => 'கணக்கு';

  @override
  String get editProfile => 'சுயவிவரத்தைத் திருத்து';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get language => 'மொழி';

  @override
  String get selectLanguage => 'மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get english => 'English (ஆங்கிலம்)';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'வாகனத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get selectAVehicle => 'ஒரு வாகனத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName உடன் தொடரவும்';
  }

  @override
  String get addStop => 'நிறுத்தம் சேர்க்கவும்';

  @override
  String get editLocations => 'இடங்களைத் திருத்தவும்';

  @override
  String get noPickupLocationSet => 'பிக்அப் இடம் அமைக்கப்படவில்லை';

  @override
  String get noDropLocationSet => 'டிராப் இடம் அமைக்கப்படவில்லை';

  @override
  String get addDrop => 'டிராப் சேர்க்கவும்';

  @override
  String get errorLoadingVehicles => 'வாகனங்களை ஏற்றுவதில் பிழை';

  @override
  String get selectGoodsType => 'சரக்கு வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get whatAreYouShipping => 'நீங்கள் என்ன அனுப்புகிறீர்கள்?';

  @override
  String get chooseCategoryBestMatches =>
      'உங்கள் சரக்குக்கு மிகவும் பொருந்தும் வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get editGoodsDetails => 'சரக்கு விவரங்களைத் திருத்தவும்';

  @override
  String get weightKgMax90 => 'எடை (கிலோ) - அதிகபட்சம் 90 கிலோ';

  @override
  String get weightInvalidError => 'எடை 1 முதல் 90 கிலோ வரை இருக்க வேண்டும்';

  @override
  String get numberOfPackages => 'பேக்கேஜ்களின் எண்ணிக்கை';

  @override
  String get worthValueRupees => 'மதிப்பு / விலை (ரூபாய்)';

  @override
  String get done => 'முடிந்தது';

  @override
  String get confirmGoodsDetails => 'சரக்கு விவரங்களை உறுதிப்படுத்தவும்';

  @override
  String get failedToLoadCategories => 'வகைகளை ஏற்ற முடியவில்லை';

  @override
  String get disclaimerTitle => 'பொறுப்புத் துறப்பு';

  @override
  String get disclaimerText =>
      'பொறுப்புத் துறப்பு: கொண்டு செல்லப்படும் சரக்கு ஆபத்தற்றது, சட்டபூர்வமானது மற்றும் தேர்ந்தெடுக்கப்பட்ட வகையைச் சேர்ந்தது என்று நான் அறிவிக்கிறேன். தடைசெய்யப்பட்ட பொருட்களைக் கொண்டு செல்வதற்கு நிறுவனம் பொறுப்பல்ல. எடை வாகனத்தின் அதிகபட்ச திறனைத் தாண்டக்கூடாது.';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight கிலோ • $packages பேக்கேஜ் • ₹$worth';
  }

  @override
  String get welcome => 'வரவேற்கிறோம்';

  @override
  String get enterMobileNumberToContinue =>
      'தொடர உங்கள் மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get mobileNumber => 'மொபைல் எண்';

  @override
  String get agreeTermsText =>
      'நான் சேவை விதிமுறைகளையும் தனியுரிமைக் கொள்கையையும் ஏற்கிறேன்';

  @override
  String get sendOtp => 'OTP அனுப்பவும்';

  @override
  String get verifyOtp => 'OTP சரிபார்க்கவும்';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber க்கு அனுப்பப்பட்ட 4-இலக்கக் குறியீட்டை உள்ளிடவும்';
  }

  @override
  String get verifyAndContinue => 'சரிபார்த்துத் தொடரவும்';

  @override
  String resendInSeconds(Object count) {
    return '$count வினாடிகளில் மீண்டும் அனுப்பவும்';
  }

  @override
  String get resendOtp => 'OTP மீண்டும் அனுப்பவும்';

  @override
  String get changeNumber => 'எண்ணை மாற்றவும்';

  @override
  String get mobileNumberRequired => 'மொபைல் எண் தேவை';

  @override
  String get enterValidMobileNumber =>
      'சரியான 10-இலக்க மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get enterCompleteOtpError =>
      'தயவுசெய்து முழு 4-இலக்க OTP ஐ உள்ளிடவும்';

  @override
  String get otpResentSuccess => 'OTP வெற்றிகரமாக மீண்டும் அனுப்பப்பட்டது';

  @override
  String get fullName => 'முழுப் பெயர்';

  @override
  String get fullNameRequired => 'முழுப் பெயர் தேவை';

  @override
  String get nameMinLengthError =>
      'பெயர் குறைந்தது 2 எழுத்துகளாக இருக்க வேண்டும்';

  @override
  String get email => 'மின்னஞ்சல்';

  @override
  String get emailRequired => 'மின்னஞ்சல் தேவை';

  @override
  String get enterValidEmail => 'சரியான மின்னஞ்சல் முகவரியை உள்ளிடவும்';

  @override
  String get referralCode => 'பரிந்துரைக் குறியீடு';

  @override
  String get enterReferralCodeOptional =>
      'பரிந்துரைக் குறியீட்டை உள்ளிடவும் (விருப்பத்தேர்வு)';

  @override
  String get createAccount => 'கணக்கை உருவாக்கவும்';

  @override
  String get completeProfileToGetStarted =>
      'தொடங்க உங்கள் சுயவிவரத்தைப் பூர்த்தி செய்யவும்';

  @override
  String get profileUpdatedSuccess =>
      'சுயவிவரம் வெற்றிகரமாகப் புதுப்பிக்கப்பட்டது!';

  @override
  String get updateProfilePicture => 'சுயவிவரப் படத்தைப் புதுப்பிக்கவும்';

  @override
  String get camera => 'கேமரா';

  @override
  String get gallery => 'கேலரி';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String get dateOfBirthOptional => 'பிறந்த தேதி (விருப்பத்தேர்வு)';

  @override
  String get gender => 'பாலினம்';

  @override
  String get male => 'ஆண்';

  @override
  String get female => 'பெண்';

  @override
  String get other => 'மற்றவை';

  @override
  String get updateProfile => 'சுயவிவரத்தைப் புதுப்பிக்கவும்';

  @override
  String profileUpdateFailed(Object error) {
    return 'சுயவிவரத்தைப் புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get goodMorning => 'காலை வணக்கம்,';

  @override
  String get goodAfternoon => 'மதிய வணக்கம்,';

  @override
  String get goodEvening => 'மாலை வணக்கம்,';

  @override
  String get pickupFrom => 'இங்கிருந்து பிக்அப்';

  @override
  String get currentLocation => 'தற்போதைய இடம்';

  @override
  String get fetchingLocation => 'இடத்தைப் பெறுகிறது...';

  @override
  String get locationServicesDisabled => 'இருப்பிடச் சேவை முடக்கப்பட்டுள்ளது';

  @override
  String get locationPermissionNeeded => 'இருப்பிட அனுமதி தேவை';

  @override
  String get locationAccessBlocked => 'இருப்பிட அணுகல் தடுக்கப்பட்டுள்ளது';

  @override
  String get couldNotFetchLocation => 'இடத்தைப் பெற முடியவில்லை';

  @override
  String get enable => 'இயக்கு';

  @override
  String get allow => 'அனுமதி';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get turnOnLocationServices => 'இருப்பிடச் சேவைகளை இயக்கவும்';

  @override
  String get allowLocationAccess => 'இருப்பிட அணுகலை அனுமதிக்கவும்';

  @override
  String get gpsRequiredDescription =>
      'உங்கள் பிக்அப் இடத்தைத் துல்லியமாகக் கண்டறியவும் அருகிலுள்ள ஓட்டுநர்களை விரைவாகக் கண்டறியவும் உங்கள் சாதன GPS தேவை.';

  @override
  String get permissionRequiredDescription =>
      'உங்கள் பிக்அப் இடத்தைத் துல்லியமாகக் கண்டறியவும் அருகிலுள்ள ஓட்டுநர்களை விரைவாகக் கண்டறியவும் ஆப் அமைப்புகளில் இருப்பிட அனுமதிகளை அனுமதிக்கவும்.';

  @override
  String get goToLocationSettings => 'இருப்பிட அமைப்புகளுக்குச் செல்லவும்';

  @override
  String get goToAppSettings => 'ஆப் அமைப்புகளுக்குச் செல்லவும்';

  @override
  String get enterAddressManually => 'நான் என் முகவரியை கைமுறையாக உள்ளிடுவேன்';

  @override
  String get taglineTitle =>
      'எதையும் கொண்டு செல்லுங்கள்,\nஎப்போது வேண்டுமானாலும்.';

  @override
  String get taglineSubtitle =>
      'விரைவான டெலிவரி உங்கள் விரல் நுனியில். ஸ்மார்ட்டாக மாற்றவும், எங்கள் பிரீமியம் கடற்படையுடன் வேகமாக முன்னேறுங்கள்.';

  @override
  String get twoWheelers => 'இரு சக்கர வாகனங்கள்';

  @override
  String get trucks => 'லாரிகள்';

  @override
  String get specialOffer => 'சிறப்பு சலுகை';

  @override
  String get promoBannerText =>
      'உங்கள் முதல் சவாரியில்\n20% தள்ளுபடி பெறுங்கள்';

  @override
  String get whereIsYourPickup => 'உங்கள் பிக்அப் எங்கே?';

  @override
  String get whereIsYourDrop => 'உங்கள் டிராப் எங்கே?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'உங்கள் டிராப் $index எங்கே?';
  }

  @override
  String get typeMinCharsToSearch =>
      'தேடலைத் தொடங்க குறைந்தது 4 எழுத்துகளை தட்டச்சு செய்யவும்';

  @override
  String get selectOnMap => 'வரைபடத்தில் தேர்ந்தெடுக்கவும்';

  @override
  String get pinpointExactLocation => 'உங்கள் சரியான இடத்தைக் குறிக்கவும்';

  @override
  String get couldNotFindAddress => 'மன்னிக்கவும், இந்த முகவரி கிடைக்கவில்லை.';

  @override
  String get trySearchingNearbyLandmark =>
      'அருகிலுள்ள அடையாளம், பகுதி அல்லது பிரபலமான இடத்தைப் பயன்படுத்தி தேட முயற்சிக்கவும்.';

  @override
  String get anErrorOccurred => 'ஒரு பிழை ஏற்பட்டது';

  @override
  String get locating => 'இடத்தைக் கண்டறிகிறது...';

  @override
  String get fetchingDetails => 'விவரங்களைப் பெறுகிறது...';

  @override
  String get confirmPickupLocation => 'பிக்அப் இடத்தை உறுதிப்படுத்தவும்';

  @override
  String get confirmDropLocation => 'டிராப் இடத்தை உறுதிப்படுத்தவும்';

  @override
  String get houseShopApartment => 'வீடு / கடை / அபார்ட்மெண்ட்';

  @override
  String get sendersName => 'அனுப்புநரின் பெயர்';

  @override
  String get receiversName => 'பெறுநரின் பெயர்';

  @override
  String get pleaseEnterName => 'தயவுசெய்து பெயரை உள்ளிடவும்';

  @override
  String get sendersMobileNumber => 'அனுப்புநரின் மொபைல் எண்';

  @override
  String get receiversMobileNumber => 'பெறுநரின் மொபைல் எண்';

  @override
  String get enterValidTenDigitNumber => 'சரியான 10-இலக்க எண்ணை உள்ளிடவும்';

  @override
  String get useMyMobileNumber => 'என் மொபைல் எண்ணைப் பயன்படுத்தவும்';

  @override
  String get saveAsOptional => 'இவ்வாறு சேமிக்கவும் (விருப்பத்தேர்வு):';

  @override
  String get home => 'வீடு';

  @override
  String get shop => 'கடை';

  @override
  String get confirmAndProceed => 'உறுதிப்படுத்தித் தொடரவும்';

  @override
  String get selectDropLocation => 'டிராப் இடத்தைத் தேர்ந்தெடுக்கவும்';

  @override
  String get cannotSwapEmptyLocations =>
      'வெற்று இடங்களை நிரப்பப்பட்ட இடங்களுடன் மாற்ற முடியாது.';

  @override
  String get proceedToVehicleSelection => 'வாகனத் தேர்வுக்குத் தொடரவும்';

  @override
  String get permissionRequired => 'அனுமதி தேவை';

  @override
  String get contactsPermissionDescription =>
      'அனுப்புநரின் தொலைபேசி எண்ணை எளிதாகத் தேர்ந்தெடுக்க Reachu க்கு உங்கள் தொடர்புகளுக்கான அணுகல் தேவை. தயவுசெய்து ஆப் அமைப்புகளில் இதை இயக்கவும்.';

  @override
  String get openSettings => 'அமைப்புகளைத் திறக்கவும்';

  @override
  String get selectContact => 'தொடர்பைத் தேர்ந்தெடுக்கவும்';

  @override
  String get contactPermissionDenied => 'தொடர்பு அனுமதி மறுக்கப்பட்டது.';

  @override
  String get myProfile => 'என் சுயவிவரம்';

  @override
  String selfFormat(String name) {
    return '$name (சுயம்)';
  }

  @override
  String get deviceContacts => 'சாதனத் தொடர்புகள்';

  @override
  String get rideHistory => 'ரைடு வரலாறு';

  @override
  String get transactions => 'பரிவர்த்தனைகள்';

  @override
  String get noTransactionsFound => 'பரிவர்த்தனைகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get failedToLoadTransactions => 'பரிவர்த்தனைகளை ஏற்ற முடியவில்லை';

  @override
  String get addMoney => 'பணம் சேர்க்கவும்';

  @override
  String get enterAmountToAdd => 'சேர்க்க வேண்டிய தொகையை உள்ளிடவும்';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay திறக்க முடியவில்லை: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'பணம் செலுத்தும் ஆர்டரை உருவாக்க முடியவில்லை: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'Reachu கிரெடிட்களில் ₹$amount வெற்றிகரமாகச் சேர்க்கப்பட்டது!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'பணம் செலுத்தும் சரிபார்ப்பு தோல்வியடைந்தது: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'பணம் செலுத்துதல் தோல்வியடைந்தது ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'வெளிப்புற வாலட் தேர்ந்தெடுக்கப்பட்டது: $walletName';
  }

  @override
  String get walletTopUp => 'வாலட் டாப்-அப்';

  @override
  String get payments => 'பணம் செலுத்துதல்கள்';

  @override
  String get reachuCredits => 'Reachu கிரெடிட்கள்';

  @override
  String get balance => 'இருப்பு';

  @override
  String get errorLoadingBalance => 'இருப்பை ஏற்றுவதில் பிழை';

  @override
  String get availableBalance => 'கிடைக்கும் இருப்பு';

  @override
  String get totalExpenses => 'மொத்தச் செலவுகள்';

  @override
  String get recentTransactions => 'சமீபத்திய பரிவர்த்தனைகள்';

  @override
  String get viewMore => 'மேலும் காண்க';

  @override
  String get noTransactionsYet => 'இதுவரை பரிவர்த்தனைகள் இல்லை';

  @override
  String get booking => 'புக்கிங்';

  @override
  String get earning => 'வருமானம்';

  @override
  String get support => 'ஆதரவு';

  @override
  String get profile => 'சுயவிவரம்';

  @override
  String get pendingWithdrawals => 'நிலுவையில் உள்ள பின்வாங்கல்கள்';

  @override
  String get driverDebt => 'ஓட்டுநர் கடன்';

  @override
  String minBalanceRequired(Object amount) {
    return 'குறைந்தபட்ச இருப்பு தேவை: ₹$amount';
  }

  @override
  String get insufficientBalance => 'பின்வாங்க போதுமான இருப்பு இல்லை';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'எச்சரிக்கை: உங்கள் கிடைக்கும் இருப்பு புதிய ரைடுகளை ஏற்கத் தேவையான குறைந்தபட்ச வரம்புக்கு (₹$amount) குறைவாக உள்ளது. தயவுசெய்து உங்கள் வாலட்டை டாப் அப் செய்யவும்.';
  }

  @override
  String get moneyTransfer => 'பணம் மாற்றவும்';

  @override
  String get withdrawMoney => 'பணம் பின்வாங்கவும்';

  @override
  String get manageAccounts => 'கணக்குகளை நிர்வகிக்கவும்';

  @override
  String get bankAccounts => 'வங்கிக் கணக்குகள் மற்றும் UPI';

  @override
  String get addAccount => 'பணம் செலுத்தும் முறையைச் சேர்க்கவும்';

  @override
  String get addBankAccount => 'வங்கிக் கணக்கைச் சேர்க்கவும்';

  @override
  String get addUpiId => 'UPI ஐடி சேர்க்கவும்';

  @override
  String get editBankAccount => 'வங்கிக் கணக்கைத் திருத்தவும்';

  @override
  String get editUpiId => 'UPI ஐடியைத் திருத்தவும்';

  @override
  String get deleteAccount => 'கணக்கை நீக்கவும்';

  @override
  String get deleteAccountConfirm =>
      'இந்தப் பணம் செலுத்தும் முறையை நீக்க விரும்புகிறீர்களா?';

  @override
  String get accountHolderName => 'கணக்கு வைத்திருப்பவரின் பெயர்';

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
  String get bankName => 'வங்கியின் பெயர்';

  @override
  String get accountNumber => 'கணக்கு எண்';

  @override
  String get confirmAccountNumber => 'கணக்கு எண்ணை உறுதிப்படுத்தவும்';

  @override
  String get ifscCode => 'IFSC குறியீடு';

  @override
  String get upiId => 'UPI ஐடி';

  @override
  String get fieldRequired => 'இந்தப் புலம் தேவை';

  @override
  String get invalidUpi => 'சரியான UPI ஐடியை உள்ளிடவும் (எ.கா: name@upi)';

  @override
  String get invalidIfsc => 'சரியான 11-இலக்க IFSC குறியீட்டை உள்ளிடவும்';

  @override
  String get invalidAccountNumber => 'சரியான கணக்கு எண்ணை உள்ளிடவும்';

  @override
  String get accountNumbersDoNotMatch => 'கணக்கு எண்கள் பொருந்தவில்லை';

  @override
  String get noPaymentMethods =>
      'இதுவரை பணம் செலுத்தும் முறைகள் எதுவும் சேர்க்கப்படவில்லை';

  @override
  String get addPaymentMethodSubtitle =>
      'உங்கள் வருமானத்தைப் பின்வாங்க வங்கிக் கணக்கு அல்லது UPI ஐடி சேர்க்கவும்';

  @override
  String get confirmTransfer => 'மாற்றத்தை உறுதிப்படுத்தவும்';

  @override
  String get transferAmount => 'மாற்றத் தொகை';

  @override
  String get transferSuccess =>
      'பின்வாங்கல் கோரிக்கை வெற்றிகரமாக உருவாக்கப்பட்டது';

  @override
  String get collectPayment => 'பணம் வசூலிக்கவும்';

  @override
  String get collectCash => 'ரொக்கம் வசூலிக்கவும்';

  @override
  String get cashCollectedSuccess =>
      'ரொக்கப் பணம் செலுத்துதல் வெற்றிகரமாக முடிந்தது!';

  @override
  String get displayQrCode => 'UPI QR குறியீட்டைக் காட்டவும்';

  @override
  String get customerScanQr =>
      'பணம் செலுத்த வாடிக்கையாளரிடம் இந்த QR குறியீட்டை ஸ்கேன் செய்யச் சொல்லவும்';

  @override
  String get generatingQr => 'QR குறியீடு உருவாக்கப்படுகிறது...';

  @override
  String get selectPaymentMethod =>
      'பணம் செலுத்தும் முறையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get beneficiary => 'பயனாளி';

  @override
  String get completed => 'முடிந்தது';

  @override
  String get pending => 'நிலுவையில்';

  @override
  String get failed => 'தோல்வியடைந்தது';

  @override
  String get failedToLoadAccounts => 'பணம் செலுத்தும் முறைகளை ஏற்ற முடியவில்லை';

  @override
  String get accountDeletedSuccess =>
      'பணம் செலுத்தும் முறை வெற்றிகரமாக நீக்கப்பட்டது';

  @override
  String get accountUpdatedSuccess =>
      'பணம் செலுத்தும் முறை வெற்றிகரமாகப் புதுப்பிக்கப்பட்டது';

  @override
  String get accountAddedSuccess =>
      'பணம் செலுத்தும் முறை வெற்றிகரமாகச் சேர்க்கப்பட்டது';

  @override
  String get withdrawalAmount => 'பின்வாங்கல் தொகை';

  @override
  String get transferDestination => 'மாற்ற இலக்கு';

  @override
  String get enterAmount => 'தொகையை உள்ளிடவும்';

  @override
  String get selected => 'தேர்ந்தெடுக்கப்பட்டது';

  @override
  String get accountNumberLabel => 'கணக்கு எண்';

  @override
  String get errorLoadingAccounts => 'பணம் செலுத்தும் முறைகளை ஏற்றுவதில் பிழை';

  @override
  String get errorLoadingWallet => 'வாலட் தகவலை ஏற்றுவதில் பிழை';

  @override
  String get enterAccountHolderName =>
      'கணக்கு வைத்திருப்பவரின் பெயரை உள்ளிடவும்';

  @override
  String get bankNameHint => 'எ.கா: ஸ்டேட் பேங்க் ஆஃப் இந்தியா';

  @override
  String get enterAccountNumber => 'கணக்கு எண்ணை உள்ளிடவும்';

  @override
  String get confirmAccountNumberHint => 'கணக்கு எண்ணை உறுதிப்படுத்தவும்';

  @override
  String get ifscCodeHint => 'எ.கா: SBIN0001234';

  @override
  String get upiIdHint => 'எ.கா: user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'மொத்தக் கட்டணம்';

  @override
  String get hideQrCode => 'QR மறைக்கவும்';

  @override
  String get nameMinLengthRequired =>
      'பெயர் குறைந்தது 2 எழுத்துகளாக இருக்க வேண்டும்';

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
    return 'ஆர்டர் #$orderId';
  }

  @override
  String get personalInformation => 'தனிப்பட்ட தகவல்';

  @override
  String get online => 'ஆன்லைன்';

  @override
  String get offline => 'ஆஃப்லைன்';

  @override
  String get onlineSuccessMessage =>
      'நீங்கள் இப்போது ஆன்லைனில் உள்ளீர்கள் மற்றும் பணியில் உள்ளீர்கள்.';

  @override
  String get offlineSuccessMessage => 'நீங்கள் இப்போது ஆஃப்லைனில் உள்ளீர்கள்.';

  @override
  String get partnerSupport => 'பார்ட்னர் ஆதரவு';

  @override
  String get partnerSupportSubtitle =>
      'வணக்கம் பார்ட்னர்! உங்கள் சவாரி, பணம் செலுத்துதல் அல்லது கணக்கில் உதவி வேண்டுமா? நாங்கள் 24/7 உங்களுக்கு உதவ இங்கே இருக்கிறோம்.';

  @override
  String get faqsAndHelp => 'அடிக்கடி கேட்கப்படும் கேள்விகள் மற்றும் உதவி';

  @override
  String get findQuickAnswers => 'விரைவான பதில்களைக் கண்டறியவும்';

  @override
  String get raiseSupportTicket => 'டிக்கெட் சமர்ப்பிக்கவும்';

  @override
  String get contactSupportAgent => 'ஆதரவு முகவரைத் தொடர்பு கொள்ளவும்';

  @override
  String get recentTickets => 'சமீபத்திய டிக்கெட்டுகள்';

  @override
  String get noActiveTickets => 'செயலில் உள்ள ஆதரவு டிக்கெட்டுகள் இல்லை';

  @override
  String get submitTicketDescription =>
      'ஏதேனும் சிக்கல் ஏற்பட்டால் டிக்கெட் சமர்ப்பிக்கவும்.';

  @override
  String get failedToLoadTickets => 'சமீபத்திய டிக்கெட்டுகளை ஏற்ற முடியவில்லை';

  @override
  String get contactSupport => 'ஆதரவைத் தொடர்பு கொள்ளவும்';

  @override
  String get callUs => 'எங்களை அழைக்கவும்';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'எங்களுடன் அரட்டையடிக்கவும்';

  @override
  String get emailSupport => 'மின்னஞ்சல் ஆதரவு';

  @override
  String get ticketStatusOpen => 'திறந்துள்ளது';

  @override
  String get ticketStatusInProgress => 'முன்னேற்றத்தில் உள்ளது';

  @override
  String get ticketStatusResolved => 'தீர்க்கப்பட்டது';

  @override
  String get ticketStatusClosed => 'மூடப்பட்டது';

  @override
  String get ticketCategoryRideIssue => 'சவாரி சிக்கல்';

  @override
  String get ticketCategoryPayment => 'பணம் செலுத்துதல்';

  @override
  String get ticketCategoryAccount => 'கணக்கு';

  @override
  String get ticketCategoryDriverIssue => 'ஓட்டுநர் சிக்கல்';

  @override
  String get ticketCategoryOther => 'மற்றவை';

  @override
  String get failedToLoadDashboard => 'டாஷ்போர்டை ஏற்ற முடியவில்லை';

  @override
  String get todaysEarnings => 'இன்றைய வருமானம்';

  @override
  String get cashCollected => 'வசூலிக்கப்பட்ட ரொக்கம்';

  @override
  String get onlinePayment => 'ஆன்லைன் பணம் செலுத்துதல்';

  @override
  String get todaysRideStatus => 'இன்றைய ஆர்டர் நிலை';

  @override
  String get totalRides => 'மொத்த ஆர்டர்கள்';

  @override
  String get cancelled => 'ரத்துசெய்யப்பட்டது';

  @override
  String get dutyRating => 'பணி மதிப்பீடு';

  @override
  String get noRidesFound => 'ரைடுகள் எதுவும் கிடைக்கவில்லை';

  @override
  String get failedToLoadHistory => 'வரலாற்றை ஏற்ற முடியவில்லை';

  @override
  String get all => 'அனைத்தும்';

  @override
  String get paymentPending => 'பணம் செலுத்துதல் நிலுவையில்';

  @override
  String stopsCount(int count) {
    return '$count நிறுத்தம்';
  }

  @override
  String get rideDetails => 'ரைடு விவரங்கள்';

  @override
  String get pickupLocation => 'பிக்அப் இடம்';

  @override
  String get dropLocation => 'டிராப் இடம்';

  @override
  String stopLocation(int number) {
    return 'நிறுத்தம் $number';
  }

  @override
  String get fareBreakdown => 'கட்டண விவரம்';

  @override
  String get netPayable => 'மொத்த செலுத்த வேண்டிய தொகை';

  @override
  String get paymentMethod => 'பணம் செலுத்தும் முறை';

  @override
  String get cash => 'ரொக்கம்';

  @override
  String get customerDetails => 'வாடிக்கையாளர் விவரங்கள்';

  @override
  String get callCustomer => 'வாடிக்கையாளரை அழைக்கவும்';

  @override
  String get goodsType => 'சரக்கு வகை';

  @override
  String get quantity => 'அளவு';

  @override
  String get weight => 'எடை';

  @override
  String get distance => 'தூரம்';

  @override
  String get duration => 'நேரம்';

  @override
  String get cancellationReason => 'ரத்துசெய்வதற்கான காரணம்';

  @override
  String get routeTimeline => 'வழித்தட காலவரிசை';

  @override
  String get goodsSpecifications => 'சரக்கு விவரம்';

  @override
  String get vehicleMetadata => 'வாகன விவரம்';

  @override
  String get description => 'விளக்கம்';

  @override
  String get estimatedWeight => 'மதிப்பிடப்பட்ட எடை';

  @override
  String get vehicleName => 'வாகனத்தின் பெயர்';

  @override
  String get vehicleNumber => 'வாகன எண்';

  @override
  String get modelColor => 'மாடல் / நிறம்';

  @override
  String get baseFare => 'அடிப்படைக் கட்டணம்';

  @override
  String get weatherSurcharge => 'வானிலை கூடுதல் கட்டணம்';

  @override
  String get trafficSurcharge => 'போக்குவரத்து கூடுதல் கட்டணம்';

  @override
  String get promoDiscount => 'ப்ரோமோ தள்ளுபடி';

  @override
  String get pickupSender => 'பிக்அப் (அனுப்புநர்)';

  @override
  String get dropoffRecipient => 'டிராப்ஆஃப் (பெறுநர்)';

  @override
  String rideIdLabel(String id) {
    return 'ரைடு ஐடி: $id';
  }

  @override
  String get todaysTotalEarnings => 'இன்றைய மொத்த வருமானம்';

  @override
  String get failedToLoadEarnings => 'வருமானத் தரவை ஏற்ற முடியவில்லை';

  @override
  String get noTransactionsRecorded =>
      'பரிவர்த்தனைகள் எதுவும் பதிவு செய்யப்படவில்லை';

  @override
  String get mySupportTickets => 'என் ஆதரவு டிக்கெட்டுகள்';

  @override
  String get newTicket => 'புதிய டிக்கெட்';

  @override
  String get noSupportTicketsRaised =>
      'ஆதரவு டிக்கெட்டுகள் எதுவும் சமர்ப்பிக்கப்படவில்லை';

  @override
  String get tapNewTicketSubtitle =>
      'உதவி பெற \'புதிய டிக்கெட்\' மீது தட்டவும்.';

  @override
  String get submitATicket => 'டிக்கெட் சமர்ப்பிக்கவும்';

  @override
  String get explainIssueDetail =>
      'உங்கள் சிக்கலை விரிவாக விவரிக்கவும். ஆதரவு முகவர் விரைவில் உறுதிப்படுத்தி பதிலளிப்பார்.';

  @override
  String get categoryRequired => 'வகை*';

  @override
  String get selectIssueCategory => 'சிக்கல் வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get pleaseSelectCategoryError =>
      'தயவுசெய்து ஒரு சிக்கல் வகையைத் தேர்ந்தெடுக்கவும்';

  @override
  String get subjectRequired => 'பொருள்*';

  @override
  String get briefSummaryHint => 'சிக்கலின் சுருக்க விவரம்';

  @override
  String get subjectRequiredError => 'பொருள் கட்டாயம்';

  @override
  String get subjectMinLengthError =>
      'பொருள் குறைந்தது 5 எழுத்துகளாக இருக்க வேண்டும்';

  @override
  String get descriptionRequired => 'விளக்கம் / செய்தி*';

  @override
  String get describeProblemHint => 'உங்கள் சிக்கலை விரிவாக விவரிக்கவும்...';

  @override
  String get messageRequiredError => 'செய்தி விவரம் கட்டாயம்';

  @override
  String get messageMinLengthError =>
      'செய்தி குறைந்தது 10 எழுத்துகளாக இருக்க வேண்டும்';

  @override
  String get submitTicket => 'டிக்கெட் சமர்ப்பிக்கவும்';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get termsAndConditions => 'விதிமுறைகள் மற்றும் நிபந்தனைகள்';

  @override
  String get termsOfService => 'சேவை விதிமுறைகள்';

  @override
  String get iAgreeTo => 'நான் ';

  @override
  String get and => ' மற்றும் ';

  @override
  String get agreeSuffix => ' ஐ ஏற்கிறேன்';

  @override
  String get darkTheme => 'டார்க் தீம்';

  @override
  String get failedToLoadDetails => 'விவரங்களை ஏற்ற முடியவில்லை';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>தனியுரிமைக் கொள்கை</h1><p>Reachu டிரைவர் ஆப்பிற்கு வரவேற்கிறோம். உங்கள் தனியுரிமை எங்களுக்கு முக்கியமானது. இந்தத் தனியுரிமைக் கொள்கை உங்கள் தனிப்பட்ட தகவலை நாங்கள் எவ்வாறு சேகரிக்கிறோம், பயன்படுத்துகிறோம் மற்றும் பாதுகாக்கிறோம் என்பதை விளக்குகிறது.</p><h2>1. நாங்கள் சேகரிக்கும் தகவல்</h2><p>உங்கள் பெயர், தொலைபேசி எண், மின்னஞ்சல், வாகன விவரங்கள், செயலில் உள்ள பயணங்களின் போது இருப்பிடத் தரவு மற்றும் பரிவர்த்தனை விவரங்களை நாங்கள் சேகரிக்கிறோம்.</p><h2>2. உங்கள் தகவலை நாங்கள் எவ்வாறு பயன்படுத்துகிறோம்</h2><p>டெலிவரி ரைடுகளை எளிதாக்கவும், பணம் செலுத்துதல்களைச் செயல்படுத்தவும், பாதுகாப்பை உறுதிப்படுத்தவும் மற்றும் ஓட்டுநர் அனுபவத்தை மேம்படுத்தவும் உங்கள் தகவலைப் பயன்படுத்துகிறோம்.</p><h2>3. இருப்பிடக் கண்காணிப்பு</h2><p>பணியில் இருக்கும் போது உங்களை அருகிலுள்ள டெலிவரி கோரிக்கைகளுடன் இணைக்கவும் வாடிக்கையாளர்கள் பயண முன்னேற்றத்தைப் பார்க்கவும் பின்னணி இருப்பிட அணுகல் தேவை.</p><h2>4. தரவுப் பாதுகாப்பு</h2><p>உங்கள் தனிப்பட்ட தகவலை அங்கீகரிக்கப்படாத அணுகலில் இருந்து பாதுகாக்க கடுமையான பாதுகாப்பு நடவடிக்கைகளை நாங்கள் செயல்படுத்துகிறோம்.</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>விதிமுறைகள் மற்றும் நிபந்தனைகள்</h1><p>Reachu டிரைவர் பயன்பாட்டைப் பயன்படுத்துவதற்கு முன் இந்த விதிமுறைகள் மற்றும் நிபந்தனைகளை கவனமாகப் படிக்கவும்.</p><h2>1. விதிமுறைகளின் ஏற்பு</h2><p>Reachu இல் ஓட்டுநர் பார்ட்னராகப் பதிவு செய்வதன் மூலம், பொருந்தும் அனைத்து விதிமுறைகள், கொள்கைகள் மற்றும் உள்ளூர் போக்குவரத்து விதிகளைப் பின்பற்ற நீங்கள் ஒப்புக்கொள்கிறீர்கள்.</p><h2>2. ஓட்டுநரின் பொறுப்புகள்</h2><p>ஓட்டுநருக்கு சரியான ஓட்டுநர் உரிமம், துல்லியமான வாகன ஆவணங்கள் மற்றும் பாதுகாப்பான, சரியான நேரத்தில் டெலிவரி சேவை வழங்கும் கடமை இருக்க வேண்டும்.</p><h2>3. பணம் செலுத்துதல் மற்றும் வருமானம்</h2><p>கட்டணம் தள விகிதங்களின்படி நிர்ணயிக்கப்பட்டு, பொருந்தும் கட்டணங்களுக்குப் பிறகு உங்கள் சரிபார்க்கப்பட்ட வங்கிக் கணக்கிற்கு மாற்றப்படும்.</p><h2>4. கணக்கு இடைநிறுத்தம்</h2><p>மோசடி செயல்பாடுகள், பாதுகாப்பு மீறல்கள் அல்லது கொள்கையைப் பின்பற்றாத நிலையில் கணக்கை இடைநிறுத்தும் உரிமையை Reachu கொண்டுள்ளது.</p>';

  @override
  String get reviewAndRating => 'மதிப்பாய்வு மற்றும் மதிப்பீடு';

  @override
  String get noRatingsYet => 'இதுவரை மதிப்பீடுகள் இல்லை';

  @override
  String ratedByCustomers(int count) {
    return '$count வாடிக்கையாளர்களால் மதிப்பிடப்பட்டது';
  }

  @override
  String get noReviewsYet => 'இதுவரை மதிப்புரைகள் இல்லை';

  @override
  String get noReviewsDesc => 'நீங்கள் இதுவரை மதிப்புரைகள் எதையும் பெறவில்லை.';

  @override
  String get noCommentProvided => 'கருத்து எதுவும் வழங்கப்படவில்லை';

  @override
  String get ratingExcellent => 'சிறப்பானது';

  @override
  String get ratingGood => 'நல்லது';

  @override
  String get ratingAverage => 'சராசரி';

  @override
  String get ratingBelowAverage => 'சராசரிக்குக் கீழ்';

  @override
  String get ratingPoor => 'மோசம்';

  @override
  String get customer => 'வாடிக்கையாளர்';

  @override
  String get noInternetConnection => 'இணைய இணைப்பு இல்லை';

  @override
  String get checkInternetConnection =>
      'தயவுசெய்து உங்கள் இணைய இணைப்பைச் சரிபார்த்து மீண்டும் முயற்சிக்கவும்.';

  @override
  String get internetRestored => 'இணைய இணைப்பு மீண்டும் கிடைத்தது';

  @override
  String get retryConnection => 'மீண்டும் முயற்சி செய்';

  @override
  String get connectionTimedOut =>
      'இணைப்பு நேரம் முடிந்தது. மீண்டும் முயற்சிக்கிறது...';

  @override
  String get newUpdateAvailable =>
      'புதிய புதுப்பிப்பு கிடைக்கிறது. தொடர செயலியைப் புதுப்பிக்கவும்.';

  @override
  String get updateRequiredTitle => 'புதுப்பிப்பு தேவை';

  @override
  String updateRequiredDesc(String version) {
    return 'நீங்கள் Reachu Driver இன் பழைய பதிப்பைப் பயன்படுத்துகிறீர்கள். சவாரிகளைத் தொடர சமீபத்திய பதிப்பிற்குப் புதுப்பிக்கவும்.';
  }

  @override
  String get updateNow => 'இப்போது புதுப்பி';

  @override
  String get updateLater => 'பிறகு புதுப்பி';

  @override
  String get underMaintenanceTitle => 'பராமரிப்பில் உள்ளது';

  @override
  String get underMaintenanceDesc =>
      'உங்களுக்கு சிறந்த சேவை வழங்க எங்கள் அமைப்புகளைப் புதுப்பிக்கிறோம். சிறிது நேரத்திற்குப் பிறகு சரிபார்க்கவும்.';

  @override
  String estimatedBackIn(Object time) {
    return 'எதிர்பார்க்கப்படும் நேரம் $time';
  }

  @override
  String get backOnlineSoon => 'நாங்கள் விரைவில் ஆன்லைனுக்கு திரும்புவோம்!';

  @override
  String installedVersion(String version) {
    return 'நிறுவப்பட்ட பதிப்பு: $version';
  }

  @override
  String get couldNotOpenStore => 'ஆப் ஸ்டோரைத் திறக்க முடியவில்லை';

  @override
  String get detailedFareBreakdown => 'விரிவான கட்டண விவரம்';

  @override
  String get checkPaymentStatus => 'பணம் செலுத்திய நிலையைச் சரிபார்';

  @override
  String get checkingStatus => 'நிலை சரிபார்க்கப்படுகிறது...';

  @override
  String get details => 'விவரங்கள்';

  @override
  String get hide => 'மறை';

  @override
  String get collectCashFromCustomer => 'வாடிக்கையாளரிடம் ரொக்கம் பெறவும்';

  @override
  String get customerOnlineFareDue => 'வாடிக்கையாளர் ஆன்லைன் கட்டண பாக்கி';

  @override
  String get reachuWalletCredit => 'Reachu வாலட் கிரெடிட்';

  @override
  String promoReimbursementNote(String amount) {
    return '*உங்கள் வாலட்டில் வரவு வைக்கப்பட்ட Reachu விளம்பரத் தொகை சேர்க்கப்பட்டுள்ளது';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*காத்திருப்பு நேரத்திற்கான காத்திருப்பு கட்டணம் சேர்க்கப்பட்டுள்ளது';
  }

  @override
  String get paymentReceivedSuccess => 'பணம் வெற்றிகரமாகப் பெறப்பட்டது!';

  @override
  String get paymentStillPending =>
      'பணம் செலுத்துதல் இன்னும் நிலுவையில் உள்ளது';

  @override
  String get waitingCharge => 'காத்திருப்பு கட்டணம்';

  @override
  String get rentalCharge => 'வாடகை கட்டணம்';

  @override
  String get grossFare => 'மொத்தக் கட்டணம்';

  @override
  String get pendingDue => 'நிலுவைத் தொகை';

  @override
  String get tollFee => 'சுங்கக் கட்டணம்';

  @override
  String get cancellationFee => 'ரத்து செய்தல் கட்டணம்';

  @override
  String get nightSurcharge => 'இரவு கூடுதல் கட்டணம்';

  @override
  String get surgeFee => 'சர்ஜ் கட்டணம்';

  @override
  String get taxAndFees => 'வரி மற்றும் கட்டணங்கள்';

  @override
  String get platformFee => 'தளக் கட்டணம்';

  @override
  String get pressBackAgainToExit =>
      'செயலியிலிருந்து வெளியேற மீண்டும் பின்செல்லவும்';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'வெளியேறும் முன் சவாரியை ஏற்கவும் அல்லது நிராகரிக்கவும்';

  @override
  String get cashPayment => 'ரொக்கப் பணம்';

  @override
  String get onlineQr => 'ஆன்லைன் கியூஆர்';

  @override
  String get collectCashInstructions =>
      'சவாரியை முடிப்பதற்கு முன் வாடிக்கையாளரிடம் ரொக்கப் பணத்தைப் பெறவும்.';

  @override
  String collectCashStep1(String amount) {
    return '1. வாடிக்கையாளரிடம் சரியான ரொக்கத் தொகையைப் பெறவும்';
  }

  @override
  String get collectCashStep2 =>
      '2. கீழே உள்ள \'ரொக்கம் பெறப்பட்டது என்பதை உறுதிசெய்\' பொத்தானைத் தட்டவும்';

  @override
  String get verifyingCashDeposit => 'ரொக்க வைப்பு சரிபார்க்கப்படுகிறது...';

  @override
  String get pleaseHoldClosingRide =>
      'சவாரியை முடிக்கும் வரை தயவுசெய்து காத்திருக்கவும்';

  @override
  String get customerOnlinePayment => 'வாடிக்கையாளர் ஆன்லைன் பணம் செலுத்துதல்';

  @override
  String get generatingQrCode => 'கியூஆர் கோடு உருவாக்கப்படுகிறது...';

  @override
  String get failedToLoadQrCode => 'கியூஆர் கோடை ஏற்றுவதில் தோல்வி';

  @override
  String get scanQrToPay =>
      'ஆன்லைனில் செலுத்த வாடிக்கையாளரை கியூஆர் கோடை ஸ்கேன் செய்யச் சொல்லுங்கள்';

  @override
  String get pinchToZoomQr => 'கியூஆர் கோடை பெரிதாக்க பிஞ்ச் செய்யவும்';

  @override
  String get tapToFullScreen =>
      'முழு திரைக் காட்சிக்கு கியூஆர் கோடைத் தட்டவும்';

  @override
  String get awaitingCustomerPayment =>
      'வாடிக்கையாளர் பணத்திற்காகக் காத்திருக்கிறது...';

  @override
  String get confirmCashReceived => 'ரொக்கம் பெறப்பட்டது என்பதை உறுதிசெய்';

  @override
  String get paymentReceivedToast =>
      'பணம் பெறப்பட்டது! சவாரி முடிக்கப்படுகிறது...';

  @override
  String get invalidOrderIdError => 'தவறான ஆர்டர் ஐடி';

  @override
  String get cashPaymentRecordedWaiting =>
      'ரொக்கப் பணம் பதிவானது. சவாரி முடிக்கப்படுகிறது...';

  @override
  String get paymentReceivedTitle => 'பணம் பெறப்பட்டது';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount தொகை வெற்றிகரமாகச் செலுத்தப்பட்டது!';
  }

  @override
  String get rideClosedReturningHome =>
      'சவாரி முடிந்தது. முகப்புப் பக்கத்திற்குத் திரும்புகிறது...';

  @override
  String get fragileGoods => 'எளிதில் உடையக்கூடிய பொருட்கள்';

  @override
  String get yes => 'ஆம்';

  @override
  String get no => 'இல்லை';

  @override
  String contactLabel(String name, Object phone) {
    return 'தொடர்பு: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'அனுமதிகள் தேவை';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver ஆஃப்லைன் மற்றும் ஆன்லைனில் துல்லியமாகச் செயல்பட பின்வரும் அனுமதிகள் தேவை.';

  @override
  String get locationAlwaysTitle => 'இருப்பிடம் (எப்போதும் அனுமதி)';

  @override
  String get locationAlwaysSubtitle =>
      'ஆர்டர் ஒதுக்கீடு மற்றும் பின்னணி சவாரி கண்காணிப்பிற்குத் தேவை.';

  @override
  String get batteryUnrestrictedTitle => 'பேட்டரி ஆப்டிமைசேஷன் (கட்டுப்பாடற்ற)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'பின்னணி சாக்கெட் இணைப்பு தொடர்வதை உறுதிசெய்கிறது.';

  @override
  String get notificationsTitle => 'அறிவிப்புகள்';

  @override
  String get notificationsSubtitle =>
      'புதிய சவாரி கோரிக்கைகள் மற்றும் எச்சரிக்கைகளுக்குத் தேவை.';

  @override
  String get displayOverAppsTitle => 'பிற செயலிகளுக்கு மேல் காட்டு';

  @override
  String get displayOverAppsSubtitle =>
      'முழு திரை ஆர்டர் அறிவிப்புகளுக்குத் தேவை.';

  @override
  String get locationUsedInBackground =>
      'பின்னணியில் பயன்படுத்தப்படும் இருப்பிடம்';

  @override
  String get backgroundLocationDisclosureBody =>
      'செயலி மூடப்பட்டிருந்தாலும் இருப்பிடத் தரவை ReachuDriver சேகரிக்கிறது.\n\nஇது பின்வருவனவற்றிற்குப் பயன்படுத்தப்படுகிறது:\n  • பயனர்களுடன் உங்கள் நேரலை நிலையைப் பகிர\n  • அருகிலுள்ள சவாரிகளை உங்களுக்கு ஒதுக்க\n  • நீங்கள் பணியில் இருக்கும்போது கணினியைப் புதுப்பிக்க\n\nநீங்கள் ஆன்லைனில் இருக்கும்போது மட்டுமே இருப்பிடம் சேகரிக்கப்படும்.';

  @override
  String get changeInAppSettingsNote =>
      'செயலி அமைப்புகளில் எப்போது வேண்டுமானாலும் இதை மாற்றலாம்.';

  @override
  String get iUnderstandContinue => 'புரிந்தது — தொடரவும்';

  @override
  String get notNow => 'இப்போது வேண்டாம்';

  @override
  String get lowWalletBalance => 'குறைந்த வாலட் இருப்பு';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ஆர்டர்களைப் பெற குறைந்தபட்சம் ₹$limit வாலட் இருப்பை வைத்திருக்கவும். ஆர்டர்களைத் தொடர்ந்து பெற உங்கள் வாலட்டை டாப் அப் செய்யவும்.';
  }

  @override
  String get minimumRequiredBalance => 'குறைந்தபட்ச தேவையான இருப்பு';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ஆர்டர்களைப் பெற உங்கள் வாலட்டில் குறைந்தபட்சம் ₹$limit இருக்க வேண்டும்.';
  }

  @override
  String get activeForRides => 'சவாரிகளுக்கு செயலில் உள்ளது';

  @override
  String get lowBalanceStatus => 'குறைந்த இருப்பு';

  @override
  String get minimumLimit => 'குறைந்தபட்ச வரம்பு';

  @override
  String get eShramBenefitsTitle => 'ஈ-ஷ்ரம் பலன்கள்';

  @override
  String get govtScheme => 'அரசு திட்டம்';

  @override
  String get eShramSubHeader => 'அரசு காப்பீடு & ஓய்வூதிய திட்டம்';

  @override
  String get eShramDescription =>
      'கிக் தொழிலாளர்களுக்கான விபத்து காப்பீடு மற்றும் சமூக பாதுகாப்பு பலன்களைப் பெற அதிகாரப்பூர்வ அரசு ஈ-ஷ்ரம் போர்ட்டலில் பதிவு செய்யவும்.';

  @override
  String get registerOnEShramPortal => 'ஈ-ஷ்ரம் போர்ட்டலில் பதிவு செய்யவும்';

  @override
  String get eShramGovtBenefitsMenu => 'ஈ-ஷ்ரம் அரசு பலன்கள்';

  @override
  String get dismiss => 'விலக்கு';

  @override
  String get trainingVideos => 'பயிற்சி வீடியோக்கள்';

  @override
  String get welcomeToReachU => 'வணக்கம், ReachU-க்கு வரவேற்கிறோம்!';

  @override
  String get welcomeTrainingSubtitle =>
      'உங்கள் பயணத்தைத் தொடங்குவோம்! ஆப் எவ்வாறு செயல்படுகிறது என்பதை அறிய இந்த விரைவான பயிற்சி வீடியோவைப் பார்க்கவும்.';

  @override
  String get trainingCompletedTitle => 'பயிற்சி முடிந்தது!';

  @override
  String get trainingCompletedSubtitle =>
      'சிறப்பு! தேவையான அனைத்து பயிற்சிகளையும் வெற்றிகரமாக முடித்துவிட்டீர்கள். இப்போது நீங்கள் ஓட்டத் தொடங்கலாம்.';

  @override
  String get startDriving => 'ஓட்டத் தொடங்குங்கள்';

  @override
  String get iHaveReadAndConsent =>
      'நான் படித்து இதன் மூலம் எனது ஒப்புதலை வழங்குகிறேன்: ';

  @override
  String get tdsDeclaration => 'TDS பிரகடனம்';
}
