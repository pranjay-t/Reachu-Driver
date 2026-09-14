// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get account => 'അക്കൗണ്ട്';

  @override
  String get editProfile => 'പ്രൊഫൈൽ എഡിറ്റ് ചെയ്യുക';

  @override
  String get logout => 'ലോഗൗട്ട്';

  @override
  String get language => 'ഭാഷ';

  @override
  String get selectLanguage => 'ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get english => 'English (ഇംഗ്ലീഷ്)';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'വാഹനം തിരഞ്ഞെടുക്കുക';

  @override
  String get selectAVehicle => 'ഒരു വാഹനം തിരഞ്ഞെടുക്കുക';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName ഉപയോഗിച്ച് തുടരുക';
  }

  @override
  String get addStop => 'സ്റ്റോപ്പ് ചേർക്കുക';

  @override
  String get editLocations => 'സ്ഥലങ്ങൾ എഡിറ്റ് ചെയ്യുക';

  @override
  String get noPickupLocationSet => 'പിക്കപ്പ് സ്ഥലം സജ്ജമാക്കിയിട്ടില്ല';

  @override
  String get noDropLocationSet => 'ഡ്രോപ്പ് സ്ഥലം സജ്ജമാക്കിയിട്ടില്ല';

  @override
  String get addDrop => 'ഡ്രോപ്പ് ചേർക്കുക';

  @override
  String get errorLoadingVehicles => 'വാഹനങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പിശക്';

  @override
  String get selectGoodsType => 'ചരക്കിന്റെ തരം തിരഞ്ഞെടുക്കുക';

  @override
  String get whatAreYouShipping => 'നിങ്ങൾ എന്താണ് അയയ്ക്കുന്നത്?';

  @override
  String get chooseCategoryBestMatches =>
      'നിങ്ങളുടെ ചരക്കുമായി ഏറ്റവും പൊരുത്തപ്പെടുന്ന വിഭാഗം തിരഞ്ഞെടുക്കുക';

  @override
  String get editGoodsDetails => 'ചരക്ക് വിശദാംശങ്ങൾ എഡിറ്റ് ചെയ്യുക';

  @override
  String get weightKgMax90 => 'ഭാരം (കി.ഗ്രാം) - പരമാവധി 90 കി.ഗ്രാം';

  @override
  String get weightInvalidError => 'ഭാരം 1 മുതൽ 90 കി.ഗ്രാം വരെ ആയിരിക്കണം';

  @override
  String get numberOfPackages => 'പാക്കേജുകളുടെ എണ്ണം';

  @override
  String get worthValueRupees => 'മൂല്യം / വില (രൂപ)';

  @override
  String get done => 'പൂർത്തിയായി';

  @override
  String get confirmGoodsDetails => 'ചരക്ക് വിശദാംശങ്ങൾ സ്ഥിരീകരിക്കുക';

  @override
  String get failedToLoadCategories => 'വിഭാഗങ്ങൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get disclaimerTitle => 'നിരാകരണം';

  @override
  String get disclaimerText =>
      'നിരാകരണം: കൊണ്ടുപോകുന്ന ചരക്ക് അപകടകരമല്ലാത്തതും നിയമാനുസൃതവും തിരഞ്ഞെടുത്ത വിഭാഗത്തിലുള്ളതുമാണെന്ന് ഞാൻ പ്രഖ്യാപിക്കുന്നു. നിരോധിത വസ്തുക്കളുടെ ഗതാഗതത്തിന് കമ്പനി ഉത്തരവാദിയല്ല. ഭാരം വാഹനത്തിന്റെ പരമാവധി ശേഷി കവിയരുത്.';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight കി.ഗ്രാം • $packages പാക്കേജ് • ₹$worth';
  }

  @override
  String get welcome => 'സ്വാഗതം';

  @override
  String get enterMobileNumberToContinue =>
      'തുടരാൻ നിങ്ങളുടെ മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get mobileNumber => 'മൊബൈൽ നമ്പർ';

  @override
  String get agreeTermsText =>
      'ഞാൻ സേവന നിബന്ധനകളും സ്വകാര്യതാ നയവും അംഗീകരിക്കുന്നു';

  @override
  String get sendOtp => 'OTP അയയ്ക്കുക';

  @override
  String get verifyOtp => 'OTP സ്ഥിരീകരിക്കുക';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber എന്ന നമ്പറിലേക്ക് അയച്ച 4-അക്ക കോഡ് നൽകുക';
  }

  @override
  String get verifyAndContinue => 'സ്ഥിരീകരിച്ച് തുടരുക';

  @override
  String resendInSeconds(Object count) {
    return '$count സെക്കൻഡിൽ വീണ്ടും അയയ്ക്കുക';
  }

  @override
  String get resendOtp => 'OTP വീണ്ടും അയയ്ക്കുക';

  @override
  String get changeNumber => 'നമ്പർ മാറ്റുക';

  @override
  String get mobileNumberRequired => 'മൊബൈൽ നമ്പർ ആവശ്യമാണ്';

  @override
  String get enterValidMobileNumber => 'സാധുവായ 10-അക്ക മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get enterCompleteOtpError => 'ദയവായി പൂർണ്ണമായ 4-അക്ക OTP നൽകുക';

  @override
  String get otpResentSuccess => 'OTP വിജയകരമായി വീണ്ടും അയച്ചു';

  @override
  String get fullName => 'പൂർണ്ണ നാമം';

  @override
  String get fullNameRequired => 'പൂർണ്ണ നാമം ആവശ്യമാണ്';

  @override
  String get nameMinLengthError => 'പേര് കുറഞ്ഞത് 2 അക്ഷരങ്ങൾ ഉണ്ടായിരിക്കണം';

  @override
  String get email => 'ഇമെയിൽ';

  @override
  String get emailRequired => 'ഇമെയിൽ ആവശ്യമാണ്';

  @override
  String get enterValidEmail => 'സാധുവായ ഇമെയിൽ വിലാസം നൽകുക';

  @override
  String get referralCode => 'റഫറൽ കോഡ്';

  @override
  String get enterReferralCodeOptional => 'റഫറൽ കോഡ് നൽകുക (ഓപ്ഷണൽ)';

  @override
  String get createAccount => 'അക്കൗണ്ട് സൃഷ്ടിക്കുക';

  @override
  String get completeProfileToGetStarted =>
      'ആരംഭിക്കാൻ നിങ്ങളുടെ പ്രൊഫൈൽ പൂർത്തിയാക്കുക';

  @override
  String get profileUpdatedSuccess => 'പ്രൊഫൈൽ വിജയകരമായി അപ്ഡേറ്റ് ചെയ്തു!';

  @override
  String get updateProfilePicture => 'പ്രൊഫൈൽ ചിത്രം അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String get camera => 'ക്യാമറ';

  @override
  String get gallery => 'ഗാലറി';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get dateOfBirthOptional => 'ജനനത്തീയതി (ഓപ്ഷണൽ)';

  @override
  String get gender => 'ലിംഗം';

  @override
  String get male => 'പുരുഷൻ';

  @override
  String get female => 'സ്ത്രീ';

  @override
  String get other => 'മറ്റുള്ളവ';

  @override
  String get updateProfile => 'പ്രൊഫൈൽ അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String profileUpdateFailed(Object error) {
    return 'പ്രൊഫൈൽ അപ്ഡേറ്റ് ചെയ്യാനായില്ല: $error';
  }

  @override
  String get goodMorning => 'സുപ്രഭാതം,';

  @override
  String get goodAfternoon => 'ശുഭ ഉച്ചയ്ക്ക്,';

  @override
  String get goodEvening => 'ശുഭ സന്ധ്യ,';

  @override
  String get pickupFrom => 'ഇവിടെ നിന്ന് പിക്കപ്പ്';

  @override
  String get currentLocation => 'നിലവിലെ സ്ഥലം';

  @override
  String get fetchingLocation => 'സ്ഥലം ലഭ്യമാക്കുന്നു...';

  @override
  String get locationServicesDisabled => 'ലൊക്കേഷൻ സേവനം പ്രവർത്തനരഹിതമാണ്';

  @override
  String get locationPermissionNeeded => 'ലൊക്കേഷൻ അനുമതി ആവശ്യമാണ്';

  @override
  String get locationAccessBlocked => 'ലൊക്കേഷൻ ആക്സസ് തടഞ്ഞിരിക്കുന്നു';

  @override
  String get couldNotFetchLocation => 'സ്ഥലം ലഭ്യമാക്കാനായില്ല';

  @override
  String get enable => 'പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get allow => 'അനുവദിക്കുക';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get turnOnLocationServices => 'ലൊക്കേഷൻ സേവനങ്ങൾ ഓൺ ചെയ്യുക';

  @override
  String get allowLocationAccess => 'ലൊക്കേഷൻ ആക്സസ് അനുവദിക്കുക';

  @override
  String get gpsRequiredDescription =>
      'നിങ്ങളുടെ പിക്കപ്പ് സ്ഥലം കൃത്യമായി കണ്ടെത്താനും അടുത്തുള്ള ഡ്രൈവർമാരെ വേഗത്തിൽ കണ്ടെത്താനും നിങ്ങളുടെ ഉപകരണ GPS ആവശ്യമാണ്.';

  @override
  String get permissionRequiredDescription =>
      'നിങ്ങളുടെ പിക്കപ്പ് സ്ഥലം കൃത്യമായി കണ്ടെത്താനും അടുത്തുള്ള ഡ്രൈവർമാരെ വേഗത്തിൽ കണ്ടെത്താനും ആപ്പ് ക്രമീകരണങ്ങളിൽ ലൊക്കേഷൻ അനുമതികൾ അനുവദിക്കുക.';

  @override
  String get goToLocationSettings => 'ലൊക്കേഷൻ ക്രമീകരണങ്ങളിലേക്ക് പോകുക';

  @override
  String get goToAppSettings => 'ആപ്പ് ക്രമീകരണങ്ങളിലേക്ക് പോകുക';

  @override
  String get enterAddressManually => 'ഞാൻ എന്റെ വിലാസം സ്വയം നൽകാം';

  @override
  String get taglineTitle => 'എന്തും കൊണ്ടുപോകാം,\nഎപ്പോൾ വേണമെങ്കിലും.';

  @override
  String get taglineSubtitle =>
      'വേഗത്തിലുള്ള ഡെലിവറി നിങ്ങളുടെ വിരൽത്തുമ്പിൽ. സ്മാർട്ടായി ഷിഫ്റ്റ് ചെയ്യുക, ഞങ്ങളുടെ പ്രീമിയം ഫ്ലീറ്റുമായി വേഗത്തിൽ മുന്നോട്ട് പോകുക.';

  @override
  String get twoWheelers => 'രണ്ട് ചക്ര വാഹനങ്ങൾ';

  @override
  String get trucks => 'ട്രക്കുകൾ';

  @override
  String get specialOffer => 'പ്രത്യേക ഓഫർ';

  @override
  String get promoBannerText => 'നിങ്ങളുടെ ആദ്യ യാത്രയിൽ\n20% കിഴിവ് നേടൂ';

  @override
  String get whereIsYourPickup => 'നിങ്ങളുടെ പിക്കപ്പ് എവിടെയാണ്?';

  @override
  String get whereIsYourDrop => 'നിങ്ങളുടെ ഡ്രോപ്പ് എവിടെയാണ്?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'നിങ്ങളുടെ ഡ്രോപ്പ് $index എവിടെയാണ്?';
  }

  @override
  String get typeMinCharsToSearch =>
      'തിരയൽ ആരംഭിക്കാൻ കുറഞ്ഞത് 4 അക്ഷരങ്ങൾ ടൈപ്പ് ചെയ്യുക';

  @override
  String get selectOnMap => 'മാപ്പിൽ തിരഞ്ഞെടുക്കുക';

  @override
  String get pinpointExactLocation =>
      'നിങ്ങളുടെ കൃത്യമായ സ്ഥലം അടയാളപ്പെടുത്തുക';

  @override
  String get couldNotFindAddress => 'ക്ഷമിക്കണം, ഈ വിലാസം കണ്ടെത്താനായില്ല.';

  @override
  String get trySearchingNearbyLandmark =>
      'അടുത്തുള്ള ലാൻഡ്മാർക്ക്, പ്രദേശം അല്ലെങ്കിൽ പ്രശസ്ത സ്ഥലം ഉപയോഗിച്ച് തിരയാൻ ശ്രമിക്കുക.';

  @override
  String get anErrorOccurred => 'ഒരു പിശക് സംഭവിച്ചു';

  @override
  String get locating => 'സ്ഥലം കണ്ടെത്തുന്നു...';

  @override
  String get fetchingDetails => 'വിശദാംശങ്ങൾ ലഭ്യമാക്കുന്നു...';

  @override
  String get confirmPickupLocation => 'പിക്കപ്പ് സ്ഥലം സ്ഥിരീകരിക്കുക';

  @override
  String get confirmDropLocation => 'ഡ്രോപ്പ് സ്ഥലം സ്ഥിരീകരിക്കുക';

  @override
  String get houseShopApartment => 'വീട് / കട / അപ്പാർട്ട്മെന്റ്';

  @override
  String get sendersName => 'അയയ്ക്കുന്നയാളുടെ പേര്';

  @override
  String get receiversName => 'സ്വീകരിക്കുന്നയാളുടെ പേര്';

  @override
  String get pleaseEnterName => 'ദയവായി പേര് നൽകുക';

  @override
  String get sendersMobileNumber => 'അയയ്ക്കുന്നയാളുടെ മൊബൈൽ നമ്പർ';

  @override
  String get receiversMobileNumber => 'സ്വീകരിക്കുന്നയാളുടെ മൊബൈൽ നമ്പർ';

  @override
  String get enterValidTenDigitNumber => 'സാധുവായ 10-അക്ക നമ്പർ നൽകുക';

  @override
  String get useMyMobileNumber => 'എന്റെ മൊബൈൽ നമ്പർ ഉപയോഗിക്കുക';

  @override
  String get saveAsOptional => 'ഇങ്ങനെ സേവ് ചെയ്യുക (ഓപ്ഷണൽ):';

  @override
  String get home => 'വീട്';

  @override
  String get shop => 'കട';

  @override
  String get confirmAndProceed => 'സ്ഥിരീകരിച്ച് തുടരുക';

  @override
  String get selectDropLocation => 'ഡ്രോപ്പ് സ്ഥലം തിരഞ്ഞെടുക്കുക';

  @override
  String get cannotSwapEmptyLocations =>
      'ശൂന്യമായ സ്ഥലങ്ങൾ നിറച്ച സ്ഥലങ്ങളുമായി മാറ്റാനാവില്ല.';

  @override
  String get proceedToVehicleSelection => 'വാഹന തിരഞ്ഞെടുപ്പിലേക്ക് തുടരുക';

  @override
  String get permissionRequired => 'അനുമതി ആവശ്യമാണ്';

  @override
  String get contactsPermissionDescription =>
      'അയയ്ക്കുന്നയാളുടെ ഫോൺ നമ്പർ എളുപ്പത്തിൽ തിരഞ്ഞെടുക്കാൻ Reachu-ന് നിങ്ങളുടെ കോൺടാക്റ്റുകളിലേക്ക് ആക്സസ് ആവശ്യമാണ്. ദയവായി ആപ്പ് ക്രമീകരണങ്ങളിൽ ഇത് പ്രവർത്തനക്ഷമമാക്കുക.';

  @override
  String get openSettings => 'ക്രമീകരണങ്ങൾ തുറക്കുക';

  @override
  String get selectContact => 'കോൺടാക്റ്റ് തിരഞ്ഞെടുക്കുക';

  @override
  String get contactPermissionDenied => 'കോൺടാക്റ്റ് അനുമതി നിരസിച്ചു.';

  @override
  String get myProfile => 'എന്റെ പ്രൊഫൈൽ';

  @override
  String selfFormat(String name) {
    return '$name (സ്വയം)';
  }

  @override
  String get deviceContacts => 'ഉപകരണ കോൺടാക്റ്റുകൾ';

  @override
  String get rideHistory => 'റൈഡ് ചരിത്രം';

  @override
  String get transactions => 'ഇടപാടുകൾ';

  @override
  String get noTransactionsFound => 'ഇടപാടുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get failedToLoadTransactions => 'ഇടപാടുകൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get addMoney => 'പണം ചേർക്കുക';

  @override
  String get enterAmountToAdd => 'ചേർക്കാനുള്ള തുക നൽകുക';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay തുറക്കാനായില്ല: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'പേയ്‌മെന്റ് ഓർഡർ സൃഷ്ടിക്കാനായില്ല: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'Reachu ക്രെഡിറ്റുകളിലേക്ക് ₹$amount വിജയകരമായി ചേർത്തു!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'പേയ്‌മെന്റ് സ്ഥിരീകരണം പരാജയപ്പെട്ടു: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'പേയ്‌മെന്റ് പരാജയപ്പെട്ടു ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'ബാഹ്യ വാലറ്റ് തിരഞ്ഞെടുത്തു: $walletName';
  }

  @override
  String get walletTopUp => 'വാലറ്റ് ടോപ്പ്-അപ്പ്';

  @override
  String get payments => 'പേയ്‌മെന്റുകൾ';

  @override
  String get reachuCredits => 'Reachu ക്രെഡിറ്റുകൾ';

  @override
  String get balance => 'ബാലൻസ്';

  @override
  String get errorLoadingBalance => 'ബാലൻസ് ലോഡ് ചെയ്യുന്നതിൽ പിശക്';

  @override
  String get availableBalance => 'ലഭ്യമായ ബാലൻസ്';

  @override
  String get totalExpenses => 'മൊത്തം ചെലവുകൾ';

  @override
  String get recentTransactions => 'സമീപകാല ഇടപാടുകൾ';

  @override
  String get viewMore => 'കൂടുതൽ കാണുക';

  @override
  String get noTransactionsYet => 'ഇതുവരെ ഇടപാടുകളൊന്നുമില്ല';

  @override
  String get booking => 'ബുക്കിംഗ്';

  @override
  String get earning => 'വരുമാനം';

  @override
  String get support => 'സഹായം';

  @override
  String get profile => 'പ്രൊഫൈൽ';

  @override
  String get pendingWithdrawals => 'തീർപ്പാക്കാത്ത പിൻവലിക്കലുകൾ';

  @override
  String get driverDebt => 'ഡ്രൈവർ കടം';

  @override
  String minBalanceRequired(Object amount) {
    return 'കുറഞ്ഞ ബാലൻസ് ആവശ്യം: ₹$amount';
  }

  @override
  String get insufficientBalance => 'പിൻവലിക്കലിന് മതിയായ ബാലൻസ് ഇല്ല';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'മുന്നറിയിപ്പ്: നിങ്ങളുടെ ലഭ്യമായ ബാലൻസ് പുതിയ റൈഡുകൾ സ്വീകരിക്കാൻ ആവശ്യമായ കുറഞ്ഞ പരിധിയേക്കാൾ (₹$amount) കുറവാണ്. ദയവായി നിങ്ങളുടെ വാലറ്റ് ടോപ്പ് അപ്പ് ചെയ്യുക.';
  }

  @override
  String get moneyTransfer => 'പണം ട്രാൻസ്ഫർ ചെയ്യുക';

  @override
  String get withdrawMoney => 'പണം പിൻവലിക്കുക';

  @override
  String get manageAccounts => 'അക്കൗണ്ടുകൾ നിയന്ത്രിക്കുക';

  @override
  String get bankAccounts => 'ബാങ്ക് അക്കൗണ്ടുകളും UPI-യും';

  @override
  String get addAccount => 'പേയ്‌മെന്റ് രീതി ചേർക്കുക';

  @override
  String get addBankAccount => 'ബാങ്ക് അക്കൗണ്ട് ചേർക്കുക';

  @override
  String get addUpiId => 'UPI ഐഡി ചേർക്കുക';

  @override
  String get editBankAccount => 'ബാങ്ക് അക്കൗണ്ട് എഡിറ്റ് ചെയ്യുക';

  @override
  String get editUpiId => 'UPI ഐഡി എഡിറ്റ് ചെയ്യുക';

  @override
  String get deleteAccount => 'അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get deleteAccountConfirm =>
      'ഈ പേയ്‌മെന്റ് രീതി ഇല്ലാതാക്കണമെന്ന് ഉറപ്പാണോ?';

  @override
  String get accountHolderName => 'അക്കൗണ്ട് ഉടമയുടെ പേര്';

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
  String get bankName => 'ബാങ്കിന്റെ പേര്';

  @override
  String get accountNumber => 'അക്കൗണ്ട് നമ്പർ';

  @override
  String get confirmAccountNumber => 'അക്കൗണ്ട് നമ്പർ സ്ഥിരീകരിക്കുക';

  @override
  String get ifscCode => 'IFSC കോഡ്';

  @override
  String get upiId => 'UPI ഐഡി';

  @override
  String get fieldRequired => 'ഈ ഫീൽഡ് ആവശ്യമാണ്';

  @override
  String get invalidUpi => 'സാധുവായ UPI ഐഡി നൽകുക (ഉദാ: name@upi)';

  @override
  String get invalidIfsc => 'സാധുവായ 11-അക്ക IFSC കോഡ് നൽകുക';

  @override
  String get invalidAccountNumber => 'സാധുവായ അക്കൗണ്ട് നമ്പർ നൽകുക';

  @override
  String get accountNumbersDoNotMatch =>
      'അക്കൗണ്ട് നമ്പറുകൾ പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get noPaymentMethods =>
      'ഇതുവരെ പേയ്‌മെന്റ് രീതികളൊന്നും ചേർത്തിട്ടില്ല';

  @override
  String get addPaymentMethodSubtitle =>
      'നിങ്ങളുടെ വരുമാനം പിൻവലിക്കാൻ ഒരു ബാങ്ക് അക്കൗണ്ട് അല്ലെങ്കിൽ UPI ഐഡി ചേർക്കുക';

  @override
  String get confirmTransfer => 'ട്രാൻസ്ഫർ സ്ഥിരീകരിക്കുക';

  @override
  String get transferAmount => 'ട്രാൻസ്ഫർ തുക';

  @override
  String get transferSuccess => 'പിൻവലിക്കൽ അഭ്യർത്ഥന വിജയകരമായി സൃഷ്ടിച്ചു';

  @override
  String get collectPayment => 'പേയ്‌മെന്റ് ശേഖരിക്കുക';

  @override
  String get collectCash => 'പണം ശേഖരിക്കുക';

  @override
  String get cashCollectedSuccess =>
      'ക്യാഷ് പേയ്‌മെന്റ് വിജയകരമായി പൂർത്തിയായി!';

  @override
  String get displayQrCode => 'UPI QR കോഡ് കാണിക്കുക';

  @override
  String get customerScanQr =>
      'പണമടയ്ക്കാൻ ഉപഭോക്താവിനോട് ഈ QR കോഡ് സ്കാൻ ചെയ്യാൻ പറയുക';

  @override
  String get generatingQr => 'QR കോഡ് സൃഷ്ടിക്കുന്നു...';

  @override
  String get selectPaymentMethod => 'പേയ്‌മെന്റ് രീതി തിരഞ്ഞെടുക്കുക';

  @override
  String get beneficiary => 'ഗുണഭോക്താവ്';

  @override
  String get completed => 'പൂർത്തിയായി';

  @override
  String get pending => 'തീർപ്പാക്കാത്തത്';

  @override
  String get failed => 'പരാജയപ്പെട്ടു';

  @override
  String get failedToLoadAccounts => 'പേയ്‌മെന്റ് രീതികൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get accountDeletedSuccess => 'പേയ്‌മെന്റ് രീതി വിജയകരമായി ഇല്ലാതാക്കി';

  @override
  String get accountUpdatedSuccess =>
      'പേയ്‌മെന്റ് രീതി വിജയകരമായി അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String get accountAddedSuccess => 'പേയ്‌മെന്റ് രീതി വിജയകരമായി ചേർത്തു';

  @override
  String get withdrawalAmount => 'പിൻവലിക്കൽ തുക';

  @override
  String get transferDestination => 'ട്രാൻസ്ഫർ ലക്ഷ്യസ്ഥാനം';

  @override
  String get enterAmount => 'തുക നൽകുക';

  @override
  String get selected => 'തിരഞ്ഞെടുത്തത്';

  @override
  String get accountNumberLabel => 'അക്കൗണ്ട് നമ്പർ';

  @override
  String get errorLoadingAccounts =>
      'പേയ്‌മെന്റ് രീതികൾ ലോഡ് ചെയ്യുന്നതിൽ പിശക്';

  @override
  String get errorLoadingWallet => 'വാലറ്റ് വിവരങ്ങൾ ലോഡ് ചെയ്യുന്നതിൽ പിശക്';

  @override
  String get enterAccountHolderName => 'അക്കൗണ്ട് ഉടമയുടെ പേര് നൽകുക';

  @override
  String get bankNameHint => 'ഉദാ: സ്റ്റേറ്റ് ബാങ്ക് ഓഫ് ഇന്ത്യ';

  @override
  String get enterAccountNumber => 'അക്കൗണ്ട് നമ്പർ നൽകുക';

  @override
  String get confirmAccountNumberHint => 'അക്കൗണ്ട് നമ്പർ സ്ഥിരീകരിക്കുക';

  @override
  String get ifscCodeHint => 'ഉദാ: SBIN0001234';

  @override
  String get upiIdHint => 'ഉദാ: user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'മൊത്തം കൂലി';

  @override
  String get hideQrCode => 'QR മറയ്ക്കുക';

  @override
  String get nameMinLengthRequired =>
      'പേര് കുറഞ്ഞത് 2 അക്ഷരങ്ങൾ ഉണ്ടായിരിക്കണം';

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
    return 'ഓർഡർ #$orderId';
  }

  @override
  String get personalInformation => 'വ്യക്തിഗത വിവരങ്ങൾ';

  @override
  String get online => 'ഓൺലൈൻ';

  @override
  String get offline => 'ഓഫ്‌ലൈൻ';

  @override
  String get onlineSuccessMessage =>
      'നിങ്ങൾ ഇപ്പോൾ ഓൺലൈനിലും ഡ്യൂട്ടിയിലുമാണ്.';

  @override
  String get offlineSuccessMessage => 'നിങ്ങൾ ഇപ്പോൾ ഓഫ്‌ലൈനാണ്.';

  @override
  String get partnerSupport => 'പാർട്ണർ സഹായം';

  @override
  String get partnerSupportSubtitle =>
      'നമസ്കാരം പാർട്ണർ! നിങ്ങളുടെ യാത്ര, പേയ്‌മെന്റ് അല്ലെങ്കിൽ അക്കൗണ്ടിൽ സഹായം വേണോ? ഞങ്ങൾ 24/7 നിങ്ങളെ സഹായിക്കാൻ ഇവിടെയുണ്ട്.';

  @override
  String get faqsAndHelp => 'പതിവ് ചോദ്യങ്ങളും സഹായവും';

  @override
  String get findQuickAnswers => 'വേഗത്തിലുള്ള ഉത്തരങ്ങൾ കണ്ടെത്തുക';

  @override
  String get raiseSupportTicket => 'ടിക്കറ്റ് സമർപ്പിക്കുക';

  @override
  String get contactSupportAgent => 'സഹായ ഏജന്റുമായി ബന്ധപ്പെടുക';

  @override
  String get recentTickets => 'സമീപകാല ടിക്കറ്റുകൾ';

  @override
  String get noActiveTickets => 'സജീവ സഹായ ടിക്കറ്റുകളൊന്നുമില്ല';

  @override
  String get submitTicketDescription =>
      'എന്തെങ്കിലും പ്രശ്നമുണ്ടെങ്കിൽ ഒരു ടിക്കറ്റ് സമർപ്പിക്കുക.';

  @override
  String get failedToLoadTickets => 'സമീപകാല ടിക്കറ്റുകൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get contactSupport => 'സഹായവുമായി ബന്ധപ്പെടുക';

  @override
  String get callUs => 'ഞങ്ങളെ വിളിക്കുക';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'ഞങ്ങളുമായി ചാറ്റ് ചെയ്യുക';

  @override
  String get emailSupport => 'ഇമെയിൽ സഹായം';

  @override
  String get ticketStatusOpen => 'തുറന്നത്';

  @override
  String get ticketStatusInProgress => 'പുരോഗതിയിൽ';

  @override
  String get ticketStatusResolved => 'പരിഹരിച്ചു';

  @override
  String get ticketStatusClosed => 'അടച്ചു';

  @override
  String get ticketCategoryRideIssue => 'യാത്രാ പ്രശ്നം';

  @override
  String get ticketCategoryPayment => 'പേയ്‌മെന്റ്';

  @override
  String get ticketCategoryAccount => 'അക്കൗണ്ട്';

  @override
  String get ticketCategoryDriverIssue => 'ഡ്രൈവർ പ്രശ്നം';

  @override
  String get ticketCategoryOther => 'മറ്റുള്ളവ';

  @override
  String get failedToLoadDashboard => 'ഡാഷ്‌ബോർഡ് ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get todaysEarnings => 'ഇന്നത്തെ വരുമാനം';

  @override
  String get cashCollected => 'ശേഖരിച്ച പണം';

  @override
  String get onlinePayment => 'ഓൺലൈൻ പേയ്‌മെന്റ്';

  @override
  String get todaysRideStatus => 'ഇന്നത്തെ യാത്രാ നില';

  @override
  String get totalRides => 'മൊത്തം യാത്രകൾ';

  @override
  String get cancelled => 'റദ്ദാക്കി';

  @override
  String get dutyRating => 'ഡ്യൂട്ടി റേറ്റിംഗ്';

  @override
  String get noRidesFound => 'റൈഡുകളൊന്നും കണ്ടെത്തിയില്ല';

  @override
  String get failedToLoadHistory => 'ചരിത്രം ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get all => 'എല്ലാം';

  @override
  String get paymentPending => 'പേയ്‌മെന്റ് തീർപ്പാക്കാത്തത്';

  @override
  String stopsCount(int count) {
    return '$count സ്റ്റോപ്പ്';
  }

  @override
  String get rideDetails => 'റൈഡ് വിശദാംശങ്ങൾ';

  @override
  String get pickupLocation => 'പിക്കപ്പ് സ്ഥലം';

  @override
  String get dropLocation => 'ഡ്രോപ്പ് സ്ഥലം';

  @override
  String stopLocation(int number) {
    return 'സ്റ്റോപ്പ് $number';
  }

  @override
  String get fareBreakdown => 'കൂലി വിശദാംശം';

  @override
  String get netPayable => 'ആകെ അടയ്ക്കേണ്ട തുക';

  @override
  String get paymentMethod => 'പേയ്‌മെന്റ് രീതി';

  @override
  String get cash => 'പണം';

  @override
  String get customerDetails => 'ഉപഭോക്താവിന്റെ വിശദാംശങ്ങൾ';

  @override
  String get callCustomer => 'ഉപഭോക്താവിനെ വിളിക്കുക';

  @override
  String get goodsType => 'ചരക്കിന്റെ തരം';

  @override
  String get quantity => 'അളവ്';

  @override
  String get weight => 'ഭാരം';

  @override
  String get distance => 'ദൂരം';

  @override
  String get duration => 'സമയം';

  @override
  String get cancellationReason => 'റദ്ദാക്കാനുള്ള കാരണം';

  @override
  String get routeTimeline => 'റൂട്ട് ടൈംലൈൻ';

  @override
  String get goodsSpecifications => 'ചരക്ക് വിവരണം';

  @override
  String get vehicleMetadata => 'വാഹന വിവരണം';

  @override
  String get description => 'വിവരണം';

  @override
  String get estimatedWeight => 'കണക്കാക്കിയ ഭാരം';

  @override
  String get vehicleName => 'വാഹനത്തിന്റെ പേര്';

  @override
  String get vehicleNumber => 'വാഹന നമ്പർ';

  @override
  String get modelColor => 'മോഡൽ / നിറം';

  @override
  String get baseFare => 'അടിസ്ഥാന കൂലി';

  @override
  String get weatherSurcharge => 'കാലാവസ്ഥാ അധിക നിരക്ക്';

  @override
  String get trafficSurcharge => 'ട്രാഫിക് അധിക നിരക്ക്';

  @override
  String get promoDiscount => 'പ്രോമോ കിഴിവ്';

  @override
  String get pickupSender => 'പിക്കപ്പ് (അയയ്ക്കുന്നയാൾ)';

  @override
  String get dropoffRecipient => 'ഡ്രോപ്പോഫ് (സ്വീകരിക്കുന്നയാൾ)';

  @override
  String rideIdLabel(String id) {
    return 'റൈഡ് ഐഡി: $id';
  }

  @override
  String get todaysTotalEarnings => 'ഇന്നത്തെ മൊത്തം വരുമാനം';

  @override
  String get failedToLoadEarnings => 'വരുമാന കണക്കുകൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get noTransactionsRecorded => 'ഇടപാടുകളൊന്നും രേഖപ്പെടുത്തിയിട്ടില്ല';

  @override
  String get mySupportTickets => 'എന്റെ സപ്പോർട്ട് ടിക്കറ്റുകൾ';

  @override
  String get newTicket => 'പുതിയ ടിക്കറ്റ്';

  @override
  String get noSupportTicketsRaised =>
      'സപ്പോർട്ട് ടിക്കറ്റുകളൊന്നും സമർപ്പിച്ചിട്ടില്ല';

  @override
  String get tapNewTicketSubtitle =>
      'സഹായം ലഭിക്കാൻ \'പുതിയ ടിക്കറ്റ്\' ടാപ്പ് ചെയ്യുക.';

  @override
  String get submitATicket => 'ടിക്കറ്റ് സമർപ്പിക്കുക';

  @override
  String get explainIssueDetail =>
      'നിങ്ങളുടെ പ്രശ്നം വിശദമായി വിവരിക്കുക. സഹായ ഏജന്റ് ഉടൻ സ്ഥിരീകരിച്ച് മറുപടി നൽകും.';

  @override
  String get categoryRequired => 'വിഭാഗം*';

  @override
  String get selectIssueCategory => 'പ്രശ്ന വിഭാഗം തിരഞ്ഞെടുക്കുക';

  @override
  String get pleaseSelectCategoryError =>
      'ദയവായി ഒരു പ്രശ്ന വിഭാഗം തിരഞ്ഞെടുക്കുക';

  @override
  String get subjectRequired => 'വിഷയം*';

  @override
  String get briefSummaryHint => 'പ്രശ്നത്തിന്റെ ചുരുക്ക വിവരണം';

  @override
  String get subjectRequiredError => 'വിഷയം നിർബന്ധമാണ്';

  @override
  String get subjectMinLengthError =>
      'വിഷയം കുറഞ്ഞത് 5 അക്ഷരങ്ങൾ ഉണ്ടായിരിക്കണം';

  @override
  String get descriptionRequired => 'വിവരണം / സന്ദേശം*';

  @override
  String get describeProblemHint => 'നിങ്ങളുടെ പ്രശ്നം വിശദമായി വിവരിക്കുക...';

  @override
  String get messageRequiredError => 'സന്ദേശ വിവരണം നിർബന്ധമാണ്';

  @override
  String get messageMinLengthError =>
      'സന്ദേശം കുറഞ്ഞത് 10 അക്ഷരങ്ങൾ ഉണ്ടായിരിക്കണം';

  @override
  String get submitTicket => 'ടിക്കറ്റ് സമർപ്പിക്കുക';

  @override
  String get privacyPolicy => 'സ്വകാര്യതാ നയം';

  @override
  String get termsAndConditions => 'നിബന്ധനകളും വ്യവസ്ഥകളും';

  @override
  String get termsOfService => 'സേവന നിബന്ധനകൾ';

  @override
  String get iAgreeTo => 'ഞാൻ ';

  @override
  String get and => ' ഒപ്പം ';

  @override
  String get agreeSuffix => ' അംഗീകരിക്കുന്നു';

  @override
  String get darkTheme => 'ഡാർക്ക് തീം';

  @override
  String get failedToLoadDetails => 'വിശദാംശങ്ങൾ ലോഡ് ചെയ്യാനായില്ല';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>സ്വകാര്യതാ നയം</h1><p>Reachu ഡ്രൈവർ ആപ്പിലേക്ക് സ്വാഗതം. നിങ്ങളുടെ സ്വകാര്യത ഞങ്ങൾക്ക് പ്രധാനമാണ്. ഈ സ്വകാര്യതാ നയം നിങ്ങളുടെ വ്യക്തിഗത വിവരങ്ങൾ ഞങ്ങൾ എങ്ങനെ ശേഖരിക്കുകയും ഉപയോഗിക്കുകയും സംരക്ഷിക്കുകയും ചെയ്യുന്നു എന്ന് വിശദീകരിക്കുന്നു.</p><h2>1. ഞങ്ങൾ ശേഖരിക്കുന്ന വിവരങ്ങൾ</h2><p>നിങ്ങളുടെ പേര്, ഫോൺ നമ്പർ, ഇമെയിൽ, വാഹന വിവരങ്ങൾ, സജീവ ട്രിപ്പുകൾക്കിടയിലെ ലൊക്കേഷൻ ഡാറ്റ, ഇടപാട് വിവരങ്ങൾ എന്നിവ ഞങ്ങൾ ശേഖരിക്കുന്നു.</p><h2>2. നിങ്ങളുടെ വിവരങ്ങൾ ഞങ്ങൾ എങ്ങനെ ഉപയോഗിക്കുന്നു</h2><p>ഡെലിവറി റൈഡുകൾ സുഗമമാക്കാനും പേയ്‌മെന്റുകൾ പ്രോസസ് ചെയ്യാനും സുരക്ഷ ഉറപ്പാക്കാനും ഡ്രൈവർ അനുഭവം മെച്ചപ്പെടുത്താനും ഞങ്ങൾ നിങ്ങളുടെ വിവരങ്ങൾ ഉപയോഗിക്കുന്നു.</p><h2>3. ലൊക്കേഷൻ ട്രാക്കിംഗ്</h2><p>ഓൺ-ഡ്യൂട്ടി സമയത്ത് നിങ്ങളെ അടുത്തുള്ള ഡെലിവറി അഭ്യർത്ഥനകളുമായി ബന്ധിപ്പിക്കാനും ഉപഭോക്താക്കൾക്ക് ട്രിപ്പ് പുരോഗതി കാണാനും ബാക്ക്ഗ്രൗണ്ട് ലൊക്കേഷൻ ആക്സസ് ആവശ്യമാണ്.</p><h2>4. ഡാറ്റ സുരക്ഷ</h2><p>നിങ്ങളുടെ വ്യക്തിഗത വിവരങ്ങൾ അനധികൃത ആക്സസിൽ നിന്ന് സംരക്ഷിക്കാൻ ഞങ്ങൾ കർശനമായ സുരക്ഷാ നടപടികൾ നടപ്പിലാക്കുന്നു.</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>നിബന്ധനകളും വ്യവസ്ഥകളും</h1><p>Reachu ഡ്രൈവർ ആപ്ലിക്കേഷൻ ഉപയോഗിക്കുന്നതിന് മുമ്പ് ഈ നിബന്ധനകളും വ്യവസ്ഥകളും ശ്രദ്ധാപൂർവ്വം വായിക്കുക.</p><h2>1. നിബന്ധനകളുടെ അംഗീകാരം</h2><p>Reachu-യിൽ ഒരു ഡ്രൈവർ പാർട്ണറായി രജിസ്റ്റർ ചെയ്യുന്നതിലൂടെ, ബാധകമായ എല്ലാ നിബന്ധനകളും നയങ്ങളും പ്രാദേശിക ഗതാഗത നിയമങ്ങളും പാലിക്കാൻ നിങ്ങൾ സമ്മതിക്കുന്നു.</p><h2>2. ഡ്രൈവറുടെ ഉത്തരവാദിത്തങ്ങൾ</h2><p>ഡ്രൈവർക്ക് സാധുവായ ഡ്രൈവിംഗ് ലൈസൻസ്, കൃത്യമായ വാഹന രേഖകൾ, സുരക്ഷിതവും സമയബന്ധിതവുമായ ഡെലിവറി സേവനം നൽകാനുള്ള ബാധ്യത ഉണ്ടായിരിക്കണം.</p><h2>3. പേയ്‌മെന്റും വരുമാനവും</h2><p>കൂലി പ്ലാറ്റ്ഫോം നിരക്കുകൾക്കനുസരിച്ച് നിശ്ചയിക്കുകയും ബാധകമായ ഫീസുകൾക്ക് ശേഷം നിങ്ങളുടെ സ്ഥിരീകരിച്ച ബാങ്ക് അക്കൗണ്ടിലേക്ക് ട്രാൻസ്ഫർ ചെയ്യുകയും ചെയ്യുന്നു.</p><h2>4. അക്കൗണ്ട് സസ്പെൻഷൻ</h2><p>വഞ്ചന പ്രവർത്തനങ്ങൾ, സുരക്ഷാ ലംഘനങ്ങൾ അല്ലെങ്കിൽ നയം പാലിക്കാത്ത സാഹചര്യത്തിൽ അക്കൗണ്ട് സസ്പെൻഡ് ചെയ്യാനുള്ള അവകാശം Reachu നിക്ഷിപ്തമാക്കുന്നു.</p>';

  @override
  String get reviewAndRating => 'അവലോകനവും റേറ്റിംഗും';

  @override
  String get noRatingsYet => 'ഇതുവരെ റേറ്റിംഗുകളൊന്നുമില്ല';

  @override
  String ratedByCustomers(int count) {
    return '$count ഉപഭോക്താക്കൾ റേറ്റ് ചെയ്തു';
  }

  @override
  String get noReviewsYet => 'ഇതുവരെ അവലോകനങ്ങളൊന്നുമില്ല';

  @override
  String get noReviewsDesc =>
      'നിങ്ങൾക്ക് ഇതുവരെ അവലോകനങ്ങളൊന്നും ലഭിച്ചിട്ടില്ല.';

  @override
  String get noCommentProvided => 'അഭിപ്രായമൊന്നും നൽകിയിട്ടില്ല';

  @override
  String get ratingExcellent => 'മികച്ചത്';

  @override
  String get ratingGood => 'നല്ലത്';

  @override
  String get ratingAverage => 'ശരാശരി';

  @override
  String get ratingBelowAverage => 'ശരാശരിയിൽ താഴെ';

  @override
  String get ratingPoor => 'മോശം';

  @override
  String get customer => 'ഉപഭോക്താവ്';

  @override
  String get noInternetConnection => 'ഇന്റർനെറ്റ് കണക്ഷൻ ഇല്ല';

  @override
  String get checkInternetConnection =>
      'ദയവായി നിങ്ങളുടെ ഇന്റർനെറ്റ് കണക്ഷൻ പരിശോധിച്ച് വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get internetRestored => 'ഇന്റർനെറ്റ് കണക്ഷൻ പുനഃസ്ഥാപിച്ചു';

  @override
  String get retryConnection => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get connectionTimedOut =>
      'കണക്ഷൻ സമയം കഴിഞ്ഞു. വീണ്ടും ശ്രമിക്കുന്നു...';

  @override
  String get newUpdateAvailable =>
      'പുതിയ അപ്ഡേറ്റ് ലഭ്യമാണ്. തുടരാൻ ആപ്പ് അപ്ഡേറ്റ് ചെയ്യുക.';

  @override
  String get updateRequiredTitle => 'അപ്ഡേറ്റ് ആവശ്യമാണ്';

  @override
  String updateRequiredDesc(String version) {
    return 'നിങ്ങൾ Reachu Driver-ന്റെ പഴയ പതിപ്പാണ് ഉപയോഗിക്കുന്നത്. റൈഡുകൾ എടുക്കുന്നത് തുടരാൻ ദയവായി ഏറ്റവും പുതിയ പതിപ്പിലേക്ക് അപ്ഡേറ്റ് ചെയ്യുക.';
  }

  @override
  String get updateNow => 'ഇപ്പോൾ അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String get updateLater => 'പിന്നീട് അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String get underMaintenanceTitle => 'അറ്റകുറ്റപ്പണിയിലാണ്';

  @override
  String get underMaintenanceDesc =>
      'നിങ്ങൾക്ക് മികച്ച സേവനം നൽകുന്നതിനായി ഞങ്ങൾ സിസ്റ്റങ്ങൾ അപ്ഡേറ്റ് ചെയ്യുകയാണ്. ദയവായി അല്പസമയത്തിന് ശേഷം പരിശോധിക്കുക.';

  @override
  String estimatedBackIn(Object time) {
    return 'പ്രതീക്ഷിക്കുന്ന സമയം $time';
  }

  @override
  String get backOnlineSoon => 'ഞങ്ങൾ ഉടൻ ഓൺലൈനിൽ തിരിച്ചെത്തും!';

  @override
  String installedVersion(String version) {
    return 'ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പ്: $version';
  }

  @override
  String get couldNotOpenStore => 'ആപ്പ് സ്റ്റോർ തുറക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get detailedFareBreakdown => 'വിശദമായ നിരക്ക് വിവരം';

  @override
  String get checkPaymentStatus => 'പേയ്മെന്റ് സ്റ്റാറ്റസ് പരിശോധിക്കുക';

  @override
  String get checkingStatus => 'സ്റ്റാറ്റസ് പരിശോധിക്കുന്നു...';

  @override
  String get details => 'വിശദാംശങ്ങൾ';

  @override
  String get hide => 'മറയ്ക്കുക';

  @override
  String get collectCashFromCustomer => 'ഉപഭോക്താവിൽ നിന്ന് പണം വാങ്ങുക';

  @override
  String get customerOnlineFareDue => 'ഉപഭോക്താവ് ഓൺലൈനായി നൽകേണ്ട തുക';

  @override
  String get reachuWalletCredit => 'Reachu വാലറ്റ് ക്രെഡിറ്റ്';

  @override
  String promoReimbursementNote(String amount) {
    return '*നിങ്ങളുടെ വാലറ്റിൽ ക്രെഡിറ്റ് ചെയ്ത Reachu പ്രൊമോ തുക ഉൾപ്പെടുന്നു';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*കാത്തിരിപ്പ് സമയത്തിനായുള്ള വെയ്റ്റിംഗ് ചാർജ് ഉൾപ്പെടുന്നു';
  }

  @override
  String get paymentReceivedSuccess => 'പേയ്മെന്റ് വിജയകരമായി ലഭിച്ചു!';

  @override
  String get paymentStillPending => 'പേയ്മെന്റ് ഇപ്പോഴും ബാക്കിയാണ്';

  @override
  String get waitingCharge => 'വെയ്റ്റിംഗ് ചാർജ്';

  @override
  String get rentalCharge => 'റെന്റൽ ചാർജ്';

  @override
  String get grossFare => 'ആകെ നിരക്ക്';

  @override
  String get pendingDue => 'ബാക്കി തുക';

  @override
  String get tollFee => 'ടോൾ ഫീ';

  @override
  String get cancellationFee => 'ക്യാൻസലേഷൻ ഫീ';

  @override
  String get nightSurcharge => 'നൈറ്റ് സർചാർജ്';

  @override
  String get surgeFee => 'സർജ് ഫീ';

  @override
  String get taxAndFees => 'നികുതിയും ഫീസുകളും';

  @override
  String get platformFee => 'പ്ലാറ്റ്‌ഫോം ഫീ';

  @override
  String get pressBackAgainToExit =>
      'ആപ്പിൽ നിന്ന് പുറത്തുകടക്കാൻ വീണ്ടും ബാക്ക് അമർത്തുക';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'പുറത്തുപോകുന്നതിന് മുമ്പ് റൈഡ് സ്വീകരിക്കുകയോ നിരസിക്കുകയോ ചെയ്യുക';

  @override
  String get cashPayment => 'ക്യാഷ് പേയ്മെന്റ്';

  @override
  String get onlineQr => 'ഓൺലൈൻ ക്യുആർ';

  @override
  String get collectCashInstructions =>
      'റൈഡ് അവസാനിപ്പിക്കുന്നതിന് മുമ്പ് ഉപഭോക്താവിൽ നിന്ന് പണം വാങ്ങുക.';

  @override
  String collectCashStep1(String amount) {
    return '1. ഉപഭോക്താവിൽ നിന്ന് കൃത്യമായ തുക വാങ്ങുക';
  }

  @override
  String get collectCashStep2 =>
      '2. താഴെയുള്ള \'പണം ലഭിച്ചു എന്ന് സ്ഥിരീകരിക്കുക\' ബട്ടൺ അമർത്തുക';

  @override
  String get verifyingCashDeposit => 'പണ അടവ് പരിശോധിക്കുന്നു...';

  @override
  String get pleaseHoldClosingRide =>
      'റൈഡ് അവസാനിപ്പിക്കുന്നതുവരെ ദയവായി കാത്തിരിക്കുക';

  @override
  String get customerOnlinePayment => 'ഉപഭോക്താവിന്റെ ഓൺലൈൻ പേയ്മെന്റ്';

  @override
  String get generatingQrCode => 'ക്യുആർ കോഡ് തയ്യാറാക്കുന്നു...';

  @override
  String get failedToLoadQrCode => 'ക്യുആർ കോഡ് ലോഡ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get scanQrToPay =>
      'ഓൺലൈനായി പണമടയ്ക്കാൻ ഉപഭോക്താവിനോട് ക്യുആർ കോഡ് സ്കാൻ ചെയ്യാൻ പറയുക';

  @override
  String get pinchToZoomQr => 'ക്യുആർ കോഡ് വലുതാക്കാൻ പിഞ്ച് ചെയ്യുക';

  @override
  String get tapToFullScreen =>
      'ഫുൾ സ്ക്രീൻ കാഴ്ചയ്ക്കായി ക്യുആർ കോഡിൽ ടാപ്പ് ചെയ്യുക';

  @override
  String get awaitingCustomerPayment =>
      'ഉപഭോക്താവിന്റെ പേയ്മെന്റിനായി കാത്തിരിക്കുന്നു...';

  @override
  String get confirmCashReceived => 'പണം ലഭിച്ചു എന്ന് സ്ഥിരീകരിക്കുക';

  @override
  String get paymentReceivedToast =>
      'പേയ്മെന്റ് ലഭിച്ചു! റൈഡ് അവസാനിപ്പിക്കുന്നു...';

  @override
  String get invalidOrderIdError => 'അസാധുവായ ഓർഡർ ഐഡി';

  @override
  String get cashPaymentRecordedWaiting =>
      'ക്യാഷ് പേയ്മെന്റ് രേഖപ്പെടുത്തി. റൈഡ് അവസാനിപ്പിക്കുന്നു...';

  @override
  String get paymentReceivedTitle => 'പേയ്മെന്റ് ലഭിച്ചു';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount തുക വിജയകരമായി അടച്ചു!';
  }

  @override
  String get rideClosedReturningHome =>
      'റൈഡ് അവസാനിച്ചു. ഹോമിലേക്ക് മടങ്ങുന്നു...';

  @override
  String get fragileGoods => 'എളുപ്പത്തിൽ കേടുപാടുകൾ സംഭവിക്കുന്ന ഉൽപ്പന്നങ്ങൾ';

  @override
  String get yes => 'അതെ';

  @override
  String get no => 'അല്ല';

  @override
  String contactLabel(String name, Object phone) {
    return 'ബന്ധപ്പെടുക: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'അനുമതികൾ ആവശ്യമാണ്';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver കൃത്യമായി പ്രവർത്തിക്കാൻ താഴെ പറയുന്ന അനുമതികൾ ആവശ്യമാണ്.';

  @override
  String get locationAlwaysTitle => 'ലൊക്കേഷൻ (എപ്പോഴും അനുവദിക്കുക)';

  @override
  String get locationAlwaysSubtitle =>
      'ഓർഡർ ഡിസ്പാച്ചിനും പശ്ചാത്തല റൈഡ് ട്രാക്കിംഗിനും ആവശ്യമാണ്.';

  @override
  String get batteryUnrestrictedTitle =>
      'ബാറ്ററി ഒപ്റ്റിമൈസേഷൻ (നിയന്ത്രണമില്ലാത്തത്)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'പശ്ചാത്തല സോക്കറ്റ് കണക്ഷൻ നിലനിൽക്കുന്നുണ്ടെന്ന് ഉറപ്പാക്കുന്നു.';

  @override
  String get notificationsTitle => 'അറിയിപ്പുകൾ';

  @override
  String get notificationsSubtitle =>
      'പുതിയ റൈഡ് അഭ്യർത്ഥനകൾക്കും ഓർഡർ അലേർട്ടുകൾക്കും ആവശ്യമാണ്.';

  @override
  String get displayOverAppsTitle => 'മറ്റ് ആപ്പുകൾക്ക് മുകളിൽ കാണിക്കുക';

  @override
  String get displayOverAppsSubtitle =>
      'ഇൻകമിംഗ് ഓർഡർ പോപ്പ്അപ്പുകൾക്ക് ആവശ്യമാണ്.';

  @override
  String get locationUsedInBackground =>
      'പശ്ചാത്തലത്തിൽ ഉപയോഗിക്കുന്ന ലൊക്കേഷൻ';

  @override
  String get backgroundLocationDisclosureBody =>
      'ആപ്പ് അടച്ചിരിക്കുമ്പോഴും ലൊക്കേഷൻ വിവരങ്ങൾ ReachuDriver ശേഖരിക്കുന്നു.\n\nഇത് എന്തിനാണ് ഉപയോഗിക്കുന്നത്:\n  • നിങ്ങളുടെ തത്സമയ സ്റ്റാറ്റസ് ഉപഭോക്താക്കളുമായി പങ്കിടാൻ\n  • ഏറ്റവും അടുത്തുള്ള ബുക്കിംഗ് അഭ്യർത്ഥനകൾ നൽകാൻ\n  • നിങ്ങൾ ഡ്യൂട്ടിയിലായിരിക്കുമ്പോൾ സിസ്റ്റം അപ്ഡേറ്റ് ചെയ്യാൻ\n\nനിങ്ങൾ ഓൺലൈനിലായിരിക്കുമ്പോൾ (ഡ്യൂട്ടിയിലായിരിക്കുമ്പോൾ) മാത്രമാണ് ലൊക്കേഷൻ ശേഖരണം പ്രവർത്തിക്കുന്നത്.';

  @override
  String get changeInAppSettingsNote =>
      'ആപ്പ് സെറ്റിംഗ്സിൽ നിന്ന് എപ്പോൾ വേണമെങ്കിലും ഇത് മാറ്റാവുന്നതാണ്.';

  @override
  String get iUnderstandContinue => 'എനിക്ക് മനസ്സിലായി — തുടരുക';

  @override
  String get notNow => 'ഇപ്പോൾ വേണ്ട';

  @override
  String get lowWalletBalance => 'കുറഞ്ഞ വാലറ്റ് ബാലൻസ്';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ഓർഡറുകൾ ലഭിക്കുന്നതിന് ദയവായി കുറഞ്ഞത് ₹$limit വാലറ്റ് ബാലൻസ് സൂക്ഷിക്കുക. ഓർഡറുകൾ ലഭിക്കുന്നത് തുടരാൻ നിങ്ങളുടെ വാലറ്റ് ടോപ്പ് അപ്പ് ചെയ്യുക.';
  }

  @override
  String get minimumRequiredBalance => 'ആവശ്യമായ കുറഞ്ഞ ബാലൻസ്';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ഓർഡറുകൾ ലഭിക്കുന്നതിന് നിങ്ങളുടെ വാലറ്റിൽ കുറഞ്ഞത് ₹$limit എങ്കിലും സൂക്ഷിക്കുക.';
  }

  @override
  String get activeForRides => 'റൈഡുകൾക്കായി ആക്ടീവ്';

  @override
  String get lowBalanceStatus => 'കുറഞ്ഞ ബാലൻസ്';

  @override
  String get minimumLimit => 'കുറഞ്ഞ പരിധി';

  @override
  String get eShramBenefitsTitle => 'ഇ-ശ്രമം ആനുകൂല്യങ്ങൾ';

  @override
  String get govtScheme => 'സർക്കാർ പദ്ധതി';

  @override
  String get eShramSubHeader => 'സർക്കാർ ഇൻഷുറൻസ് & പെൻഷൻ പദ്ധതി';

  @override
  String get eShramDescription =>
      'ഗിഗ് തൊഴിലാളികൾക്കുള്ള അപകട ഇൻഷുറൻസും സാമൂഹിക സുരക്ഷാ ആനുകൂല്യങ്ങളും ലഭിക്കുന്നതിന് ഔദ്യോഗിക ഇ-ശ്രമം പോർട്ടലിൽ രജിസ്റ്റർ ചെയ്യുക.';

  @override
  String get registerOnEShramPortal => 'ഇ-ശ്രമം പോർട്ടലിൽ രജിസ്റ്റർ ചെയ്യുക';

  @override
  String get eShramGovtBenefitsMenu => 'ഇ-ശ്രമം സർക്കാർ ആനുകൂല്യങ്ങൾ';

  @override
  String get dismiss => 'ഒഴിവാക്കുക';
}
