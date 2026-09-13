import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('kn'),
    Locale('ml'),
    Locale('mr'),
    Locale('or'),
    Locale('pa'),
    Locale('ta'),
    Locale('te')
  ];

  /// Title for the Account Screen
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Label for the edit profile tile
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Label for the logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Label for the language selection tile
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Title for the language selection bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Hindi language option
  ///
  /// In en, this message translates to:
  /// **'हिन्दी (Hindi)'**
  String get hindi;

  /// Title for the select vehicle screen
  ///
  /// In en, this message translates to:
  /// **'Select Vehicle'**
  String get selectVehicle;

  /// Placeholder button text when no vehicle is selected
  ///
  /// In en, this message translates to:
  /// **'Select a Vehicle'**
  String get selectAVehicle;

  /// Button text to proceed with a selected vehicle
  ///
  /// In en, this message translates to:
  /// **'Proceed with {vehicleName}'**
  String proceedWithVehicle(String vehicleName);

  /// Button label to add a stop along the route
  ///
  /// In en, this message translates to:
  /// **'Add Stop'**
  String get addStop;

  /// Button label to edit route locations
  ///
  /// In en, this message translates to:
  /// **'Edit Locations'**
  String get editLocations;

  /// Text displayed when no pickup location is configured
  ///
  /// In en, this message translates to:
  /// **'No pickup location set'**
  String get noPickupLocationSet;

  /// Text displayed when no drop location is configured
  ///
  /// In en, this message translates to:
  /// **'No drop location set'**
  String get noDropLocationSet;

  /// Button label to add an extra drop location
  ///
  /// In en, this message translates to:
  /// **'Add drop'**
  String get addDrop;

  /// Error message when vehicles fail to load
  ///
  /// In en, this message translates to:
  /// **'Error loading vehicles'**
  String get errorLoadingVehicles;

  /// Title for the select goods type screen
  ///
  /// In en, this message translates to:
  /// **'Select Goods Type'**
  String get selectGoodsType;

  /// Header text on select goods type screen
  ///
  /// In en, this message translates to:
  /// **'What are you shipping?'**
  String get whatAreYouShipping;

  /// Subtitle text on select goods type screen
  ///
  /// In en, this message translates to:
  /// **'Choose the category that best matches your goods'**
  String get chooseCategoryBestMatches;

  /// Title for the edit goods details bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Edit Goods Details'**
  String get editGoodsDetails;

  /// Label for the weight input field
  ///
  /// In en, this message translates to:
  /// **'Weight (kg) - Max 90 kg'**
  String get weightKgMax90;

  /// Error text for invalid weight input
  ///
  /// In en, this message translates to:
  /// **'Weight must be 1 to 90 kg'**
  String get weightInvalidError;

  /// Label for the number of packages input field
  ///
  /// In en, this message translates to:
  /// **'Number of Packages'**
  String get numberOfPackages;

  /// Label for the worth of goods input field
  ///
  /// In en, this message translates to:
  /// **'Worth / Value (Rupees)'**
  String get worthValueRupees;

  /// Label for the done button in bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Label for the confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm Goods Details'**
  String get confirmGoodsDetails;

  /// Error message when categories fail to load
  ///
  /// In en, this message translates to:
  /// **'Failed to load categories'**
  String get failedToLoadCategories;

  /// Title for the disclaimer section
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get disclaimerTitle;

  /// Legal disclaimer text shown at the bottom of goods selection screen
  ///
  /// In en, this message translates to:
  /// **'Disclaimer: I declare that the goods being transported are non-hazardous, legal, and belong to the selected category. The company is not liable for transport of prohibited items. Weight must not exceed the maximum vehicle capacity.'**
  String get disclaimerText;

  /// Compact summary showing weight, packages and worth of selected goods
  ///
  /// In en, this message translates to:
  /// **'{weight} kg • {packages} package(s) • ₹{worth}'**
  String goodsSummary(String weight, int packages, String worth);

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @enterMobileNumberToContinue.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number to continue'**
  String get enterMobileNumberToContinue;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @agreeTermsText.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms of Service and Privacy Policy'**
  String get agreeTermsText;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @enterOtpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the 4-digit code sent to\n+91 {phoneNumber}'**
  String enterOtpSentTo(Object phoneNumber);

  /// No description provided for @verifyAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Verify & Continue'**
  String get verifyAndContinue;

  /// No description provided for @resendInSeconds.
  ///
  /// In en, this message translates to:
  /// **'Resend in {count}s'**
  String resendInSeconds(Object count);

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @changeNumber.
  ///
  /// In en, this message translates to:
  /// **'Change Number'**
  String get changeNumber;

  /// No description provided for @mobileNumberRequired.
  ///
  /// In en, this message translates to:
  /// **'Mobile number is required'**
  String get mobileNumberRequired;

  /// No description provided for @enterValidMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 10-digit mobile number'**
  String get enterValidMobileNumber;

  /// No description provided for @enterCompleteOtpError.
  ///
  /// In en, this message translates to:
  /// **'Please enter the complete 4-digit OTP'**
  String get enterCompleteOtpError;

  /// No description provided for @otpResentSuccess.
  ///
  /// In en, this message translates to:
  /// **'OTP resent successfully'**
  String get otpResentSuccess;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameRequired;

  /// No description provided for @nameMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get nameMinLengthError;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get enterValidEmail;

  /// No description provided for @referralCode.
  ///
  /// In en, this message translates to:
  /// **'Referral Code'**
  String get referralCode;

  /// No description provided for @enterReferralCodeOptional.
  ///
  /// In en, this message translates to:
  /// **'Enter referral code (optional)'**
  String get enterReferralCodeOptional;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @completeProfileToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Complete your profile to get started'**
  String get completeProfileToGetStarted;

  /// No description provided for @profileUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdatedSuccess;

  /// No description provided for @updateProfilePicture.
  ///
  /// In en, this message translates to:
  /// **'Update Profile Picture'**
  String get updateProfilePicture;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @dateOfBirthOptional.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth (Optional)'**
  String get dateOfBirthOptional;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// No description provided for @profileUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile: {error}'**
  String profileUpdateFailed(Object error);

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning,'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon,'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening,'**
  String get goodEvening;

  /// No description provided for @pickupFrom.
  ///
  /// In en, this message translates to:
  /// **'Pickup From'**
  String get pickupFrom;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// No description provided for @fetchingLocation.
  ///
  /// In en, this message translates to:
  /// **'Fetching location...'**
  String get fetchingLocation;

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services disabled'**
  String get locationServicesDisabled;

  /// No description provided for @locationPermissionNeeded.
  ///
  /// In en, this message translates to:
  /// **'Location permission needed'**
  String get locationPermissionNeeded;

  /// No description provided for @locationAccessBlocked.
  ///
  /// In en, this message translates to:
  /// **'Location access blocked'**
  String get locationAccessBlocked;

  /// No description provided for @couldNotFetchLocation.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t fetch location'**
  String get couldNotFetchLocation;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @turnOnLocationServices.
  ///
  /// In en, this message translates to:
  /// **'Turn on Location Services'**
  String get turnOnLocationServices;

  /// No description provided for @allowLocationAccess.
  ///
  /// In en, this message translates to:
  /// **'Allow Location Access'**
  String get allowLocationAccess;

  /// No description provided for @gpsRequiredDescription.
  ///
  /// In en, this message translates to:
  /// **'We need your device GPS turned on to accurately pinpoint your pickup location and find nearby drivers quickly.'**
  String get gpsRequiredDescription;

  /// No description provided for @permissionRequiredDescription.
  ///
  /// In en, this message translates to:
  /// **'Please allow location permissions in your app settings so we can accurately pinpoint your pickup location and find nearby drivers quickly.'**
  String get permissionRequiredDescription;

  /// No description provided for @goToLocationSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to Location Settings'**
  String get goToLocationSettings;

  /// No description provided for @goToAppSettings.
  ///
  /// In en, this message translates to:
  /// **'Go to App Settings'**
  String get goToAppSettings;

  /// No description provided for @enterAddressManually.
  ///
  /// In en, this message translates to:
  /// **'I\'ll enter my address manually'**
  String get enterAddressManually;

  /// No description provided for @taglineTitle.
  ///
  /// In en, this message translates to:
  /// **'Moving Anything,\nAnytime.'**
  String get taglineTitle;

  /// No description provided for @taglineSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fast deliveries at your fingertips. Shift smarter, move faster with our premium fleet.'**
  String get taglineSubtitle;

  /// No description provided for @twoWheelers.
  ///
  /// In en, this message translates to:
  /// **'2 Wheelers'**
  String get twoWheelers;

  /// No description provided for @trucks.
  ///
  /// In en, this message translates to:
  /// **'Trucks'**
  String get trucks;

  /// No description provided for @specialOffer.
  ///
  /// In en, this message translates to:
  /// **'Special Offer'**
  String get specialOffer;

  /// No description provided for @promoBannerText.
  ///
  /// In en, this message translates to:
  /// **'Get 20% off on\nyour first ride'**
  String get promoBannerText;

  /// No description provided for @whereIsYourPickup.
  ///
  /// In en, this message translates to:
  /// **'Where is your pickup?'**
  String get whereIsYourPickup;

  /// No description provided for @whereIsYourDrop.
  ///
  /// In en, this message translates to:
  /// **'Where is your drop?'**
  String get whereIsYourDrop;

  /// No description provided for @whereIsYourDropIndex.
  ///
  /// In en, this message translates to:
  /// **'Where is your Drop {index}?'**
  String whereIsYourDropIndex(int index);

  /// No description provided for @typeMinCharsToSearch.
  ///
  /// In en, this message translates to:
  /// **'Type at least 4 characters to start searching'**
  String get typeMinCharsToSearch;

  /// No description provided for @selectOnMap.
  ///
  /// In en, this message translates to:
  /// **'Select on Map'**
  String get selectOnMap;

  /// No description provided for @pinpointExactLocation.
  ///
  /// In en, this message translates to:
  /// **'Pinpoint your exact location'**
  String get pinpointExactLocation;

  /// No description provided for @couldNotFindAddress.
  ///
  /// In en, this message translates to:
  /// **'Sorry, we couldn\'t find this address.'**
  String get couldNotFindAddress;

  /// No description provided for @trySearchingNearbyLandmark.
  ///
  /// In en, this message translates to:
  /// **'Try searching using a nearby landmark, locality, or popular place.'**
  String get trySearchingNearbyLandmark;

  /// No description provided for @anErrorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get anErrorOccurred;

  /// No description provided for @locating.
  ///
  /// In en, this message translates to:
  /// **'Locating...'**
  String get locating;

  /// No description provided for @fetchingDetails.
  ///
  /// In en, this message translates to:
  /// **'Fetching details...'**
  String get fetchingDetails;

  /// No description provided for @confirmPickupLocation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Pickup Location'**
  String get confirmPickupLocation;

  /// No description provided for @confirmDropLocation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Drop Location'**
  String get confirmDropLocation;

  /// No description provided for @houseShopApartment.
  ///
  /// In en, this message translates to:
  /// **'House / Shop / Apartment'**
  String get houseShopApartment;

  /// No description provided for @sendersName.
  ///
  /// In en, this message translates to:
  /// **'Sender\'s Name'**
  String get sendersName;

  /// No description provided for @receiversName.
  ///
  /// In en, this message translates to:
  /// **'Receiver\'s Name'**
  String get receiversName;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter name'**
  String get pleaseEnterName;

  /// No description provided for @sendersMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Sender\'s Mobile Number'**
  String get sendersMobileNumber;

  /// No description provided for @receiversMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Receiver\'s Mobile Number'**
  String get receiversMobileNumber;

  /// No description provided for @enterValidTenDigitNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter valid 10-digit number'**
  String get enterValidTenDigitNumber;

  /// No description provided for @useMyMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Use my mobile number'**
  String get useMyMobileNumber;

  /// No description provided for @saveAsOptional.
  ///
  /// In en, this message translates to:
  /// **'Save as (Optional):'**
  String get saveAsOptional;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @confirmAndProceed.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Proceed'**
  String get confirmAndProceed;

  /// No description provided for @selectDropLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Drop Location'**
  String get selectDropLocation;

  /// No description provided for @cannotSwapEmptyLocations.
  ///
  /// In en, this message translates to:
  /// **'Cannot swap empty locations with filled ones.'**
  String get cannotSwapEmptyLocations;

  /// No description provided for @proceedToVehicleSelection.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Vehicle Selection'**
  String get proceedToVehicleSelection;

  /// No description provided for @permissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get permissionRequired;

  /// No description provided for @contactsPermissionDescription.
  ///
  /// In en, this message translates to:
  /// **'Reachu needs access to your contacts to allow you to easily select a sender\'s phone number. Please enable it in app settings.'**
  String get contactsPermissionDescription;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @selectContact.
  ///
  /// In en, this message translates to:
  /// **'Select Contact'**
  String get selectContact;

  /// No description provided for @contactPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Contact permission denied.'**
  String get contactPermissionDenied;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @selfFormat.
  ///
  /// In en, this message translates to:
  /// **'{name} (Self)'**
  String selfFormat(String name);

  /// No description provided for @deviceContacts.
  ///
  /// In en, this message translates to:
  /// **'Device Contacts'**
  String get deviceContacts;

  /// No description provided for @rideHistory.
  ///
  /// In en, this message translates to:
  /// **'Ride History'**
  String get rideHistory;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @noTransactionsFound.
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get noTransactionsFound;

  /// No description provided for @failedToLoadTransactions.
  ///
  /// In en, this message translates to:
  /// **'Failed to load transactions'**
  String get failedToLoadTransactions;

  /// No description provided for @addMoney.
  ///
  /// In en, this message translates to:
  /// **'Add Money'**
  String get addMoney;

  /// No description provided for @enterAmountToAdd.
  ///
  /// In en, this message translates to:
  /// **'Enter amount to add'**
  String get enterAmountToAdd;

  /// No description provided for @failedToOpenRazorpay.
  ///
  /// In en, this message translates to:
  /// **'Failed to open Razorpay: {error}'**
  String failedToOpenRazorpay(Object error);

  /// No description provided for @failedToCreatePaymentOrder.
  ///
  /// In en, this message translates to:
  /// **'Failed to create payment order: {error}'**
  String failedToCreatePaymentOrder(Object error);

  /// No description provided for @successfullyAddedToreachuCredits.
  ///
  /// In en, this message translates to:
  /// **'Successfully added ₹{amount} to Reachu Credits!'**
  String successfullyAddedToreachuCredits(Object amount);

  /// No description provided for @paymentVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Payment verification failed: {error}'**
  String paymentVerificationFailed(Object error);

  /// No description provided for @paymentFailedFormat.
  ///
  /// In en, this message translates to:
  /// **'Payment failed ({code}): {message}'**
  String paymentFailedFormat(Object code, Object message);

  /// No description provided for @externalWalletSelected.
  ///
  /// In en, this message translates to:
  /// **'External wallet selected: {walletName}'**
  String externalWalletSelected(Object walletName);

  /// No description provided for @walletTopUp.
  ///
  /// In en, this message translates to:
  /// **'Wallet Top-up'**
  String get walletTopUp;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @reachuCredits.
  ///
  /// In en, this message translates to:
  /// **'Reachu CREDITS'**
  String get reachuCredits;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @errorLoadingBalance.
  ///
  /// In en, this message translates to:
  /// **'Error loading balance'**
  String get errorLoadingBalance;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'AVAILABLE BALANCE'**
  String get availableBalance;

  /// No description provided for @totalExpenses.
  ///
  /// In en, this message translates to:
  /// **'TOTAL EXPENSES'**
  String get totalExpenses;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTransactions;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View More'**
  String get viewMore;

  /// No description provided for @noTransactionsYet.
  ///
  /// In en, this message translates to:
  /// **'No transactions yet'**
  String get noTransactionsYet;

  /// No description provided for @booking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// No description provided for @earning.
  ///
  /// In en, this message translates to:
  /// **'Earning'**
  String get earning;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @pendingWithdrawals.
  ///
  /// In en, this message translates to:
  /// **'Pending Withdrawals'**
  String get pendingWithdrawals;

  /// No description provided for @driverDebt.
  ///
  /// In en, this message translates to:
  /// **'Driver Debt'**
  String get driverDebt;

  /// No description provided for @minBalanceRequired.
  ///
  /// In en, this message translates to:
  /// **'Min Balance Required: ₹{amount}'**
  String minBalanceRequired(Object amount);

  /// No description provided for @insufficientBalance.
  ///
  /// In en, this message translates to:
  /// **'Insufficient balance for withdrawal'**
  String get insufficientBalance;

  /// No description provided for @minimumBalanceWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning: Your available balance is below the minimum required limit (₹{amount}) to accept new customer rides. Please top up your wallet.'**
  String minimumBalanceWarning(Object amount);

  /// No description provided for @moneyTransfer.
  ///
  /// In en, this message translates to:
  /// **'Money Transfer'**
  String get moneyTransfer;

  /// No description provided for @withdrawMoney.
  ///
  /// In en, this message translates to:
  /// **'Withdraw Money'**
  String get withdrawMoney;

  /// No description provided for @manageAccounts.
  ///
  /// In en, this message translates to:
  /// **'Manage Accounts'**
  String get manageAccounts;

  /// No description provided for @bankAccounts.
  ///
  /// In en, this message translates to:
  /// **'Bank Accounts & UPI'**
  String get bankAccounts;

  /// No description provided for @addAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Payment Method'**
  String get addAccount;

  /// No description provided for @addBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Add Bank Account'**
  String get addBankAccount;

  /// No description provided for @addUpiId.
  ///
  /// In en, this message translates to:
  /// **'Add UPI ID'**
  String get addUpiId;

  /// No description provided for @editBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Edit Bank Account'**
  String get editBankAccount;

  /// No description provided for @editUpiId.
  ///
  /// In en, this message translates to:
  /// **'Edit UPI ID'**
  String get editUpiId;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @deleteAccountConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this payment method?'**
  String get deleteAccountConfirm;

  /// No description provided for @accountHolderName.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get accountHolderName;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @accountNumber.
  ///
  /// In en, this message translates to:
  /// **'Account Number'**
  String get accountNumber;

  /// No description provided for @confirmAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Confirm Account Number'**
  String get confirmAccountNumber;

  /// No description provided for @ifscCode.
  ///
  /// In en, this message translates to:
  /// **'IFSC Code'**
  String get ifscCode;

  /// No description provided for @upiId.
  ///
  /// In en, this message translates to:
  /// **'UPI ID'**
  String get upiId;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @invalidUpi.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid UPI ID (e.g. name@upi)'**
  String get invalidUpi;

  /// No description provided for @invalidIfsc.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 11-digit IFSC code'**
  String get invalidIfsc;

  /// No description provided for @invalidAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid account number'**
  String get invalidAccountNumber;

  /// No description provided for @accountNumbersDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Account numbers do not match'**
  String get accountNumbersDoNotMatch;

  /// No description provided for @noPaymentMethods.
  ///
  /// In en, this message translates to:
  /// **'No payment methods added yet'**
  String get noPaymentMethods;

  /// No description provided for @addPaymentMethodSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add a bank account or UPI ID to withdraw your earnings'**
  String get addPaymentMethodSubtitle;

  /// No description provided for @confirmTransfer.
  ///
  /// In en, this message translates to:
  /// **'Confirm Transfer'**
  String get confirmTransfer;

  /// No description provided for @transferAmount.
  ///
  /// In en, this message translates to:
  /// **'Transfer Amount'**
  String get transferAmount;

  /// No description provided for @transferSuccess.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal request created successfully'**
  String get transferSuccess;

  /// No description provided for @collectPayment.
  ///
  /// In en, this message translates to:
  /// **'Collect Payment'**
  String get collectPayment;

  /// No description provided for @collectCash.
  ///
  /// In en, this message translates to:
  /// **'Collect Cash'**
  String get collectCash;

  /// No description provided for @cashCollectedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Cash payment completed successfully!'**
  String get cashCollectedSuccess;

  /// No description provided for @displayQrCode.
  ///
  /// In en, this message translates to:
  /// **'Display UPI QR Code'**
  String get displayQrCode;

  /// No description provided for @customerScanQr.
  ///
  /// In en, this message translates to:
  /// **'Ask the customer to scan this QR code to pay'**
  String get customerScanQr;

  /// No description provided for @generatingQr.
  ///
  /// In en, this message translates to:
  /// **'Generating QR code...'**
  String get generatingQr;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get selectPaymentMethod;

  /// No description provided for @beneficiary.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary'**
  String get beneficiary;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @failedToLoadAccounts.
  ///
  /// In en, this message translates to:
  /// **'Failed to load payment methods'**
  String get failedToLoadAccounts;

  /// No description provided for @accountDeletedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment method deleted successfully'**
  String get accountDeletedSuccess;

  /// No description provided for @accountUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment method updated successfully'**
  String get accountUpdatedSuccess;

  /// No description provided for @accountAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment method added successfully'**
  String get accountAddedSuccess;

  /// No description provided for @withdrawalAmount.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal Amount'**
  String get withdrawalAmount;

  /// No description provided for @transferDestination.
  ///
  /// In en, this message translates to:
  /// **'Transfer Destination'**
  String get transferDestination;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get enterAmount;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selected;

  /// No description provided for @accountNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Account No'**
  String get accountNumberLabel;

  /// No description provided for @errorLoadingAccounts.
  ///
  /// In en, this message translates to:
  /// **'Error loading payment methods'**
  String get errorLoadingAccounts;

  /// No description provided for @errorLoadingWallet.
  ///
  /// In en, this message translates to:
  /// **'Error loading wallet info'**
  String get errorLoadingWallet;

  /// No description provided for @enterAccountHolderName.
  ///
  /// In en, this message translates to:
  /// **'Enter account holder name'**
  String get enterAccountHolderName;

  /// No description provided for @bankNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. State Bank of India'**
  String get bankNameHint;

  /// No description provided for @enterAccountNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter account number'**
  String get enterAccountNumber;

  /// No description provided for @confirmAccountNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm account number'**
  String get confirmAccountNumberHint;

  /// No description provided for @ifscCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. SBIN0001234'**
  String get ifscCodeHint;

  /// No description provided for @upiIdHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. user@upi'**
  String get upiIdHint;

  /// No description provided for @upi.
  ///
  /// In en, this message translates to:
  /// **'UPI'**
  String get upi;

  /// No description provided for @totalFare.
  ///
  /// In en, this message translates to:
  /// **'TOTAL FARE'**
  String get totalFare;

  /// No description provided for @hideQrCode.
  ///
  /// In en, this message translates to:
  /// **'Hide QR'**
  String get hideQrCode;

  /// No description provided for @nameMinLengthRequired.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get nameMinLengthRequired;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order #{orderId}'**
  String orderNumber(String orderId);

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @onlineSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'You are now online and on duty.'**
  String get onlineSuccessMessage;

  /// No description provided for @offlineSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'You are now offline.'**
  String get offlineSuccessMessage;

  /// No description provided for @partnerSupport.
  ///
  /// In en, this message translates to:
  /// **'Partner Support'**
  String get partnerSupport;

  /// No description provided for @partnerSupportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Hello Partner! Need help with your rides, payments or account? We are here to support you 24/7.'**
  String get partnerSupportSubtitle;

  /// No description provided for @faqsAndHelp.
  ///
  /// In en, this message translates to:
  /// **'FAQs & Help'**
  String get faqsAndHelp;

  /// No description provided for @findQuickAnswers.
  ///
  /// In en, this message translates to:
  /// **'Find quick answers'**
  String get findQuickAnswers;

  /// No description provided for @raiseSupportTicket.
  ///
  /// In en, this message translates to:
  /// **'Raise Ticket'**
  String get raiseSupportTicket;

  /// No description provided for @contactSupportAgent.
  ///
  /// In en, this message translates to:
  /// **'Contact support agent'**
  String get contactSupportAgent;

  /// No description provided for @recentTickets.
  ///
  /// In en, this message translates to:
  /// **'Recent Tickets'**
  String get recentTickets;

  /// No description provided for @noActiveTickets.
  ///
  /// In en, this message translates to:
  /// **'No active support tickets'**
  String get noActiveTickets;

  /// No description provided for @submitTicketDescription.
  ///
  /// In en, this message translates to:
  /// **'Submit a ticket if you face any issues.'**
  String get submitTicketDescription;

  /// No description provided for @failedToLoadTickets.
  ///
  /// In en, this message translates to:
  /// **'Failed to load recent tickets'**
  String get failedToLoadTickets;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @callUs.
  ///
  /// In en, this message translates to:
  /// **'Call Us'**
  String get callUs;

  /// No description provided for @whatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsApp;

  /// No description provided for @chatWithUs.
  ///
  /// In en, this message translates to:
  /// **'Chat with us'**
  String get chatWithUs;

  /// No description provided for @emailSupport.
  ///
  /// In en, this message translates to:
  /// **'Email Support'**
  String get emailSupport;

  /// No description provided for @ticketStatusOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get ticketStatusOpen;

  /// No description provided for @ticketStatusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get ticketStatusInProgress;

  /// No description provided for @ticketStatusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get ticketStatusResolved;

  /// No description provided for @ticketStatusClosed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get ticketStatusClosed;

  /// No description provided for @ticketCategoryRideIssue.
  ///
  /// In en, this message translates to:
  /// **'Ride Issue'**
  String get ticketCategoryRideIssue;

  /// No description provided for @ticketCategoryPayment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get ticketCategoryPayment;

  /// No description provided for @ticketCategoryAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get ticketCategoryAccount;

  /// No description provided for @ticketCategoryDriverIssue.
  ///
  /// In en, this message translates to:
  /// **'Driver Issue'**
  String get ticketCategoryDriverIssue;

  /// No description provided for @ticketCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get ticketCategoryOther;

  /// No description provided for @failedToLoadDashboard.
  ///
  /// In en, this message translates to:
  /// **'Failed to load dashboard'**
  String get failedToLoadDashboard;

  /// No description provided for @todaysEarnings.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Earnings'**
  String get todaysEarnings;

  /// No description provided for @cashCollected.
  ///
  /// In en, this message translates to:
  /// **'CASH COLLECTED'**
  String get cashCollected;

  /// No description provided for @onlinePayment.
  ///
  /// In en, this message translates to:
  /// **'ONLINE PAYMENT'**
  String get onlinePayment;

  /// No description provided for @todaysRideStatus.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Ride Status'**
  String get todaysRideStatus;

  /// No description provided for @totalRides.
  ///
  /// In en, this message translates to:
  /// **'Total Rides'**
  String get totalRides;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @dutyRating.
  ///
  /// In en, this message translates to:
  /// **'Duty Rating'**
  String get dutyRating;

  /// No description provided for @noRidesFound.
  ///
  /// In en, this message translates to:
  /// **'No rides found'**
  String get noRidesFound;

  /// No description provided for @failedToLoadHistory.
  ///
  /// In en, this message translates to:
  /// **'Failed to load history'**
  String get failedToLoadHistory;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @paymentPending.
  ///
  /// In en, this message translates to:
  /// **'Payment Pending'**
  String get paymentPending;

  /// No description provided for @stopsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} stops'**
  String stopsCount(int count);

  /// No description provided for @rideDetails.
  ///
  /// In en, this message translates to:
  /// **'Ride Details'**
  String get rideDetails;

  /// No description provided for @pickupLocation.
  ///
  /// In en, this message translates to:
  /// **'Pickup Location'**
  String get pickupLocation;

  /// No description provided for @dropLocation.
  ///
  /// In en, this message translates to:
  /// **'Dropoff Location'**
  String get dropLocation;

  /// No description provided for @stopLocation.
  ///
  /// In en, this message translates to:
  /// **'Stop {number}'**
  String stopLocation(int number);

  /// No description provided for @fareBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Fare Breakdown'**
  String get fareBreakdown;

  /// No description provided for @netPayable.
  ///
  /// In en, this message translates to:
  /// **'Net Payable'**
  String get netPayable;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @customerDetails.
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get customerDetails;

  /// No description provided for @callCustomer.
  ///
  /// In en, this message translates to:
  /// **'Call Customer'**
  String get callCustomer;

  /// No description provided for @goodsType.
  ///
  /// In en, this message translates to:
  /// **'Goods Type'**
  String get goodsType;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @cancellationReason.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Reason'**
  String get cancellationReason;

  /// No description provided for @routeTimeline.
  ///
  /// In en, this message translates to:
  /// **'Route Timeline'**
  String get routeTimeline;

  /// No description provided for @goodsSpecifications.
  ///
  /// In en, this message translates to:
  /// **'Goods Specifications'**
  String get goodsSpecifications;

  /// No description provided for @vehicleMetadata.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Metadata'**
  String get vehicleMetadata;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @estimatedWeight.
  ///
  /// In en, this message translates to:
  /// **'Estimated Weight'**
  String get estimatedWeight;

  /// No description provided for @vehicleName.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Name'**
  String get vehicleName;

  /// No description provided for @vehicleNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Number'**
  String get vehicleNumber;

  /// No description provided for @modelColor.
  ///
  /// In en, this message translates to:
  /// **'Model / Color'**
  String get modelColor;

  /// No description provided for @baseFare.
  ///
  /// In en, this message translates to:
  /// **'Base Fare'**
  String get baseFare;

  /// No description provided for @weatherSurcharge.
  ///
  /// In en, this message translates to:
  /// **'Weather Surcharge'**
  String get weatherSurcharge;

  /// No description provided for @trafficSurcharge.
  ///
  /// In en, this message translates to:
  /// **'Traffic Surcharge'**
  String get trafficSurcharge;

  /// No description provided for @promoDiscount.
  ///
  /// In en, this message translates to:
  /// **'Promo Discount'**
  String get promoDiscount;

  /// No description provided for @pickupSender.
  ///
  /// In en, this message translates to:
  /// **'Pickup (Sender)'**
  String get pickupSender;

  /// No description provided for @dropoffRecipient.
  ///
  /// In en, this message translates to:
  /// **'Dropoff Recipient'**
  String get dropoffRecipient;

  /// No description provided for @rideIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Ride ID: {id}'**
  String rideIdLabel(String id);

  /// No description provided for @todaysTotalEarnings.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Total Earnings'**
  String get todaysTotalEarnings;

  /// No description provided for @failedToLoadEarnings.
  ///
  /// In en, this message translates to:
  /// **'Failed to load earnings stats'**
  String get failedToLoadEarnings;

  /// No description provided for @noTransactionsRecorded.
  ///
  /// In en, this message translates to:
  /// **'No transactions recorded'**
  String get noTransactionsRecorded;

  /// No description provided for @mySupportTickets.
  ///
  /// In en, this message translates to:
  /// **'My Support Tickets'**
  String get mySupportTickets;

  /// No description provided for @newTicket.
  ///
  /// In en, this message translates to:
  /// **'New Ticket'**
  String get newTicket;

  /// No description provided for @noSupportTicketsRaised.
  ///
  /// In en, this message translates to:
  /// **'No support tickets raised'**
  String get noSupportTicketsRaised;

  /// No description provided for @tapNewTicketSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap \'New Ticket\' to request assistance.'**
  String get tapNewTicketSubtitle;

  /// No description provided for @submitATicket.
  ///
  /// In en, this message translates to:
  /// **'Submit a Ticket'**
  String get submitATicket;

  /// No description provided for @explainIssueDetail.
  ///
  /// In en, this message translates to:
  /// **'Explain your issue in detail. A support agent will verify it and reply shortly.'**
  String get explainIssueDetail;

  /// No description provided for @categoryRequired.
  ///
  /// In en, this message translates to:
  /// **'Category*'**
  String get categoryRequired;

  /// No description provided for @selectIssueCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Issue Category'**
  String get selectIssueCategory;

  /// No description provided for @pleaseSelectCategoryError.
  ///
  /// In en, this message translates to:
  /// **'Please select an issue category'**
  String get pleaseSelectCategoryError;

  /// No description provided for @subjectRequired.
  ///
  /// In en, this message translates to:
  /// **'Subject*'**
  String get subjectRequired;

  /// No description provided for @briefSummaryHint.
  ///
  /// In en, this message translates to:
  /// **'Brief summary of the issue'**
  String get briefSummaryHint;

  /// No description provided for @subjectRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Subject is required'**
  String get subjectRequiredError;

  /// No description provided for @subjectMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Subject must be at least 5 characters'**
  String get subjectMinLengthError;

  /// No description provided for @descriptionRequired.
  ///
  /// In en, this message translates to:
  /// **'Description / Message*'**
  String get descriptionRequired;

  /// No description provided for @describeProblemHint.
  ///
  /// In en, this message translates to:
  /// **'Describe your problem in detail...'**
  String get describeProblemHint;

  /// No description provided for @messageRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Message description is required'**
  String get messageRequiredError;

  /// No description provided for @messageMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Message must be at least 10 characters'**
  String get messageMinLengthError;

  /// No description provided for @submitTicket.
  ///
  /// In en, this message translates to:
  /// **'Submit Ticket'**
  String get submitTicket;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @iAgreeTo.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get iAgreeTo;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @agreeSuffix.
  ///
  /// In en, this message translates to:
  /// **''**
  String get agreeSuffix;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @failedToLoadDetails.
  ///
  /// In en, this message translates to:
  /// **'Failed to load details'**
  String get failedToLoadDetails;

  /// No description provided for @defaultPrivacyPolicyHtml.
  ///
  /// In en, this message translates to:
  /// **'<h1>Privacy Policy</h1><p>Welcome to ReachU Driver. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information.</p><h2>1. Information We Collect</h2><p>We collect personal information such as your name, phone number, email address, vehicle details, location data during active trips, and transaction details.</p><h2>2. How We Use Information</h2><p>We use your information to facilitate delivery rides, process payments, ensure safety, and improve driver platform experience.</p><h2>3. Location Tracking</h2><p>Background location access is required while on-duty to match you with nearby delivery requests and allow customers to track trip progress.</p><h2>4. Data Protection</h2><p>We implement strict security measures to protect your personal data against unauthorized access or disclosure.</p>'**
  String get defaultPrivacyPolicyHtml;

  /// No description provided for @defaultTermsAndConditionsHtml.
  ///
  /// In en, this message translates to:
  /// **'<h1>Terms & Conditions</h1><p>Please read these Terms & Conditions carefully before using the ReachU Driver application.</p><h2>1. Acceptance of Terms</h2><p>By registering and operating as a driver partner on ReachU, you agree to comply with all applicable terms, policies, and local transport regulations.</p><h2>2. Driver Responsibilities</h2><p>Drivers must maintain a valid driving license, accurate vehicle documentation, and provide safe, timely delivery service.</p><h2>3. Payments & Earnings</h2><p>Payouts and trip fares are calculated according to platform rates and transferred to verified driver bank accounts after applicable platform fees.</p><h2>4. Account Termination</h2><p>ReachU reserves the right to suspend or terminate accounts in cases of fraudulent activity, safety violations, or repeated policy non-compliance.</p>'**
  String get defaultTermsAndConditionsHtml;

  /// No description provided for @reviewAndRating.
  ///
  /// In en, this message translates to:
  /// **'Review & Rating'**
  String get reviewAndRating;

  /// No description provided for @noRatingsYet.
  ///
  /// In en, this message translates to:
  /// **'No ratings yet'**
  String get noRatingsYet;

  /// Text showing how many customers rated the driver
  ///
  /// In en, this message translates to:
  /// **'Rated by {count} customers'**
  String ratedByCustomers(int count);

  /// No description provided for @noReviewsYet.
  ///
  /// In en, this message translates to:
  /// **'No Reviews Yet'**
  String get noReviewsYet;

  /// No description provided for @noReviewsDesc.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t received any reviews yet.'**
  String get noReviewsDesc;

  /// No description provided for @noCommentProvided.
  ///
  /// In en, this message translates to:
  /// **'No comment provided'**
  String get noCommentProvided;

  /// No description provided for @ratingExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get ratingExcellent;

  /// No description provided for @ratingGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get ratingGood;

  /// No description provided for @ratingAverage.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get ratingAverage;

  /// No description provided for @ratingBelowAverage.
  ///
  /// In en, this message translates to:
  /// **'Below Average'**
  String get ratingBelowAverage;

  /// No description provided for @ratingPoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get ratingPoor;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get noInternetConnection;

  /// No description provided for @checkInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Please check your mobile data or Wi-Fi connection.'**
  String get checkInternetConnection;

  /// No description provided for @internetRestored.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection Restored'**
  String get internetRestored;

  /// No description provided for @retryConnection.
  ///
  /// In en, this message translates to:
  /// **'Retry Connection'**
  String get retryConnection;

  /// No description provided for @connectionTimedOut.
  ///
  /// In en, this message translates to:
  /// **'Connection timed out. Please try again.'**
  String get connectionTimedOut;

  /// No description provided for @newUpdateAvailable.
  ///
  /// In en, this message translates to:
  /// **'New Update Available!'**
  String get newUpdateAvailable;

  /// No description provided for @updateRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get updateRequiredTitle;

  /// Force update message with version placeholder
  ///
  /// In en, this message translates to:
  /// **'A newer, faster, and more secure version of Reachu is available. Please update to version {version} to continue using the application.'**
  String updateRequiredDesc(String version);

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'UPDATE NOW'**
  String get updateNow;

  /// No description provided for @updateLater.
  ///
  /// In en, this message translates to:
  /// **'LATER'**
  String get updateLater;

  /// No description provided for @underMaintenanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Under Maintenance'**
  String get underMaintenanceTitle;

  /// No description provided for @underMaintenanceDesc.
  ///
  /// In en, this message translates to:
  /// **'We are currently performing scheduled maintenance to upgrade our system. We will be back online soon.'**
  String get underMaintenanceDesc;

  /// No description provided for @estimatedBackIn.
  ///
  /// In en, this message translates to:
  /// **'ESTIMATED BACK IN'**
  String estimatedBackIn(Object time);

  /// No description provided for @backOnlineSoon.
  ///
  /// In en, this message translates to:
  /// **'We will be back online soon'**
  String get backOnlineSoon;

  /// Installed app version display
  ///
  /// In en, this message translates to:
  /// **'Installed Version: {version}'**
  String installedVersion(String version);

  /// No description provided for @couldNotOpenStore.
  ///
  /// In en, this message translates to:
  /// **'Could not open Play Store. Please update manually.'**
  String get couldNotOpenStore;

  /// No description provided for @detailedFareBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Detailed Fare Breakdown'**
  String get detailedFareBreakdown;

  /// No description provided for @checkPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Check Payment Status'**
  String get checkPaymentStatus;

  /// No description provided for @checkingStatus.
  ///
  /// In en, this message translates to:
  /// **'Checking Status...'**
  String get checkingStatus;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @hide.
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// No description provided for @collectCashFromCustomer.
  ///
  /// In en, this message translates to:
  /// **'COLLECT CASH FROM CUSTOMER'**
  String get collectCashFromCustomer;

  /// No description provided for @customerOnlineFareDue.
  ///
  /// In en, this message translates to:
  /// **'CUSTOMER ONLINE FARE DUE'**
  String get customerOnlineFareDue;

  /// No description provided for @reachuWalletCredit.
  ///
  /// In en, this message translates to:
  /// **'ReachU Credit (To Your Wallet)'**
  String get reachuWalletCredit;

  /// Promo discount reimbursement note
  ///
  /// In en, this message translates to:
  /// **'{amount} promo discount will be credited to your ReachU Wallet by company.'**
  String promoReimbursementNote(String amount);

  /// Waiting charge note
  ///
  /// In en, this message translates to:
  /// **'Includes {amount} waiting charge for customer delay.'**
  String waitingChargeNote(String amount);

  /// No description provided for @paymentReceivedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment received successfully!'**
  String get paymentReceivedSuccess;

  /// No description provided for @paymentStillPending.
  ///
  /// In en, this message translates to:
  /// **'Payment is still pending from passenger.'**
  String get paymentStillPending;

  /// No description provided for @waitingCharge.
  ///
  /// In en, this message translates to:
  /// **'Waiting Charge'**
  String get waitingCharge;

  /// No description provided for @rentalCharge.
  ///
  /// In en, this message translates to:
  /// **'Rental Charge'**
  String get rentalCharge;

  /// No description provided for @grossFare.
  ///
  /// In en, this message translates to:
  /// **'Gross Fare'**
  String get grossFare;

  /// No description provided for @pendingDue.
  ///
  /// In en, this message translates to:
  /// **'Pending Due / Previous Balance'**
  String get pendingDue;

  /// No description provided for @tollFee.
  ///
  /// In en, this message translates to:
  /// **'Toll Fee'**
  String get tollFee;

  /// No description provided for @cancellationFee.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Fee'**
  String get cancellationFee;

  /// No description provided for @nightSurcharge.
  ///
  /// In en, this message translates to:
  /// **'Night Surcharge'**
  String get nightSurcharge;

  /// No description provided for @surgeFee.
  ///
  /// In en, this message translates to:
  /// **'Surge Fee'**
  String get surgeFee;

  /// No description provided for @taxAndFees.
  ///
  /// In en, this message translates to:
  /// **'Tax & Fees'**
  String get taxAndFees;

  /// No description provided for @platformFee.
  ///
  /// In en, this message translates to:
  /// **'Platform Fee'**
  String get platformFee;

  /// No description provided for @pressBackAgainToExit.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit app'**
  String get pressBackAgainToExit;

  /// No description provided for @pleaseAcceptOrDeclineRide.
  ///
  /// In en, this message translates to:
  /// **'Please accept or decline incoming ride requests.'**
  String get pleaseAcceptOrDeclineRide;

  /// No description provided for @cashPayment.
  ///
  /// In en, this message translates to:
  /// **'Cash Payment'**
  String get cashPayment;

  /// No description provided for @onlineQr.
  ///
  /// In en, this message translates to:
  /// **'Online QR'**
  String get onlineQr;

  /// No description provided for @collectCashInstructions.
  ///
  /// In en, this message translates to:
  /// **'Collect Cash Instructions'**
  String get collectCashInstructions;

  /// No description provided for @collectCashStep1.
  ///
  /// In en, this message translates to:
  /// **'1. Count and receive the physical currency of {amount} directly from the customer.'**
  String collectCashStep1(String amount);

  /// No description provided for @collectCashStep2.
  ///
  /// In en, this message translates to:
  /// **'2. Only tap the confirmation button below after verifying you have the full cash amount in hand.'**
  String get collectCashStep2;

  /// No description provided for @verifyingCashDeposit.
  ///
  /// In en, this message translates to:
  /// **'Verifying Cash Deposit with Server...'**
  String get verifyingCashDeposit;

  /// No description provided for @pleaseHoldClosingRide.
  ///
  /// In en, this message translates to:
  /// **'Please hold, closing ride automatically once processed.'**
  String get pleaseHoldClosingRide;

  /// No description provided for @customerOnlinePayment.
  ///
  /// In en, this message translates to:
  /// **'Customer Online Payment'**
  String get customerOnlinePayment;

  /// No description provided for @generatingQrCode.
  ///
  /// In en, this message translates to:
  /// **'Generating QR Code...'**
  String get generatingQrCode;

  /// No description provided for @failedToLoadQrCode.
  ///
  /// In en, this message translates to:
  /// **'Failed to Load QR Code'**
  String get failedToLoadQrCode;

  /// No description provided for @scanQrToPay.
  ///
  /// In en, this message translates to:
  /// **'SCAN QR TO PAY'**
  String get scanQrToPay;

  /// No description provided for @pinchToZoomQr.
  ///
  /// In en, this message translates to:
  /// **'Pinch to Zoom QR code if needed'**
  String get pinchToZoomQr;

  /// No description provided for @tapToFullScreen.
  ///
  /// In en, this message translates to:
  /// **'Tap to Full Screen'**
  String get tapToFullScreen;

  /// No description provided for @awaitingCustomerPayment.
  ///
  /// In en, this message translates to:
  /// **'Awaiting Customer Payment...'**
  String get awaitingCustomerPayment;

  /// No description provided for @confirmCashReceived.
  ///
  /// In en, this message translates to:
  /// **'Confirm Cash Received'**
  String get confirmCashReceived;

  /// No description provided for @paymentReceivedToast.
  ///
  /// In en, this message translates to:
  /// **'Payment received! Ride completed successfully.'**
  String get paymentReceivedToast;

  /// No description provided for @invalidOrderIdError.
  ///
  /// In en, this message translates to:
  /// **'Invalid Order ID. Cannot record payment.'**
  String get invalidOrderIdError;

  /// No description provided for @cashPaymentRecordedWaiting.
  ///
  /// In en, this message translates to:
  /// **'Cash payment recorded. Waiting for confirmation...'**
  String get cashPaymentRecordedWaiting;

  /// No description provided for @paymentReceivedTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Received!'**
  String get paymentReceivedTitle;

  /// No description provided for @amountPaidSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'{amount} Paid Successfully'**
  String amountPaidSuccessfully(String amount);

  /// No description provided for @rideClosedReturningHome.
  ///
  /// In en, this message translates to:
  /// **'Ride closed. Returning to home screen...'**
  String get rideClosedReturningHome;

  /// No description provided for @fragileGoods.
  ///
  /// In en, this message translates to:
  /// **'Fragile Goods'**
  String get fragileGoods;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'YES'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'NO'**
  String get no;

  /// No description provided for @contactLabel.
  ///
  /// In en, this message translates to:
  /// **'Contact: {name}'**
  String contactLabel(String name, Object phone);

  /// No description provided for @permissionsRequired.
  ///
  /// In en, this message translates to:
  /// **'Permissions Required'**
  String get permissionsRequired;

  /// No description provided for @enableAllPermissionsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enable all permissions to go online and receive bookings.'**
  String get enableAllPermissionsSubtitle;

  /// No description provided for @locationAlwaysTitle.
  ///
  /// In en, this message translates to:
  /// **'Location (Always)'**
  String get locationAlwaysTitle;

  /// No description provided for @locationAlwaysSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Required for continuous tracking'**
  String get locationAlwaysSubtitle;

  /// No description provided for @batteryUnrestrictedTitle.
  ///
  /// In en, this message translates to:
  /// **'Battery Unrestricted'**
  String get batteryUnrestrictedTitle;

  /// No description provided for @batteryUnrestrictedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set to \"Unrestricted\" & enable \"Allow background activity\"'**
  String get batteryUnrestrictedSubtitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Required for booking alerts'**
  String get notificationsSubtitle;

  /// No description provided for @displayOverAppsTitle.
  ///
  /// In en, this message translates to:
  /// **'Display Over Other Apps'**
  String get displayOverAppsTitle;

  /// No description provided for @displayOverAppsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Required for floating widget alerts'**
  String get displayOverAppsSubtitle;

  /// No description provided for @locationUsedInBackground.
  ///
  /// In en, this message translates to:
  /// **'Location Used in Background'**
  String get locationUsedInBackground;

  /// No description provided for @backgroundLocationDisclosureBody.
  ///
  /// In en, this message translates to:
  /// **'ReachuDriver collects your location data even when the app is closed or not in use.\n\nThis is used to:\n  • Share your real-time position with loaders/users\n  • Assign you the nearest booking requests\n  • Keep the dispatch system updated while you\'re on duty\n\nLocation collection only runs while you are online (on duty) and stops immediately when you go offline.'**
  String get backgroundLocationDisclosureBody;

  /// No description provided for @changeInAppSettingsNote.
  ///
  /// In en, this message translates to:
  /// **'You can change this at any time in App Settings.'**
  String get changeInAppSettingsNote;

  /// No description provided for @iUnderstandContinue.
  ///
  /// In en, this message translates to:
  /// **'I Understand — Continue'**
  String get iUnderstandContinue;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notNow;

  /// Title for low wallet balance dialog
  ///
  /// In en, this message translates to:
  /// **'Low Wallet Balance'**
  String get lowWalletBalance;

  /// Subtitle for low wallet balance popup
  ///
  /// In en, this message translates to:
  /// **'Please maintain a minimum wallet balance of ₹{limit} to receive orders. Top up your wallet to continue receiving orders.'**
  String lowWalletBalanceSubtitle(String limit);

  /// Label for minimum required balance card
  ///
  /// In en, this message translates to:
  /// **'Minimum Required Balance'**
  String get minimumRequiredBalance;

  /// Dashboard warning text for low wallet balance
  ///
  /// In en, this message translates to:
  /// **'Please maintain at least ₹{limit} in your wallet to receive orders.'**
  String lowBalanceDashboardWarning(String limit);

  /// Status badge for active wallet balance
  ///
  /// In en, this message translates to:
  /// **'Active for Rides'**
  String get activeForRides;

  /// Status badge for low wallet balance
  ///
  /// In en, this message translates to:
  /// **'Low Balance'**
  String get lowBalanceStatus;

  /// Label for minimum wallet limit breakdown
  ///
  /// In en, this message translates to:
  /// **'Min. Limit'**
  String get minimumLimit;

  /// Title for e-Shram worker benefits card
  ///
  /// In en, this message translates to:
  /// **'e-Shram Benefits'**
  String get eShramBenefitsTitle;

  /// Badge text for official government scheme
  ///
  /// In en, this message translates to:
  /// **'Govt Scheme'**
  String get govtScheme;

  /// Sub header for e-Shram scheme
  ///
  /// In en, this message translates to:
  /// **'Govt. Insurance & Pension Scheme'**
  String get eShramSubHeader;

  /// Description text for e-Shram worker benefits
  ///
  /// In en, this message translates to:
  /// **'Register on official Govt. e-Shram portal for accidental insurance cover & social security benefits for gig workers.'**
  String get eShramDescription;

  /// CTA button label for registering on e-Shram portal
  ///
  /// In en, this message translates to:
  /// **'Register on e-Shram Portal'**
  String get registerOnEShramPortal;

  /// Menu title for e-Shram benefits in profile
  ///
  /// In en, this message translates to:
  /// **'e-Shram Govt. Benefits'**
  String get eShramGovtBenefitsMenu;

  /// Button label to dismiss popup
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en', 'gu', 'hi', 'kn', 'ml', 'mr', 'or', 'pa', 'ta', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
    case 'gu': return AppLocalizationsGu();
    case 'hi': return AppLocalizationsHi();
    case 'kn': return AppLocalizationsKn();
    case 'ml': return AppLocalizationsMl();
    case 'mr': return AppLocalizationsMr();
    case 'or': return AppLocalizationsOr();
    case 'pa': return AppLocalizationsPa();
    case 'ta': return AppLocalizationsTa();
    case 'te': return AppLocalizationsTe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
