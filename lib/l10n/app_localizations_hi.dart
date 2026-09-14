// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get account => 'खाता';

  @override
  String get editProfile => 'प्रोफ़ाइल संपादित करें';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get language => 'भाषा';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get english => 'English (अंग्रेज़ी)';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'वाहन चुनें';

  @override
  String get selectAVehicle => 'एक वाहन चुनें';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName के साथ आगे बढ़ें';
  }

  @override
  String get addStop => 'स्टॉप जोड़ें';

  @override
  String get editLocations => 'स्थान संपादित करें';

  @override
  String get noPickupLocationSet => 'कोई पिकअप स्थान सेट नहीं है';

  @override
  String get noDropLocationSet => 'कोई ड्रॉप स्थान सेट नहीं है';

  @override
  String get addDrop => 'ड्रॉप जोड़ें';

  @override
  String get errorLoadingVehicles => 'वाहन लोड करने में त्रुटि';

  @override
  String get selectGoodsType => 'माल का प्रकार चुनें';

  @override
  String get whatAreYouShipping => 'आप क्या भेज रहे हैं?';

  @override
  String get chooseCategoryBestMatches =>
      'वह श्रेणी चुनें जो आपके माल से सबसे मेल खाती हो';

  @override
  String get editGoodsDetails => 'माल का विवरण संपादित करें';

  @override
  String get weightKgMax90 => 'वजन (किग्रा) - अधिकतम 90 किग्रा';

  @override
  String get weightInvalidError => 'वजन 1 से 90 किग्रा के बीच होना चाहिए';

  @override
  String get numberOfPackages => 'पैकेजों की संख्या';

  @override
  String get worthValueRupees => 'मूल्य / कीमत (रुपये)';

  @override
  String get done => 'हो गया';

  @override
  String get confirmGoodsDetails => 'माल के विवरण की पुष्टि करें';

  @override
  String get failedToLoadCategories => 'श्रेणियां लोड करने में विफल';

  @override
  String get disclaimerTitle => 'अस्वीकरण';

  @override
  String get disclaimerText =>
      'अस्वीकरण: मैं घोषणा करता हूँ कि परिवहन किया जा रहा माल गैर-खतरनाक, कानूनी है और चुनी गई श्रेणी का है। प्रतिबंधित वस्तुओं के परिवहन के लिए कंपनी उत्तरदायी नहीं है। वजन वाहन की अधिकतम क्षमता से अधिक नहीं होना चाहिए।';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight किग्रा • $packages पैकेज • ₹$worth';
  }

  @override
  String get welcome => 'स्वागत है';

  @override
  String get enterMobileNumberToContinue =>
      'जारी रखने के लिए अपना मोबाइल नंबर दर्ज करें';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get agreeTermsText =>
      'मैं सेवा की शर्तों और गोपनीयता नीति से सहमत हूँ';

  @override
  String get sendOtp => 'ओटीपी भेजें';

  @override
  String get verifyOtp => 'ओटीपी सत्यापित करें';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber पर भेजे गए 4-अंकीय कोड को दर्ज करें';
  }

  @override
  String get verifyAndContinue => 'सत्यापित करें और जारी रखें';

  @override
  String resendInSeconds(Object count) {
    return '$count सेकंड में पुनः भेजें';
  }

  @override
  String get resendOtp => 'ओटीपी पुनः भेजें';

  @override
  String get changeNumber => 'नंबर बदलें';

  @override
  String get mobileNumberRequired => 'मोबाइल नंबर आवश्यक है';

  @override
  String get enterValidMobileNumber => 'एक वैध 10-अंकीय मोबाइल नंबर दर्ज करें';

  @override
  String get enterCompleteOtpError => 'कृपया पूरा 4-अंकीय ओटीपी दर्ज करें';

  @override
  String get otpResentSuccess => 'ओटीपी सफलतापूर्वक पुनः भेजा गया';

  @override
  String get fullName => 'पूरा नाम';

  @override
  String get fullNameRequired => 'पूरा नाम आवश्यक है';

  @override
  String get nameMinLengthError => 'नाम कम से कम 2 अक्षरों का होना चाहिए';

  @override
  String get email => 'ईमेल';

  @override
  String get emailRequired => 'ईमेल आवश्यक है';

  @override
  String get enterValidEmail => 'एक वैध ईमेल पता दर्ज करें';

  @override
  String get referralCode => 'रेफरल कोड';

  @override
  String get enterReferralCodeOptional => 'रेफरल कोड दर्ज करें (वैकल्पिक)';

  @override
  String get createAccount => 'खाता बनाएं';

  @override
  String get completeProfileToGetStarted =>
      'शुरू करने के लिए अपनी प्रोफ़ाइल पूरी करें';

  @override
  String get profileUpdatedSuccess => 'प्रोफ़ाइल सफलतापूर्वक अपडेट हो गई!';

  @override
  String get updateProfilePicture => 'प्रोफ़ाइल पिक्चर अपडेट करें';

  @override
  String get camera => 'कैमरा';

  @override
  String get gallery => 'गैलरी';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get dateOfBirthOptional => 'जन्म तिथि (वैकल्पिक)';

  @override
  String get gender => 'लिंग';

  @override
  String get male => 'पुरुष';

  @override
  String get female => 'महिला';

  @override
  String get other => 'अन्य';

  @override
  String get updateProfile => 'प्रोफ़ाइल अपडेट करें';

  @override
  String profileUpdateFailed(Object error) {
    return 'प्रोफ़ाइल अपडेट करने में विफल: $error';
  }

  @override
  String get goodMorning => 'शुभ प्रभात,';

  @override
  String get goodAfternoon => 'शुभ दोपहर,';

  @override
  String get goodEvening => 'शुभ संध्या,';

  @override
  String get pickupFrom => 'यहाँ से पिकअप';

  @override
  String get currentLocation => 'वर्तमान स्थान';

  @override
  String get fetchingLocation => 'स्थान प्राप्त किया जा रहा है...';

  @override
  String get locationServicesDisabled => 'स्थान सेवा अक्षम है';

  @override
  String get locationPermissionNeeded => 'स्थान अनुमति की आवश्यकता है';

  @override
  String get locationAccessBlocked => 'स्थान पहुंच अवरुद्ध है';

  @override
  String get couldNotFetchLocation => 'स्थान प्राप्त नहीं किया जा सका';

  @override
  String get enable => 'सक्षम करें';

  @override
  String get allow => 'अनुमति दें';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get turnOnLocationServices => 'स्थान सेवाएं चालू करें';

  @override
  String get allowLocationAccess => 'स्थान पहुंच की अनुमति दें';

  @override
  String get gpsRequiredDescription =>
      'हमें आपके पिकअप स्थान को सटीक रूप से इंगित करने और आस-पास के ड्राइवरों को जल्दी खोजने के लिए आपके डिवाइस जीपीएस की आवश्यकता है।';

  @override
  String get permissionRequiredDescription =>
      'कृपया अपने ऐप सेटिंग्स में स्थान अनुमतियों की अनुमति दें ताकि हम आपके पिकअप स्थान को सटीक रूप से इंगित कर सकें और आस-पास के ड्राइवरों को जल्दी खोज सकें।';

  @override
  String get goToLocationSettings => 'स्थान सेटिंग्स पर जाएं';

  @override
  String get goToAppSettings => 'ऐप सेटिंग्स पर जाएं';

  @override
  String get enterAddressManually => 'मैं अपना पता मैन्युअल रूप से दर्ज करूँगा';

  @override
  String get taglineTitle => 'कुछ भी ले जाएं,\nकभी भी।';

  @override
  String get taglineSubtitle =>
      'तेज़ डिलीवरी आपकी उंगलियों पर। स्मार्ट तरीके से शिफ्ट करें, हमारे प्रीमियम बेड़े के साथ तेज़ी से आगे बढ़ें।';

  @override
  String get twoWheelers => 'दो पहिया';

  @override
  String get trucks => 'ट्रक';

  @override
  String get specialOffer => 'विशेष ऑफर';

  @override
  String get promoBannerText => 'अपनी पहली सवारी पर\n20% की छूट पाएं';

  @override
  String get whereIsYourPickup => 'आपका पिकअप कहाँ है?';

  @override
  String get whereIsYourDrop => 'आपका ड्रॉप कहाँ है?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'आपका ड्रॉप $index कहाँ है?';
  }

  @override
  String get typeMinCharsToSearch =>
      'खोजना शुरू करने के लिए कम से कम 4 अक्षर टाइप करें';

  @override
  String get selectOnMap => 'मानचित्र पर चुनें';

  @override
  String get pinpointExactLocation => 'अपने सटीक स्थान को इंगित करें';

  @override
  String get couldNotFindAddress => 'क्षमा करें, हमें यह पता नहीं मिला।';

  @override
  String get trySearchingNearbyLandmark =>
      'किसी आस-पास के लैंडमार्क, इलाके या लोकप्रिय स्थान का उपयोग करके खोजने का प्रयास करें।';

  @override
  String get anErrorOccurred => 'एक त्रुटि हुई';

  @override
  String get locating => 'स्थान ढूंढा जा रहा है...';

  @override
  String get fetchingDetails => 'विवरण प्राप्त किया जा रहा है...';

  @override
  String get confirmPickupLocation => 'पिकअप स्थान की पुष्टि करें';

  @override
  String get confirmDropLocation => 'ड्रॉप स्थान की पुष्टि करें';

  @override
  String get houseShopApartment => 'मकान / दुकान / अपार्टमेंट';

  @override
  String get sendersName => 'भेजने वाले का नाम';

  @override
  String get receiversName => 'प्राप्त करने वाले का नाम';

  @override
  String get pleaseEnterName => 'कृपया नाम दर्ज करें';

  @override
  String get sendersMobileNumber => 'भेजने वाले का मोबाइल नंबर';

  @override
  String get receiversMobileNumber => 'प्राप्त करने वाले का मोबाइल नंबर';

  @override
  String get enterValidTenDigitNumber => 'एक वैध 10-अंकीय नंबर दर्ज करें';

  @override
  String get useMyMobileNumber => 'मेरे मोबाइल नंबर का उपयोग करें';

  @override
  String get saveAsOptional => 'इस रूप में सहेजें (वैकल्पिक):';

  @override
  String get home => 'घर';

  @override
  String get shop => 'दुकान';

  @override
  String get confirmAndProceed => 'पुष्टि करें और आगे बढ़ें';

  @override
  String get selectDropLocation => 'ड्रॉप स्थान चुनें';

  @override
  String get cannotSwapEmptyLocations =>
      'खाली स्थानों को भरे हुए स्थानों के साथ बदला नहीं जा सकता।';

  @override
  String get proceedToVehicleSelection => 'वाहन चयन पर आगे बढ़ें';

  @override
  String get permissionRequired => 'अनुमति आवश्यक है';

  @override
  String get contactsPermissionDescription =>
      'गति लोडर को आपके संपर्कों तक पहुंच की आवश्यकता है ताकि आप आसानी से भेजने वाले का फोन नंबर चुन सकें। कृपया इसे ऐप सेटिंग्स में सक्षम करें।';

  @override
  String get openSettings => 'सेटिंग्स खोलें';

  @override
  String get selectContact => 'संपर्क चुनें';

  @override
  String get contactPermissionDenied => 'संपर्क अनुमति अस्वीकार कर दी गई।';

  @override
  String get myProfile => 'मेरी प्रोफ़ाइल';

  @override
  String selfFormat(String name) {
    return '$name (स्वयं)';
  }

  @override
  String get deviceContacts => 'डिवाइस संपर्क';

  @override
  String get rideHistory => 'राइड का इतिहास';

  @override
  String get transactions => 'लेन-देन';

  @override
  String get noTransactionsFound => 'कोई लेन-देन नहीं मिला';

  @override
  String get failedToLoadTransactions => 'लेन-देन लोड करने में विफल';

  @override
  String get addMoney => 'पैसे जोड़ें';

  @override
  String get enterAmountToAdd => 'जोड़ने के लिए राशि दर्ज करें';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'रेज़रपे खोलने में विफल: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'भुगतान ऑर्डर बनाने में विफल: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'गति क्रेडिट में ₹$amount सफलतापूर्वक जोड़े गए!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'भुगतान सत्यापन विफल: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'भुगतान विफल ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'बाहरी वॉलेट चुना गया: $walletName';
  }

  @override
  String get walletTopUp => 'वॉलेट टॉप-अप';

  @override
  String get payments => 'भुगतान';

  @override
  String get reachuCredits => 'गति क्रेडिट';

  @override
  String get balance => 'शेष राशि';

  @override
  String get errorLoadingBalance => 'शेष राशि लोड करने में त्रुटि';

  @override
  String get availableBalance => 'उपलब्ध शेष राशि';

  @override
  String get totalExpenses => 'कुल खर्च';

  @override
  String get recentTransactions => 'हाल के लेन-देन';

  @override
  String get viewMore => 'और देखें';

  @override
  String get noTransactionsYet => 'अभी तक कोई लेन-देन नहीं';

  @override
  String get booking => 'बुकिंग';

  @override
  String get earning => 'कमाई';

  @override
  String get support => 'सहायता';

  @override
  String get profile => 'प्रोफ़ाइल';

  @override
  String get pendingWithdrawals => 'लंबित निकासी';

  @override
  String get driverDebt => 'ड्राइवर ऋण';

  @override
  String minBalanceRequired(Object amount) {
    return 'न्यूनतम शेष राशि की आवश्यकता: ₹$amount';
  }

  @override
  String get insufficientBalance => 'निकासी के लिए अपर्याप्त शेष राशि';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'चेतावनी: आपका उपलब्ध शेष नए राइड स्वीकार करने के लिए आवश्यक न्यूनतम सीमा (₹$amount) से कम है। कृपया अपने वॉलेट को टॉप अप करें।';
  }

  @override
  String get moneyTransfer => 'पैसे ट्रांसफर करें';

  @override
  String get withdrawMoney => 'पैसे निकालें';

  @override
  String get manageAccounts => 'खाते प्रबंधित करें';

  @override
  String get bankAccounts => 'बैंक खाते और यूपीआई';

  @override
  String get addAccount => 'भुगतान विधि जोड़ें';

  @override
  String get addBankAccount => 'बैंक खाता जोड़ें';

  @override
  String get addUpiId => 'यूपीआई आईडी जोड़ें';

  @override
  String get editBankAccount => 'बैंक खाता संपादित करें';

  @override
  String get editUpiId => 'यूपीआई आईडी संपादित करें';

  @override
  String get deleteAccount => 'खाता हटाएं';

  @override
  String get deleteAccountConfirm =>
      'क्या आप वाकई इस भुगतान विधि को हटाना चाहते हैं?';

  @override
  String get accountHolderName => 'खाता धारक का नाम';

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
  String get bankName => 'बैंक का नाम';

  @override
  String get accountNumber => 'खाता संख्या';

  @override
  String get confirmAccountNumber => 'खाता संख्या की पुष्टि करें';

  @override
  String get ifscCode => 'आईएफएससी कोड';

  @override
  String get upiId => 'यूपीआई आईडी';

  @override
  String get fieldRequired => 'यह फ़ील्ड आवश्यक है';

  @override
  String get invalidUpi => 'एक वैध यूपीआई आईडी दर्ज करें (जैसे name@upi)';

  @override
  String get invalidIfsc => 'एक वैध 11-अंकीय आईएफएससी कोड दर्ज करें';

  @override
  String get invalidAccountNumber => 'एक वैध खाता संख्या दर्ज करें';

  @override
  String get accountNumbersDoNotMatch => 'खाता संख्या मेल नहीं खाती';

  @override
  String get noPaymentMethods => 'अभी तक कोई भुगतान विधि नहीं जोड़ी गई है';

  @override
  String get addPaymentMethodSubtitle =>
      'अपनी कमाई वापस लेने के लिए एक बैंक खाता या यूपीआई आईडी जोड़ें';

  @override
  String get confirmTransfer => 'स्थानांतरण की पुष्टि करें';

  @override
  String get transferAmount => 'स्थानांतरण राशि';

  @override
  String get transferSuccess => 'निकासी अनुरोध सफलतापूर्वक बनाया गया';

  @override
  String get collectPayment => 'भुगतान एकत्र करें';

  @override
  String get collectCash => 'नकद एकत्र करें';

  @override
  String get cashCollectedSuccess => 'नकद भुगतान सफलतापूर्वक पूरा हुआ!';

  @override
  String get displayQrCode => 'यूपीआई क्यूआर कोड दिखाएं';

  @override
  String get customerScanQr =>
      'ग्राहक को भुगतान करने के लिए इस क्यूआर कोड को स्कैन करने के लिए कहें';

  @override
  String get generatingQr => 'क्यूआर कोड बनाया जा रहा है...';

  @override
  String get selectPaymentMethod => 'भुगतान विधि चुनें';

  @override
  String get beneficiary => 'लाभार्थी';

  @override
  String get completed => 'पूरा हुआ';

  @override
  String get pending => 'लंबित';

  @override
  String get failed => 'विफल';

  @override
  String get failedToLoadAccounts => 'भुगतान विधियां लोड करने में विफल';

  @override
  String get accountDeletedSuccess => 'भुगतान विधि सफलतापूर्वक हटा दी गई';

  @override
  String get accountUpdatedSuccess => 'भुगतान विधि सफलतापूर्वक अपडेट की गई';

  @override
  String get accountAddedSuccess => 'भुगतान विधि सफलतापूर्वक जोड़ दी गई';

  @override
  String get withdrawalAmount => 'निकासी राशि';

  @override
  String get transferDestination => 'स्थानांतरण गंतव्य';

  @override
  String get enterAmount => 'राशि दर्ज करें';

  @override
  String get selected => 'चुना गया';

  @override
  String get accountNumberLabel => 'खाता संख्या';

  @override
  String get errorLoadingAccounts => 'भुगतान विधियां लोड करने में त्रुटि';

  @override
  String get errorLoadingWallet => 'वॉलेट जानकारी लोड करने में त्रुटि';

  @override
  String get enterAccountHolderName => 'खाता धारक का नाम दर्ज करें';

  @override
  String get bankNameHint => 'जैसे भारतीय स्टेट बैंक';

  @override
  String get enterAccountNumber => 'खाता संख्या दर्ज करें';

  @override
  String get confirmAccountNumberHint => 'खाता संख्या की पुष्टि करें';

  @override
  String get ifscCodeHint => 'जैसे SBIN0001234';

  @override
  String get upiIdHint => 'जैसे user@upi';

  @override
  String get upi => 'यूपीआई';

  @override
  String get totalFare => 'कुल किराया';

  @override
  String get hideQrCode => 'क्यूआर छुपाएं';

  @override
  String get nameMinLengthRequired => 'नाम कम से कम 2 अक्षरों का होना चाहिए';

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
    return 'ऑर्डर #$orderId';
  }

  @override
  String get personalInformation => 'व्यक्तिगत जानकारी';

  @override
  String get online => 'ऑनलाइन';

  @override
  String get offline => 'ऑफ़लाइन';

  @override
  String get onlineSuccessMessage => 'अब आप ऑनलाइन और ड्यूटी पर हैं।';

  @override
  String get offlineSuccessMessage => 'अब आप ऑफ़लाइन हैं।';

  @override
  String get partnerSupport => 'पार्टनर सहायता';

  @override
  String get partnerSupportSubtitle =>
      'नमस्कार पार्टनर! क्या आपको अपनी सवारी, भुगतान या खाते में सहायता चाहिए? हम यहां आपकी 24/7 सहायता के लिए हैं।';

  @override
  String get faqsAndHelp => 'पूछे जाने वाले प्रश्न और सहायता';

  @override
  String get findQuickAnswers => 'त्वरित उत्तर खोजें';

  @override
  String get raiseSupportTicket => 'टिकट दर्ज करें';

  @override
  String get contactSupportAgent => 'सहायता एजेंट से संपर्क करें';

  @override
  String get recentTickets => 'हाल के टिकट';

  @override
  String get noActiveTickets => 'कोई सक्रिय सहायता टिकट नहीं है';

  @override
  String get submitTicketDescription =>
      'यदि आपको कोई समस्या आती है तो टिकट सबमिट करें।';

  @override
  String get failedToLoadTickets => 'हाल के टिकट लोड करने में विफल';

  @override
  String get contactSupport => 'सहायता से संपर्क करें';

  @override
  String get callUs => 'हमें कॉल करें';

  @override
  String get whatsApp => 'व्हाट्सएप';

  @override
  String get chatWithUs => 'हमारे साथ चैट करें';

  @override
  String get emailSupport => 'ईमेल सहायता';

  @override
  String get ticketStatusOpen => 'खुला है';

  @override
  String get ticketStatusInProgress => 'प्रगति पर है';

  @override
  String get ticketStatusResolved => 'हल हो गया है';

  @override
  String get ticketStatusClosed => 'बंद है';

  @override
  String get ticketCategoryRideIssue => 'सवारी की समस्या';

  @override
  String get ticketCategoryPayment => 'भुगतान';

  @override
  String get ticketCategoryAccount => 'खाता';

  @override
  String get ticketCategoryDriverIssue => 'ड्राइवर की समस्या';

  @override
  String get ticketCategoryOther => 'अन्य';

  @override
  String get failedToLoadDashboard => 'डैशबोर्ड लोड करने में विफल';

  @override
  String get todaysEarnings => 'आज की कमाई';

  @override
  String get cashCollected => 'नकद एकत्र किया गया';

  @override
  String get onlinePayment => 'ऑनलाइन भुगतान';

  @override
  String get todaysRideStatus => 'आज की सवारी की स्थिति';

  @override
  String get totalRides => 'कुल सवारी';

  @override
  String get cancelled => 'रद्द की गई';

  @override
  String get dutyRating => 'ड्यूटी रेटिंग';

  @override
  String get noRidesFound => 'कोई राइड नहीं मिली';

  @override
  String get failedToLoadHistory => 'इतिहास लोड करने में विफल';

  @override
  String get all => 'सभी';

  @override
  String get paymentPending => 'भुगतान लंबित';

  @override
  String stopsCount(int count) {
    return '$count स्टॉप';
  }

  @override
  String get rideDetails => 'राइड का विवरण';

  @override
  String get pickupLocation => 'पिकअप स्थान';

  @override
  String get dropLocation => 'ड्रॉप स्थान';

  @override
  String stopLocation(int number) {
    return 'स्टॉप $number';
  }

  @override
  String get fareBreakdown => 'किराया विवरण';

  @override
  String get netPayable => 'कुल देय राशि';

  @override
  String get paymentMethod => 'भुगतान का तरीका';

  @override
  String get cash => 'नकद';

  @override
  String get customerDetails => 'ग्राहक का विवरण';

  @override
  String get callCustomer => 'ग्राहक को कॉल करें';

  @override
  String get goodsType => 'सामान का प्रकार';

  @override
  String get quantity => 'मात्रा';

  @override
  String get weight => 'वजन';

  @override
  String get distance => 'दूरी';

  @override
  String get duration => 'समय';

  @override
  String get cancellationReason => 'रद्द करने का कारण';

  @override
  String get routeTimeline => 'मार्ग समयरेखा';

  @override
  String get goodsSpecifications => 'सामान का विवरण';

  @override
  String get vehicleMetadata => 'वाहन का विवरण';

  @override
  String get description => 'विवरण';

  @override
  String get estimatedWeight => 'अनुमानित वजन';

  @override
  String get vehicleName => 'वाहन का नाम';

  @override
  String get vehicleNumber => 'वाहन नंबर';

  @override
  String get modelColor => 'मॉडल / रंग';

  @override
  String get baseFare => 'मूल किराया';

  @override
  String get weatherSurcharge => 'मौसम अधिभार';

  @override
  String get trafficSurcharge => 'ट्रैफिक अधिभार';

  @override
  String get promoDiscount => 'प्रोमो छूट';

  @override
  String get pickupSender => 'पिकअप (प्रेषक)';

  @override
  String get dropoffRecipient => 'ड्रॉपऑफ (प्राप्तकर्ता)';

  @override
  String rideIdLabel(String id) {
    return 'राइड आईडी: $id';
  }

  @override
  String get todaysTotalEarnings => 'आज की कुल कमाई';

  @override
  String get failedToLoadEarnings => 'कमाई के आंकड़े लोड करने में विफल';

  @override
  String get noTransactionsRecorded => 'कोई लेनदेन दर्ज नहीं किया गया';

  @override
  String get mySupportTickets => 'मेरे सपोर्ट टिकट';

  @override
  String get newTicket => 'नया टिकट';

  @override
  String get noSupportTicketsRaised => 'कोई सपोर्ट टिकट दर्ज नहीं है';

  @override
  String get tapNewTicketSubtitle =>
      'सहायता प्राप्त करने के लिए \'नया टिकट\' पर टैप करें।';

  @override
  String get submitATicket => 'टिकट दर्ज करें';

  @override
  String get explainIssueDetail =>
      'अपनी समस्या का विस्तार से वर्णन करें। सहायता एजेंट जल्द ही इसकी पुष्टि कर जवाब देगा।';

  @override
  String get categoryRequired => 'श्रेणी*';

  @override
  String get selectIssueCategory => 'समस्या श्रेणी चुनें';

  @override
  String get pleaseSelectCategoryError => 'कृपया एक समस्या श्रेणी चुनें';

  @override
  String get subjectRequired => 'विषय*';

  @override
  String get briefSummaryHint => 'समस्या का संक्षिप्त विवरण';

  @override
  String get subjectRequiredError => 'विषय अनिवार्य है';

  @override
  String get subjectMinLengthError => 'विषय कम से कम 5 अक्षरों का होना चाहिए';

  @override
  String get descriptionRequired => 'विवरण / संदेश*';

  @override
  String get describeProblemHint => 'अपनी समस्या का विस्तार से वर्णन करें...';

  @override
  String get messageRequiredError => 'संदेश विवरण अनिवार्य है';

  @override
  String get messageMinLengthError => 'संदेश कम से कम 10 अक्षरों का होना चाहिए';

  @override
  String get submitTicket => 'टिकट जमा करें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get termsAndConditions => 'नियम और शर्तें';

  @override
  String get termsOfService => 'सेवा की शर्तें';

  @override
  String get iAgreeTo => 'मैं ';

  @override
  String get and => ' और ';

  @override
  String get agreeSuffix => ' से सहमत हूँ';

  @override
  String get darkTheme => 'डार्क थीम';

  @override
  String get failedToLoadDetails => 'विवरण लोड करने में विफल';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>गोपनीयता नीति</h1><p>रीचयू ड्राइवर ऐप में आपका स्वागत है। आपकी गोपनीयता हमारे लिए महत्वपूर्ण है। यह गोपनीयता नीति बताती है कि हम आपकी व्यक्तिगत जानकारी कैसे एकत्र, उपयोग और सुरक्षित करते हैं।</p><h2>1. हम जो जानकारी एकत्र करते हैं</h2><p>हम आपका नाम, फोन नंबर, ईमेल, वाहन का विवरण, सक्रिय ट्रिप के दौरान लोकेशन डेटा और लेनदेन का विवरण एकत्र करते हैं।</p><h2>2. हम आपकी जानकारी का उपयोग कैसे करते हैं</h2><p>हम आपकी जानकारी का उपयोग डिलीवरी राइड को सुगम बनाने, भुगतान संसाधित करने, सुरक्षा सुनिश्चित करने और ड्राइवर अनुभव को बेहतर बनाने के लिए करते हैं।</p><h2>3. लोकेशन ट्रैकिंग</h2><p>ऑन-ड्यूटी के दौरान बैकग्राउंड लोकेशन एक्सेस आवश्यक है ताकि आपको नजदीकी डिलीवरी अनुरोधों से जोड़ा जा सके और ग्राहक ट्रिप की प्रगति देख सकें।</p><h2>4. डेटा सुरक्षा</h2><p>हम आपकी व्यक्तिगत जानकारी को अनधिकृत पहुंच से सुरक्षित रखने के लिए सख्त सुरक्षा उपाय लागू करते हैं।</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>नियम और शर्तें</h1><p>कृपया रीचयू ड्राइवर एप्लिकेशन का उपयोग करने से पहले इन नियमों और शर्तों को ध्यान से पढ़ें।</p><h2>1. शर्तों की स्वीकृति</h2><p>रीचयू पर एक ड्राइवर पार्टनर के रूप में पंजीकरण करके, आप सभी लागू शर्तों, नीतियों और स्थानीय परिवहन नियमों का पालन करने के लिए सहमत होते हैं।</p><h2>2. ड्राइवर की जिम्मेदारियां</h2><p>ड्राइवर के पास वैध ड्राइविंग लाइसेंस, सटीक वाहन दस्तावेज और सुरक्षित, समय पर डिलीवरी सेवा प्रदान करने का दायित्व होना चाहिए।</p><h2>3. भुगतान और कमाई</h2><p>किराया प्लेटफॉर्म दरों के अनुसार तय किया जाता है और लागू शुल्कों के बाद आपके सत्यापित बैंक खाते में स्थानांतरित किया जाता है।</p><h2>4. खाता निलंबन</h2><p>रीचयू धोखाधड़ी गतिविधियों, सुरक्षा उल्लंघनों या नीति का पालन न करने की स्थिति में खाते को निलंबित करने का अधिकार सुरक्षित रखता है।</p>';

  @override
  String get reviewAndRating => 'समीक्षा और रेटिंग';

  @override
  String get noRatingsYet => 'अभी तक कोई रेटिंग नहीं';

  @override
  String ratedByCustomers(int count) {
    return '$count ग्राहकों द्वारा रेटिंग दी गई';
  }

  @override
  String get noReviewsYet => 'अभी तक कोई समीक्षा नहीं';

  @override
  String get noReviewsDesc => 'आपको अभी तक कोई समीक्षा प्राप्त नहीं हुई है।';

  @override
  String get noCommentProvided => 'कोई टिप्पणी नहीं दी गई';

  @override
  String get ratingExcellent => 'उत्कृष्ट';

  @override
  String get ratingGood => 'अच्छा';

  @override
  String get ratingAverage => 'औसत';

  @override
  String get ratingBelowAverage => 'औसत से कम';

  @override
  String get ratingPoor => 'खराब';

  @override
  String get customer => 'ग्राहक';

  @override
  String get noInternetConnection => 'कोई इंटरनेट कनेक्शन नहीं';

  @override
  String get checkInternetConnection =>
      'कृपया अपना मोबाइल डेटा या वाई-फाई कनेक्शन जांचें।';

  @override
  String get internetRestored => 'इंटरनेट कनेक्शन बहाल हो गया';

  @override
  String get retryConnection => 'पुनः प्रयास करें';

  @override
  String get connectionTimedOut =>
      'कनेक्शन समय समाप्त हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get newUpdateAvailable => 'नया अपडेट उपलब्ध है!';

  @override
  String get updateRequiredTitle => 'अपडेट आवश्यक है';

  @override
  String updateRequiredDesc(String version) {
    return 'रीचयू का एक नया, तेज़ और अधिक सुरक्षित संस्करण उपलब्ध है। एप्लिकेशन का उपयोग जारी रखने के लिए कृपया संस्करण $version में अपडेट करें।';
  }

  @override
  String get updateNow => 'अभी अपडेट करें';

  @override
  String get updateLater => 'बाद में';

  @override
  String get underMaintenanceTitle => 'रखरखाव जारी है';

  @override
  String get underMaintenanceDesc =>
      'हम वर्तमान में अपने सिस्टम को अपग्रेड करने के लिए रखरखाव कर रहे हैं। हम जल्द ही वापस ऑनलाइन होंगे।';

  @override
  String estimatedBackIn(Object time) {
    return 'वापसी का अनुमानित समय';
  }

  @override
  String get backOnlineSoon => 'हम जल्द ही वापस ऑनलाइन होंगे';

  @override
  String installedVersion(String version) {
    return 'स्थापित संस्करण: $version';
  }

  @override
  String get couldNotOpenStore =>
      'प्ले स्टोर खोलने में असमर्थ। कृपया मैन्युअल रूप से अपडेट करें।';

  @override
  String get detailedFareBreakdown => 'विस्तृत किराया विवरण';

  @override
  String get checkPaymentStatus => 'भुगतान स्थिति जांचें';

  @override
  String get checkingStatus => 'जांच हो रही है...';

  @override
  String get details => 'विवरण';

  @override
  String get hide => 'छिपाएं';

  @override
  String get collectCashFromCustomer => 'ग्राहक से नकद प्राप्त करें';

  @override
  String get customerOnlineFareDue => 'ग्राहक का ऑनलाइन किराया देय';

  @override
  String get reachuWalletCredit => 'रीचयू क्रेडिट (आपके वॉलेट में)';

  @override
  String promoReimbursementNote(String amount) {
    return '$amount प्रोमो छूट कंपनी द्वारा आपके रीचयू वॉलेट में क्रेडिट की जाएगी।';
  }

  @override
  String waitingChargeNote(String amount) {
    return 'ग्राहक की देरी के लिए $amount वेटिंग शुल्क शामिल है।';
  }

  @override
  String get paymentReceivedSuccess => 'भुगतान सफलतापूर्वक प्राप्त हुआ!';

  @override
  String get paymentStillPending => 'यात्री का भुगतान अभी भी लंबित है।';

  @override
  String get waitingCharge => 'वेटिंग शुल्क';

  @override
  String get rentalCharge => 'रेंटल शुल्क';

  @override
  String get grossFare => 'कुल किराया';

  @override
  String get pendingDue => 'बकाया राशि';

  @override
  String get tollFee => 'टोल शुल्क';

  @override
  String get cancellationFee => 'रद्दीकरण शुल्क';

  @override
  String get nightSurcharge => 'नाइट अधिभार';

  @override
  String get surgeFee => 'सर्ज शुल्क';

  @override
  String get taxAndFees => 'कर एवं शुल्क';

  @override
  String get platformFee => 'प्लेटफ़ॉर्म शुल्क';

  @override
  String get pressBackAgainToExit =>
      'ऐप से बाहर निकलने के लिए फिर से बैक दबाएं';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'कृपया आने वाले राइड अनुरोध को स्वीकार या अस्वीकार करें।';

  @override
  String get cashPayment => 'नकद भुगतान';

  @override
  String get onlineQr => 'ऑनलाइन क्यूआर';

  @override
  String get collectCashInstructions => 'नकद प्राप्त करने के निर्देश';

  @override
  String collectCashStep1(String amount) {
    return '1. ग्राहक से सीधे $amount की नकद राशि गिनकर प्राप्त करें।';
  }

  @override
  String get collectCashStep2 =>
      '2. हाथ में पूरी नकद राशि सत्यापित करने के बाद ही नीचे पुष्टि बटन दबाएं।';

  @override
  String get verifyingCashDeposit =>
      'सर्वर के साथ नकद जमा सत्यापित किया जा रहा है...';

  @override
  String get pleaseHoldClosingRide =>
      'कृपया प्रतीक्षा करें, प्रक्रिया पूरी होने पर राइड अपने आप बंद हो जाएगी।';

  @override
  String get customerOnlinePayment => 'ग्राहक ऑनलाइन भुगतान';

  @override
  String get generatingQrCode => 'क्यूआर कोड जेनरेट हो रहा है...';

  @override
  String get failedToLoadQrCode => 'क्यूआर कोड लोड करने में विफल';

  @override
  String get scanQrToPay => 'भुगतान के लिए क्यूआर स्कैन करें';

  @override
  String get pinchToZoomQr => 'यदि आवश्यक हो तो क्यूआर कोड ज़ूम करें';

  @override
  String get tapToFullScreen => 'फुल स्क्रीन के लिए टैप करें';

  @override
  String get awaitingCustomerPayment => 'ग्राहक के भुगतान की प्रतीक्षा है...';

  @override
  String get confirmCashReceived => 'नकद प्राप्ति की पुष्टि करें';

  @override
  String get paymentReceivedToast =>
      'भुगतान प्राप्त हुआ! राइड सफलतापूर्वक पूरी हुई।';

  @override
  String get invalidOrderIdError =>
      'अमान्य ऑर्डर आईडी। भुगतान दर्ज नहीं किया जा सकता।';

  @override
  String get cashPaymentRecordedWaiting =>
      'नकद भुगतान दर्ज किया गया। पुष्टि की प्रतीक्षा है...';

  @override
  String get paymentReceivedTitle => 'भुगतान प्राप्त हुआ!';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount का भुगतान सफलतापूर्वक हुआ';
  }

  @override
  String get rideClosedReturningHome =>
      'राइड बंद हो गई। होम स्क्रीन पर लौट रहे हैं...';

  @override
  String get fragileGoods => 'नाजुक सामान (Fragile)';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

  @override
  String contactLabel(String name, Object phone) {
    return 'संपर्क: $name';
  }

  @override
  String get permissionsRequired => 'अनुमतियाँ आवश्यक हैं';

  @override
  String get enableAllPermissionsSubtitle =>
      'ऑनलाइन जाने और बुकिंग प्राप्त करने के लिए कृपया सभी अनुमतियां सक्षम करें।';

  @override
  String get locationAlwaysTitle => 'लोकेशन (हमेशा / Always)';

  @override
  String get locationAlwaysSubtitle => 'निरंतर ट्रैकिंग के लिए आवश्यक है';

  @override
  String get batteryUnrestrictedTitle => 'बैटरी अप्रतिबंधित (Unrestricted)';

  @override
  String get batteryUnrestrictedSubtitle =>
      '\"Unrestricted\" सेट करें और \"पृष्ठभूमि गतिविधि की अनुमति दें\" को सक्षम करें';

  @override
  String get notificationsTitle => 'सूचनाएं (Notifications)';

  @override
  String get notificationsSubtitle => 'बुकिंग अलर्ट के लिए आवश्यक';

  @override
  String get displayOverAppsTitle => 'अन्य ऐप्स के ऊपर प्रदर्शित करें';

  @override
  String get displayOverAppsSubtitle => 'फ़्लोटिंग विजेट अलर्ट के लिए आवश्यक';

  @override
  String get locationUsedInBackground =>
      'पृष्ठभूमि में उपयोग की जाने वाली लोकेशन';

  @override
  String get backgroundLocationDisclosureBody =>
      'ReachuDriver आपके लोकेशन डेटा को तब भी एकत्र करता है जब ऐप बंद हो या उपयोग में न हो।\n\nइसका उपयोग निम्न के लिए किया जाता है:\n  • लोडर्स/उपयोगकर्ताओं के साथ अपनी वास्तविक समय स्थिति साझा करें\n  • आपको निकटतम बुकिंग अनुरोध असाइन करें\n  • जब आप ड्यूटी पर हों तो डिस्पैच सिस्टम को अपडेट रखें\n\nलोकेशन संग्रह केवल तब चलता है जब आप ऑनलाइन (ड्यूटी पर) होते हैं और जब आप ऑफ़लाइन जाते हैं तो तुरंत बंद हो जाता है।';

  @override
  String get changeInAppSettingsNote =>
      'आप ऐप सेटिंग्स में किसी भी समय इसे बदल सकते हैं।';

  @override
  String get iUnderstandContinue => 'मुझे समझ आ गया — जारी रखें';

  @override
  String get notNow => 'अभी नहीं';

  @override
  String get lowWalletBalance => 'कम वॉलेट बैलेंस';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ऑर्डर प्राप्त करने के लिए कृपया न्यूनतम ₹$limit का वॉलेट बैलेंस बनाए रखें। ऑर्डर प्राप्त करना जारी रखने के लिए अपना वॉलेट रीचार्ज करें।';
  }

  @override
  String get minimumRequiredBalance => 'न्यूनतम आवश्यक बैलेंस';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ऑर्डर प्राप्त करने के लिए कृपया अपने वॉलेट में कम से कम ₹$limit बनाए रखें।';
  }

  @override
  String get activeForRides => 'राइड्स के लिए सक्रिय';

  @override
  String get lowBalanceStatus => 'कम बैलेंस';

  @override
  String get minimumLimit => 'न्यूनतम सीमा';

  @override
  String get eShramBenefitsTitle => 'ई-श्रम लाभ';

  @override
  String get govtScheme => 'सरकारी योजना';

  @override
  String get eShramSubHeader => 'सरकारी बीमा एवं पेंशन योजना';

  @override
  String get eShramDescription =>
      'गिग वर्कर के लिए दुर्घटना बीमा और सामाजिक सुरक्षा लाभ प्राप्त करने हेतु आधिकारिक सरकारी ई-श्रम पोर्टल पर पंजीकरण करें।';

  @override
  String get registerOnEShramPortal => 'ई-श्रम पोर्टल पर पंजीकरण करें';

  @override
  String get eShramGovtBenefitsMenu => 'ई-श्रम सरकारी लाभ';

  @override
  String get dismiss => 'खारिज करें';
}
