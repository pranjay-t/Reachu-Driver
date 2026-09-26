// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get editProfile => 'প্রোফাইল সম্পাদনা করুন';

  @override
  String get logout => 'লগআউট';

  @override
  String get language => 'ভাষা';

  @override
  String get selectLanguage => 'ভাষা নির্বাচন করুন';

  @override
  String get english => 'English (ইংরেজি)';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'যানবাহন নির্বাচন করুন';

  @override
  String get selectAVehicle => 'একটি যানবাহন নির্বাচন করুন';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName দিয়ে এগিয়ে যান';
  }

  @override
  String get addStop => 'স্টপ যোগ করুন';

  @override
  String get editLocations => 'অবস্থান সম্পাদনা করুন';

  @override
  String get noPickupLocationSet => 'কোনো পিকআপ অবস্থান সেট করা নেই';

  @override
  String get noDropLocationSet => 'কোনো ড্রপ অবস্থান সেট করা নেই';

  @override
  String get addDrop => 'ড্রপ যোগ করুন';

  @override
  String get errorLoadingVehicles => 'যানবাহন লোড করতে ত্রুটি';

  @override
  String get selectGoodsType => 'পণ্যের ধরন নির্বাচন করুন';

  @override
  String get whatAreYouShipping => 'আপনি কী পাঠাচ্ছেন?';

  @override
  String get chooseCategoryBestMatches =>
      'যে বিভাগটি আপনার পণ্যের সাথে সবচেয়ে মিলে যায় তা বেছে নিন';

  @override
  String get editGoodsDetails => 'পণ্যের বিবরণ সম্পাদনা করুন';

  @override
  String get weightKgMax90 => 'ওজন (কেজি) - সর্বোচ্চ ৯০ কেজি';

  @override
  String get weightInvalidError => 'ওজন ১ থেকে ৯০ কেজির মধ্যে হতে হবে';

  @override
  String get numberOfPackages => 'প্যাকেজের সংখ্যা';

  @override
  String get worthValueRupees => 'মূল্য / দাম (টাকা)';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get confirmGoodsDetails => 'পণ্যের বিবরণ নিশ্চিত করুন';

  @override
  String get failedToLoadCategories => 'বিভাগ লোড করতে ব্যর্থ';

  @override
  String get disclaimerTitle => 'দাবিত্যাগ';

  @override
  String get disclaimerText =>
      'দাবিত্যাগ: আমি ঘোষণা করছি যে পরিবহনকৃত পণ্য অ-বিপজ্জনক, বৈধ এবং নির্বাচিত বিভাগের। নিষিদ্ধ পণ্য পরিবহনের জন্য কোম্পানি দায়ী নয়। ওজন যানবাহনের সর্বোচ্চ ধারণক্ষমতা অতিক্রম করা উচিত নয়।';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight কেজি • $packages প্যাকেজ • ₹$worth';
  }

  @override
  String get welcome => 'স্বাগতম';

  @override
  String get enterMobileNumberToContinue =>
      'চালিয়ে যেতে আপনার মোবাইল নম্বর লিখুন';

  @override
  String get mobileNumber => 'মোবাইল নম্বর';

  @override
  String get agreeTermsText =>
      'আমি পরিষেবার শর্তাবলী এবং গোপনীয়তা নীতিতে সম্মত';

  @override
  String get sendOtp => 'ওটিপি পাঠান';

  @override
  String get verifyOtp => 'ওটিপি যাচাই করুন';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber-এ পাঠানো ৪-অঙ্কের কোড লিখুন';
  }

  @override
  String get verifyAndContinue => 'যাচাই করুন এবং চালিয়ে যান';

  @override
  String resendInSeconds(Object count) {
    return '$count সেকেন্ডে আবার পাঠান';
  }

  @override
  String get resendOtp => 'ওটিপি আবার পাঠান';

  @override
  String get changeNumber => 'নম্বর পরিবর্তন করুন';

  @override
  String get mobileNumberRequired => 'মোবাইল নম্বর প্রয়োজন';

  @override
  String get enterValidMobileNumber => 'একটি বৈধ ১০-অঙ্কের মোবাইল নম্বর লিখুন';

  @override
  String get enterCompleteOtpError =>
      'অনুগ্রহ করে সম্পূর্ণ ৪-অঙ্কের ওটিপি লিখুন';

  @override
  String get otpResentSuccess => 'ওটিপি সফলভাবে আবার পাঠানো হয়েছে';

  @override
  String get fullName => 'পূর্ণ নাম';

  @override
  String get fullNameRequired => 'পূর্ণ নাম প্রয়োজন';

  @override
  String get nameMinLengthError => 'নাম কমপক্ষে ২ অক্ষরের হতে হবে';

  @override
  String get email => 'ইমেইল';

  @override
  String get emailRequired => 'ইমেইল প্রয়োজন';

  @override
  String get enterValidEmail => 'একটি বৈধ ইমেইল ঠিকানা লিখুন';

  @override
  String get referralCode => 'রেফারেল কোড';

  @override
  String get enterReferralCodeOptional => 'রেফারেল কোড লিখুন (ঐচ্ছিক)';

  @override
  String get createAccount => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String get completeProfileToGetStarted =>
      'শুরু করতে আপনার প্রোফাইল সম্পূর্ণ করুন';

  @override
  String get profileUpdatedSuccess => 'প্রোফাইল সফলভাবে আপডেট হয়েছে!';

  @override
  String get updateProfilePicture => 'প্রোফাইল ছবি আপডেট করুন';

  @override
  String get camera => 'ক্যামেরা';

  @override
  String get gallery => 'গ্যালারি';

  @override
  String get cancel => 'বাতিল';

  @override
  String get dateOfBirthOptional => 'জন্ম তারিখ (ঐচ্ছিক)';

  @override
  String get gender => 'লিঙ্গ';

  @override
  String get male => 'পুরুষ';

  @override
  String get female => 'মহিলা';

  @override
  String get other => 'অন্যান্য';

  @override
  String get updateProfile => 'প্রোফাইল আপডেট করুন';

  @override
  String profileUpdateFailed(Object error) {
    return 'প্রোফাইল আপডেট করতে ব্যর্থ: $error';
  }

  @override
  String get goodMorning => 'শুভ সকাল,';

  @override
  String get goodAfternoon => 'শুভ দুপুর,';

  @override
  String get goodEvening => 'শুভ সন্ধ্যা,';

  @override
  String get pickupFrom => 'এখান থেকে পিকআপ';

  @override
  String get currentLocation => 'বর্তমান অবস্থান';

  @override
  String get fetchingLocation => 'অবস্থান আনা হচ্ছে...';

  @override
  String get locationServicesDisabled => 'অবস্থান সেবা নিষ্ক্রিয়';

  @override
  String get locationPermissionNeeded => 'অবস্থান অনুমতি প্রয়োজন';

  @override
  String get locationAccessBlocked => 'অবস্থান অ্যাক্সেস অবরুদ্ধ';

  @override
  String get couldNotFetchLocation => 'অবস্থান আনা যায়নি';

  @override
  String get enable => 'সক্রিয় করুন';

  @override
  String get allow => 'অনুমতি দিন';

  @override
  String get settings => 'সেটিংস';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get turnOnLocationServices => 'অবস্থান সেবা চালু করুন';

  @override
  String get allowLocationAccess => 'অবস্থান অ্যাক্সেসের অনুমতি দিন';

  @override
  String get gpsRequiredDescription =>
      'আপনার পিকআপ অবস্থান সঠিকভাবে নির্দেশ করতে এবং কাছাকাছি ড্রাইভারদের দ্রুত খুঁজে পেতে আমাদের আপনার ডিভাইস জিপিএস প্রয়োজন।';

  @override
  String get permissionRequiredDescription =>
      'অনুগ্রহ করে আপনার অ্যাপ সেটিংসে অবস্থান অনুমতি দিন যাতে আমরা আপনার পিকআপ অবস্থান সঠিকভাবে নির্দেশ করতে এবং কাছাকাছি ড্রাইভারদের দ্রুত খুঁজে পেতে পারি।';

  @override
  String get goToLocationSettings => 'অবস্থান সেটিংসে যান';

  @override
  String get goToAppSettings => 'অ্যাপ সেটিংসে যান';

  @override
  String get enterAddressManually => 'আমি আমার ঠিকানা ম্যানুয়ালি লিখব';

  @override
  String get taglineTitle => 'যা খুশি নিয়ে যান,\nযখন খুশি।';

  @override
  String get taglineSubtitle =>
      'দ্রুত ডেলিভারি আপনার আঙুলের ডগায়। স্মার্টভাবে স্থানান্তর করুন, আমাদের প্রিমিয়াম বহরের সাথে দ্রুত এগিয়ে যান।';

  @override
  String get twoWheelers => 'দুই চাকার';

  @override
  String get trucks => 'ট্রাক';

  @override
  String get specialOffer => 'বিশেষ অফার';

  @override
  String get promoBannerText => 'আপনার প্রথম রাইডে\n২০% ছাড় পান';

  @override
  String get whereIsYourPickup => 'আপনার পিকআপ কোথায়?';

  @override
  String get whereIsYourDrop => 'আপনার ড্রপ কোথায়?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'আপনার ড্রপ $index কোথায়?';
  }

  @override
  String get typeMinCharsToSearch =>
      'খোঁজা শুরু করতে কমপক্ষে ৪ অক্ষর টাইপ করুন';

  @override
  String get selectOnMap => 'মানচিত্রে নির্বাচন করুন';

  @override
  String get pinpointExactLocation => 'আপনার সঠিক অবস্থান নির্দেশ করুন';

  @override
  String get couldNotFindAddress => 'দুঃখিত, আমরা এই ঠিকানাটি পাইনি।';

  @override
  String get trySearchingNearbyLandmark =>
      'কাছাকাছি কোনো ল্যান্ডমার্ক, এলাকা বা জনপ্রিয় স্থান দিয়ে খোঁজার চেষ্টা করুন।';

  @override
  String get anErrorOccurred => 'একটি ত্রুটি ঘটেছে';

  @override
  String get locating => 'অবস্থান খোঁজা হচ্ছে...';

  @override
  String get fetchingDetails => 'বিবরণ আনা হচ্ছে...';

  @override
  String get confirmPickupLocation => 'পিকআপ অবস্থান নিশ্চিত করুন';

  @override
  String get confirmDropLocation => 'ড্রপ অবস্থান নিশ্চিত করুন';

  @override
  String get houseShopApartment => 'বাড়ি / দোকান / অ্যাপার্টমেন্ট';

  @override
  String get sendersName => 'প্রেরকের নাম';

  @override
  String get receiversName => 'প্রাপকের নাম';

  @override
  String get pleaseEnterName => 'অনুগ্রহ করে নাম লিখুন';

  @override
  String get sendersMobileNumber => 'প্রেরকের মোবাইল নম্বর';

  @override
  String get receiversMobileNumber => 'প্রাপকের মোবাইল নম্বর';

  @override
  String get enterValidTenDigitNumber => 'একটি বৈধ ১০-অঙ্কের নম্বর লিখুন';

  @override
  String get useMyMobileNumber => 'আমার মোবাইল নম্বর ব্যবহার করুন';

  @override
  String get saveAsOptional => 'এইভাবে সংরক্ষণ করুন (ঐচ্ছিক):';

  @override
  String get home => 'বাড়ি';

  @override
  String get shop => 'দোকান';

  @override
  String get confirmAndProceed => 'নিশ্চিত করুন এবং এগিয়ে যান';

  @override
  String get selectDropLocation => 'ড্রপ অবস্থান নির্বাচন করুন';

  @override
  String get cannotSwapEmptyLocations =>
      'খালি অবস্থানগুলিকে ভরা অবস্থানের সাথে বদলানো যাবে না।';

  @override
  String get proceedToVehicleSelection => 'যানবাহন নির্বাচনে এগিয়ে যান';

  @override
  String get permissionRequired => 'অনুমতি প্রয়োজন';

  @override
  String get contactsPermissionDescription =>
      'প্রেরকের ফোন নম্বর সহজে বেছে নিতে গতি লোডারের আপনার পরিচিতিতে অ্যাক্সেস প্রয়োজন। অনুগ্রহ করে অ্যাপ সেটিংসে এটি সক্রিয় করুন।';

  @override
  String get openSettings => 'সেটিংস খুলুন';

  @override
  String get selectContact => 'পরিচিতি নির্বাচন করুন';

  @override
  String get contactPermissionDenied =>
      'পরিচিতি অনুমতি প্রত্যাখ্যান করা হয়েছে।';

  @override
  String get myProfile => 'আমার প্রোফাইল';

  @override
  String selfFormat(String name) {
    return '$name (নিজে)';
  }

  @override
  String get deviceContacts => 'ডিভাইস পরিচিতি';

  @override
  String get rideHistory => 'রাইডের ইতিহাস';

  @override
  String get transactions => 'লেনদেন';

  @override
  String get noTransactionsFound => 'কোনো লেনদেন পাওয়া যায়নি';

  @override
  String get failedToLoadTransactions => 'লেনদেন লোড করতে ব্যর্থ';

  @override
  String get addMoney => 'টাকা যোগ করুন';

  @override
  String get enterAmountToAdd => 'যোগ করার জন্য পরিমাণ লিখুন';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay খুলতে ব্যর্থ: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'পেমেন্ট অর্ডার তৈরি করতে ব্যর্থ: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'গতি ক্রেডিটে ₹$amount সফলভাবে যোগ করা হয়েছে!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'পেমেন্ট যাচাই ব্যর্থ: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'পেমেন্ট ব্যর্থ ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'বহিরাগত ওয়ালেট নির্বাচিত: $walletName';
  }

  @override
  String get walletTopUp => 'ওয়ালেট টপ-আপ';

  @override
  String get payments => 'পেমেন্ট';

  @override
  String get reachuCredits => 'গতি ক্রেডিট';

  @override
  String get balance => 'ব্যালেন্স';

  @override
  String get errorLoadingBalance => 'ব্যালেন্স লোড করতে ত্রুটি';

  @override
  String get availableBalance => 'উপলব্ধ ব্যালেন্স';

  @override
  String get totalExpenses => 'মোট খরচ';

  @override
  String get recentTransactions => 'সাম্প্রতিক লেনদেন';

  @override
  String get viewMore => 'আরও দেখুন';

  @override
  String get noTransactionsYet => 'এখনও কোনো লেনদেন নেই';

  @override
  String get booking => 'বুকিং';

  @override
  String get earning => 'আয়';

  @override
  String get support => 'সহায়তা';

  @override
  String get profile => 'প্রোফাইল';

  @override
  String get pendingWithdrawals => 'মুলতুবি উত্তোলন';

  @override
  String get driverDebt => 'ড্রাইভার ঋণ';

  @override
  String minBalanceRequired(Object amount) {
    return 'ন্যূনতম ব্যালেন্স প্রয়োজন: ₹$amount';
  }

  @override
  String get insufficientBalance => 'উত্তোলনের জন্য অপর্যাপ্ত ব্যালেন্স';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'সতর্কতা: আপনার উপলব্ধ ব্যালেন্স নতুন রাইড গ্রহণের জন্য প্রয়োজনীয় ন্যূনতম সীমা (₹$amount) এর নিচে। অনুগ্রহ করে আপনার ওয়ালেট টপ আপ করুন।';
  }

  @override
  String get moneyTransfer => 'টাকা স্থানান্তর করুন';

  @override
  String get withdrawMoney => 'টাকা উত্তোলন করুন';

  @override
  String get manageAccounts => 'অ্যাকাউন্ট পরিচালনা করুন';

  @override
  String get bankAccounts => 'ব্যাংক অ্যাকাউন্ট এবং UPI';

  @override
  String get addAccount => 'পেমেন্ট পদ্ধতি যোগ করুন';

  @override
  String get addBankAccount => 'ব্যাংক অ্যাকাউন্ট যোগ করুন';

  @override
  String get addUpiId => 'UPI আইডি যোগ করুন';

  @override
  String get editBankAccount => 'ব্যাংক অ্যাকাউন্ট সম্পাদনা করুন';

  @override
  String get editUpiId => 'UPI আইডি সম্পাদনা করুন';

  @override
  String get deleteAccount => 'অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountConfirm =>
      'আপনি কি নিশ্চিত যে এই পেমেন্ট পদ্ধতি মুছতে চান?';

  @override
  String get accountHolderName => 'অ্যাকাউন্ট ধারকের নাম';

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
  String get bankName => 'ব্যাংকের নাম';

  @override
  String get accountNumber => 'অ্যাকাউন্ট নম্বর';

  @override
  String get confirmAccountNumber => 'অ্যাকাউন্ট নম্বর নিশ্চিত করুন';

  @override
  String get ifscCode => 'IFSC কোড';

  @override
  String get upiId => 'UPI আইডি';

  @override
  String get fieldRequired => 'এই ক্ষেত্রটি প্রয়োজন';

  @override
  String get invalidUpi => 'একটি বৈধ UPI আইডি লিখুন (যেমন name@upi)';

  @override
  String get invalidIfsc => 'একটি বৈধ ১১-অঙ্কের IFSC কোড লিখুন';

  @override
  String get invalidAccountNumber => 'একটি বৈধ অ্যাকাউন্ট নম্বর লিখুন';

  @override
  String get accountNumbersDoNotMatch => 'অ্যাকাউন্ট নম্বর মিলছে না';

  @override
  String get noPaymentMethods => 'এখনও কোনো পেমেন্ট পদ্ধতি যোগ করা হয়নি';

  @override
  String get addPaymentMethodSubtitle =>
      'আপনার আয় উত্তোলনের জন্য একটি ব্যাংক অ্যাকাউন্ট বা UPI আইডি যোগ করুন';

  @override
  String get confirmTransfer => 'স্থানান্তর নিশ্চিত করুন';

  @override
  String get transferAmount => 'স্থানান্তরের পরিমাণ';

  @override
  String get transferSuccess => 'উত্তোলনের অনুরোধ সফলভাবে তৈরি হয়েছে';

  @override
  String get collectPayment => 'পেমেন্ট সংগ্রহ করুন';

  @override
  String get collectCash => 'নগদ সংগ্রহ করুন';

  @override
  String get cashCollectedSuccess => 'নগদ পেমেন্ট সফলভাবে সম্পন্ন হয়েছে!';

  @override
  String get displayQrCode => 'UPI QR কোড দেখান';

  @override
  String get customerScanQr =>
      'গ্রাহককে পেমেন্ট করতে এই QR কোড স্ক্যান করতে বলুন';

  @override
  String get generatingQr => 'QR কোড তৈরি হচ্ছে...';

  @override
  String get selectPaymentMethod => 'পেমেন্ট পদ্ধতি নির্বাচন করুন';

  @override
  String get beneficiary => 'সুবিধাভোগী';

  @override
  String get completed => 'সম্পন্ন';

  @override
  String get pending => 'মুলতুবি';

  @override
  String get failed => 'ব্যর্থ';

  @override
  String get failedToLoadAccounts => 'পেমেন্ট পদ্ধতি লোড করতে ব্যর্থ';

  @override
  String get accountDeletedSuccess => 'পেমেন্ট পদ্ধতি সফলভাবে মুছে ফেলা হয়েছে';

  @override
  String get accountUpdatedSuccess => 'পেমেন্ট পদ্ধতি সফলভাবে আপডেট হয়েছে';

  @override
  String get accountAddedSuccess => 'পেমেন্ট পদ্ধতি সফলভাবে যোগ করা হয়েছে';

  @override
  String get withdrawalAmount => 'উত্তোলনের পরিমাণ';

  @override
  String get transferDestination => 'স্থানান্তরের গন্তব্য';

  @override
  String get enterAmount => 'পরিমাণ লিখুন';

  @override
  String get selected => 'নির্বাচিত';

  @override
  String get accountNumberLabel => 'অ্যাকাউন্ট নম্বর';

  @override
  String get errorLoadingAccounts => 'পেমেন্ট পদ্ধতি লোড করতে ত্রুটি';

  @override
  String get errorLoadingWallet => 'ওয়ালেট তথ্য লোড করতে ত্রুটি';

  @override
  String get enterAccountHolderName => 'অ্যাকাউন্ট ধারকের নাম লিখুন';

  @override
  String get bankNameHint => 'যেমন স্টেট ব্যাংক অফ ইন্ডিয়া';

  @override
  String get enterAccountNumber => 'অ্যাকাউন্ট নম্বর লিখুন';

  @override
  String get confirmAccountNumberHint => 'অ্যাকাউন্ট নম্বর নিশ্চিত করুন';

  @override
  String get ifscCodeHint => 'যেমন SBIN0001234';

  @override
  String get upiIdHint => 'যেমন user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'মোট ভাড়া';

  @override
  String get hideQrCode => 'QR লুকান';

  @override
  String get nameMinLengthRequired => 'নাম কমপক্ষে ২ অক্ষরের হতে হবে';

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
    return 'অর্ডার #$orderId';
  }

  @override
  String get personalInformation => 'ব্যক্তিগত তথ্য';

  @override
  String get online => 'অনলাইন';

  @override
  String get offline => 'অফলাইন';

  @override
  String get onlineSuccessMessage => 'আপনি এখন অনলাইন এবং ডিউটিতে আছেন।';

  @override
  String get offlineSuccessMessage => 'আপনি এখন অফলাইন আছেন।';

  @override
  String get partnerSupport => 'পার্টনার সহায়তা';

  @override
  String get partnerSupportSubtitle =>
      'নমস্কার পার্টনার! আপনার রাইড, পেমেন্ট বা অ্যাকাউন্টে সাহায্য লাগবে? আমরা আপনার ২৪/৭ সহায়তার জন্য এখানে আছি।';

  @override
  String get faqsAndHelp => 'প্রশ্নোত্তর এবং সহায়তা';

  @override
  String get findQuickAnswers => 'দ্রুত উত্তর খুঁজুন';

  @override
  String get raiseSupportTicket => 'টিকেট দাখিল করুন';

  @override
  String get contactSupportAgent => 'সহায়তা এজেন্টের সাথে যোগাযোগ করুন';

  @override
  String get recentTickets => 'সাম্প্রতিক টিকেট';

  @override
  String get noActiveTickets => 'কোনো সক্রিয় সহায়তা টিকেট নেই';

  @override
  String get submitTicketDescription => 'সমস্যা হলে টিকেট জমা দিন।';

  @override
  String get failedToLoadTickets => 'সাম্প্রতিক টিকেট লোড করতে ব্যর্থ';

  @override
  String get contactSupport => 'সহায়তার সাথে যোগাযোগ করুন';

  @override
  String get callUs => 'আমাদের কল করুন';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'আমাদের সাথে চ্যাট করুন';

  @override
  String get emailSupport => 'ইমেইল সহায়তা';

  @override
  String get ticketStatusOpen => 'খোলা';

  @override
  String get ticketStatusInProgress => 'চলমান';

  @override
  String get ticketStatusResolved => 'সমাধান হয়েছে';

  @override
  String get ticketStatusClosed => 'বন্ধ';

  @override
  String get ticketCategoryRideIssue => 'রাইডের সমস্যা';

  @override
  String get ticketCategoryPayment => 'পেমেন্ট';

  @override
  String get ticketCategoryAccount => 'অ্যাকাউন্ট';

  @override
  String get ticketCategoryDriverIssue => 'ড্রাইভারের সমস্যা';

  @override
  String get ticketCategoryOther => 'অন্যান্য';

  @override
  String get failedToLoadDashboard => 'ড্যাশবোর্ড লোড করতে ব্যর্থ';

  @override
  String get todaysEarnings => 'আজকের আয়';

  @override
  String get cashCollected => 'নগদ সংগৃহীত';

  @override
  String get onlinePayment => 'অনলাইন পেমেন্ট';

  @override
  String get todaysRideStatus => 'আজকের অর্ডার স্ট্যাটাস';

  @override
  String get totalRides => 'মোট অর্ডার';

  @override
  String get cancelled => 'বাতিল';

  @override
  String get dutyRating => 'ডিউটি রেটিং';

  @override
  String get noRidesFound => 'কোনো রাইড পাওয়া যায়নি';

  @override
  String get failedToLoadHistory => 'ইতিহাস লোড করতে ব্যর্থ';

  @override
  String get all => 'সব';

  @override
  String get paymentPending => 'পেমেন্ট মুলতুবি';

  @override
  String stopsCount(int count) {
    return '$count স্টপ';
  }

  @override
  String get rideDetails => 'রাইডের বিবরণ';

  @override
  String get pickupLocation => 'পিকআপ অবস্থান';

  @override
  String get dropLocation => 'ড্রপ অবস্থান';

  @override
  String stopLocation(int number) {
    return 'স্টপ $number';
  }

  @override
  String get fareBreakdown => 'ভাড়ার বিবরণ';

  @override
  String get netPayable => 'মোট প্রদেয় পরিমাণ';

  @override
  String get paymentMethod => 'পেমেন্টের পদ্ধতি';

  @override
  String get cash => 'নগদ';

  @override
  String get customerDetails => 'গ্রাহকের বিবরণ';

  @override
  String get callCustomer => 'গ্রাহককে কল করুন';

  @override
  String get goodsType => 'পণ্যের ধরন';

  @override
  String get quantity => 'পরিমাণ';

  @override
  String get weight => 'ওজন';

  @override
  String get distance => 'দূরত্ব';

  @override
  String get duration => 'সময়কাল';

  @override
  String get cancellationReason => 'বাতিলের কারণ';

  @override
  String get routeTimeline => 'রুটের সময়রেখা';

  @override
  String get goodsSpecifications => 'পণ্যের বিবরণ';

  @override
  String get vehicleMetadata => 'যানবাহনের বিবরণ';

  @override
  String get description => 'বিবরণ';

  @override
  String get estimatedWeight => 'আনুমানিক ওজন';

  @override
  String get vehicleName => 'যানবাহনের নাম';

  @override
  String get vehicleNumber => 'যানবাহন নম্বর';

  @override
  String get modelColor => 'মডেল / রঙ';

  @override
  String get baseFare => 'মূল ভাড়া';

  @override
  String get weatherSurcharge => 'আবহাওয়া সারচার্জ';

  @override
  String get trafficSurcharge => 'ট্রাফিক সারচার্জ';

  @override
  String get promoDiscount => 'প্রোমো ছাড়';

  @override
  String get pickupSender => 'পিকআপ (প্রেরক)';

  @override
  String get dropoffRecipient => 'ড্রপঅফ (প্রাপক)';

  @override
  String rideIdLabel(String id) {
    return 'রাইড আইডি: $id';
  }

  @override
  String get todaysTotalEarnings => 'আজকের মোট আয়';

  @override
  String get failedToLoadEarnings => 'আয়ের তথ্য লোড করতে ব্যর্থ';

  @override
  String get noTransactionsRecorded => 'কোনো লেনদেন নথিভুক্ত হয়নি';

  @override
  String get mySupportTickets => 'আমার সহায়তা টিকেট';

  @override
  String get newTicket => 'নতুন টিকেট';

  @override
  String get noSupportTicketsRaised => 'কোনো সহায়তা টিকেট দাখিল করা হয়নি';

  @override
  String get tapNewTicketSubtitle =>
      'সহায়তা পেতে \'নতুন টিকেট\'-এ ট্যাপ করুন।';

  @override
  String get submitATicket => 'টিকেট দাখিল করুন';

  @override
  String get explainIssueDetail =>
      'আপনার সমস্যা বিস্তারিত বর্ণনা করুন। সহায়তা এজেন্ট শীঘ্রই নিশ্চিত করে উত্তর দেবে।';

  @override
  String get categoryRequired => 'বিভাগ*';

  @override
  String get selectIssueCategory => 'সমস্যার বিভাগ নির্বাচন করুন';

  @override
  String get pleaseSelectCategoryError =>
      'অনুগ্রহ করে একটি সমস্যার বিভাগ নির্বাচন করুন';

  @override
  String get subjectRequired => 'বিষয়*';

  @override
  String get briefSummaryHint => 'সমস্যার সংক্ষিপ্ত বিবরণ';

  @override
  String get subjectRequiredError => 'বিষয় আবশ্যক';

  @override
  String get subjectMinLengthError => 'বিষয় কমপক্ষে ৫ অক্ষরের হতে হবে';

  @override
  String get descriptionRequired => 'বিবরণ / বার্তা*';

  @override
  String get describeProblemHint => 'আপনার সমস্যা বিস্তারিত বর্ণনা করুন...';

  @override
  String get messageRequiredError => 'বার্তার বিবরণ আবশ্যক';

  @override
  String get messageMinLengthError => 'বার্তা কমপক্ষে ১০ অক্ষরের হতে হবে';

  @override
  String get submitTicket => 'টিকেট জমা দিন';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get termsAndConditions => 'নিয়ম ও শর্তাবলী';

  @override
  String get termsOfService => 'পরিষেবার শর্তাবলী';

  @override
  String get iAgreeTo => 'আমি ';

  @override
  String get and => ' এবং ';

  @override
  String get agreeSuffix => ' এ সম্মত';

  @override
  String get darkTheme => 'ডার্ক থিম';

  @override
  String get failedToLoadDetails => 'বিবরণ লোড করতে ব্যর্থ';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>গোপনীয়তা নীতি</h1><p>Reachu ড্রাইভার অ্যাপে আপনাকে স্বাগতম। আপনার গোপনীয়তা আমাদের কাছে গুরুত্বপূর্ণ। এই গোপনীয়তা নীতি ব্যাখ্যা করে আমরা আপনার ব্যক্তিগত তথ্য কীভাবে সংগ্রহ, ব্যবহার এবং সুরক্ষিত করি।</p><h2>১. আমরা যে তথ্য সংগ্রহ করি</h2><p>আমরা আপনার নাম, ফোন নম্বর, ইমেইল, যানবাহনের বিবরণ, সক্রিয় ট্রিপের সময় অবস্থান ডেটা এবং লেনদেনের বিবরণ সংগ্রহ করি।</p><h2>২. আমরা আপনার তথ্য কীভাবে ব্যবহার করি</h2><p>আমরা আপনার তথ্য ব্যবহার করি ডেলিভারি রাইড সহজ করতে, পেমেন্ট প্রক্রিয়া করতে, নিরাপত্তা নিশ্চিত করতে এবং ড্রাইভার অভিজ্ঞতা উন্নত করতে।</p><h2>৩. অবস্থান ট্র্যাকিং</h2><p>ডিউটিতে থাকাকালীন ব্যাকগ্রাউন্ড অবস্থান অ্যাক্সেস প্রয়োজন যাতে আপনাকে কাছাকাছি ডেলিভারি অনুরোধের সাথে সংযুক্ত করা যায় এবং গ্রাহকরা ট্রিপের অগ্রগতি দেখতে পারেন।</p><h2>৪. ডেটা সুরক্ষা</h2><p>আমরা আপনার ব্যক্তিগত তথ্য অননুমোদিত অ্যাক্সেস থেকে রক্ষা করতে কঠোর নিরাপত্তা ব্যবস্থা প্রয়োগ করি।</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>নিয়ম ও শর্তাবলী</h1><p>Reachu ড্রাইভার অ্যাপ্লিকেশন ব্যবহার করার আগে অনুগ্রহ করে এই নিয়ম ও শর্তাবলী মনোযোগ সহকারে পড়ুন।</p><h2>১. শর্তাবলীর স্বীকৃতি</h2><p>Reachu-তে ড্রাইভার পার্টনার হিসেবে নিবন্ধন করে আপনি সব প্রযোজ্য শর্ত, নীতি এবং স্থানীয় পরিবহন নিয়ম মেনে চলতে সম্মত হন।</p><h2>২. ড্রাইভারের দায়িত্ব</h2><p>ড্রাইভারের বৈধ ড্রাইভিং লাইসেন্স, সঠিক যানবাহন নথি এবং নিরাপদ, সময়মতো ডেলিভারি সেবা প্রদানের দায়িত্ব থাকতে হবে।</p><h2>৩. পেমেন্ট এবং আয়</h2><p>ভাড়া প্ল্যাটফর্মের হার অনুযায়ী নির্ধারিত হয় এবং প্রযোজ্য চার্জ কাটার পর আপনার যাচাইকৃত ব্যাংক অ্যাকাউন্টে স্থানান্তরিত হয়।</p><h2>৪. অ্যাকাউন্ট স্থগিতকরণ</h2><p>Reachu প্রতারণামূলক কার্যকলাপ, নিরাপত্তা লঙ্ঘন বা নীতি অমান্যের ক্ষেত্রে অ্যাকাউন্ট স্থগিত করার অধিকার সংরক্ষণ করে।</p>';

  @override
  String get reviewAndRating => 'পর্যালোচনা এবং রেটিং';

  @override
  String get noRatingsYet => 'এখনও কোনো রেটিং নেই';

  @override
  String ratedByCustomers(int count) {
    return '$count জন গ্রাহক দ্বারা রেটিং দেওয়া হয়েছে';
  }

  @override
  String get noReviewsYet => 'এখনও কোনো পর্যালোচনা নেই';

  @override
  String get noReviewsDesc => 'আপনি এখনও কোনো পর্যালোচনা পাননি।';

  @override
  String get noCommentProvided => 'কোনো মন্তব্য দেওয়া হয়নি';

  @override
  String get ratingExcellent => 'চমৎকার';

  @override
  String get ratingGood => 'ভালো';

  @override
  String get ratingAverage => 'গড়';

  @override
  String get ratingBelowAverage => 'গড়ের নিচে';

  @override
  String get ratingPoor => 'খারাপ';

  @override
  String get customer => 'গ্রাহক';

  @override
  String get noInternetConnection => 'ইন্টারনেট সংযোগ নেই';

  @override
  String get checkInternetConnection =>
      'আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন এবং আবার চেষ্টা করুন।';

  @override
  String get internetRestored => 'ইন্টারনেট সংযোগ পুনরুদ্ধার করা হয়েছে';

  @override
  String get retryConnection => 'পুনরায় চেষ্টা করুন';

  @override
  String get connectionTimedOut =>
      'সংযোগের সময় শেষ। পুনরায় চেষ্টা করা হচ্ছে...';

  @override
  String get newUpdateAvailable =>
      'একটি নতুন আপডেট উপলব্ধ। চালিয়ে যেতে অ্যাপ আপডেট করুন।';

  @override
  String get updateRequiredTitle => 'আপডেট প্রয়োজন';

  @override
  String updateRequiredDesc(String version) {
    return 'আপনি Reachu Driver এর একটি পুরানো সংস্করণ ব্যবহার করছেন। রাইড নেওয়া চালিয়ে যেতে সর্বশেষ সংস্করণে আপডেট করুন।';
  }

  @override
  String get updateNow => 'এখনই আপডেট করুন';

  @override
  String get updateLater => 'পরে আপডেট করুন';

  @override
  String get underMaintenanceTitle => 'রক্ষণাবেক্ষণ চলছে';

  @override
  String get underMaintenanceDesc =>
      'আপনাকে আরও ভাল পরিষেবা দেওয়ার জন্য আমরা সিস্টেম আপডেট করছি। কিছু সময় পরে আবার পরীক্ষা করুন।';

  @override
  String estimatedBackIn(Object time) {
    return 'আনুমানিক প্রত্যাবর্তন $time এর মধ্যে';
  }

  @override
  String get backOnlineSoon => 'আমরা শীঘ্রই আবার অনলাইন হব!';

  @override
  String installedVersion(String version) {
    return 'ইনস্টল করা সংস্করণ: $version';
  }

  @override
  String get couldNotOpenStore => 'অ্যাপ স্টোর খোলা যায়নি';

  @override
  String get detailedFareBreakdown => 'বিস্তারিত ভাড়ার বিবরণ';

  @override
  String get checkPaymentStatus => 'পেমেন্ট স্থিতি পরীক্ষা করুন';

  @override
  String get checkingStatus => 'স্থিতি পরীক্ষা করা হচ্ছে...';

  @override
  String get details => 'বিস্তারিত';

  @override
  String get hide => 'লুকান';

  @override
  String get collectCashFromCustomer => 'গ্রাহকের কাছ থেকে নগদ সংগ্রহ করুন';

  @override
  String get customerOnlineFareDue => 'গ্রাহকের অনলাইন ভাড়া বকেয়া';

  @override
  String get reachuWalletCredit => 'Reachu ওয়ালেট ক্রেডিট';

  @override
  String promoReimbursementNote(String amount) {
    return '*আপনার ওয়ালেটে জমা হওয়া Reachu প্রোমো রিইম্বার্সমেন্ট অন্তর্ভুক্ত';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*অপেক্ষার সময়ের জন্য ওয়েটিং চার্জ অন্তর্ভুক্ত';
  }

  @override
  String get paymentReceivedSuccess => 'পেমেন্ট সফলভাবে প্রাপ্ত হয়েছে!';

  @override
  String get paymentStillPending => 'পেমেন্ট এখনও বকেয়া রয়েছে';

  @override
  String get waitingCharge => 'ওয়েটিং চার্জ';

  @override
  String get rentalCharge => 'রেন্টাল চার্জ';

  @override
  String get grossFare => 'মোট ভাড়া';

  @override
  String get pendingDue => 'বকেয়া পরিমাণ';

  @override
  String get tollFee => 'টোল ফি';

  @override
  String get cancellationFee => 'বাতিলকরণ ফি';

  @override
  String get nightSurcharge => 'নাইট সারচার্জ';

  @override
  String get surgeFee => 'সার্জ ফি';

  @override
  String get taxAndFees => 'কর এবং ফি';

  @override
  String get platformFee => 'প্ল্যাটফর্ম ফি';

  @override
  String get pressBackAgainToExit => 'অ্যাপ থেকে বের হতে আবার ব্যাক টিপুন';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'প্রস্থান করার আগে রাইড গ্রহণ বা প্রত্যাখ্যান করুন';

  @override
  String get cashPayment => 'নগদ পেমেন্ট';

  @override
  String get onlineQr => 'অনলাইন কিউআর';

  @override
  String get collectCashInstructions =>
      'রাইড শেষ করার আগে গ্রাহকের কাছ থেকে নগদ টাকা সংগ্রহ করুন।';

  @override
  String collectCashStep1(String amount) {
    return '১. গ্রাহকের কাছ থেকে সঠিক নগদ পরিমাণ সংগ্রহ করুন';
  }

  @override
  String get collectCashStep2 =>
      '২. নিচে \'নগদ প্রাপ্তি নিশ্চিত করুন\' বাটনে চাপুন';

  @override
  String get verifyingCashDeposit => 'নগদ আমানত যাচাই করা হচ্ছে...';

  @override
  String get pleaseHoldClosingRide =>
      'রাইড বন্ধ করার সময় অনুগ্রহ করে অপেক্ষা করুন';

  @override
  String get customerOnlinePayment => 'গ্রাহক অনলাইন পেমেন্ট';

  @override
  String get generatingQrCode => 'কিউআর কোড তৈরি করা হচ্ছে...';

  @override
  String get failedToLoadQrCode => 'কিউআর কোড লোড করতে ব্যর্থ হয়েছে';

  @override
  String get scanQrToPay =>
      'অনলাইনে পেমেন্ট করতে গ্রাহককে কিউআর কোড স্ক্যান করতে বলুন';

  @override
  String get pinchToZoomQr => 'কিউআর কোড জুম করতে পিঞ্চ করুন';

  @override
  String get tapToFullScreen =>
      'ফুল স্ক্রিন ভিউয়ের জন্য কিউআর কোডে ট্যাপ করুন';

  @override
  String get awaitingCustomerPayment =>
      'গ্রাহকের পেমেন্টের জন্য অপেক্ষা করা হচ্ছে...';

  @override
  String get confirmCashReceived => 'নগদ প্রাপ্তি নিশ্চিত করুন';

  @override
  String get paymentReceivedToast =>
      'পেমেন্ট পাওয়া গেছে! রাইড বন্ধ করা হচ্ছে...';

  @override
  String get invalidOrderIdError => 'অকার্যকর অর্ডার আইডি';

  @override
  String get cashPaymentRecordedWaiting =>
      'নগদ পেমেন্ট রেকর্ড করা হয়েছে। রাইড বন্ধ করা হচ্ছে...';

  @override
  String get paymentReceivedTitle => 'পেমেন্ট প্রাপ্ত হয়েছে';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount টাকা সফলভাবে প্রদান করা হয়েছে!';
  }

  @override
  String get rideClosedReturningHome =>
      'রাইড বন্ধ হয়েছে। হোমে ফিরে যাওয়া হচ্ছে...';

  @override
  String get fragileGoods => 'পচনশীল/ভঙ্গুর পণ্য';

  @override
  String get yes => 'হ্যাঁ';

  @override
  String get no => 'না';

  @override
  String contactLabel(String name, Object phone) {
    return 'যোগাযোগ: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'অনুমতি প্রয়োজন';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver সঠিকভাবে অফলাইন এবং অনলাইনে কাজ করার জন্য নিচের অনুমতিগুলির প্রয়োজন।';

  @override
  String get locationAlwaysTitle => 'অবস্থান (সবসময় অনুমতি দিন)';

  @override
  String get locationAlwaysSubtitle =>
      'অর্ডার ডিসপ্যাচ এবং ব্যাকগ্রাউন্ড রাইড ট্র্যাকিংয়ের জন্য প্রয়োজনীয়।';

  @override
  String get batteryUnrestrictedTitle =>
      'ব্যাটারি অপ্টিমাইজেশান (অনিয়ন্ত্রিত)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'ব্যাকগ্রাউন্ড সকেট সংযোগ এবং রাইড সতর্কতা বন্ধ না হওয়া নিশ্চিত করে।';

  @override
  String get notificationsTitle => 'বিজ্ঞপ্তি';

  @override
  String get notificationsSubtitle =>
      'নতুন রাইড অনুরোধ এবং অর্ডার সতর্কতার জন্য প্রয়োজনীয়।';

  @override
  String get displayOverAppsTitle => 'অন্যান্য অ্যাপের উপরে প্রদর্শন করুন';

  @override
  String get displayOverAppsSubtitle =>
      'ফুল-স্ক্রিন ইনকামিং অর্ডার পপআপের জন্য প্রয়োজনীয়।';

  @override
  String get locationUsedInBackground => 'ব্যাকগ্রাউন্ডে ব্যবহৃত অবস্থান';

  @override
  String get backgroundLocationDisclosureBody =>
      'অ্যাপ বন্ধ বা ব্যবহার না থাকা অবস্থায়ও ReachuDriver লোকেশন ডেটা সংগ্রহ করে।\n\nএটি ব্যবহারের ক্ষেত্র:\n  • লোডার/ব্যবহারকারীদের সাথে আপনার রিয়েল-টাইম স্থিতি শেয়ার করা\n  • আপনাকে নিকটতম বুকিং অনুরোধ বরাদ্দ করা\n  • ডিউটিতে থাকার সময় ডিসপ্যাচ সিস্টেম আপডেট রাখা\n\nলোকেশন সংগ্রহ কেবল আপনি অনলাইনে (ডিউটিতে) থাকা অবস্থায় চলে এবং অফলাইনে গেলে সঙ্গে সঙ্গে বন্ধ হয়ে যায়।';

  @override
  String get changeInAppSettingsNote =>
      'আপনি অ্যাপ সেটিংস থেকে যে কোনো সময় এটি পরিবর্তন করতে পারেন।';

  @override
  String get iUnderstandContinue => 'আমি বুঝেছি — চালিয়ে যান';

  @override
  String get notNow => 'এখন নয়';

  @override
  String get lowWalletBalance => 'কম ওয়ালেট ব্যালেন্স';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'অর্ডার পেতে অনুগ্রহ করে সর্বনিম্ন ₹$limit ওয়ালেট ব্যালেন্স বজায় রাখুন। অর্ডার পাওয়া চালিয়ে যেতে আপনার ওয়ালেট টপ আপ করুন।';
  }

  @override
  String get minimumRequiredBalance => 'সর্বনিম্ন প্রয়োজনীয় ব্যালেন্স';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'অর্ডার পেতে অনুগ্রহ করে আপনার ওয়ালেটে অন্তত ₹$limit বজায় রাখুন।';
  }

  @override
  String get activeForRides => 'রাইডের জন্য সক্রিয়';

  @override
  String get lowBalanceStatus => 'কম ব্যালেন্স';

  @override
  String get minimumLimit => 'সর্বনিম্ন সীমা';

  @override
  String get eShramBenefitsTitle => 'ই-শ্রম সুবিধাসমূহ';

  @override
  String get govtScheme => 'সরকারি প্রকল্প';

  @override
  String get eShramSubHeader => 'সরকারি বীমা ও পেনশন প্রকল্প';

  @override
  String get eShramDescription =>
      'গিগ কর্মীদের জন্য দুর্ঘটনাজনিত বীমা কভার এবং সামাজিক সুরক্ষা সুবিধা পেতে সরকারি ই-শ্রম পোর্টালে নিবন্ধন করুন।';

  @override
  String get registerOnEShramPortal => 'ই-শ্রম পোর্টালে নিবন্ধন করুন';

  @override
  String get eShramGovtBenefitsMenu => 'ই-শ্রম সরকারি সুবিধাসমূহ';

  @override
  String get dismiss => 'বাতিল করুন';

  @override
  String get trainingVideos => 'প্রশিক্ষণ ভিডিও';

  @override
  String get welcomeToReachU => 'নমস্কার, ReachU-তে আপনাকে স্বাগতম!';

  @override
  String get welcomeTrainingSubtitle =>
      'চলুন আপনার যাত্রা শুরু করি! অ্যাপটি কীভাবে কাজ করে তা জানতে অনুগ্রহ করে এই সংক্ষিপ্ত প্রশিক্ষণ ভিডিওটি দেখুন।';

  @override
  String get trainingCompletedTitle => 'প্রশিক্ষণ সম্পন্ন হয়েছে!';

  @override
  String get trainingCompletedSubtitle =>
      'খুব ভালো! আপনি সফলভাবে সমস্ত প্রয়োজনীয় প্রশিক্ষণ সম্পন্ন করেছেন। আপনি এখন গাড়ি চালানো শুরু করতে প্রস্তুত।';

  @override
  String get startDriving => 'ড্রাইভিং শুরু করুন';

  @override
  String get iHaveReadAndConsent =>
      'আমি পড়েছি এবং এতদ্বারা আমার সম্মতি প্রদান করছি: ';

  @override
  String get tdsDeclaration => 'TDS ঘোষণা';
}
