// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get account => 'ఖాతా';

  @override
  String get editProfile => 'ప్రొఫైల్ సవరించండి';

  @override
  String get logout => 'లాగ్అవుట్';

  @override
  String get language => 'భాష';

  @override
  String get selectLanguage => 'భాషను ఎంచుకోండి';

  @override
  String get english => 'English (ఆంగ్లం)';

  @override
  String get hindi => 'హిందీ (Hindi)';

  @override
  String get selectVehicle => 'వాహనం ఎంచుకోండి';

  @override
  String get selectAVehicle => 'ఒక వాహనం ఎంచుకోండి';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName తో కొనసాగండి';
  }

  @override
  String get addStop => 'స్టాప్ జోడించండి';

  @override
  String get editLocations => 'స్థానాలను సవరించండి';

  @override
  String get noPickupLocationSet => 'పికప్ స్థానం సెట్ చేయబడలేదు';

  @override
  String get noDropLocationSet => 'డ్రాప్ స్థానం సెట్ చేయబడలేదు';

  @override
  String get addDrop => 'డ్రాప్ జోడించండి';

  @override
  String get errorLoadingVehicles => 'వాహనాలను లోడ్ చేయడంలో లోపం';

  @override
  String get selectGoodsType => 'సరుకు రకాన్ని ఎంచుకోండి';

  @override
  String get whatAreYouShipping => 'మీరు ఏమి పంపుతున్నారు?';

  @override
  String get chooseCategoryBestMatches =>
      'మీ సరుకుకు బాగా సరిపోయే వర్గాన్ని ఎంచుకోండి';

  @override
  String get editGoodsDetails => 'సరుకు వివరాలను సవరించండి';

  @override
  String get weightKgMax90 => 'బరువు (కిలోలు) - గరిష్టం 90 కిలోలు';

  @override
  String get weightInvalidError => 'బరువు 1 నుండి 90 కిలోల మధ్య ఉండాలి';

  @override
  String get numberOfPackages => 'ప్యాకేజీల సంఖ్య';

  @override
  String get worthValueRupees => 'విలువ / ధర (రూపాయలు)';

  @override
  String get done => 'పూర్తయింది';

  @override
  String get confirmGoodsDetails => 'సరుకు వివరాలను నిర్ధారించండి';

  @override
  String get failedToLoadCategories => 'వర్గాలను లోడ్ చేయడం విఫలమైంది';

  @override
  String get disclaimerTitle => 'నిరాకరణ';

  @override
  String get disclaimerText =>
      'నిరాకరణ: రవాణా చేయబడుతున్న సరుకు ప్రమాదకరం కాదు, చట్టబద్ధమైనది మరియు ఎంచుకున్న వర్గానికి చెందినదని నేను ప్రకటిస్తున్నాను. నిషేధిత వస్తువుల రవాణాకు కంపెనీ బాధ్యత వహించదు. బరువు వాహనం యొక్క గరిష్ట సామర్థ్యాన్ని మించకూడదు.';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight కిలోలు • $packages ప్యాకేజీలు • ₹$worth';
  }

  @override
  String get welcome => 'స్వాగతం';

  @override
  String get enterMobileNumberToContinue =>
      'కొనసాగించడానికి మీ మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get mobileNumber => 'మొబైల్ నంబర్';

  @override
  String get agreeTermsText =>
      'నేను సేవా నిబంధనలు మరియు గోప్యతా విధానానికి అంగీకరిస్తున్నాను';

  @override
  String get sendOtp => 'OTP పంపండి';

  @override
  String get verifyOtp => 'OTP ధృవీకరించండి';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber కు పంపిన 4-అంకెల కోడ్‌ను నమోదు చేయండి';
  }

  @override
  String get verifyAndContinue => 'ధృవీకరించి కొనసాగండి';

  @override
  String resendInSeconds(Object count) {
    return '$count సెకన్లలో మళ్లీ పంపండి';
  }

  @override
  String get resendOtp => 'OTP మళ్లీ పంపండి';

  @override
  String get changeNumber => 'నంబర్ మార్చండి';

  @override
  String get mobileNumberRequired => 'మొబైల్ నంబర్ అవసరం';

  @override
  String get enterValidMobileNumber =>
      'చెల్లుబాటు అయ్యే 10-అంకెల మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get enterCompleteOtpError => 'దయచేసి పూర్తి 4-అంకెల OTP నమోదు చేయండి';

  @override
  String get otpResentSuccess => 'OTP విజయవంతంగా మళ్లీ పంపబడింది';

  @override
  String get fullName => 'పూర్తి పేరు';

  @override
  String get fullNameRequired => 'పూర్తి పేరు అవసరం';

  @override
  String get nameMinLengthError => 'పేరు కనీసం 2 అక్షరాలు ఉండాలి';

  @override
  String get email => 'ఇమెయిల్';

  @override
  String get emailRequired => 'ఇమెయిల్ అవసరం';

  @override
  String get enterValidEmail =>
      'చెల్లుబాటు అయ్యే ఇమెయిల్ చిరునామా నమోదు చేయండి';

  @override
  String get referralCode => 'రెఫరల్ కోడ్';

  @override
  String get enterReferralCodeOptional => 'రెఫరల్ కోడ్ నమోదు చేయండి (ఐచ్ఛికం)';

  @override
  String get createAccount => 'ఖాతా సృష్టించండి';

  @override
  String get completeProfileToGetStarted =>
      'ప్రారంభించడానికి మీ ప్రొఫైల్‌ను పూర్తి చేయండి';

  @override
  String get profileUpdatedSuccess => 'ప్రొఫైల్ విజయవంతంగా అప్‌డేట్ అయింది!';

  @override
  String get updateProfilePicture => 'ప్రొఫైల్ చిత్రం అప్‌డేట్ చేయండి';

  @override
  String get camera => 'కెమెరా';

  @override
  String get gallery => 'గ్యాలరీ';

  @override
  String get cancel => 'రద్దు చేయండి';

  @override
  String get dateOfBirthOptional => 'పుట్టిన తేదీ (ఐచ్ఛికం)';

  @override
  String get gender => 'లింగం';

  @override
  String get male => 'పురుషుడు';

  @override
  String get female => 'స్త్రీ';

  @override
  String get other => 'ఇతర';

  @override
  String get updateProfile => 'ప్రొఫైల్ అప్‌డేట్ చేయండి';

  @override
  String profileUpdateFailed(Object error) {
    return 'ప్రొఫైల్ అప్‌డేట్ విఫలమైంది: $error';
  }

  @override
  String get goodMorning => 'శుభోదయం,';

  @override
  String get goodAfternoon => 'శుభ మధ్యాహ్నం,';

  @override
  String get goodEvening => 'శుభ సాయంత్రం,';

  @override
  String get pickupFrom => 'ఇక్కడ నుండి పికప్';

  @override
  String get currentLocation => 'ప్రస్తుత స్థానం';

  @override
  String get fetchingLocation => 'స్థానం పొందుతోంది...';

  @override
  String get locationServicesDisabled => 'స్థాన సేవలు నిలిపివేయబడ్డాయి';

  @override
  String get locationPermissionNeeded => 'స్థాన అనుమతి అవసరం';

  @override
  String get locationAccessBlocked => 'స్థాన ప్రాప్యత నిరోధించబడింది';

  @override
  String get couldNotFetchLocation => 'స్థానం పొందలేకపోయాము';

  @override
  String get enable => 'ప్రారంభించండి';

  @override
  String get allow => 'అనుమతించండి';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get retry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get turnOnLocationServices => 'స్థాన సేవలను ఆన్ చేయండి';

  @override
  String get allowLocationAccess => 'స్థాన ప్రాప్యతను అనుమతించండి';

  @override
  String get gpsRequiredDescription =>
      'మీ పికప్ స్థానాన్ని ఖచ్చితంగా గుర్తించడానికి మరియు సమీపంలోని డ్రైవర్లను త్వరగా కనుగొనడానికి మీ పరికర GPS అవసరం.';

  @override
  String get permissionRequiredDescription =>
      'మీ పికప్ స్థానాన్ని ఖచ్చితంగా గుర్తించడానికి మరియు సమీపంలోని డ్రైవర్లను త్వరగా కనుగొనడానికి దయచేసి మీ యాప్ సెట్టింగ్‌లలో స్థాన అనుమతులను అనుమతించండి.';

  @override
  String get goToLocationSettings => 'స్థాన సెట్టింగ్‌లకు వెళ్లండి';

  @override
  String get goToAppSettings => 'యాప్ సెట్టింగ్‌లకు వెళ్లండి';

  @override
  String get enterAddressManually =>
      'నేను నా చిరునామాను మాన్యువల్‌గా నమోదు చేస్తాను';

  @override
  String get taglineTitle => 'ఏదైనా తీసుకువెళ్లండి,\nఎప్పుడైనా.';

  @override
  String get taglineSubtitle =>
      'వేగవంతమైన డెలివరీ మీ వేలికొనలపై. స్మార్ట్‌గా షిఫ్ట్ చేయండి, మా ప్రీమియం ఫ్లీట్‌తో వేగంగా ముందుకు సాగండి.';

  @override
  String get twoWheelers => 'రెండు చక్రాలు';

  @override
  String get trucks => 'ట్రక్కులు';

  @override
  String get specialOffer => 'ప్రత్యేక ఆఫర్';

  @override
  String get promoBannerText => 'మీ మొదటి రైడ్‌పై\n20% తగ్గింపు పొందండి';

  @override
  String get whereIsYourPickup => 'మీ పికప్ ఎక్కడ ఉంది?';

  @override
  String get whereIsYourDrop => 'మీ డ్రాప్ ఎక్కడ ఉంది?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'మీ డ్రాప్ $index ఎక్కడ ఉంది?';
  }

  @override
  String get typeMinCharsToSearch =>
      'శోధన ప్రారంభించడానికి కనీసం 4 అక్షరాలు టైప్ చేయండి';

  @override
  String get selectOnMap => 'మ్యాప్‌పై ఎంచుకోండి';

  @override
  String get pinpointExactLocation => 'మీ ఖచ్చితమైన స్థానాన్ని గుర్తించండి';

  @override
  String get couldNotFindAddress =>
      'క్షమించండి, మాకు ఈ చిరునామా కనుగొనలేకపోయాము.';

  @override
  String get trySearchingNearbyLandmark =>
      'సమీపంలోని ల్యాండ్‌మార్క్, ప్రాంతం లేదా ప్రసిద్ధ స్థలం ఉపయోగించి శోధించడానికి ప్రయత్నించండి.';

  @override
  String get anErrorOccurred => 'ఒక లోపం సంభవించింది';

  @override
  String get locating => 'స్థానం కనుగొంటోంది...';

  @override
  String get fetchingDetails => 'వివరాలు పొందుతోంది...';

  @override
  String get confirmPickupLocation => 'పికప్ స్థానాన్ని నిర్ధారించండి';

  @override
  String get confirmDropLocation => 'డ్రాప్ స్థానాన్ని నిర్ధారించండి';

  @override
  String get houseShopApartment => 'ఇల్లు / దుకాణం / అపార్ట్‌మెంట్';

  @override
  String get sendersName => 'పంపేవారి పేరు';

  @override
  String get receiversName => 'స్వీకరించేవారి పేరు';

  @override
  String get pleaseEnterName => 'దయచేసి పేరు నమోదు చేయండి';

  @override
  String get sendersMobileNumber => 'పంపేవారి మొబైల్ నంబర్';

  @override
  String get receiversMobileNumber => 'స్వీకరించేవారి మొబైల్ నంబర్';

  @override
  String get enterValidTenDigitNumber =>
      'చెల్లుబాటు అయ్యే 10-అంకెల నంబర్‌ను నమోదు చేయండి';

  @override
  String get useMyMobileNumber => 'నా మొబైల్ నంబర్‌ను ఉపయోగించండి';

  @override
  String get saveAsOptional => 'ఇలా సేవ్ చేయండి (ఐచ్ఛికం):';

  @override
  String get home => 'ఇల్లు';

  @override
  String get shop => 'దుకాణం';

  @override
  String get confirmAndProceed => 'నిర్ధారించి కొనసాగండి';

  @override
  String get selectDropLocation => 'డ్రాప్ స్థానం ఎంచుకోండి';

  @override
  String get cannotSwapEmptyLocations =>
      'ఖాళీ స్థానాలను నింపిన స్థానాలతో మార్చలేరు.';

  @override
  String get proceedToVehicleSelection => 'వాహన ఎంపికకు కొనసాగండి';

  @override
  String get permissionRequired => 'అనుమతి అవసరం';

  @override
  String get contactsPermissionDescription =>
      'పంపేవారి ఫోన్ నంబర్‌ను సులభంగా ఎంచుకోవడానికి Reachu కి మీ పరిచయాలకు ప్రాప్యత అవసరం. దయచేసి యాప్ సెట్టింగ్‌లలో దీన్ని ప్రారంభించండి.';

  @override
  String get openSettings => 'సెట్టింగ్‌లు తెరవండి';

  @override
  String get selectContact => 'పరిచయం ఎంచుకోండి';

  @override
  String get contactPermissionDenied => 'పరిచయ అనుమతి తిరస్కరించబడింది.';

  @override
  String get myProfile => 'నా ప్రొఫైల్';

  @override
  String selfFormat(String name) {
    return '$name (స్వయం)';
  }

  @override
  String get deviceContacts => 'పరికర పరిచయాలు';

  @override
  String get rideHistory => 'రైడ్ చరిత్ర';

  @override
  String get transactions => 'లావాదేవీలు';

  @override
  String get noTransactionsFound => 'లావాదేవీలు కనుగొనబడలేదు';

  @override
  String get failedToLoadTransactions => 'లావాదేవీలు లోడ్ చేయడం విఫలమైంది';

  @override
  String get addMoney => 'డబ్బు జోడించండి';

  @override
  String get enterAmountToAdd => 'జోడించాల్సిన మొత్తం నమోదు చేయండి';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay తెరవడం విఫలమైంది: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'చెల్లింపు ఆర్డర్ సృష్టించడం విఫలమైంది: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'Reachu క్రెడిట్‌లకు ₹$amount విజయవంతంగా జోడించబడింది!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'చెల్లింపు ధృవీకరణ విఫలమైంది: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'చెల్లింపు విఫలమైంది ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'బాహ్య వాలెట్ ఎంచుకోబడింది: $walletName';
  }

  @override
  String get walletTopUp => 'వాలెట్ టాప్-అప్';

  @override
  String get payments => 'చెల్లింపులు';

  @override
  String get reachuCredits => 'Reachu క్రెడిట్‌లు';

  @override
  String get balance => 'బ్యాలెన్స్';

  @override
  String get errorLoadingBalance => 'బ్యాలెన్స్ లోడ్ చేయడంలో లోపం';

  @override
  String get availableBalance => 'అందుబాటులో ఉన్న బ్యాలెన్స్';

  @override
  String get totalExpenses => 'మొత్తం ఖర్చులు';

  @override
  String get recentTransactions => 'ఇటీవలి లావాదేవీలు';

  @override
  String get viewMore => 'మరిన్ని చూడండి';

  @override
  String get noTransactionsYet => 'ఇంకా లావాదేవీలు లేవు';

  @override
  String get booking => 'బుకింగ్';

  @override
  String get earning => 'సంపాదన';

  @override
  String get support => 'సహాయం';

  @override
  String get profile => 'ప్రొఫైల్';

  @override
  String get pendingWithdrawals => 'పెండింగ్ ఉపసంహరణలు';

  @override
  String get driverDebt => 'డ్రైవర్ రుణం';

  @override
  String minBalanceRequired(Object amount) {
    return 'కనీస బ్యాలెన్స్ అవసరం: ₹$amount';
  }

  @override
  String get insufficientBalance => 'ఉపసంహరణకు సరిపోని బ్యాలెన్స్';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'హెచ్చరిక: మీ అందుబాటులో ఉన్న బ్యాలెన్స్ కొత్త రైడ్‌లను అంగీకరించడానికి అవసరమైన కనీస పరిమితి (₹$amount) కంటే తక్కువగా ఉంది. దయచేసి మీ వాలెట్‌ను టాప్ అప్ చేయండి.';
  }

  @override
  String get moneyTransfer => 'డబ్బు బదిలీ చేయండి';

  @override
  String get withdrawMoney => 'డబ్బు ఉపసంహరించండి';

  @override
  String get manageAccounts => 'ఖాతాలను నిర్వహించండి';

  @override
  String get bankAccounts => 'బ్యాంక్ ఖాతాలు మరియు UPI';

  @override
  String get addAccount => 'చెల్లింపు పద్ధతి జోడించండి';

  @override
  String get addBankAccount => 'బ్యాంక్ ఖాతా జోడించండి';

  @override
  String get addUpiId => 'UPI ID జోడించండి';

  @override
  String get editBankAccount => 'బ్యాంక్ ఖాతాను సవరించండి';

  @override
  String get editUpiId => 'UPI ID సవరించండి';

  @override
  String get deleteAccount => 'ఖాతా తొలగించండి';

  @override
  String get deleteAccountConfirm =>
      'మీరు నిజంగా ఈ చెల్లింపు పద్ధతిని తొలగించాలనుకుంటున్నారా?';

  @override
  String get accountHolderName => 'ఖాతాదారుని పేరు';

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
  String get bankName => 'బ్యాంక్ పేరు';

  @override
  String get accountNumber => 'ఖాతా సంఖ్య';

  @override
  String get confirmAccountNumber => 'ఖాతా సంఖ్యను నిర్ధారించండి';

  @override
  String get ifscCode => 'IFSC కోడ్';

  @override
  String get upiId => 'UPI ID';

  @override
  String get fieldRequired => 'ఈ ఫీల్డ్ అవసరం';

  @override
  String get invalidUpi =>
      'చెల్లుబాటు అయ్యే UPI ID నమోదు చేయండి (ఉదా. name@upi)';

  @override
  String get invalidIfsc =>
      'చెల్లుబాటు అయ్యే 11-అక్షరాల IFSC కోడ్ నమోదు చేయండి';

  @override
  String get invalidAccountNumber => 'చెల్లుబాటు అయ్యే ఖాతా సంఖ్య నమోదు చేయండి';

  @override
  String get accountNumbersDoNotMatch => 'ఖాతా సంఖ్యలు సరిపోలడం లేదు';

  @override
  String get noPaymentMethods => 'ఇంకా చెల్లింపు పద్ధతులు జోడించబడలేదు';

  @override
  String get addPaymentMethodSubtitle =>
      'మీ సంపాదనను ఉపసంహరించడానికి బ్యాంక్ ఖాతా లేదా UPI ID జోడించండి';

  @override
  String get confirmTransfer => 'బదిలీని నిర్ధారించండి';

  @override
  String get transferAmount => 'బదిలీ మొత్తం';

  @override
  String get transferSuccess => 'ఉపసంహరణ అభ్యర్థన విజయవంతంగా సృష్టించబడింది';

  @override
  String get collectPayment => 'చెల్లింపు సేకరించండి';

  @override
  String get collectCash => 'నగదు సేకరించండి';

  @override
  String get cashCollectedSuccess => 'నగదు చెల్లింపు విజయవంతంగా పూర్తయింది!';

  @override
  String get displayQrCode => 'UPI QR కోడ్ చూపించండి';

  @override
  String get customerScanQr =>
      'చెల్లించడానికి ఈ QR కోడ్‌ను స్కాన్ చేయమని కస్టమర్‌ను అడగండి';

  @override
  String get generatingQr => 'QR కోడ్ సృష్టిస్తోంది...';

  @override
  String get selectPaymentMethod => 'చెల్లింపు పద్ధతిని ఎంచుకోండి';

  @override
  String get beneficiary => 'లబ్ధిదారుడు';

  @override
  String get completed => 'పూర్తయింది';

  @override
  String get pending => 'పెండింగ్';

  @override
  String get failed => 'విఫలమైంది';

  @override
  String get failedToLoadAccounts => 'చెల్లింపు పద్ధతులు లోడ్ చేయడం విఫలమైంది';

  @override
  String get accountDeletedSuccess =>
      'చెల్లింపు పద్ధతి విజయవంతంగా తొలగించబడింది';

  @override
  String get accountUpdatedSuccess =>
      'చెల్లింపు పద్ధతి విజయవంతంగా అప్‌డేట్ అయింది';

  @override
  String get accountAddedSuccess => 'చెల్లింపు పద్ధతి విజయవంతంగా జోడించబడింది';

  @override
  String get withdrawalAmount => 'ఉపసంహరణ మొత్తం';

  @override
  String get transferDestination => 'బదిలీ గమ్యస్థానం';

  @override
  String get enterAmount => 'మొత్తం నమోదు చేయండి';

  @override
  String get selected => 'ఎంచుకోబడింది';

  @override
  String get accountNumberLabel => 'ఖాతా సంఖ్య';

  @override
  String get errorLoadingAccounts => 'చెల్లింపు పద్ధతులు లోడ్ చేయడంలో లోపం';

  @override
  String get errorLoadingWallet => 'వాలెట్ సమాచారం లోడ్ చేయడంలో లోపం';

  @override
  String get enterAccountHolderName => 'ఖాతాదారుని పేరు నమోదు చేయండి';

  @override
  String get bankNameHint => 'ఉదా. స్టేట్ బ్యాంక్ ఆఫ్ ఇండియా';

  @override
  String get enterAccountNumber => 'ఖాతా సంఖ్య నమోదు చేయండి';

  @override
  String get confirmAccountNumberHint => 'ఖాతా సంఖ్యను నిర్ధారించండి';

  @override
  String get ifscCodeHint => 'ఉదా. SBIN0001234';

  @override
  String get upiIdHint => 'ఉదా. user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'మొత్తం ఛార్జీ';

  @override
  String get hideQrCode => 'QR దాచండి';

  @override
  String get nameMinLengthRequired => 'పేరు కనీసం 2 అక్షరాలు ఉండాలి';

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
    return 'ఆర్డర్ #$orderId';
  }

  @override
  String get personalInformation => 'వ్యక్తిగత సమాచారం';

  @override
  String get online => 'ఆన్‌లైన్';

  @override
  String get offline => 'ఆఫ్‌లైన్';

  @override
  String get onlineSuccessMessage =>
      'మీరు ఇప్పుడు ఆన్‌లైన్‌లో ఉన్నారు మరియు డ్యూటీలో ఉన్నారు.';

  @override
  String get offlineSuccessMessage => 'మీరు ఇప్పుడు ఆఫ్‌లైన్‌లో ఉన్నారు.';

  @override
  String get partnerSupport => 'పార్టనర్ సహాయం';

  @override
  String get partnerSupportSubtitle =>
      'నమస్కారం పార్టనర్! మీ రైడ్, చెల్లింపు లేదా ఖాతాపై సహాయం కావాలా? మేము 24/7 మీ సహాయం కోసం ఇక్కడ ఉన్నాము.';

  @override
  String get faqsAndHelp => 'తరచుగా అడిగే ప్రశ్నలు మరియు సహాయం';

  @override
  String get findQuickAnswers => 'త్వరిత సమాధానాలు కనుగొనండి';

  @override
  String get raiseSupportTicket => 'టికెట్ నమోదు చేయండి';

  @override
  String get contactSupportAgent => 'సహాయ ఏజెంట్‌ను సంప్రదించండి';

  @override
  String get recentTickets => 'ఇటీవలి టికెట్లు';

  @override
  String get noActiveTickets => 'క్రియాశీల సహాయ టికెట్లు లేవు';

  @override
  String get submitTicketDescription =>
      'మీకు ఏదైనా సమస్య వస్తే టికెట్ సమర్పించండి.';

  @override
  String get failedToLoadTickets => 'ఇటీవలి టికెట్లు లోడ్ చేయడం విఫలమైంది';

  @override
  String get contactSupport => 'సహాయాన్ని సంప్రదించండి';

  @override
  String get callUs => 'మాకు కాల్ చేయండి';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'మాతో చాట్ చేయండి';

  @override
  String get emailSupport => 'ఇమెయిల్ సహాయం';

  @override
  String get ticketStatusOpen => 'తెరిచి ఉంది';

  @override
  String get ticketStatusInProgress => 'పురోగతిలో ఉంది';

  @override
  String get ticketStatusResolved => 'పరిష్కరించబడింది';

  @override
  String get ticketStatusClosed => 'మూసివేయబడింది';

  @override
  String get ticketCategoryRideIssue => 'రైడ్ సమస్య';

  @override
  String get ticketCategoryPayment => 'చెల్లింపు';

  @override
  String get ticketCategoryAccount => 'ఖాతా';

  @override
  String get ticketCategoryDriverIssue => 'డ్రైవర్ సమస్య';

  @override
  String get ticketCategoryOther => 'ఇతర';

  @override
  String get failedToLoadDashboard => 'డాష్‌బోర్డ్ లోడ్ చేయడం విఫలమైంది';

  @override
  String get todaysEarnings => 'నేటి సంపాదన';

  @override
  String get cashCollected => 'సేకరించిన నగదు';

  @override
  String get onlinePayment => 'ఆన్‌లైన్ చెల్లింపు';

  @override
  String get todaysRideStatus => 'నేటి ఆర్డర్ స్థితి';

  @override
  String get totalRides => 'మొత్తం ఆర్డర్‌లు';

  @override
  String get cancelled => 'రద్దు చేయబడింది';

  @override
  String get dutyRating => 'డ్యూటీ రేటింగ్';

  @override
  String get noRidesFound => 'రైడ్‌లు కనుగొనబడలేదు';

  @override
  String get failedToLoadHistory => 'చరిత్ర లోడ్ చేయడం విఫలమైంది';

  @override
  String get all => 'అన్నీ';

  @override
  String get paymentPending => 'చెల్లింపు పెండింగ్';

  @override
  String stopsCount(int count) {
    return '$count స్టాప్‌లు';
  }

  @override
  String get rideDetails => 'రైడ్ వివరాలు';

  @override
  String get pickupLocation => 'పికప్ స్థానం';

  @override
  String get dropLocation => 'డ్రాప్ స్థానం';

  @override
  String stopLocation(int number) {
    return 'స్టాప్ $number';
  }

  @override
  String get fareBreakdown => 'ఛార్జీ వివరణ';

  @override
  String get netPayable => 'నికర చెల్లించవలసిన మొత్తం';

  @override
  String get paymentMethod => 'చెల్లింపు పద్ధతి';

  @override
  String get cash => 'నగదు';

  @override
  String get customerDetails => 'కస్టమర్ వివరాలు';

  @override
  String get callCustomer => 'కస్టమర్‌కు కాల్ చేయండి';

  @override
  String get goodsType => 'సరుకు రకం';

  @override
  String get quantity => 'పరిమాణం';

  @override
  String get weight => 'బరువు';

  @override
  String get distance => 'దూరం';

  @override
  String get duration => 'వ్యవధి';

  @override
  String get cancellationReason => 'రద్దు కారణం';

  @override
  String get routeTimeline => 'మార్గ కాలక్రమం';

  @override
  String get goodsSpecifications => 'సరుకు వివరాలు';

  @override
  String get vehicleMetadata => 'వాహన వివరాలు';

  @override
  String get description => 'వివరణ';

  @override
  String get estimatedWeight => 'అంచనా బరువు';

  @override
  String get vehicleName => 'వాహనం పేరు';

  @override
  String get vehicleNumber => 'వాహన నంబర్';

  @override
  String get modelColor => 'మోడల్ / రంగు';

  @override
  String get baseFare => 'ప్రాథమిక ఛార్జీ';

  @override
  String get weatherSurcharge => 'వాతావరణ అదనపు ఛార్జీ';

  @override
  String get trafficSurcharge => 'ట్రాఫిక్ అదనపు ఛార్జీ';

  @override
  String get promoDiscount => 'ప్రోమో తగ్గింపు';

  @override
  String get pickupSender => 'పికప్ (పంపేవారు)';

  @override
  String get dropoffRecipient => 'డ్రాప్‌ఆఫ్ (స్వీకరించేవారు)';

  @override
  String rideIdLabel(String id) {
    return 'రైడ్ ID: $id';
  }

  @override
  String get todaysTotalEarnings => 'నేటి మొత్తం సంపాదన';

  @override
  String get failedToLoadEarnings => 'సంపాదన గణాంకాలు లోడ్ చేయడం విఫలమైంది';

  @override
  String get noTransactionsRecorded => 'లావాదేవీలు నమోదు కాలేదు';

  @override
  String get mySupportTickets => 'నా సపోర్ట్ టికెట్లు';

  @override
  String get newTicket => 'కొత్త టికెట్';

  @override
  String get noSupportTicketsRaised => 'సపోర్ట్ టికెట్లు నమోదు కాలేదు';

  @override
  String get tapNewTicketSubtitle =>
      'సహాయం పొందడానికి \'కొత్త టికెట్\'పై ట్యాప్ చేయండి.';

  @override
  String get submitATicket => 'టికెట్ నమోదు చేయండి';

  @override
  String get explainIssueDetail =>
      'మీ సమస్యను వివరంగా వివరించండి. సహాయ ఏజెంట్ త్వరలో ధృవీకరించి ప్రతిస్పందిస్తారు.';

  @override
  String get categoryRequired => 'వర్గం*';

  @override
  String get selectIssueCategory => 'సమస్య వర్గాన్ని ఎంచుకోండి';

  @override
  String get pleaseSelectCategoryError => 'దయచేసి ఒక సమస్య వర్గాన్ని ఎంచుకోండి';

  @override
  String get subjectRequired => 'విషయం*';

  @override
  String get briefSummaryHint => 'సమస్య యొక్క సంక్షిప్త వివరణ';

  @override
  String get subjectRequiredError => 'విషయం తప్పనిసరి';

  @override
  String get subjectMinLengthError => 'విషయం కనీసం 5 అక్షరాలు ఉండాలి';

  @override
  String get descriptionRequired => 'వివరణ / సందేశం*';

  @override
  String get describeProblemHint => 'మీ సమస్యను వివరంగా వివరించండి...';

  @override
  String get messageRequiredError => 'సందేశ వివరణ తప్పనిసరి';

  @override
  String get messageMinLengthError => 'సందేశం కనీసం 10 అక్షరాలు ఉండాలి';

  @override
  String get submitTicket => 'టికెట్ సమర్పించండి';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get termsAndConditions => 'నిబంధనలు మరియు షరతులు';

  @override
  String get termsOfService => 'సేవా నిబంధనలు';

  @override
  String get iAgreeTo => 'నేను ';

  @override
  String get and => ' మరియు ';

  @override
  String get agreeSuffix => ' కి అంగీకరిస్తున్నాను';

  @override
  String get darkTheme => 'డార్క్ థీమ్';

  @override
  String get failedToLoadDetails => 'వివరాలు లోడ్ చేయడం విఫలమైంది';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>గోప్యతా విధానం</h1><p>Reachu డ్రైవర్ యాప్‌కు స్వాగతం. మీ గోప్యత మాకు ముఖ్యం. ఈ గోప్యతా విధానం మేము మీ వ్యక్తిగత సమాచారాన్ని ఎలా సేకరించి, ఉపయోగించి మరియు రక్షిస్తామో వివరిస్తుంది.</p><h2>1. మేము సేకరించే సమాచారం</h2><p>మేము మీ పేరు, ఫోన్ నంబర్, ఇమెయిల్, వాహన వివరాలు, క్రియాశీల ట్రిప్ సమయంలో స్థాన డేటా మరియు లావాదేవీ వివరాలను సేకరిస్తాము.</p><h2>2. మేము మీ సమాచారాన్ని ఎలా ఉపయోగిస్తాము</h2><p>డెలివరీ రైడ్‌లను సులభతరం చేయడానికి, చెల్లింపులను ప్రాసెస్ చేయడానికి, భద్రతను నిర్ధారించడానికి మరియు డ్రైవర్ అనుభవాన్ని మెరుగుపరచడానికి మేము మీ సమాచారాన్ని ఉపయోగిస్తాము.</p><h2>3. స్థాన ట్రాకింగ్</h2><p>సమీప డెలివరీ అభ్యర్థనలకు మిమ్మల్ని అనుసంధానించడానికి మరియు కస్టమర్లు ట్రిప్ పురోగతిని చూడటానికి డ్యూటీలో ఉన్నప్పుడు బ్యాక్‌గ్రౌండ్ స్థాన ప్రాప్యత అవసరం.</p><h2>4. డేటా భద్రత</h2><p>అనధికార ప్రాప్యత నుండి మీ వ్యక్తిగత సమాచారాన్ని రక్షించడానికి మేము కఠినమైన భద్రతా చర్యలను అమలు చేస్తాము.</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>నిబంధనలు మరియు షరతులు</h1><p>Reachu డ్రైవర్ అప్లికేషన్‌ను ఉపయోగించే ముందు దయచేసి ఈ నిబంధనలు మరియు షరతులను జాగ్రత్తగా చదవండి.</p><h2>1. నిబంధనల అంగీకారం</h2><p>Reachu లో డ్రైవర్ పార్టనర్‌గా నమోదు చేసుకోవడం ద్వారా, మీరు అన్ని వర్తించే నిబంధనలు, విధానాలు మరియు స్థానిక రవాణా నిబంధనలను పాటించడానికి అంగీకరిస్తున్నారు.</p><h2>2. డ్రైవర్ బాధ్యతలు</h2><p>డ్రైవర్ వద్ద చెల్లుబాటు అయ్యే డ్రైవింగ్ లైసెన్స్, ఖచ్చితమైన వాహన పత్రాలు ఉండాలి మరియు సురక్షితమైన, సమయానుకూల డెలివరీ సేవను అందించే బాధ్యత ఉండాలి.</p><h2>3. చెల్లింపు మరియు సంపాదన</h2><p>ఛార్జీలు ప్లాట్‌ఫారమ్ రేట్ల ప్రకారం నిర్ణయించబడతాయి మరియు వర్తించే ఛార్జీల తర్వాత మీ ధృవీకరించబడిన బ్యాంక్ ఖాతాకు బదిలీ చేయబడతాయి.</p><h2>4. ఖాతా నిలిపివేత</h2><p>మోసపూరిత కార్యకలాపాలు, భద్రతా ఉల్లంఘనలు లేదా విధానాన్ని పాటించని సందర్భంలో ఖాతాను నిలిపివేసే హక్కును Reachu కలిగి ఉంది.</p>';

  @override
  String get reviewAndRating => 'సమీక్ష మరియు రేటింగ్';

  @override
  String get noRatingsYet => 'ఇంకా రేటింగ్‌లు లేవు';

  @override
  String ratedByCustomers(int count) {
    return '$count కస్టమర్లచే రేటింగ్ ఇవ్వబడింది';
  }

  @override
  String get noReviewsYet => 'ఇంకా సమీక్షలు లేవు';

  @override
  String get noReviewsDesc => 'మీకు ఇంకా సమీక్షలు రాలేదు.';

  @override
  String get noCommentProvided => 'వ్యాఖ్య ఇవ్వబడలేదు';

  @override
  String get ratingExcellent => 'అద్భుతం';

  @override
  String get ratingGood => 'మంచిది';

  @override
  String get ratingAverage => 'సగటు';

  @override
  String get ratingBelowAverage => 'సగటు కంటే తక్కువ';

  @override
  String get ratingPoor => 'చెడ్డది';

  @override
  String get customer => 'కస్టమర్';

  @override
  String get noInternetConnection => 'ఇంటర్నెట్ కనెక్షన్ లేదు';

  @override
  String get checkInternetConnection =>
      'దయచేసి మీ ఇంటర్నెట్ కనెక్షన్‌ని తనిఖీ చేసి మళ్లీ ప్రయత్నించండి.';

  @override
  String get internetRestored => 'ఇంటర్నెట్ కనెక్షన్ పునరుద్ధరించబడింది';

  @override
  String get retryConnection => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get connectionTimedOut =>
      'కనెక్షన్ సమయం ముగిసింది. మళ్లీ ప్రయత్నిస్తోంది...';

  @override
  String get newUpdateAvailable =>
      'కొత్త అప్‌డేట్ అందుబాటులో ఉంది. కొనసాగడానికి యాప్‌ని అప్‌డేట్ చేయండి.';

  @override
  String get updateRequiredTitle => 'అప్‌డేట్ అవసరం';

  @override
  String updateRequiredDesc(String version) {
    return 'మీరు Reachu Driver యొక్క పాత వెర్షన్‌ను ఉపయోగిస్తున్నారు. రైడ్‌లను తీసుకోవడం కొనసాగించడానికి దయచేసి లేటెస్ట్ వెర్షన్‌కి అప్‌డేట్ చేయండి.';
  }

  @override
  String get updateNow => 'ఇప్పుడే అప్‌డేట్ చేయండి';

  @override
  String get updateLater => 'తర్వాత అప్‌డేట్ చేయండి';

  @override
  String get underMaintenanceTitle => 'నిర్వహణలో ఉంది';

  @override
  String get underMaintenanceDesc =>
      'మీకు మెరుగైన సేవ అందించడానికి మేము సిస్టమ్‌లను అప్‌డేట్ చేస్తున్నాము. దయచేసి కాసేపటి తర్వాత తనిఖీ చేయండి.';

  @override
  String estimatedBackIn(Object time) {
    return 'అంచనా సమయం $time';
  }

  @override
  String get backOnlineSoon => 'మేము త్వరలోనే ఆన్‌లైన్‌లోకి వస్తాము!';

  @override
  String installedVersion(String version) {
    return 'ఇన్‌స్టాల్ చేసిన వెర్షన్: $version';
  }

  @override
  String get couldNotOpenStore => 'యాప్ స్టోర్ తెరవడం సాధ్యం కాలేదు';

  @override
  String get detailedFareBreakdown => 'వివరమైన ఛార్జీల వివరాలు';

  @override
  String get checkPaymentStatus => 'చెల్లింపు స్థితిని తనిఖీ చేయండి';

  @override
  String get checkingStatus => 'స్థితిని తనిఖీ చేస్తోంది...';

  @override
  String get details => 'వివరాలు';

  @override
  String get hide => 'దాచు';

  @override
  String get collectCashFromCustomer => 'కస్టమర్ నుండి నగదు సేకరించండి';

  @override
  String get customerOnlineFareDue => 'కస్టమర్ ఆన్‌లైన్ ఛార్జీ బాకీ';

  @override
  String get reachuWalletCredit => 'Reachu వాలెట్ క్రెడిట్';

  @override
  String promoReimbursementNote(String amount) {
    return '*మీ వాలెట్‌కి జమ చేసిన Reachu ప్రోమో రియింబర్స్‌మెంట్ చేర్చబడింది';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*వేచి ఉండే సమయానికి వెయిటింగ్ ఛార్జ్ చేర్చబడింది';
  }

  @override
  String get paymentReceivedSuccess => 'చెల్లింపు విజయవంతంగా అందింది!';

  @override
  String get paymentStillPending => 'చెల్లింపు ఇంకా పెండింగ్‌లో ఉంది';

  @override
  String get waitingCharge => 'వెయిటింగ్ ఛార్జ్';

  @override
  String get rentalCharge => 'రెంటల్ ఛార్జ్';

  @override
  String get grossFare => 'మొత్తం ఛార్జీ';

  @override
  String get pendingDue => 'బాకీ ఉన్న మొత్తం';

  @override
  String get tollFee => 'టోల్ రుసుము';

  @override
  String get cancellationFee => 'రద్దు రుసుము';

  @override
  String get nightSurcharge => 'నైట్ సర్ఛార్జ్';

  @override
  String get surgeFee => 'సర్జ్ ఫీజు';

  @override
  String get taxAndFees => 'పన్ను & రుసుములు';

  @override
  String get platformFee => 'ప్లాట్‌ఫారమ్ ఫీజు';

  @override
  String get pressBackAgainToExit =>
      'యాప్ నుండి నిష్క్రమించడానికి మళ్లీ బ్యాక్ నొక్కండి';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'నిష్క్రమించే ముందు దయచేసి రైడ్‌ను అంగీకరించండి లేదా తిరస్కరించండి';

  @override
  String get cashPayment => 'నగదు చెల్లింపు';

  @override
  String get onlineQr => 'ఆన్‌లైన్ క్యూఆర్';

  @override
  String get collectCashInstructions =>
      'రైడ్‌ను ముగించే ముందు దయచేసి కస్టమర్ నుండి నగదు సేకరించండి.';

  @override
  String collectCashStep1(String amount) {
    return '1. కస్టమర్ నుండి సరైన నగదు మొత్తాన్ని సేకరించండి';
  }

  @override
  String get collectCashStep2 =>
      '2. కింద ఉన్న \'నగదు అందిందని ధృవీకరించు\' బటన్‌పై నొక్కండి';

  @override
  String get verifyingCashDeposit => 'నగదు జమను తనిఖీ చేస్తోంది...';

  @override
  String get pleaseHoldClosingRide =>
      'మేము రైడ్‌ను ముగించే వరకు దయచేసి నిరీక్షించండి';

  @override
  String get customerOnlinePayment => 'కస్టమర్ ఆన్‌లైన్ చెల్లింపు';

  @override
  String get generatingQrCode => 'క్యూఆర్ కోడ్ రూపొందించబడుతోంది...';

  @override
  String get failedToLoadQrCode => 'క్యూఆర్ కోడ్ లోడ్ చేయడం విఫలమైంది';

  @override
  String get scanQrToPay =>
      'ఆన్‌లైన్‌లో చెల్లించడానికి క్యూఆర్ కోడ్‌ను స్కాన్ చేయమని కస్టమర్‌ను కోరండి';

  @override
  String get pinchToZoomQr => 'క్యూఆర్ కోడ్‌ను జూమ్ చేయడానికి పించ్ చేయండి';

  @override
  String get tapToFullScreen =>
      'ఫుల్ స్క్రీన్ వ్యూ కోసం క్యూఆర్ కోడ్‌పై నొక్కండి';

  @override
  String get awaitingCustomerPayment =>
      'కస్టమర్ చెల్లింపు కోసం వేచి చూస్తోంది...';

  @override
  String get confirmCashReceived => 'నగదు అందిందని ధృవీకరించు';

  @override
  String get paymentReceivedToast =>
      'చెల్లింపు అందింది! రైడ్ ముగించబడుతోంది...';

  @override
  String get invalidOrderIdError => 'చెల్లని ఆర్డర్ ఐడీ';

  @override
  String get cashPaymentRecordedWaiting =>
      'నగదు చెల్లింపు నమోదైంది. రైడ్ ముగించబడుతోంది...';

  @override
  String get paymentReceivedTitle => 'చెల్లింపు అందింది';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount మొత్తం విజయవంతంగా చెల్లించబడింది!';
  }

  @override
  String get rideClosedReturningHome =>
      'రైడ్ ముగిసింది. హోమ్‌కి తిరిగి వెళ్తోంది...';

  @override
  String get fragileGoods => 'సున్నితమైన వస్తువులు';

  @override
  String get yes => 'అవును';

  @override
  String get no => 'కాదు';

  @override
  String contactLabel(String name, Object phone) {
    return 'సందర్శించండి: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'అనుమతులు అవసరం';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver ఆఫ్‌లైన్ మరియు ఆన్‌లైన్‌లో కచ్చితంగా పనిచేయడానికి కింది అనుమతులు అవసరం.';

  @override
  String get locationAlwaysTitle => 'లోకేషన్ (ఎల్లప్పుడూ అనుమతించు)';

  @override
  String get locationAlwaysSubtitle =>
      'ఆర్డర్ డిస్పాచ్ మరియు బ్యాక్‌గ్రౌండ్ రైడ్ ట్రాకింగ్ కోసం అవసరం.';

  @override
  String get batteryUnrestrictedTitle => 'బ్యాటరీ ఆప్టిమైజేషన్ (అపరిమిత)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'బ్యాక్‌గ్రౌండ్ సాకెట్ కనెక్షన్ మరియు రైడ్ అలర్ట్‌లు నిలిచిపోకుండా చూస్తుంది.';

  @override
  String get notificationsTitle => 'నోటిఫికేషన్‌లు';

  @override
  String get notificationsSubtitle =>
      'కొత్త రైడ్ అభ్యర్థనలు మరియు ఆర్డర్ అలర్ట్‌ల కోసం అవసరం.';

  @override
  String get displayOverAppsTitle => 'ఇతర యాప్‌లపై ప్రదర్శించు';

  @override
  String get displayOverAppsSubtitle =>
      'ఫుల్-స్క్రీన్ ఆర్డర్ పాప్‌అప్‌ల కోసం అవసరం.';

  @override
  String get locationUsedInBackground => 'బ్యాక్‌గ్రౌండ్‌లో ఉపయోగించే లోకేషన్';

  @override
  String get backgroundLocationDisclosureBody =>
      'యాప్ మూసివేసినా లేదా ఉపయోగంలో లేకపోయినా ReachuDriver లోకేషన్ డేటాను సేకరిస్తుంది.\n\nఇది దీని కోసం ఉపయోగించబడుతుంది:\n  • లోడర్‌లు/వినియోగదారులతో మీ ప్రత్యక్ష స్థితిని భాగస్వామ్యం చేయడం\n  • మీకు దగ్గరలోని బుకింగ్ అభ్యర్థనలను కేటాయించడం\n  • మీరు డ్యూటీలో ఉన్నప్పుడు డిస్పాచ్ సిస్టమ్‌ను అప్‌డేట్ చేయడం\n\nమీరు ఆన్‌లైన్‌లో ఉన్నప్పుడు మాత్రమే లోకేషన్ సేకరణ పనిచేస్తుంది.';

  @override
  String get changeInAppSettingsNote =>
      'మీరు యాప్ సెట్టింగ్‌లలో దీన్ని ఎప్పుడైనా మార్చవచ్చు.';

  @override
  String get iUnderstandContinue => 'నాకు అర్థమైంది — కొనసాగించు';

  @override
  String get notNow => 'ఇప్పుడు వద్దు';

  @override
  String get lowWalletBalance => 'తక్కువ వాలెట్ బ్యాలెన్స్';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ఆర్డర్‌లను స్వీకరించడానికి దయచేసి కనీసం ₹$limit వాలెట్ బ్యాలెన్స్‌ను నిర్వహించండి. ఆర్డర్‌లను పొందడం కొనసాగించడానికి మీ వాలెట్‌ను టాప్ అప్ చేయండి.';
  }

  @override
  String get minimumRequiredBalance => 'కనీస అవసరమైన బ్యాలెన్స్';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ఆర్డర్‌లను స్వీకరించడానికి దయచేసి మీ వాలెట్‌లో కనీసం ₹$limit నిర్వహించండి.';
  }

  @override
  String get activeForRides => 'రైడ్‌ల కోసం క్రియాశీలంగా ఉంది';

  @override
  String get lowBalanceStatus => 'తక్కువ బ్యాలెన్స్';

  @override
  String get minimumLimit => 'కనీస పరిమితి';

  @override
  String get eShramBenefitsTitle => 'ఈ-శ్రమ్ ప్రయోజనాలు';

  @override
  String get govtScheme => 'ప్రభుత్వ పథకం';

  @override
  String get eShramSubHeader => 'ప్రభుత్వ ఇన్సూరెన్స్ & పెన్షన్ పథకం';

  @override
  String get eShramDescription =>
      'గిగ్ వర్కర్ల కోసం ప్రమాద బీమా కవర్ మరియు సామాజిక భద్రతా ప్రయోజనాల కోసం అధికారిక ప్రభుత్వ ఈ-శ్రమ్ పోర్టల్‌లో నమోదు చేసుకోండి.';

  @override
  String get registerOnEShramPortal => 'ఈ-శ్రమ్ పోర్టల్‌లో నమోదు చేసుకోండి';

  @override
  String get eShramGovtBenefitsMenu => 'ఈ-శ్రమ్ ప్రభుత్వ ప్రయోజనాలు';

  @override
  String get dismiss => 'రద్దు చేయి';

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
