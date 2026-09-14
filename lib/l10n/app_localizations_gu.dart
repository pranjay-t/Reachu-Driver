// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get account => 'ખાતું';

  @override
  String get editProfile => 'પ્રોફાઇલ સંપાદિત કરો';

  @override
  String get logout => 'લૉગઆઉટ';

  @override
  String get language => 'ભાષા';

  @override
  String get selectLanguage => 'ભાષા પસંદ કરો';

  @override
  String get english => 'English (અંગ્રેજી)';

  @override
  String get hindi => 'હિન્દી (Hindi)';

  @override
  String get selectVehicle => 'વાહન પસંદ કરો';

  @override
  String get selectAVehicle => 'એક વાહન પસંદ કરો';

  @override
  String proceedWithVehicle(String vehicleName) {
    return '$vehicleName સાથે આગળ વધો';
  }

  @override
  String get addStop => 'સ્ટોપ ઉમેરો';

  @override
  String get editLocations => 'સ્થાનો સંપાદિત કરો';

  @override
  String get noPickupLocationSet => 'કોઈ પિકઅપ સ્થાન સેટ નથી';

  @override
  String get noDropLocationSet => 'કોઈ ડ્રોપ સ્થાન સેટ નથી';

  @override
  String get addDrop => 'ડ્રોપ ઉમેરો';

  @override
  String get errorLoadingVehicles => 'વાહનો લોડ કરવામાં ભૂલ';

  @override
  String get selectGoodsType => 'માલનો પ્રકાર પસંદ કરો';

  @override
  String get whatAreYouShipping => 'તમે શું મોકલી રહ્યા છો?';

  @override
  String get chooseCategoryBestMatches =>
      'તે શ્રેણી પસંદ કરો જે તમારા માલ સાથે સૌથી વધુ મેળ ખાય';

  @override
  String get editGoodsDetails => 'માલની વિગતો સંપાદિત કરો';

  @override
  String get weightKgMax90 => 'વજન (કિગ્રા) - મહત્તમ 90 કિગ્રા';

  @override
  String get weightInvalidError => 'વજન 1 થી 90 કિગ્રા વચ્ચે હોવું જોઈએ';

  @override
  String get numberOfPackages => 'પેકેજોની સંખ્યા';

  @override
  String get worthValueRupees => 'મૂલ્ય / કિંમત (રૂપિયા)';

  @override
  String get done => 'થઈ ગયું';

  @override
  String get confirmGoodsDetails => 'માલની વિગતોની પુષ્ટિ કરો';

  @override
  String get failedToLoadCategories => 'શ્રેણીઓ લોડ કરવામાં નિષ્ફળ';

  @override
  String get disclaimerTitle => 'અસ્વીકરણ';

  @override
  String get disclaimerText =>
      'અસ્વીકરણ: હું ઘોષણા કરું છું કે પરિવહન કરવામાં આવી રહેલો માલ બિન-ખતરનાક, કાયદેસર છે અને પસંદ કરેલી શ્રેણીનો છે. પ્રતિબંધિત વસ્તુઓના પરિવહન માટે કંપની જવાબદાર નથી. વજન વાહનની મહત્તમ ક્ષમતાથી વધુ ન હોવું જોઈએ.';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight કિગ્રા • $packages પેકેજ • ₹$worth';
  }

  @override
  String get welcome => 'સ્વાગત છે';

  @override
  String get enterMobileNumberToContinue =>
      'ચાલુ રાખવા માટે તમારો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get mobileNumber => 'મોબાઇલ નંબર';

  @override
  String get agreeTermsText =>
      'હું સેવાની શરતો અને ગોપનીયતા નીતિ સાથે સંમત છું';

  @override
  String get sendOtp => 'OTP મોકલો';

  @override
  String get verifyOtp => 'OTP ચકાસો';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return '+91 $phoneNumber પર મોકલેલો 4-અંકનો કોડ દાખલ કરો';
  }

  @override
  String get verifyAndContinue => 'ચકાસો અને ચાલુ રાખો';

  @override
  String resendInSeconds(Object count) {
    return '$count સેકન્ડમાં ફરી મોકલો';
  }

  @override
  String get resendOtp => 'OTP ફરી મોકલો';

  @override
  String get changeNumber => 'નંબર બદલો';

  @override
  String get mobileNumberRequired => 'મોબાઇલ નંબર જરૂરી છે';

  @override
  String get enterValidMobileNumber => 'માન્ય 10-અંકનો મોબાઇલ નંબર દાખલ કરો';

  @override
  String get enterCompleteOtpError => 'કૃપા કરીને સંપૂર્ણ 4-અંકનો OTP દાખલ કરો';

  @override
  String get otpResentSuccess => 'OTP સફળતાપૂર્વક ફરી મોકલાયો';

  @override
  String get fullName => 'પૂરું નામ';

  @override
  String get fullNameRequired => 'પૂરું નામ જરૂરી છે';

  @override
  String get nameMinLengthError => 'નામ ઓછામાં ઓછા 2 અક્ષરોનું હોવું જોઈએ';

  @override
  String get email => 'ઈમેઇલ';

  @override
  String get emailRequired => 'ઈમેઇલ જરૂરી છે';

  @override
  String get enterValidEmail => 'માન્ય ઈમેઇલ સરનામું દાખલ કરો';

  @override
  String get referralCode => 'રેફરલ કોડ';

  @override
  String get enterReferralCodeOptional => 'રેફરલ કોડ દાખલ કરો (વૈકલ્પિક)';

  @override
  String get createAccount => 'ખાતું બનાવો';

  @override
  String get completeProfileToGetStarted =>
      'શરૂ કરવા માટે તમારી પ્રોફાઇલ પૂર્ણ કરો';

  @override
  String get profileUpdatedSuccess => 'પ્રોફાઇલ સફળતાપૂર્વક અપડેટ થઈ!';

  @override
  String get updateProfilePicture => 'પ્રોફાઇલ ચિત્ર અપડેટ કરો';

  @override
  String get camera => 'કેમેરા';

  @override
  String get gallery => 'ગેલેરી';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get dateOfBirthOptional => 'જન્મ તારીખ (વૈકલ્પિક)';

  @override
  String get gender => 'લિંગ';

  @override
  String get male => 'પુરુષ';

  @override
  String get female => 'સ્ત્રી';

  @override
  String get other => 'અન્ય';

  @override
  String get updateProfile => 'પ્રોફાઇલ અપડેટ કરો';

  @override
  String profileUpdateFailed(Object error) {
    return 'પ્રોફાઇલ અપડેટ કરવામાં નિષ્ફળ: $error';
  }

  @override
  String get goodMorning => 'સુપ્રભાત,';

  @override
  String get goodAfternoon => 'શુભ બપોર,';

  @override
  String get goodEvening => 'શુભ સાંજ,';

  @override
  String get pickupFrom => 'અહીંથી પિકઅપ';

  @override
  String get currentLocation => 'વર્તમાન સ્થાન';

  @override
  String get fetchingLocation => 'સ્થાન મેળવી રહ્યા છીએ...';

  @override
  String get locationServicesDisabled => 'સ્થાન સેવાઓ અક્ષમ છે';

  @override
  String get locationPermissionNeeded => 'સ્થાન પરવાનગી જરૂરી છે';

  @override
  String get locationAccessBlocked => 'સ્થાન ઍક્સેસ અવરોધિત છે';

  @override
  String get couldNotFetchLocation => 'સ્થાન મેળવી શકાયું નહીં';

  @override
  String get enable => 'સક્ષમ કરો';

  @override
  String get allow => 'મંજૂરી આપો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get retry => 'ફરી પ્રયાસ કરો';

  @override
  String get turnOnLocationServices => 'સ્થાન સેવાઓ ચાલુ કરો';

  @override
  String get allowLocationAccess => 'સ્થાન ઍક્સેસની મંજૂરી આપો';

  @override
  String get gpsRequiredDescription =>
      'તમારા પિકઅપ સ્થાનને ચોક્કસ રીતે ઓળખવા અને નજીકના ડ્રાઇવરોને ઝડપથી શોધવા માટે અમને તમારા ડિવાઇસ GPSની જરૂર છે.';

  @override
  String get permissionRequiredDescription =>
      'કૃપા કરીને તમારી એપ સેટિંગ્સમાં સ્થાન પરવાનગીઓ મંજૂર કરો જેથી અમે તમારા પિકઅપ સ્થાનને ચોક્કસ રીતે ઓળખી શકીએ અને નજીકના ડ્રાઇવરોને ઝડપથી શોધી શકીએ.';

  @override
  String get goToLocationSettings => 'સ્થાન સેટિંગ્સ પર જાઓ';

  @override
  String get goToAppSettings => 'એપ સેટિંગ્સ પર જાઓ';

  @override
  String get enterAddressManually => 'હું મારું સરનામું મેન્યુઅલી દાખલ કરીશ';

  @override
  String get taglineTitle => 'કંઈપણ લઈ જાઓ,\nક્યારેય.';

  @override
  String get taglineSubtitle =>
      'ઝડપી ડિલિવરી તમારી આંગળીઓ પર. સ્માર્ટ રીતે શિફ્ટ કરો, અમારા પ્રીમિયમ ફ્લીટ સાથે ઝડપથી આગળ વધો.';

  @override
  String get twoWheelers => 'બે પૈડાં';

  @override
  String get trucks => 'ટ્રક';

  @override
  String get specialOffer => 'વિશેષ ઓફર';

  @override
  String get promoBannerText => 'તમારી પહેલી રાઇડ પર\n20% નું ડિસ્કાઉન્ટ મેળવો';

  @override
  String get whereIsYourPickup => 'તમારું પિકઅપ ક્યાં છે?';

  @override
  String get whereIsYourDrop => 'તમારું ડ્રોપ ક્યાં છે?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'તમારું ડ્રોપ $index ક્યાં છે?';
  }

  @override
  String get typeMinCharsToSearch =>
      'શોધ શરૂ કરવા માટે ઓછામાં ઓછા 4 અક્ષરો ટાઇપ કરો';

  @override
  String get selectOnMap => 'નકશા પર પસંદ કરો';

  @override
  String get pinpointExactLocation => 'તમારા ચોક્કસ સ્થાનને ઓળખો';

  @override
  String get couldNotFindAddress => 'માફ કરો, અમને આ સરનામું મળ્યું નહીં.';

  @override
  String get trySearchingNearbyLandmark =>
      'નજીકના લેન્ડમાર્ક, વિસ્તાર અથવા લોકપ્રિય સ્થાનનો ઉપયોગ કરીને શોધવાનો પ્રયાસ કરો.';

  @override
  String get anErrorOccurred => 'એક ભૂલ આવી';

  @override
  String get locating => 'સ્થાન શોધી રહ્યા છીએ...';

  @override
  String get fetchingDetails => 'વિગતો મેળવી રહ્યા છીએ...';

  @override
  String get confirmPickupLocation => 'પિકઅપ સ્થાનની પુષ્ટિ કરો';

  @override
  String get confirmDropLocation => 'ડ્રોપ સ્થાનની પુષ્ટિ કરો';

  @override
  String get houseShopApartment => 'ઘર / દુકાન / એપાર્ટમેન્ટ';

  @override
  String get sendersName => 'મોકલનારનું નામ';

  @override
  String get receiversName => 'પ્રાપ્તકર્તાનું નામ';

  @override
  String get pleaseEnterName => 'કૃપા કરીને નામ દાખલ કરો';

  @override
  String get sendersMobileNumber => 'મોકલનારનો મોબાઇલ નંબર';

  @override
  String get receiversMobileNumber => 'પ્રાપ્તકર્તાનો મોબાઇલ નંબર';

  @override
  String get enterValidTenDigitNumber => 'માન્ય 10-અંકનો નંબર દાખલ કરો';

  @override
  String get useMyMobileNumber => 'મારો મોબાઇલ નંબર વાપરો';

  @override
  String get saveAsOptional => 'આ રૂપે સાચવો (વૈકલ્પિક):';

  @override
  String get home => 'ઘર';

  @override
  String get shop => 'દુકાન';

  @override
  String get confirmAndProceed => 'પુષ્ટિ કરો અને આગળ વધો';

  @override
  String get selectDropLocation => 'ડ્રોપ સ્થાન પસંદ કરો';

  @override
  String get cannotSwapEmptyLocations =>
      'ખાલી સ્થાનોને ભરેલા સ્થાનો સાથે બદલી શકાતા નથી.';

  @override
  String get proceedToVehicleSelection => 'વાહન પસંદગી પર આગળ વધો';

  @override
  String get permissionRequired => 'પરવાનગી જરૂરી છે';

  @override
  String get contactsPermissionDescription =>
      'મોકલનારનો ફોન નંબર સરળતાથી પસંદ કરવા માટે Reachu ને તમારા સંપર્કોની ઍક્સેસની જરૂર છે. કૃપા કરીને એપ સેટિંગ્સમાં તેને સક્ષમ કરો.';

  @override
  String get openSettings => 'સેટિંગ્સ ખોલો';

  @override
  String get selectContact => 'સંપર્ક પસંદ કરો';

  @override
  String get contactPermissionDenied => 'સંપર્ક પરવાનગી નકારવામાં આવી.';

  @override
  String get myProfile => 'મારી પ્રોફાઇલ';

  @override
  String selfFormat(String name) {
    return '$name (પોતે)';
  }

  @override
  String get deviceContacts => 'ડિવાઇસ સંપર્કો';

  @override
  String get rideHistory => 'રાઇડનો ઇતિહાસ';

  @override
  String get transactions => 'વ્યવહારો';

  @override
  String get noTransactionsFound => 'કોઈ વ્યવહાર મળ્યો નહીં';

  @override
  String get failedToLoadTransactions => 'વ્યવહારો લોડ કરવામાં નિષ્ફળ';

  @override
  String get addMoney => 'પૈસા ઉમેરો';

  @override
  String get enterAmountToAdd => 'ઉમેરવાની રકમ દાખલ કરો';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Razorpay ખોલવામાં નિષ્ફળ: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'ચુકવણી ઓર્ડર બનાવવામાં નિષ્ફળ: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'Reachu ક્રેડિટમાં ₹$amount સફળતાપૂર્વક ઉમેરાયા!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'ચુકવણી ચકાસણી નિષ્ફળ: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'ચુકવણી નિષ્ફળ ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'બાહ્ય વૉલેટ પસંદ કર્યું: $walletName';
  }

  @override
  String get walletTopUp => 'વૉલેટ ટોપ-અપ';

  @override
  String get payments => 'ચુકવણીઓ';

  @override
  String get reachuCredits => 'Reachu ક્રેડિટ';

  @override
  String get balance => 'બેલેન્સ';

  @override
  String get errorLoadingBalance => 'બેલેન્સ લોડ કરવામાં ભૂલ';

  @override
  String get availableBalance => 'ઉપલબ્ધ બેલેન્સ';

  @override
  String get totalExpenses => 'કુલ ખર્ચ';

  @override
  String get recentTransactions => 'તાજેતરના વ્યવહારો';

  @override
  String get viewMore => 'વધુ જુઓ';

  @override
  String get noTransactionsYet => 'હજુ સુધી કોઈ વ્યવહાર નથી';

  @override
  String get booking => 'બુકિંગ';

  @override
  String get earning => 'કમાણી';

  @override
  String get support => 'સહાય';

  @override
  String get profile => 'પ્રોફાઇલ';

  @override
  String get pendingWithdrawals => 'બાકી ઉપાડ';

  @override
  String get driverDebt => 'ડ્રાઇવર ઋણ';

  @override
  String minBalanceRequired(Object amount) {
    return 'ન્યૂનતમ બેલેન્સ જરૂરી: ₹$amount';
  }

  @override
  String get insufficientBalance => 'ઉપાડ માટે અપૂરતું બેલેન્સ';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'ચેતવણી: તમારું ઉપલબ્ધ બેલેન્સ નવી રાઇડ સ્વીકારવા માટે જરૂરી ન્યૂનતમ મર્યાદા (₹$amount) કરતાં ઓછું છે. કૃપા કરીને તમારું વૉલેટ ટોપ અપ કરો.';
  }

  @override
  String get moneyTransfer => 'પૈસા ટ્રાન્સફર કરો';

  @override
  String get withdrawMoney => 'પૈસા ઉપાડો';

  @override
  String get manageAccounts => 'ખાતાઓ મેનેજ કરો';

  @override
  String get bankAccounts => 'બેંક ખાતા અને UPI';

  @override
  String get addAccount => 'ચુકવણી પદ્ધતિ ઉમેરો';

  @override
  String get addBankAccount => 'બેંક ખાતું ઉમેરો';

  @override
  String get addUpiId => 'UPI ID ઉમેરો';

  @override
  String get editBankAccount => 'બેંક ખાતું સંપાદિત કરો';

  @override
  String get editUpiId => 'UPI ID સંપાદિત કરો';

  @override
  String get deleteAccount => 'ખાતું કાઢી નાખો';

  @override
  String get deleteAccountConfirm =>
      'શું તમે ખરેખર આ ચુકવણી પદ્ધતિ કાઢી નાખવા માંગો છો?';

  @override
  String get accountHolderName => 'ખાતાધારકનું નામ';

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
  String get bankName => 'બેંકનું નામ';

  @override
  String get accountNumber => 'ખાતા નંબર';

  @override
  String get confirmAccountNumber => 'ખાતા નંબરની પુષ્ટિ કરો';

  @override
  String get ifscCode => 'IFSC કોડ';

  @override
  String get upiId => 'UPI ID';

  @override
  String get fieldRequired => 'આ ફીલ્ડ જરૂરી છે';

  @override
  String get invalidUpi => 'માન્ય UPI ID દાખલ કરો (જેમ કે name@upi)';

  @override
  String get invalidIfsc => 'માન્ય 11-અક્ષરનો IFSC કોડ દાખલ કરો';

  @override
  String get invalidAccountNumber => 'માન્ય ખાતા નંબર દાખલ કરો';

  @override
  String get accountNumbersDoNotMatch => 'ખાતા નંબર મેળ ખાતા નથી';

  @override
  String get noPaymentMethods => 'હજુ સુધી કોઈ ચુકવણી પદ્ધતિ ઉમેરાઈ નથી';

  @override
  String get addPaymentMethodSubtitle =>
      'તમારી કમાણી ઉપાડવા માટે બેંક ખાતું અથવા UPI ID ઉમેરો';

  @override
  String get confirmTransfer => 'ટ્રાન્સફરની પુષ્ટિ કરો';

  @override
  String get transferAmount => 'ટ્રાન્સફર રકમ';

  @override
  String get transferSuccess => 'ઉપાડ વિનંતી સફળતાપૂર્વક બનાવવામાં આવી';

  @override
  String get collectPayment => 'ચુકવણી એકત્રિત કરો';

  @override
  String get collectCash => 'રોકડા એકત્રિત કરો';

  @override
  String get cashCollectedSuccess => 'રોકડ ચુકવણી સફળતાપૂર્વક પૂર્ણ થઈ!';

  @override
  String get displayQrCode => 'UPI QR કોડ બતાવો';

  @override
  String get customerScanQr =>
      'ચુકવણી કરવા માટે આ QR કોડ સ્કેન કરવા ગ્રાહકને કહો';

  @override
  String get generatingQr => 'QR કોડ બનાવી રહ્યા છીએ...';

  @override
  String get selectPaymentMethod => 'ચુકવણી પદ્ધતિ પસંદ કરો';

  @override
  String get beneficiary => 'લાભાર્થી';

  @override
  String get completed => 'પૂર્ણ';

  @override
  String get pending => 'બાકી';

  @override
  String get failed => 'નિષ્ફળ';

  @override
  String get failedToLoadAccounts => 'ચુકવણી પદ્ધતિઓ લોડ કરવામાં નિષ્ફળ';

  @override
  String get accountDeletedSuccess =>
      'ચુકવણી પદ્ધતિ સફળતાપૂર્વક કાઢી નાખવામાં આવી';

  @override
  String get accountUpdatedSuccess => 'ચુકવણી પદ્ધતિ સફળતાપૂર્વક અપડેટ થઈ';

  @override
  String get accountAddedSuccess => 'ચુકવણી પદ્ધતિ સફળતાપૂર્વક ઉમેરાઈ';

  @override
  String get withdrawalAmount => 'ઉપાડ રકમ';

  @override
  String get transferDestination => 'ટ્રાન્સફર ગંતવ્ય';

  @override
  String get enterAmount => 'રકમ દાખલ કરો';

  @override
  String get selected => 'પસંદ કરેલ';

  @override
  String get accountNumberLabel => 'ખાતા નંબર';

  @override
  String get errorLoadingAccounts => 'ચુકવણી પદ્ધતિઓ લોડ કરવામાં ભૂલ';

  @override
  String get errorLoadingWallet => 'વૉલેટ માહિતી લોડ કરવામાં ભૂલ';

  @override
  String get enterAccountHolderName => 'ખાતાધારકનું નામ દાખલ કરો';

  @override
  String get bankNameHint => 'જેમ કે સ્ટેટ બેંક ઓફ ઇન્ડિયા';

  @override
  String get enterAccountNumber => 'ખાતા નંબર દાખલ કરો';

  @override
  String get confirmAccountNumberHint => 'ખાતા નંબરની પુષ્ટિ કરો';

  @override
  String get ifscCodeHint => 'જેમ કે SBIN0001234';

  @override
  String get upiIdHint => 'જેમ કે user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'કુલ ભાડું';

  @override
  String get hideQrCode => 'QR છુપાવો';

  @override
  String get nameMinLengthRequired => 'નામ ઓછામાં ઓછા 2 અક્ષરોનું હોવું જોઈએ';

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
    return 'ઓર્ડર #$orderId';
  }

  @override
  String get personalInformation => 'વ્યક્તિગત માહિતી';

  @override
  String get online => 'ઓનલાઇન';

  @override
  String get offline => 'ઑફલાઇન';

  @override
  String get onlineSuccessMessage => 'હવે તમે ઓનલાઇન અને ડ્યૂટી પર છો.';

  @override
  String get offlineSuccessMessage => 'હવે તમે ઑફલાઇન છો.';

  @override
  String get partnerSupport => 'પાર્ટનર સહાય';

  @override
  String get partnerSupportSubtitle =>
      'નમસ્તે પાર્ટનર! શું તમને તમારી રાઇડ, ચુકવણી અથવા ખાતામાં મદદ જોઈએ છે? અમે અહીં તમારી 24/7 સહાય માટે છીએ.';

  @override
  String get faqsAndHelp => 'વારંવાર પૂછાતા પ્રશ્નો અને સહાય';

  @override
  String get findQuickAnswers => 'ઝડપી જવાબો શોધો';

  @override
  String get raiseSupportTicket => 'ટિકિટ નોંધાવો';

  @override
  String get contactSupportAgent => 'સહાય એજન્ટનો સંપર્ક કરો';

  @override
  String get recentTickets => 'તાજેતરની ટિકિટો';

  @override
  String get noActiveTickets => 'કોઈ સક્રિય સહાય ટિકિટ નથી';

  @override
  String get submitTicketDescription =>
      'જો તમને કોઈ સમસ્યા આવે તો ટિકિટ સબમિટ કરો.';

  @override
  String get failedToLoadTickets => 'તાજેતરની ટિકિટો લોડ કરવામાં નિષ્ફળ';

  @override
  String get contactSupport => 'સહાયનો સંપર્ક કરો';

  @override
  String get callUs => 'અમને કૉલ કરો';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'અમારી સાથે ચેટ કરો';

  @override
  String get emailSupport => 'ઈમેઇલ સહાય';

  @override
  String get ticketStatusOpen => 'ખુલ્લું છે';

  @override
  String get ticketStatusInProgress => 'પ્રગતિમાં છે';

  @override
  String get ticketStatusResolved => 'ઉકેલાઈ ગયું છે';

  @override
  String get ticketStatusClosed => 'બંધ છે';

  @override
  String get ticketCategoryRideIssue => 'રાઇડની સમસ્યા';

  @override
  String get ticketCategoryPayment => 'ચુકવણી';

  @override
  String get ticketCategoryAccount => 'ખાતું';

  @override
  String get ticketCategoryDriverIssue => 'ડ્રાઇવરની સમસ્યા';

  @override
  String get ticketCategoryOther => 'અન્ય';

  @override
  String get failedToLoadDashboard => 'ડેશબોર્ડ લોડ કરવામાં નિષ્ફળ';

  @override
  String get todaysEarnings => 'આજની કમાણી';

  @override
  String get cashCollected => 'એકત્રિત રોકડા';

  @override
  String get onlinePayment => 'ઓનલાઇન ચુકવણી';

  @override
  String get todaysRideStatus => 'આજની ઓર્ડર સ્થિતિ';

  @override
  String get totalRides => 'કુલ ઓર્ડર';

  @override
  String get cancelled => 'રદ કરેલ';

  @override
  String get dutyRating => 'ડ્યૂટી રેટિંગ';

  @override
  String get noRidesFound => 'કોઈ રાઇડ મળી નહીં';

  @override
  String get failedToLoadHistory => 'ઇતિહાસ લોડ કરવામાં નિષ્ફળ';

  @override
  String get all => 'બધા';

  @override
  String get paymentPending => 'ચુકવણી બાકી';

  @override
  String stopsCount(int count) {
    return '$count સ્ટોપ';
  }

  @override
  String get rideDetails => 'રાઇડની વિગતો';

  @override
  String get pickupLocation => 'પિકઅપ સ્થાન';

  @override
  String get dropLocation => 'ડ્રોપ સ્થાન';

  @override
  String stopLocation(int number) {
    return 'સ્ટોપ $number';
  }

  @override
  String get fareBreakdown => 'ભાડાની વિગત';

  @override
  String get netPayable => 'ચોખ્ખી ચૂકવવાપાત્ર રકમ';

  @override
  String get paymentMethod => 'ચુકવણીની પદ્ધતિ';

  @override
  String get cash => 'રોકડા';

  @override
  String get customerDetails => 'ગ્રાહકની વિગતો';

  @override
  String get callCustomer => 'ગ્રાહકને કૉલ કરો';

  @override
  String get goodsType => 'માલનો પ્રકાર';

  @override
  String get quantity => 'જથ્થો';

  @override
  String get weight => 'વજન';

  @override
  String get distance => 'અંતર';

  @override
  String get duration => 'સમયગાળો';

  @override
  String get cancellationReason => 'રદ કરવાનું કારણ';

  @override
  String get routeTimeline => 'માર્ગ સમયરેખા';

  @override
  String get goodsSpecifications => 'માલની વિગતો';

  @override
  String get vehicleMetadata => 'વાહનની વિગતો';

  @override
  String get description => 'વર્ણન';

  @override
  String get estimatedWeight => 'અંદાજિત વજન';

  @override
  String get vehicleName => 'વાહનનું નામ';

  @override
  String get vehicleNumber => 'વાહન નંબર';

  @override
  String get modelColor => 'મોડલ / રંગ';

  @override
  String get baseFare => 'મૂળ ભાડું';

  @override
  String get weatherSurcharge => 'હવામાન સરચાર્જ';

  @override
  String get trafficSurcharge => 'ટ્રાફિક સરચાર્જ';

  @override
  String get promoDiscount => 'પ્રોમો ડિસ્કાઉન્ટ';

  @override
  String get pickupSender => 'પિકઅપ (મોકલનાર)';

  @override
  String get dropoffRecipient => 'ડ્રોપઑફ (પ્રાપ્તકર્તા)';

  @override
  String rideIdLabel(String id) {
    return 'રાઇડ ID: $id';
  }

  @override
  String get todaysTotalEarnings => 'આજની કુલ કમાણી';

  @override
  String get failedToLoadEarnings => 'કમાણીના આંકડા લોડ કરવામાં નિષ્ફળ';

  @override
  String get noTransactionsRecorded => 'કોઈ વ્યવહાર નોંધાયો નથી';

  @override
  String get mySupportTickets => 'મારી સપોર્ટ ટિકિટો';

  @override
  String get newTicket => 'નવી ટિકિટ';

  @override
  String get noSupportTicketsRaised => 'કોઈ સપોર્ટ ટિકિટ નોંધાવી નથી';

  @override
  String get tapNewTicketSubtitle =>
      'સહાય મેળવવા માટે \'નવી ટિકિટ\' પર ટૅપ કરો.';

  @override
  String get submitATicket => 'ટિકિટ નોંધાવો';

  @override
  String get explainIssueDetail =>
      'તમારી સમસ્યાનું વિગતવાર વર્ણન કરો. સહાય એજન્ટ ટૂંક સમયમાં તેની પુષ્ટિ કરીને જવાબ આપશે.';

  @override
  String get categoryRequired => 'શ્રેણી*';

  @override
  String get selectIssueCategory => 'સમસ્યાની શ્રેણી પસંદ કરો';

  @override
  String get pleaseSelectCategoryError =>
      'કૃપા કરીને એક સમસ્યાની શ્રેણી પસંદ કરો';

  @override
  String get subjectRequired => 'વિષય*';

  @override
  String get briefSummaryHint => 'સમસ્યાનું સંક્ષિપ્ત વર્ણન';

  @override
  String get subjectRequiredError => 'વિષય ફરજિયાત છે';

  @override
  String get subjectMinLengthError => 'વિષય ઓછામાં ઓછા 5 અક્ષરોનો હોવો જોઈએ';

  @override
  String get descriptionRequired => 'વર્ણન / સંદેશ*';

  @override
  String get describeProblemHint => 'તમારી સમસ્યાનું વિગતવાર વર્ણન કરો...';

  @override
  String get messageRequiredError => 'સંદેશ વર્ણન ફરજિયાત છે';

  @override
  String get messageMinLengthError => 'સંદેશ ઓછામાં ઓછા 10 અક્ષરોનો હોવો જોઈએ';

  @override
  String get submitTicket => 'ટિકિટ સબમિટ કરો';

  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';

  @override
  String get termsAndConditions => 'નિયમો અને શરતો';

  @override
  String get termsOfService => 'સેવાની શરતો';

  @override
  String get iAgreeTo => 'હું ';

  @override
  String get and => ' અને ';

  @override
  String get agreeSuffix => ' સાથે સંમત છું';

  @override
  String get darkTheme => 'ડાર્ક થીમ';

  @override
  String get failedToLoadDetails => 'વિગતો લોડ કરવામાં નિષ્ફળ';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>ગોપનીયતા નીતિ</h1><p>Reachu ડ્રાઇવર એપમાં આપનું સ્વાગત છે. તમારી ગોપનીયતા અમારા માટે મહત્વપૂર્ણ છે. આ ગોપનીયતા નીતિ સમજાવે છે કે અમે તમારી વ્યક્તિગત માહિતી કેવી રીતે એકત્રિત, ઉપયોગ અને સુરક્ષિત કરીએ છીએ.</p><h2>1. અમે જે માહિતી એકત્રિત કરીએ છીએ</h2><p>અમે તમારું નામ, ફોન નંબર, ઈમેઇલ, વાહનની વિગતો, સક્રિય ટ્રિપ દરમિયાન સ્થાન ડેટા અને વ્યવહારની વિગતો એકત્રિત કરીએ છીએ.</p><h2>2. અમે તમારી માહિતીનો ઉપયોગ કેવી રીતે કરીએ છીએ</h2><p>અમે તમારી માહિતીનો ઉપયોગ ડિલિવરી રાઇડ સરળ બનાવવા, ચુકવણીઓ પ્રક્રિયા કરવા, સુરક્ષા સુનિશ્ચિત કરવા અને ડ્રાઇવર અનુભવ સુધારવા માટે કરીએ છીએ.</p><h2>3. સ્થાન ટ્રેકિંગ</h2><p>ઓન-ડ્યૂટી દરમિયાન બેકગ્રાઉન્ડ સ્થાન ઍક્સેસ જરૂરી છે જેથી તમને નજીકની ડિલિવરી વિનંતીઓ સાથે જોડી શકાય અને ગ્રાહકો ટ્રિપની પ્રગતિ જોઈ શકે.</p><h2>4. ડેટા સુરક્ષા</h2><p>અમે તમારી વ્યક્તિગત માહિતીને અનધિકૃત ઍક્સેસથી સુરક્ષિત રાખવા માટે કડક સુરક્ષા પગલાં લાગુ કરીએ છીએ.</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>નિયમો અને શરતો</h1><p>કૃપા કરીને Reachu ડ્રાઇવર એપ્લિકેશનનો ઉપયોગ કરતા પહેલાં આ નિયમો અને શરતો કાળજીપૂર્વક વાંચો.</p><h2>1. શરતોની સ્વીકૃતિ</h2><p>Reachu પર ડ્રાઇવર પાર્ટનર તરીકે નોંધણી કરીને, તમે બધી લાગુ શરતો, નીતિઓ અને સ્થાનિક પરિવહન નિયમોનું પાલન કરવા માટે સંમત થાઓ છો.</p><h2>2. ડ્રાઇવરની જવાબદારીઓ</h2><p>ડ્રાઇવર પાસે માન્ય ડ્રાઇવિંગ લાઇસન્સ, ચોક્કસ વાહન દસ્તાવેજો હોવા જોઈએ અને સુરક્ષિત, સમયસર ડિલિવરી સેવા પ્રદાન કરવાની જવાબદારી હોવી જોઈએ.</p><h2>3. ચુકવણી અને કમાણી</h2><p>ભાડું પ્લેટફોર્મ દરો અનુસાર નક્કી થાય છે અને લાગુ શુલ્ક પછી તમારા ચકાસાયેલા બેંક ખાતામાં ટ્રાન્સફર થાય છે.</p><h2>4. ખાતું સસ્પેન્શન</h2><p>છેતરપિંડીની પ્રવૃત્તિઓ, સુરક્ષા ઉલ્લંઘનો અથવા નીતિનું પાલન ન કરવાના કિસ્સામાં ખાતું સસ્પેન્ડ કરવાનો અધિકાર Reachu પાસે અનામત છે.</p>';

  @override
  String get reviewAndRating => 'સમીક્ષા અને રેટિંગ';

  @override
  String get noRatingsYet => 'હજુ સુધી કોઈ રેટિંગ નથી';

  @override
  String ratedByCustomers(int count) {
    return '$count ગ્રાહકો દ્વારા રેટિંગ આપવામાં આવી';
  }

  @override
  String get noReviewsYet => 'હજુ સુધી કોઈ સમીક્ષા નથી';

  @override
  String get noReviewsDesc => 'તમને હજુ સુધી કોઈ સમીક્ષા મળી નથી.';

  @override
  String get noCommentProvided => 'કોઈ ટિપ્પણી આપવામાં આવી નથી';

  @override
  String get ratingExcellent => 'ઉત્કૃષ્ટ';

  @override
  String get ratingGood => 'સારું';

  @override
  String get ratingAverage => 'સરેરાશ';

  @override
  String get ratingBelowAverage => 'સરેરાશથી ઓછું';

  @override
  String get ratingPoor => 'ખરાબ';

  @override
  String get customer => 'ગ્રાહક';

  @override
  String get noInternetConnection => 'ઇન્ટરનેટ કનેક્શન નથી';

  @override
  String get checkInternetConnection =>
      'કૃપા કરીને તમારું ઇન્ટરનેટ કનેક્શન તપાસો અને ફરી પ્રયાસ કરો.';

  @override
  String get internetRestored => 'ઇન્ટરનેટ કનેક્શન પુનઃસ્થાપિત થયું';

  @override
  String get retryConnection => 'ફરી પ્રયાસ કરો';

  @override
  String get connectionTimedOut =>
      'કનેક્શન સમયસીમા સમાપ્ત થઈ. ફરી પ્રયાસ કરી રહ્યા છીએ...';

  @override
  String get newUpdateAvailable =>
      'નવું અપડેટ ઉપલબ્ધ છે. ચાલુ રાખવા માટે એપ અપડેટ કરો.';

  @override
  String get updateRequiredTitle => 'અપડેટ જરૂરી છે';

  @override
  String updateRequiredDesc(String version) {
    return 'તમે Reachu Driver નું જૂનું વર્ઝન વાપરી રહ્યા છો. રાઇડ લેવાનું ચાલુ રાખવા માટે કૃપા કરીને લેટેસ્ટ વર્ઝનમાં અપડેટ કરો.';
  }

  @override
  String get updateNow => 'અત્યારે અપડેટ કરો';

  @override
  String get updateLater => 'પછીથી અપડેટ કરો';

  @override
  String get underMaintenanceTitle => 'મેન્ટેનન્સ હેઠળ છે';

  @override
  String get underMaintenanceDesc =>
      'તમને વધુ સારી સેવા આપવા માટે અમે અમારી સિસ્ટમ અપડેટ કરી રહ્યા છીએ. કૃપા કરીને થોડી વાર પછી તપાસો.';

  @override
  String estimatedBackIn(Object time) {
    return 'અંદાજિત વાપસી $time માં';
  }

  @override
  String get backOnlineSoon => 'અમે ટૂંક સમયમાં ઓનલાઇન પાછા આવીશું!';

  @override
  String installedVersion(String version) {
    return 'ઇન્સ્ટોલ કરેલ વર્ઝન: $version';
  }

  @override
  String get couldNotOpenStore => 'એપ સ્ટોર ખોલી શકાયું નથી';

  @override
  String get detailedFareBreakdown => 'વિગતવાર ભાડાની વિગત';

  @override
  String get checkPaymentStatus => 'ચુકવણીની સ્થિતિ તપાસો';

  @override
  String get checkingStatus => 'સ્થિતિ તપાસી રહ્યા છીએ...';

  @override
  String get details => 'વિગતો';

  @override
  String get hide => 'છુપાવો';

  @override
  String get collectCashFromCustomer => 'ગ્રાહક પાસેથી રોકડ મેળવો';

  @override
  String get customerOnlineFareDue => 'ગ્રાહકનું ઓનલાઇન ભાડું બાકી';

  @override
  String get reachuWalletCredit => 'Reachu વોલેટ ક્રેડિટ';

  @override
  String promoReimbursementNote(String amount) {
    return '*તમારા વોલેટમાં જમા Reachu પ્રોમો વળતર શામેલ છે';
  }

  @override
  String waitingChargeNote(String amount) {
    return '*પ્રતીક્ષા સમય માટે વેટિંગ ચાર્જ શામેલ છે';
  }

  @override
  String get paymentReceivedSuccess => 'ચુકવણી સફળતાપૂર્વક મળી!';

  @override
  String get paymentStillPending => 'ચુકવણી હજુ પણ બાકી છે';

  @override
  String get waitingCharge => 'વેટિંગ ચાર્જ';

  @override
  String get rentalCharge => 'રેન્ટલ ચાર્જ';

  @override
  String get grossFare => 'કુલ ભાડું';

  @override
  String get pendingDue => 'બાકી રકમ';

  @override
  String get tollFee => 'ટોલ ફી';

  @override
  String get cancellationFee => 'કેન્સલેશન ફી';

  @override
  String get nightSurcharge => 'નાઇટ સરચાર્જ';

  @override
  String get surgeFee => 'સર્જ ફી';

  @override
  String get taxAndFees => 'ટેક્સ અને ફી';

  @override
  String get platformFee => 'પ્લેટફોર્મ ફી';

  @override
  String get pressBackAgainToExit => 'એપમાંથી બહાર નીકળવા માટે ફરીથી બેક દબાવો';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'બહાર નીકળતા પહેલા કૃપા કરીને રાઇડ સ્વીકારો અથવા અસ્વીકારો';

  @override
  String get cashPayment => 'રોકડ ચુકવણી';

  @override
  String get onlineQr => 'ઓનલાઇન ક્યૂઆર';

  @override
  String get collectCashInstructions =>
      'રાઇડ સમાપ્ત કરતા પહેલા કૃપા કરીને ગ્રાહક પાસેથી રોકડ રકમ મેળવો.';

  @override
  String collectCashStep1(String amount) {
    return '૧. ગ્રાહક પાસેથી યોગ્ય રોકડ રકમ એકત્રિત કરો';
  }

  @override
  String get collectCashStep2 =>
      '૨. નીચે \'રોકડ મળ્યાની પુષ્ટિ કરો\' બટન પર ટેપ કરો';

  @override
  String get verifyingCashDeposit => 'રોકડ ચુકવણી ચકાસી રહ્યા છીએ...';

  @override
  String get pleaseHoldClosingRide =>
      'અમે રાઇડ બંધ કરીએ ત્યાં સુધી કૃપા કરીને રાહ જુઓ';

  @override
  String get customerOnlinePayment => 'ગ્રાહક ઓનલાઇન ચુકવણી';

  @override
  String get generatingQrCode => 'ક્યૂઆર કોડ બનાવી રહ્યા છીએ...';

  @override
  String get failedToLoadQrCode => 'ક્યૂઆર કોડ લોડ કરવામાં નિષ્ફળ';

  @override
  String get scanQrToPay =>
      'ઓનલાઇન ચૂકવણી કરવા માટે ગ્રાહકને ક્યૂઆર કોડ સ્કેન કરવા કહો';

  @override
  String get pinchToZoomQr => 'ક્યૂઆર કોડ ઝૂમ કરવા માટે પિંચ કરો';

  @override
  String get tapToFullScreen => 'ફુલ સ્ક્રીન વ્યુ માટે ક્યૂઆર કોડ પર ટેપ કરો';

  @override
  String get awaitingCustomerPayment =>
      'ગ્રાહકની ચુકવણીની રાહ જોઈ રહ્યા છીએ...';

  @override
  String get confirmCashReceived => 'રોકડ મળ્યાની પુષ્ટિ કરો';

  @override
  String get paymentReceivedToast =>
      'ચુકવણી પ્રાપ્ત થઈ! રાઇડ બંધ કરી રહ્યા છીએ...';

  @override
  String get invalidOrderIdError => 'અમાન્ય ઓર્ડર આઈડી';

  @override
  String get cashPaymentRecordedWaiting =>
      'રોકડ ચુકવણી નોંધાઈ. રાઇડ બંધ કરી રહ્યા છીએ...';

  @override
  String get paymentReceivedTitle => 'ચુકવણી પ્રાપ્ત થઈ';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount ની રકમ સફળતાપૂર્વક ચૂકવવામાં આવી!';
  }

  @override
  String get rideClosedReturningHome =>
      'રાઇડ બંધ થઈ ગઈ. હોમ સ્ક્રીન પર પાછા જઈ રહ્યા છીએ...';

  @override
  String get fragileGoods => 'નાજુક સામાન';

  @override
  String get yes => 'હા';

  @override
  String get no => 'ના';

  @override
  String contactLabel(String name, Object phone) {
    return 'સંપર્ક: $name ($phone)';
  }

  @override
  String get permissionsRequired => 'પરમિશન જરૂરી છે';

  @override
  String get enableAllPermissionsSubtitle =>
      'ReachuDriver ને ઓફલાઇન અને ઓનલાઇન યોગ્ય રીતે કામ કરવા માટે નીચેની પરમિશનની જરૂર છે.';

  @override
  String get locationAlwaysTitle => 'લોકેશન (હંમેશા મંજૂરી આપો)';

  @override
  String get locationAlwaysSubtitle =>
      'ઓર્ડર ડિસ્પેચ અને બેકગ્રાઉન્ડ રાઇડ ટ્રેકિંગ માટે જરૂરી.';

  @override
  String get batteryUnrestrictedTitle => 'બેટરી ઓપ્ટિમાઇઝેશન (અપ્રતિબદ્ધ)';

  @override
  String get batteryUnrestrictedSubtitle =>
      'બેકગ્રાઉન્ડ સોકેટ કનેક્શન અને રાઇડ એલર્ટ ચાલુ રહે તે સુનિશ્ચિત કરે છે.';

  @override
  String get notificationsTitle => 'નોટિફિકેશન';

  @override
  String get notificationsSubtitle =>
      'નવી રાઇડ વિનંતીઓ અને ઓર્ડર એલર્ટ માટે જરૂરી.';

  @override
  String get displayOverAppsTitle => 'અન્ય એપ્સ પર ડિસ્પ્લે કરો';

  @override
  String get displayOverAppsSubtitle =>
      'ફુલ-સ્ક્રીન ઇનકમિંગ ઓર્ડર પોપઅપ માટે જરૂરી.';

  @override
  String get locationUsedInBackground => 'બેકગ્રાઉન્ડમાં વપરાતું લોકેશન';

  @override
  String get backgroundLocationDisclosureBody =>
      'એપ બંધ હોય કે વપરાશમાં ન હોય ત્યારે પણ ReachuDriver લોકેશન ડેટા એકત્રિત કરે છે.\n\nતેનો ઉપયોગ આ માટે થાય છે:\n  • લોડર્સ/વપરાશકર્તાઓ સાથે તમારું રીઅલ-ટાઇમ સ્ટેટસ શેર કરવા\n  • તમને નજીકની બુકિંગ વિનંતીઓ ફાળવવા\n  • જ્યારે તમે ડ્યુટી પર હોવ ત્યારે ડિસ્પેચ સિસ્ટમ અપડેટ રાખવા\n\nલોકેશન સંગ્રહ માત્ર ત્યારે જ ચાલે છે જ્યારે તમે ઓનલાઇન (ડ્યુટી પર) હોવ અને ઓફલાઇન થતાં જ તરત બંધ થઈ જાય છે.';

  @override
  String get changeInAppSettingsNote =>
      'તમે એપ સેટિંગ્સમાં ગમે ત્યારે આ બદલી શકો છો.';

  @override
  String get iUnderstandContinue => 'હું સમજું છું — આગળ વધો';

  @override
  String get notNow => 'અત્યારે નહીં';

  @override
  String get lowWalletBalance => 'ઓછું વોલેટ બેલેન્સ';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'ઓર્ડર મેળવવા માટે કૃપા કરીને તમારા વોલેટમાં ઓછામાં ઓછું ₹$limit બેલેન્સ રાખો. ઓર્ડર મેળવવાનું ચાલુ રાખવા માટે વોલેટ ટોપ અપ કરો.';
  }

  @override
  String get minimumRequiredBalance => 'ઓછામાં ઓછું જરૂરી બેલેન્સ';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'ઓર્ડર મેળવવા માટે કૃપા કરીને તમારા વોલેટમાં ઓછામાં ઓછા ₹$limit રાખો.';
  }

  @override
  String get activeForRides => 'રાઇડ્સ માટે સક્રિય';

  @override
  String get lowBalanceStatus => 'ઓછું બેલેન્સ';

  @override
  String get minimumLimit => 'ઓછામાં ઓછી મર્યાદા';

  @override
  String get eShramBenefitsTitle => 'ઈ-શ્રમ લાભો';

  @override
  String get govtScheme => 'સરકારી યોજના';

  @override
  String get eShramSubHeader => 'સરકારી વીમા અને પેન્શન યોજના';

  @override
  String get eShramDescription =>
      'ગિગ વર્કર્સ માટે અકસ્માત વીમો અને સામાજિક સુરક્ષા લાભો મેળવવા માટે સત્તાવાર સરકારી ઈ-શ્રમ પોર્ટલ પર નોંધણી કરો.';

  @override
  String get registerOnEShramPortal => 'ઈ-શ્રમ પોર્ટલ પર નોંધણી કરો';

  @override
  String get eShramGovtBenefitsMenu => 'ઈ-શ્રમ સરકારી લાભો';

  @override
  String get dismiss => 'બંધ કરો';
}
