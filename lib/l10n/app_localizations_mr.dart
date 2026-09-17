// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get account => 'खाते';

  @override
  String get editProfile => 'प्रोफाइल संपादित करा';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get language => 'भाषा';

  @override
  String get selectLanguage => 'भाषा निवडा';

  @override
  String get english => 'English (इंग्रजी)';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'वाहन निवडा';

  @override
  String get selectAVehicle => 'एक वाहन निवडा';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName सोबत पुढे जा';
  }

  @override
  String get addStop => 'स्टॉप जोडा';

  @override
  String get editLocations => 'स्थान संपादित करा';

  @override
  String get noPickupLocationSet => 'कोणतेही पिकअप स्थान सेट केलेले नाही';

  @override
  String get noDropLocationSet => 'कोणतेही ड्रॉप स्थान सेट केलेले नाही';

  @override
  String get addDrop => 'ड्रॉप जोडा';

  @override
  String get errorLoadingVehicles => 'वाहने लोड करताना त्रुटी';

  @override
  String get selectGoodsType => 'मालाचा प्रकार निवडा';

  @override
  String get whatAreYouShipping => 'तुम्ही काय पाठवत आहात?';

  @override
  String get chooseCategoryBestMatches =>
      'तुमच्या मालाशी सर्वाधिक जुळणारी श्रेणी निवडा';

  @override
  String get editGoodsDetails => 'मालाचे तपशील संपादित करा';

  @override
  String get weightKgMax90 => 'वजन (किग्रॅ) - कमाल ९० किग्रॅ';

  @override
  String get weightInvalidError => 'वजन १ ते ९० किग्रॅ दरम्यान असावे';

  @override
  String get numberOfPackages => 'पॅकेजची संख्या';

  @override
  String get worthValueRupees => 'मूल्य / किंमत (रुपये)';

  @override
  String get done => 'झाले';

  @override
  String get confirmGoodsDetails => 'मालाच्या तपशीलांची पुष्टी करा';

  @override
  String get failedToLoadCategories => 'श्रेण्या लोड करण्यात अयशस्वी';

  @override
  String get disclaimerTitle => 'अस्वीकरण';

  @override
  String get disclaimerText =>
      'अस्वीकरण: मी घोषित करतो की वाहतूक केला जाणारा माल गैर-धोकादायक, कायदेशीर आहे आणि निवडलेल्या श्रेणीचा आहे. प्रतिबंधित वस्तूंच्या वाहतुकीसाठी कंपनी जबाबदार नाही. वजन वाहनाच्या कमाल क्षमतेपेक्षा जास्त नसावे.';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight किग्रॅ • $packages पॅकेज • ₹$worth';
  }

  @override
  String get welcome => 'स्वागत आहे';

  @override
  String get enterMobileNumberToContinue =>
      'पुढे जाण्यासाठी तुमचा मोबाइल नंबर प्रविष्ट करा';

  @override
  String get mobileNumber => 'मोबाइल नंबर';

  @override
  String get agreeTermsText => 'मी सेवेच्या अटी आणि गोपनीयता धोरणाशी सहमत आहे';

  @override
  String get sendOtp => 'OTP पाठवा';

  @override
  String get verifyOtp => 'OTP पडताळा';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber वर पाठवलेला ४-अंकी कोड प्रविष्ट करा';
  }

  @override
  String get verifyAndContinue => 'पडताळा आणि पुढे जा';

  @override
  String resendInSeconds(Object count) {
    return '$count सेकंदात पुन्हा पाठवा';
  }

  @override
  String get resendOtp => 'OTP पुन्हा पाठवा';

  @override
  String get changeNumber => 'नंबर बदला';

  @override
  String get mobileNumberRequired => 'मोबाइल नंबर आवश्यक आहे';

  @override
  String get enterValidMobileNumber => 'वैध १०-अंकी मोबाइल नंबर प्रविष्ट करा';

  @override
  String get enterCompleteOtpError => 'कृपया संपूर्ण ४-अंकी OTP प्रविष्ट करा';

  @override
  String get otpResentSuccess => 'OTP यशस्वीरित्या पुन्हा पाठवला';

  @override
  String get fullName => 'पूर्ण नाव';

  @override
  String get fullNameRequired => 'पूर्ण नाव आवश्यक आहे';

  @override
  String get nameMinLengthError => 'नाव किमान २ अक्षरांचे असावे';

  @override
  String get email => 'ईमेल';

  @override
  String get emailRequired => 'ईमेल आवश्यक आहे';

  @override
  String get enterValidEmail => 'वैध ईमेल पत्ता प्रविष्ट करा';

  @override
  String get referralCode => 'रेफरल कोड';

  @override
  String get enterReferralCodeOptional => 'रेफरल कोड प्रविष्ट करा (पर्यायी)';

  @override
  String get createAccount => 'खाते तयार करा';

  @override
  String get completeProfileToGetStarted =>
      'सुरू करण्यासाठी तुमची प्रोफाइल पूर्ण करा';

  @override
  String get profileUpdatedSuccess => 'प्रोफाइल यशस्वीरित्या अपडेट झाली!';

  @override
  String get updateProfilePicture => 'प्रोफाइल चित्र अपडेट करा';

  @override
  String get camera => 'कॅमेरा';

  @override
  String get gallery => 'गॅलरी';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get dateOfBirthOptional => 'जन्मतारीख (पर्यायी)';

  @override
  String get gender => 'लिंग';

  @override
  String get male => 'पुरुष';

  @override
  String get female => 'स्त्री';

  @override
  String get other => 'इतर';

  @override
  String get updateProfile => 'प्रोफाइल अपडेट करा';

  @override
  String profileUpdateFailed(Object error) {
    return 'प्रोफाइल अपडेट करण्यात अयशस्वी: $error';
  }

  @override
  String get goodMorning => 'शुभ प्रभात,';

  @override
  String get goodAfternoon => 'शुभ दुपार,';

  @override
  String get goodEvening => 'शुभ संध्याकाळ,';

  @override
  String get pickupFrom => 'येथून पिकअप';

  @override
  String get currentLocation => 'सध्याचे स्थान';

  @override
  String get fetchingLocation => 'स्थान मिळवत आहे...';

  @override
  String get locationServicesDisabled => 'स्थान सेवा अक्षम आहे';

  @override
  String get locationPermissionNeeded => 'स्थान परवानगी आवश्यक आहे';

  @override
  String get locationAccessBlocked => 'स्थान प्रवेश अवरोधित आहे';

  @override
  String get couldNotFetchLocation => 'स्थान मिळवता आले नाही';

  @override
  String get enable => 'सक्षम करा';

  @override
  String get allow => 'परवानगी द्या';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get turnOnLocationServices => 'स्थान सेवा चालू करा';

  @override
  String get allowLocationAccess => 'स्थान प्रवेशास परवानगी द्या';

  @override
  String get gpsRequiredDescription =>
      'तुमचे पिकअप स्थान अचूकपणे दर्शविण्यासाठी आणि जवळच्या ड्रायव्हर्सना लवकर शोधण्यासाठी आम्हाला तुमच्या डिव्हाइस GPS ची आवश्यकता आहे.';

  @override
  String get permissionRequiredDescription =>
      'कृपया तुमच्या अॅप सेटिंग्जमध्ये स्थान परवानग्या द्या जेणेकरून आम्ही तुमचे पिकअप स्थान अचूकपणे दर्शवू शकू आणि जवळच्या ड्रायव्हर्सना लवकर शोधू शकू.';

  @override
  String get goToLocationSettings => 'स्थान सेटिंग्जवर जा';

  @override
  String get goToAppSettings => 'अॅप सेटिंग्जवर जा';

  @override
  String get enterAddressManually => 'मी माझा पत्ता स्वतः प्रविष्ट करेन';

  @override
  String get taglineTitle => 'काहीही नेऊन जा,\nकधीही.';

  @override
  String get taglineSubtitle =>
      'जलद डिलिव्हरी तुमच्या बोटांच्या टोकावर. स्मार्टपणे स्थलांतर करा, आमच्या प्रीमियम ताफ्यासह वेगाने पुढे जा.';

  @override
  String get twoWheelers => 'दोन चाकी';

  @override
  String get trucks => 'ट्रक';

  @override
  String get specialOffer => 'विशेष ऑफर';

  @override
  String get promoBannerText => 'तुमच्या पहिल्या राइडवर\n२०% सूट मिळवा';

  @override
  String get whereIsYourPickup => 'तुमचे पिकअप कुठे आहे?';

  @override
  String get whereIsYourDrop => 'तुमचे ड्रॉप कुठे आहे?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'तुमचे ड्रॉप $index कुठे आहे?';
  }

  @override
  String get typeMinCharsToSearch =>
      'शोध सुरू करण्यासाठी किमान ४ अक्षरे टाइप करा';

  @override
  String get selectOnMap => 'नकाशावर निवडा';

  @override
  String get pinpointExactLocation => 'तुमचे अचूक स्थान दर्शवा';

  @override
  String get couldNotFindAddress => 'क्षमा करा, आम्हाला हा पत्ता सापडला नाही.';

  @override
  String get trySearchingNearbyLandmark =>
      'जवळच्या लँडमार्क, परिसर किंवा लोकप्रिय स्थानाचा वापर करून शोधण्याचा प्रयत्न करा.';

  @override
  String get anErrorOccurred => 'एक त्रुटी आली';

  @override
  String get locating => 'स्थान शोधत आहे...';

  @override
  String get fetchingDetails => 'तपशील मिळवत आहे...';

  @override
  String get confirmPickupLocation => 'पिकअप स्थानाची पुष्टी करा';

  @override
  String get confirmDropLocation => 'ड्रॉप स्थानाची पुष्टी करा';

  @override
  String get houseShopApartment => 'घर / दुकान / अपार्टमेंट';

  @override
  String get sendersName => 'पाठवणाऱ्याचे नाव';

  @override
  String get receiversName => 'प्राप्तकर्त्याचे नाव';

  @override
  String get pleaseEnterName => 'कृपया नाव प्रविष्ट करा';

  @override
  String get sendersMobileNumber => 'पाठवणाऱ्याचा मोबाइल नंबर';

  @override
  String get receiversMobileNumber => 'प्राप्तकर्त्याचा मोबाइल नंबर';

  @override
  String get enterValidTenDigitNumber => 'वैध १०-अंकी नंबर प्रविष्ट करा';

  @override
  String get useMyMobileNumber => 'माझा मोबाइल नंबर वापरा';

  @override
  String get saveAsOptional => 'या स्वरूपात जतन करा (पर्यायी):';

  @override
  String get home => 'घर';

  @override
  String get shop => 'दुकान';

  @override
  String get confirmAndProceed => 'पुष्टी करा आणि पुढे जा';

  @override
  String get selectDropLocation => 'ड्रॉप स्थान निवडा';

  @override
  String get cannotSwapEmptyLocations =>
      'रिकामी स्थाने भरलेल्या स्थानांशी बदलता येत नाहीत.';

  @override
  String get proceedToVehicleSelection => 'वाहन निवडीकडे पुढे जा';

  @override
  String get permissionRequired => 'परवानगी आवश्यक आहे';

  @override
  String get contactsPermissionDescription =>
      'पाठवणाऱ्याचा फोन नंबर सहज निवडण्यासाठी गती लोडरला तुमच्या संपर्कांमध्ये प्रवेश आवश्यक आहे. कृपया अॅप सेटिंग्जमध्ये हे सक्षम करा.';

  @override
  String get openSettings => 'सेटिंग्ज उघडा';

  @override
  String get selectContact => 'संपर्क निवडा';

  @override
  String get contactPermissionDenied => 'संपर्क परवानगी नाकारली.';

  @override
  String get myProfile => 'माझी प्रोफाइल';

  @override
  String selfFormat(String name) {
    return '$name (स्वतः)';
  }

  @override
  String get deviceContacts => 'डिव्हाइस संपर्क';

  @override
  String get rideHistory => 'राइड इतिहास';

  @override
  String get transactions => 'व्यवहार';

  @override
  String get noTransactionsFound => 'कोणतेही व्यवहार सापडले नाहीत';

  @override
  String get failedToLoadTransactions => 'व्यवहार लोड करण्यात अयशस्वी';

  @override
  String get addMoney => 'पैसे जोडा';

  @override
  String get enterAmountToAdd => 'जोडण्यासाठी रक्कम प्रविष्ट करा';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay उघडण्यात अयशस्वी: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'पेमेंट ऑर्डर तयार करण्यात अयशस्वी: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'गती क्रेडिटमध्ये ₹$amount यशस्वीरित्या जोडले!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'पेमेंट पडताळणी अयशस्वी: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'पेमेंट अयशस्वी ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'बाह्य वॉलेट निवडले: $walletName';
  }

  @override
  String get walletTopUp => 'वॉलेट टॉप-अप';

  @override
  String get payments => 'पेमेंट';

  @override
  String get reachuCredits => 'गती क्रेडिट';

  @override
  String get balance => 'शिल्लक';

  @override
  String get errorLoadingBalance => 'शिल्लक लोड करताना त्रुटी';

  @override
  String get availableBalance => 'उपलब्ध शिल्लक';

  @override
  String get totalExpenses => 'एकूण खर्च';

  @override
  String get recentTransactions => 'अलीकडील व्यवहार';

  @override
  String get viewMore => 'अधिक पहा';

  @override
  String get noTransactionsYet => 'अद्याप कोणतेही व्यवहार नाहीत';

  @override
  String get booking => 'बुकिंग';

  @override
  String get earning => 'कमाई';

  @override
  String get support => 'सहाय्य';

  @override
  String get profile => 'प्रोफाइल';

  @override
  String get pendingWithdrawals => 'प्रलंबित पैसे काढणे';

  @override
  String get driverDebt => 'ड्रायव्हर कर्ज';

  @override
  String minBalanceRequired(Object amount) {
    return 'किमान शिल्लक आवश्यक: ₹$amount';
  }

  @override
  String get insufficientBalance => 'पैसे काढण्यासाठी अपुरी शिल्लक';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'चेतावणी: तुमची उपलब्ध शिल्लक नवीन राइड स्वीकारण्यासाठी आवश्यक किमान मर्यादा (₹$amount) पेक्षा कमी आहे. कृपया तुमचे वॉलेट टॉप अप करा.';
  }

  @override
  String get moneyTransfer => 'पैसे ट्रान्सफर करा';

  @override
  String get withdrawMoney => 'पैसे काढा';

  @override
  String get manageAccounts => 'खाती व्यवस्थापित करा';

  @override
  String get bankAccounts => 'बँक खाती आणि UPI';

  @override
  String get addAccount => 'पेमेंट पद्धत जोडा';

  @override
  String get addBankAccount => 'बँक खाते जोडा';

  @override
  String get addUpiId => 'UPI आयडी जोडा';

  @override
  String get editBankAccount => 'बँक खाते संपादित करा';

  @override
  String get editUpiId => 'UPI आयडी संपादित करा';

  @override
  String get deleteAccount => 'खाते हटवा';

  @override
  String get deleteAccountConfirm =>
      'तुम्हाला खात्री आहे की ही पेमेंट पद्धत हटवायची आहे?';

  @override
  String get accountHolderName => 'खातेधारकाचे नाव';

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
  String get bankName => 'बँकेचे नाव';

  @override
  String get accountNumber => 'खाते क्रमांक';

  @override
  String get confirmAccountNumber => 'खाते क्रमांकाची पुष्टी करा';

  @override
  String get ifscCode => 'IFSC कोड';

  @override
  String get upiId => 'UPI आयडी';

  @override
  String get fieldRequired => 'हे फील्ड आवश्यक आहे';

  @override
  String get invalidUpi => 'वैध UPI आयडी प्रविष्ट करा (उदा. name@upi)';

  @override
  String get invalidIfsc => 'वैध ११-अंकी IFSC कोड प्रविष्ट करा';

  @override
  String get invalidAccountNumber => 'वैध खाते क्रमांक प्रविष्ट करा';

  @override
  String get accountNumbersDoNotMatch => 'खाते क्रमांक जुळत नाहीत';

  @override
  String get noPaymentMethods => 'अद्याप कोणतीही पेमेंट पद्धत जोडलेली नाही';

  @override
  String get addPaymentMethodSubtitle =>
      'तुमची कमाई काढण्यासाठी बँक खाते किंवा UPI आयडी जोडा';

  @override
  String get confirmTransfer => 'ट्रान्सफरची पुष्टी करा';

  @override
  String get transferAmount => 'ट्रान्सफर रक्कम';

  @override
  String get transferSuccess => 'पैसे काढण्याची विनंती यशस्वीरित्या तयार झाली';

  @override
  String get collectPayment => 'पेमेंट गोळा करा';

  @override
  String get collectCash => 'रोख गोळा करा';

  @override
  String get cashCollectedSuccess => 'रोख पेमेंट यशस्वीरित्या पूर्ण झाले!';

  @override
  String get displayQrCode => 'UPI QR कोड दाखवा';

  @override
  String get customerScanQr =>
      'ग्राहकाला पेमेंट करण्यासाठी हा QR कोड स्कॅन करण्यास सांगा';

  @override
  String get generatingQr => 'QR कोड तयार होत आहे...';

  @override
  String get selectPaymentMethod => 'पेमेंट पद्धत निवडा';

  @override
  String get beneficiary => 'लाभार्थी';

  @override
  String get completed => 'पूर्ण';

  @override
  String get pending => 'प्रलंबित';

  @override
  String get failed => 'अयशस्वी';

  @override
  String get failedToLoadAccounts => 'पेमेंट पद्धती लोड करण्यात अयशस्वी';

  @override
  String get accountDeletedSuccess => 'पेमेंट पद्धत यशस्वीरित्या हटवली';

  @override
  String get accountUpdatedSuccess => 'पेमेंट पद्धत यशस्वीरित्या अपडेट झाली';

  @override
  String get accountAddedSuccess => 'पेमेंट पद्धत यशस्वीरित्या जोडली';

  @override
  String get withdrawalAmount => 'काढण्याची रक्कम';

  @override
  String get transferDestination => 'ट्रान्सफर गंतव्य';

  @override
  String get enterAmount => 'रक्कम प्रविष्ट करा';

  @override
  String get selected => 'निवडले';

  @override
  String get accountNumberLabel => 'खाते क्रमांक';

  @override
  String get errorLoadingAccounts => 'पेमेंट पद्धती लोड करताना त्रुटी';

  @override
  String get errorLoadingWallet => 'वॉलेट माहिती लोड करताना त्रुटी';

  @override
  String get enterAccountHolderName => 'खातेधारकाचे नाव प्रविष्ट करा';

  @override
  String get bankNameHint => 'उदा. स्टेट बँक ऑफ इंडिया';

  @override
  String get enterAccountNumber => 'खाते क्रमांक प्रविष्ट करा';

  @override
  String get confirmAccountNumberHint => 'खाते क्रमांकाची पुष्टी करा';

  @override
  String get ifscCodeHint => 'उदा. SBIN0001234';

  @override
  String get upiIdHint => 'उदा. user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'एकूण भाडे';

  @override
  String get hideQrCode => 'QR लपवा';

  @override
  String get nameMinLengthRequired => 'नाव किमान २ अक्षरांचे असावे';

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
  String get personalInformation => 'वैयक्तिक माहिती';

  @override
  String get online => 'ऑनलाइन';

  @override
  String get offline => 'ऑफलाइन';

  @override
  String get onlineSuccessMessage => 'तुम्ही आता ऑनलाइन आणि ड्यूटीवर आहात.';

  @override
  String get offlineSuccessMessage => 'तुम्ही आता ऑफलाइन आहात.';

  @override
  String get partnerSupport => 'पार्टनर सहाय्य';

  @override
  String get partnerSupportSubtitle =>
      'नमस्कार पार्टनर! तुमच्या राइड, पेमेंट किंवा खात्यात मदत हवी आहे का? आम्ही तुमच्या २४/७ सहाय्यासाठी येथे आहोत.';

  @override
  String get faqsAndHelp => 'वारंवार विचारले जाणारे प्रश्न आणि मदत';

  @override
  String get findQuickAnswers => 'त्वरित उत्तरे शोधा';

  @override
  String get raiseSupportTicket => 'तिकीट दाखल करा';

  @override
  String get contactSupportAgent => 'सहाय्य एजंटशी संपर्क साधा';

  @override
  String get recentTickets => 'अलीकडील तिकिटे';

  @override
  String get noActiveTickets => 'कोणतेही सक्रिय सहाय्य तिकिटे नाहीत';

  @override
  String get submitTicketDescription => 'समस्या आल्यास तिकीट सबमिट करा.';

  @override
  String get failedToLoadTickets => 'अलीकडील तिकिटे लोड करण्यात अयशस्वी';

  @override
  String get contactSupport => 'सहाय्याशी संपर्क साधा';

  @override
  String get callUs => 'आम्हाला कॉल करा';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'आमच्याशी चॅट करा';

  @override
  String get emailSupport => 'ईमेल सहाय्य';

  @override
  String get ticketStatusOpen => 'खुले';

  @override
  String get ticketStatusInProgress => 'प्रगतीपथावर';

  @override
  String get ticketStatusResolved => 'सोडवले';

  @override
  String get ticketStatusClosed => 'बंद';

  @override
  String get ticketCategoryRideIssue => 'राइड समस्या';

  @override
  String get ticketCategoryPayment => 'पेमेंट';

  @override
  String get ticketCategoryAccount => 'खाते';

  @override
  String get ticketCategoryDriverIssue => 'ड्रायव्हर समस्या';

  @override
  String get ticketCategoryOther => 'इतर';

  @override
  String get failedToLoadDashboard => 'डॅशबोर्ड लोड करण्यात अयशस्वी';

  @override
  String get todaysEarnings => 'आजची कमाई';

  @override
  String get cashCollected => 'रोख गोळा केले';

  @override
  String get onlinePayment => 'ऑनलाइन पेमेंट';

  @override
  String get todaysRideStatus => 'आजची ऑर्डर स्थिती';

  @override
  String get totalRides => 'एकूण ऑर्डर्स';

  @override
  String get cancelled => 'रद्द';

  @override
  String get dutyRating => 'ड्यूटी रेटिंग';

  @override
  String get noRidesFound => 'कोणतीही राइड सापडली नाही';

  @override
  String get failedToLoadHistory => 'इतिहास लोड करण्यात अयशस्वी';

  @override
  String get all => 'सर्व';

  @override
  String get paymentPending => 'पेमेंट प्रलंबित';

  @override
  String stopsCount(int count) {
    return '$count स्टॉप';
  }

  @override
  String get rideDetails => 'राइड तपशील';

  @override
  String get pickupLocation => 'पिकअप स्थान';

  @override
  String get dropLocation => 'ड्रॉप स्थान';

  @override
  String stopLocation(int number) {
    return 'स्टॉप $number';
  }

  @override
  String get fareBreakdown => 'भाडे तपशील';

  @override
  String get netPayable => 'एकूण देय रक्कम';

  @override
  String get paymentMethod => 'पेमेंट पद्धत';

  @override
  String get cash => 'रोख';

  @override
  String get customerDetails => 'ग्राहक तपशील';

  @override
  String get callCustomer => 'ग्राहकाला कॉल करा';

  @override
  String get goodsType => 'मालाचा प्रकार';

  @override
  String get quantity => 'प्रमाण';

  @override
  String get weight => 'वजन';

  @override
  String get distance => 'अंतर';

  @override
  String get duration => 'कालावधी';

  @override
  String get cancellationReason => 'रद्द करण्याचे कारण';

  @override
  String get routeTimeline => 'मार्ग टाइमलाइन';

  @override
  String get goodsSpecifications => 'मालाचे तपशील';

  @override
  String get vehicleMetadata => 'वाहनाचे तपशील';

  @override
  String get description => 'वर्णन';

  @override
  String get estimatedWeight => 'अंदाजे वजन';

  @override
  String get vehicleName => 'वाहनाचे नाव';

  @override
  String get vehicleNumber => 'वाहन क्रमांक';

  @override
  String get modelColor => 'मॉडेल / रंग';

  @override
  String get baseFare => 'मूळ भाडे';

  @override
  String get weatherSurcharge => 'हवामान अधिभार';

  @override
  String get trafficSurcharge => 'ट्रॅफिक अधिभार';

  @override
  String get promoDiscount => 'प्रोमो सूट';

  @override
  String get pickupSender => 'पिकअप (प्रेषक)';

  @override
  String get dropoffRecipient => 'ड्रॉपऑफ (प्राप्तकर्ता)';

  @override
  String rideIdLabel(String id) {
    return 'राइड आयडी: $id';
  }

  @override
  String get todaysTotalEarnings => 'आजची एकूण कमाई';

  @override
  String get failedToLoadEarnings => 'कमाईचे आकडे लोड करण्यात अयशस्वी';

  @override
  String get noTransactionsRecorded => 'कोणतेही व्यवहार नोंदवलेले नाहीत';

  @override
  String get mySupportTickets => 'माझी सहाय्य तिकिटे';

  @override
  String get newTicket => 'नवीन तिकीट';

  @override
  String get noSupportTicketsRaised => 'कोणतेही सहाय्य तिकीट दाखल केलेले नाही';

  @override
  String get tapNewTicketSubtitle =>
      'मदत मिळवण्यासाठी \'नवीन तिकीट\' वर टॅप करा.';

  @override
  String get submitATicket => 'तिकीट दाखल करा';

  @override
  String get explainIssueDetail =>
      'तुमची समस्या सविस्तर वर्णन करा. सहाय्य एजंट लवकरच पुष्टी करून उत्तर देईल.';

  @override
  String get categoryRequired => 'श्रेणी*';

  @override
  String get selectIssueCategory => 'समस्या श्रेणी निवडा';

  @override
  String get pleaseSelectCategoryError => 'कृपया एक समस्या श्रेणी निवडा';

  @override
  String get subjectRequired => 'विषय*';

  @override
  String get briefSummaryHint => 'समस्येचे संक्षिप्त वर्णन';

  @override
  String get subjectRequiredError => 'विषय आवश्यक आहे';

  @override
  String get subjectMinLengthError => 'विषय किमान ५ अक्षरांचा असावा';

  @override
  String get descriptionRequired => 'वर्णन / संदेश*';

  @override
  String get describeProblemHint => 'तुमची समस्या सविस्तर वर्णन करा...';

  @override
  String get messageRequiredError => 'संदेश वर्णन आवश्यक आहे';

  @override
  String get messageMinLengthError => 'संदेश किमान १० अक्षरांचा असावा';

  @override
  String get submitTicket => 'तिकीट सबमिट करा';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get termsAndConditions => 'नियम आणि अटी';

  @override
  String get termsOfService => 'सेवेच्या अटी';

  @override
  String get iAgreeTo => 'मी ';

  @override
  String get and => ' आणि ';

  @override
  String get agreeSuffix => ' शी सहमत आहे';

  @override
  String get darkTheme => 'डार्क थीम';

  @override
  String get failedToLoadDetails => 'तपशील लोड करण्यात अयशस्वी';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>गोपनीयता धोरण</h1><p>Reachu ड्रायव्हर अॅपमध्ये तुमचे स्वागत आहे. तुमची गोपनीयता आमच्यासाठी महत्त्वाची आहे. हे गोपनीयता धोरण स्पष्ट करते की आम्ही तुमची वैयक्तिक माहिती कशी गोळा, वापर आणि सुरक्षित करतो.</p><h2>१. आम्ही गोळा करतो ती माहिती</h2><p>आम्ही तुमचे नाव, फोन नंबर, ईमेल, वाहन तपशील, सक्रिय ट्रिप दरम्यान स्थान डेटा आणि व्यवहार तपशील गोळा करतो.</p><h2>२. आम्ही तुमची माहिती कशी वापरतो</h2><p>आम्ही तुमची माहिती डिलिव्हरी राइड सुलभ करण्यासाठी, पेमेंट प्रक्रिया करण्यासाठी, सुरक्षा सुनिश्चित करण्यासाठी आणि ड्रायव्हर अनुभव सुधारण्यासाठी वापरतो.</p><h2>३. स्थान ट्रॅकिंग</h2><p>ड्यूटीवर असताना बॅकग्राउंड स्थान प्रवेश आवश्यक आहे जेणेकरून तुम्हाला जवळच्या डिलिव्हरी विनंत्यांशी जोडता येईल आणि ग्राहक ट्रिपची प्रगती पाहू शकतील.</p><h2>४. डेटा सुरक्षा</h2><p>आम्ही तुमची वैयक्तिक माहिती अनधिकृत प्रवेशापासून सुरक्षित ठेवण्यासाठी कठोर सुरक्षा उपाय लागू करतो.</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>नियम आणि अटी</h1><p>Reachu ड्रायव्हर अनुप्रयोग वापरण्यापूर्वी कृपया हे नियम आणि अटी काळजीपूर्वक वाचा.</p><h2>१. अटींची स्वीकृती</h2><p>Reachu वर ड्रायव्हर पार्टनर म्हणून नोंदणी करून, तुम्ही सर्व लागू अटी, धोरणे आणि स्थानिक वाहतूक नियमांचे पालन करण्यास सहमत आहात.</p><h2>२. ड्रायव्हरच्या जबाबदाऱ्या</h2><p>ड्रायव्हरकडे वैध ड्रायव्हिंग परवाना, अचूक वाहन कागदपत्रे आणि सुरक्षित, वेळेवर डिलिव्हरी सेवा देण्याची जबाबदारी असावी.</p><h2>३. पेमेंट आणि कमाई</h2><p>भाडे प्लॅटफॉर्म दरांनुसार ठरवले जाते आणि लागू शुल्क वजा केल्यानंतर तुमच्या पडताळलेल्या बँक खात्यात हस्तांतरित केले जाते.</p><h2>४. खाते निलंबन</h2><p>Reachu फसव्या क्रियाकलाप, सुरक्षा उल्लंघन किंवा धोरणाचे पालन न केल्यास खाते निलंबित करण्याचा अधिकार राखून ठेवते.</p>';

  @override
  String get reviewAndRating => 'पुनरावलोकन आणि रेटिंग';

  @override
  String get noRatingsYet => 'अद्याप कोणतेही रेटिंग नाही';

  @override
  String ratedByCustomers(int count) {
    return '$count ग्राहकांनी रेटिंग दिले';
  }

  @override
  String get noReviewsYet => 'अद्याप कोणतीही पुनरावलोकने नाहीत';

  @override
  String get noReviewsDesc =>
      'तुम्हाला अद्याप कोणतीही पुनरावलोकने मिळालेली नाहीत.';

  @override
  String get noCommentProvided => 'कोणतीही टिप्पणी दिलेली नाही';

  @override
  String get ratingExcellent => 'उत्कृष्ट';

  @override
  String get ratingGood => 'चांगले';

  @override
  String get ratingAverage => 'सरासरी';

  @override
  String get ratingBelowAverage => 'सरासरीपेक्षा कमी';

  @override
  String get ratingPoor => 'खराब';

  @override
  String get customer => 'ग्राहक';

  @override
  String get noInternetConnection => 'इंटरनेट कनेक्शन नाही';

  @override
  String get checkInternetConnection =>
      'कृपया तुमचे इंटरनेट कनेक्शन तपासा आणि पुन्हा प्रयत्न करा.';

  @override
  String get internetRestored => 'इंटरनेट कनेक्शन पुन्हा सुरू झाले';

  @override
  String get retryConnection => 'पुन्हा प्रयत्न करा';

  @override
  String get connectionTimedOut =>
      'कनेक्शनची वेळ संपली. पुन्हा प्रयत्न करत आहे...';

  @override
  String get newUpdateAvailable =>
      'नवीन अपडेट उपलब्ध आहे. सुरू ठेवण्यासाठी ॲप अपडेट करा.';

  @override
  String get updateRequiredTitle => 'अपडेट आवश्यक आहे';

  @override
  String updateRequiredDesc(String version) {
    return 'तुम्ही Reachu Driver ची जुनी आवृत्ती वापरत आहात. राइड्स घेणे सुरू ठेवण्यासाठी कृपया नवीनतम आवृत्तीवर अपडेट करा.';
  }

  @override
  String get updateNow => 'आत्ताच अपडेट करा';

  @override
  String get updateLater => 'नंतर अपडेट करा';

  @override
  String get underMaintenanceTitle => 'रखरखाव सुरू आहे';

  @override
  String get underMaintenanceDesc =>
      'तुम्हाला अधिक चांगली सेवा देण्यासाठी आम्ही आमची सिस्टम अपडेट करत आहोत. कृपया काही वेळाने तपासा.';

  @override
  String estimatedBackIn(Object time) {
    return 'अंदाजे $time मध्ये परत सुरू होईल';
  }

  @override
  String get backOnlineSoon => 'आम्ही लवकरच ऑनलाइन येऊ!';

  @override
  String installedVersion(String version) {
    return 'इन्स्टॉल केलेली आवृत्ती: $version';
  }

  @override
  String get couldNotOpenStore => 'ॲप स्टोअर उघडता आले नाही';

  @override
  String get detailedFareBreakdown => 'सविस्तर भाड्याचा तपशील';

  @override
  String get checkPaymentStatus => 'पेमेंटची स्थिती तपासा';

  @override
  String get checkingStatus => 'स्थिती तपासत आहे...';

  @override
  String get details => 'तपशील';

  @override
  String get hide => 'लपवा';

  @override
  String get collectCashFromCustomer => 'ग्राहकाकडून रोख रक्कम जमा करा';

  @override
  String get customerOnlineFareDue => 'ग्राहकाचे ऑनलाइन भाडे देय';

  @override
  String get reachuWalletCredit => 'Reachu वॉलेट क्रेडिट';

  @override
  String promoReimbursementNote(String amount) {
    return '*तुमच्या वॉलेटमध्ये जमा झालेली Reachu प्रोमो परतफेड समाविष्ट आहे';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*प्रतीक्षा वेळेसाठी वेटिंग चार्ज समाविष्ट आहे';
  }

  @override
  String get paymentReceivedSuccess => 'पेमेंट यशस्वीरित्या प्राप्त झाले!';

  @override
  String get paymentStillPending => 'पेमेंट अजूनही प्रलंबित आहे';

  @override
  String get waitingCharge => 'वेटिंग चार्ज';

  @override
  String get rentalCharge => 'रेंटल चार्ज';

  @override
  String get grossFare => 'एकूण भाडे';

  @override
  String get pendingDue => 'प्रलंबित देय रक्कम';

  @override
  String get tollFee => 'टोल शुल्क';

  @override
  String get cancellationFee => 'रद्दीकरण शुल्क';

  @override
  String get nightSurcharge => 'नाईट सरचार्ज';

  @override
  String get surgeFee => 'सर्ज फी';

  @override
  String get taxAndFees => 'कर आणि शुल्क';

  @override
  String get platformFee => 'प्लॅटफॉर्म फी';

  @override
  String get pressBackAgainToExit => 'ॲपमधून बाहेर पडण्यासाठी पुन्हा मागे दाबा';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'बाहेर पडण्यापूर्वी कृपया राइड स्वीकारा किंवा नाकारा';

  @override
  String get cashPayment => 'रोख पेमेंट';

  @override
  String get onlineQr => 'ऑनलाइन क्यूआर';

  @override
  String get collectCashInstructions =>
      'राइड संपवण्यापूर्वी कृपया ग्राहकाकडून रोख रक्कम जमा करा.';

  @override
  String collectCashStep1(String amount) {
    return '१. ग्राहकाकडून अचूक रोख रक्कम जमा करा';
  }

  @override
  String get collectCashStep2 =>
      '२. खालील \'रोख रक्कम प्राप्त झाल्याची पुष्टी करा\' बटण दाबा';

  @override
  String get verifyingCashDeposit => 'रोख जमा रक्कम तपासत आहे...';

  @override
  String get pleaseHoldClosingRide =>
      'आम्ही राइड बंद करेपर्यंत कृपया प्रतीक्षा करा';

  @override
  String get customerOnlinePayment => 'ग्राहक ऑनलाइन पेमेंट';

  @override
  String get generatingQrCode => 'क्यूआर कोड तयार करत आहे...';

  @override
  String get failedToLoadQrCode => 'क्यूआर कोड लोड करण्यात अयशस्वी';

  @override
  String get scanQrToPay =>
      'ऑनलाइन पेमेंट करण्यासाठी ग्राहकाला क्यूआर कोड स्कॅन करायला सांगा';

  @override
  String get pinchToZoomQr => 'क्यूआर कोड झूम करण्यासाठी पिंच करा';

  @override
  String get tapToFullScreen => 'फुल स्क्रीन व्ह्यूसाठी क्यूआर कोडवर टॅप करा';

  @override
  String get awaitingCustomerPayment => 'ग्राहकाच्या पेमेंटची वाट पाहत आहे...';

  @override
  String get confirmCashReceived => 'रोख रक्कम प्राप्त झाल्याची पुष्टी करा';

  @override
  String get paymentReceivedToast => 'पेमेंट प्राप्त झाले! राइड बंद करत आहे...';

  @override
  String get invalidOrderIdError => 'अवैध ऑर्डर आयडी';

  @override
  String get cashPaymentRecordedWaiting =>
      'रोख पेमेंट नोंदवले गेले. राइड बंद करत आहे...';

  @override
  String get paymentReceivedTitle => 'पेमेंट प्राप्त झाले';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount ची रक्कम यशस्वीरित्या भरली गेली!';
  }

  @override
  String get rideClosedReturningHome =>
      'राइड बंद झाली. होम स्क्रीनवर परत जात आहे...';

  @override
  String get fragileGoods => 'नाजूक वस्तू';

  @override
  String get yes => 'होय';

  @override
  String get no => 'नाही';

  @override
  String contactLabel(String name, Object phone) {
    return 'संपर्क: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'परवानग्या आवश्यक आहेत';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver ला ऑफलाइन आणि ऑनलाइन अचूकपणे काम करण्यासाठी खालील परवानग्यांची आवश्यकता आहे.';

  @override
  String get locationAlwaysTitle => 'स्थान (नेहमी अनुमती द्या)';

  @override
  String get locationAlwaysSubtitle =>
      'ऑर्डर डिस्पॅच आणि बॅकग्राउंड राइड ट्रॅकिंगसाठी आवश्यक.';

  @override
  String get batteryUnrestrictedTitle => 'बॅटरी ऑप्टिमायझेशन (अप्रतिबंधित)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'बॅकग्राउंड सॉकेट कनेक्शन आणि राइड अलर्ट बंद पडणार नाहीत याची खात्री करते.';

  @override
  String get notificationsTitle => 'सूचना';

  @override
  String get notificationsSubtitle =>
      'नवीन राइड विनंत्या आणि ऑर्डर अलर्टसाठी आवश्यक.';

  @override
  String get displayOverAppsTitle => 'इतर ॲप्सवर प्रदर्शित करा';

  @override
  String get displayOverAppsSubtitle =>
      'फुल-स्क्रीन येणाऱ्या ऑर्डर पॉपअपसाठी आवश्यक.';

  @override
  String get locationUsedInBackground => 'बॅकग्राउंडमध्ये वापरलेले स्थान';

  @override
  String get backgroundLocationDisclosureBody =>
      'ॲप बंद असताना किंवा वापरात नसतानाही ReachuDriver लोकेशन डेटा गोळा करतो.\n\nयाचा वापर खालील गोष्टींसाठी केला जातो:\n  • लोडर्स/वापरकर्त्यांसह तुमची रिअल-टाइम स्थिती शेअर करणे\n  • तुम्हाला जवळच्या बुकिंग विनंत्या सोपवणे\n  • तुम्ही ड्युटीवर असताना डिस्पॅच सिस्टम अपडेट ठेवणे\n\nलोकेशन संकलन फक्त तुम्ही ऑनलाइन (ड्युटीवर) असतानाच चालते आणि ऑफलाइन झाल्यावर लगेच बंद होते.';

  @override
  String get changeInAppSettingsNote =>
      'तुम्ही ॲप सेटिंग्जमध्ये कधीही हे बदलू शकता.';

  @override
  String get iUnderstandContinue => 'मला समजले — पुढे जा';

  @override
  String get notNow => 'आत्ता नाही';

  @override
  String get lowWalletBalance => 'कमी वॉलेट शिल्लक';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ऑर्डर मिळवण्यासाठी कृपया किमान ₹$limit ची वॉलेट शिल्लक ठेवा. ऑर्डर मिळवणे सुरू ठेवण्यासाठी तुमचे वॉलेट टॉप अप करा.';
  }

  @override
  String get minimumRequiredBalance => 'किमान आवश्यक शिल्लक';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ऑर्डर मिळवण्यासाठी कृपया तुमच्या वॉलेटमध्ये किमान ₹$limit ठेवा.';
  }

  @override
  String get activeForRides => 'राईड्ससाठी सक्रिय';

  @override
  String get lowBalanceStatus => 'कमी शिल्लक';

  @override
  String get minimumLimit => 'किमान मर्यादा';

  @override
  String get eShramBenefitsTitle => 'ई-श्रम लाभ';

  @override
  String get govtScheme => 'सरकारी योजना';

  @override
  String get eShramSubHeader => 'सरकारी विमा व पेन्शन योजना';

  @override
  String get eShramDescription =>
      'गिग कामगारांसाठी अपघात विमा आणि सामाजिक सुरक्षा लाभ मिळवण्यासाठी अधिकृत सरकारी ई-श्रम पोर्टलवर नोंदणी करा.';

  @override
  String get registerOnEShramPortal => 'ई-श्रम पोर्टलवर नोंदणी करा';

  @override
  String get eShramGovtBenefitsMenu => 'ई-श्रम सरकारी लाभ';

  @override
  String get dismiss => 'रद्द करा';

  @override
  String get trainingVideos => 'Training Videos';

  @override
  String get welcomeToReachU => 'Hi, Welcome to ReachU!';

  @override
  String get welcomeTrainingSubtitle =>
      'Let\'s start your journey! Please watch this quick training video to learn how things work.';

  @override
  String get trainingCompletedTitle => 'Training Completed!';

  @override
  String get trainingCompletedSubtitle =>
      'Great job! You have successfully completed all required training. You are now ready to start driving.';

  @override
  String get startDriving => 'Start Driving';

  @override
  String get iHaveReadAndConsent =>
      'I have read and hereby provide my consent on the ';

  @override
  String get tdsDeclaration => 'TDS Declaration';
}
