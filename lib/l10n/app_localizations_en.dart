// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get account => 'Account';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get logout => 'Logout';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get english => 'English';

  @override
  String get hindi => 'हिन्दी (Hindi)';

  @override
  String get selectVehicle => 'Select Vehicle';

  @override
  String get selectAVehicle => 'Select a Vehicle';

  @override
  String proceedWithVehicle(String vehicleName) {
    return 'Proceed with $vehicleName';
  }

  @override
  String get addStop => 'Add Stop';

  @override
  String get editLocations => 'Edit Locations';

  @override
  String get noPickupLocationSet => 'No pickup location set';

  @override
  String get noDropLocationSet => 'No drop location set';

  @override
  String get addDrop => 'Add drop';

  @override
  String get errorLoadingVehicles => 'Error loading vehicles';

  @override
  String get selectGoodsType => 'Select Goods Type';

  @override
  String get whatAreYouShipping => 'What are you shipping?';

  @override
  String get chooseCategoryBestMatches =>
      'Choose the category that best matches your goods';

  @override
  String get editGoodsDetails => 'Edit Goods Details';

  @override
  String get weightKgMax90 => 'Weight (kg) - Max 90 kg';

  @override
  String get weightInvalidError => 'Weight must be 1 to 90 kg';

  @override
  String get numberOfPackages => 'Number of Packages';

  @override
  String get worthValueRupees => 'Worth / Value (Rupees)';

  @override
  String get done => 'Done';

  @override
  String get confirmGoodsDetails => 'Confirm Goods Details';

  @override
  String get failedToLoadCategories => 'Failed to load categories';

  @override
  String get disclaimerTitle => 'Disclaimer';

  @override
  String get disclaimerText =>
      'Disclaimer: I declare that the goods being transported are non-hazardous, legal, and belong to the selected category. The company is not liable for transport of prohibited items. Weight must not exceed the maximum vehicle capacity.';

  @override
  String goodsSummary(String weight, int packages, String worth) {
    return '$weight kg • $packages package(s) • ₹$worth';
  }

  @override
  String get welcome => 'Welcome';

  @override
  String get enterMobileNumberToContinue =>
      'Enter your mobile number to continue';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get agreeTermsText =>
      'I agree to the Terms of Service and Privacy Policy';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String enterOtpSentTo(Object phoneNumber) {
    return 'Enter the 4-digit code sent to\n+91 $phoneNumber';
  }

  @override
  String get verifyAndContinue => 'Verify & Continue';

  @override
  String resendInSeconds(Object count) {
    return 'Resend in ${count}s';
  }

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get changeNumber => 'Change Number';

  @override
  String get mobileNumberRequired => 'Mobile number is required';

  @override
  String get enterValidMobileNumber => 'Enter a valid 10-digit mobile number';

  @override
  String get enterCompleteOtpError => 'Please enter the complete 4-digit OTP';

  @override
  String get otpResentSuccess => 'OTP resent successfully';

  @override
  String get fullName => 'Full Name';

  @override
  String get fullNameRequired => 'Full name is required';

  @override
  String get nameMinLengthError => 'Name must be at least 2 characters';

  @override
  String get email => 'Email';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get enterValidEmail => 'Enter a valid email address';

  @override
  String get referralCode => 'Referral Code';

  @override
  String get enterReferralCodeOptional => 'Enter referral code (optional)';

  @override
  String get createAccount => 'Create Account';

  @override
  String get completeProfileToGetStarted =>
      'Complete your profile to get started';

  @override
  String get profileUpdatedSuccess => 'Profile updated successfully!';

  @override
  String get updateProfilePicture => 'Update Profile Picture';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get cancel => 'Cancel';

  @override
  String get dateOfBirthOptional => 'Date of Birth (Optional)';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get other => 'Other';

  @override
  String get updateProfile => 'Update Profile';

  @override
  String profileUpdateFailed(Object error) {
    return 'Failed to update profile: $error';
  }

  @override
  String get goodMorning => 'Good Morning,';

  @override
  String get goodAfternoon => 'Good Afternoon,';

  @override
  String get goodEvening => 'Good Evening,';

  @override
  String get pickupFrom => 'Pickup From';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get fetchingLocation => 'Fetching location...';

  @override
  String get locationServicesDisabled => 'Location services disabled';

  @override
  String get locationPermissionNeeded => 'Location permission needed';

  @override
  String get locationAccessBlocked => 'Location access blocked';

  @override
  String get couldNotFetchLocation => 'Couldn\'t fetch location';

  @override
  String get enable => 'Enable';

  @override
  String get allow => 'Allow';

  @override
  String get settings => 'Settings';

  @override
  String get retry => 'Retry';

  @override
  String get turnOnLocationServices => 'Turn on Location Services';

  @override
  String get allowLocationAccess => 'Allow Location Access';

  @override
  String get gpsRequiredDescription =>
      'We need your device GPS turned on to accurately pinpoint your pickup location and find nearby drivers quickly.';

  @override
  String get permissionRequiredDescription =>
      'Please allow location permissions in your app settings so we can accurately pinpoint your pickup location and find nearby drivers quickly.';

  @override
  String get goToLocationSettings => 'Go to Location Settings';

  @override
  String get goToAppSettings => 'Go to App Settings';

  @override
  String get enterAddressManually => 'I\'ll enter my address manually';

  @override
  String get taglineTitle => 'Moving Anything,\nAnytime.';

  @override
  String get taglineSubtitle =>
      'Fast deliveries at your fingertips. Shift smarter, move faster with our premium fleet.';

  @override
  String get twoWheelers => '2 Wheelers';

  @override
  String get trucks => 'Trucks';

  @override
  String get specialOffer => 'Special Offer';

  @override
  String get promoBannerText => 'Get 20% off on\nyour first ride';

  @override
  String get whereIsYourPickup => 'Where is your pickup?';

  @override
  String get whereIsYourDrop => 'Where is your drop?';

  @override
  String whereIsYourDropIndex(int index) {
    return 'Where is your Drop $index?';
  }

  @override
  String get typeMinCharsToSearch =>
      'Type at least 4 characters to start searching';

  @override
  String get selectOnMap => 'Select on Map';

  @override
  String get pinpointExactLocation => 'Pinpoint your exact location';

  @override
  String get couldNotFindAddress => 'Sorry, we couldn\'t find this address.';

  @override
  String get trySearchingNearbyLandmark =>
      'Try searching using a nearby landmark, locality, or popular place.';

  @override
  String get anErrorOccurred => 'An error occurred';

  @override
  String get locating => 'Locating...';

  @override
  String get fetchingDetails => 'Fetching details...';

  @override
  String get confirmPickupLocation => 'Confirm Pickup Location';

  @override
  String get confirmDropLocation => 'Confirm Drop Location';

  @override
  String get houseShopApartment => 'House / Shop / Apartment';

  @override
  String get sendersName => 'Sender\'s Name';

  @override
  String get receiversName => 'Receiver\'s Name';

  @override
  String get pleaseEnterName => 'Please enter name';

  @override
  String get sendersMobileNumber => 'Sender\'s Mobile Number';

  @override
  String get receiversMobileNumber => 'Receiver\'s Mobile Number';

  @override
  String get enterValidTenDigitNumber => 'Enter valid 10-digit number';

  @override
  String get useMyMobileNumber => 'Use my mobile number';

  @override
  String get saveAsOptional => 'Save as (Optional):';

  @override
  String get home => 'Home';

  @override
  String get shop => 'Shop';

  @override
  String get confirmAndProceed => 'Confirm & Proceed';

  @override
  String get selectDropLocation => 'Select Drop Location';

  @override
  String get cannotSwapEmptyLocations =>
      'Cannot swap empty locations with filled ones.';

  @override
  String get proceedToVehicleSelection => 'Proceed to Vehicle Selection';

  @override
  String get permissionRequired => 'Permission Required';

  @override
  String get contactsPermissionDescription =>
      'Reachu needs access to your contacts to allow you to easily select a sender\'s phone number. Please enable it in app settings.';

  @override
  String get openSettings => 'Open Settings';

  @override
  String get selectContact => 'Select Contact';

  @override
  String get contactPermissionDenied => 'Contact permission denied.';

  @override
  String get myProfile => 'My Profile';

  @override
  String selfFormat(String name) {
    return '$name (Self)';
  }

  @override
  String get deviceContacts => 'Device Contacts';

  @override
  String get rideHistory => 'Ride History';

  @override
  String get transactions => 'Transactions';

  @override
  String get noTransactionsFound => 'No transactions found';

  @override
  String get failedToLoadTransactions => 'Failed to load transactions';

  @override
  String get addMoney => 'Add Money';

  @override
  String get enterAmountToAdd => 'Enter amount to add';

  @override
  String failedToOpenRazorpay(Object error) {
    return 'Failed to open Razorpay: $error';
  }

  @override
  String failedToCreatePaymentOrder(Object error) {
    return 'Failed to create payment order: $error';
  }

  @override
  String successfullyAddedToreachuCredits(Object amount) {
    return 'Successfully added ₹$amount to Reachu Credits!';
  }

  @override
  String paymentVerificationFailed(Object error) {
    return 'Payment verification failed: $error';
  }

  @override
  String paymentFailedFormat(Object code, Object message) {
    return 'Payment failed ($code): $message';
  }

  @override
  String externalWalletSelected(Object walletName) {
    return 'External wallet selected: $walletName';
  }

  @override
  String get walletTopUp => 'Wallet Top-up';

  @override
  String get payments => 'Payments';

  @override
  String get reachuCredits => 'Reachu CREDITS';

  @override
  String get balance => 'Balance';

  @override
  String get errorLoadingBalance => 'Error loading balance';

  @override
  String get availableBalance => 'AVAILABLE BALANCE';

  @override
  String get totalExpenses => 'TOTAL EXPENSES';

  @override
  String get recentTransactions => 'Recent Transactions';

  @override
  String get viewMore => 'View More';

  @override
  String get noTransactionsYet => 'No transactions yet';

  @override
  String get booking => 'Booking';

  @override
  String get earning => 'Earning';

  @override
  String get support => 'Support';

  @override
  String get profile => 'Profile';

  @override
  String get pendingWithdrawals => 'Pending Withdrawals';

  @override
  String get driverDebt => 'Driver Debt';

  @override
  String minBalanceRequired(Object amount) {
    return 'Min Balance Required: ₹$amount';
  }

  @override
  String get insufficientBalance => 'Insufficient balance for withdrawal';

  @override
  String minimumBalanceWarning(Object amount) {
    return 'Warning: Your available balance is below the minimum required limit (₹$amount) to accept new customer rides. Please top up your wallet.';
  }

  @override
  String get moneyTransfer => 'Money Transfer';

  @override
  String get withdrawMoney => 'Withdraw Money';

  @override
  String get manageAccounts => 'Bank Accounts';

  @override
  String get bankAccounts => 'Bank Accounts';

  @override
  String get addAccount => 'Add Bank Account';

  @override
  String get addBankAccount => 'Add Bank Account';

  @override
  String get addUpiId => 'Add UPI ID';

  @override
  String get editBankAccount => 'Edit Bank Account';

  @override
  String get editUpiId => 'Edit UPI ID';

  @override
  String get deleteAccount => 'Delete Bank Account';

  @override
  String get deleteAccountConfirm =>
      'Are you sure you want to delete this bank account?';

  @override
  String get accountHolderName =>
      'Account Holder Name (Name as present on bank account)';

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
  String get bankName => 'Bank Name';

  @override
  String get accountNumber => 'Account Number';

  @override
  String get confirmAccountNumber => 'Confirm Account Number';

  @override
  String get ifscCode => 'IFSC Code';

  @override
  String get upiId => 'UPI ID';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidUpi => 'Enter a valid UPI ID (e.g. name@upi)';

  @override
  String get invalidIfsc =>
      'Enter a valid 11-digit IFSC code (e.g. SBIN0001234)';

  @override
  String get invalidAccountNumber =>
      'Enter a valid account number (9-18 digits)';

  @override
  String get accountNumbersDoNotMatch => 'Account numbers do not match';

  @override
  String get noPaymentMethods => 'No bank accounts added yet';

  @override
  String get addPaymentMethodSubtitle =>
      'Add your verified bank account to withdraw your earnings directly';

  @override
  String get confirmTransfer => 'Confirm Withdrawal';

  @override
  String get transferAmount => 'Transfer Amount';

  @override
  String get transferSuccess => 'Withdrawal request created successfully';

  @override
  String get collectPayment => 'Collect Payment';

  @override
  String get collectCash => 'Collect Cash';

  @override
  String get cashCollectedSuccess => 'Cash payment completed successfully!';

  @override
  String get displayQrCode => 'Display UPI QR Code';

  @override
  String get customerScanQr => 'Ask the customer to scan this QR code to pay';

  @override
  String get generatingQr => 'Generating QR code...';

  @override
  String get selectPaymentMethod => 'Select Bank Account';

  @override
  String get beneficiary => 'Beneficiary';

  @override
  String get completed => 'Completed';

  @override
  String get pending => 'Pending';

  @override
  String get failed => 'Failed';

  @override
  String get failedToLoadAccounts => 'Failed to load bank accounts';

  @override
  String get accountDeletedSuccess => 'Bank account deleted successfully';

  @override
  String get accountUpdatedSuccess => 'Bank account updated successfully';

  @override
  String get accountAddedSuccess => 'Bank account added successfully';

  @override
  String get withdrawalAmount => 'Withdrawal Amount';

  @override
  String get transferDestination => 'Transfer Destination';

  @override
  String get enterAmount => 'Enter amount';

  @override
  String get selected => 'Selected';

  @override
  String get accountNumberLabel => 'Account No';

  @override
  String get errorLoadingAccounts => 'Error loading bank accounts';

  @override
  String get errorLoadingWallet => 'Error loading wallet info';

  @override
  String get enterAccountHolderName => 'Enter account holder name';

  @override
  String get bankNameHint => 'e.g. State Bank of India';

  @override
  String get enterAccountNumber => 'Enter bank account number';

  @override
  String get confirmAccountNumberHint => 'Re-enter bank account number';

  @override
  String get ifscCodeHint => 'e.g. SBIN0001234';

  @override
  String get upiIdHint => 'e.g. user@upi';

  @override
  String get upi => 'UPI';

  @override
  String get totalFare => 'TOTAL FARE';

  @override
  String get hideQrCode => 'Hide QR';

  @override
  String get nameMinLengthRequired => 'Name must be at least 2 characters';

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
    return 'Order #$orderId';
  }

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get onlineSuccessMessage => 'You are now online and on duty.';

  @override
  String get offlineSuccessMessage => 'You are now offline.';

  @override
  String get partnerSupport => 'Partner Support';

  @override
  String get partnerSupportSubtitle =>
      'Hello Partner! Need help with your rides, payments or account? We are here to support you 24/7.';

  @override
  String get faqsAndHelp => 'FAQs & Help';

  @override
  String get findQuickAnswers => 'Find quick answers';

  @override
  String get raiseSupportTicket => 'Raise Ticket';

  @override
  String get contactSupportAgent => 'Contact support agent';

  @override
  String get recentTickets => 'Recent Tickets';

  @override
  String get noActiveTickets => 'No active support tickets';

  @override
  String get submitTicketDescription =>
      'Submit a ticket if you face any issues.';

  @override
  String get failedToLoadTickets => 'Failed to load recent tickets';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get callUs => 'Call Us';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get chatWithUs => 'Chat with us';

  @override
  String get emailSupport => 'Email Support';

  @override
  String get ticketStatusOpen => 'Open';

  @override
  String get ticketStatusInProgress => 'In Progress';

  @override
  String get ticketStatusResolved => 'Resolved';

  @override
  String get ticketStatusClosed => 'Closed';

  @override
  String get ticketCategoryRideIssue => 'Ride Issue';

  @override
  String get ticketCategoryPayment => 'Payment';

  @override
  String get ticketCategoryAccount => 'Account';

  @override
  String get ticketCategoryDriverIssue => 'Driver Issue';

  @override
  String get ticketCategoryOther => 'Other';

  @override
  String get failedToLoadDashboard => 'Failed to load dashboard';

  @override
  String get todaysEarnings => 'Today\'s Earnings';

  @override
  String get cashCollected => 'CASH COLLECTED';

  @override
  String get onlinePayment => 'ONLINE PAYMENT';

  @override
  String get todaysRideStatus => 'Today\'s Order Status';

  @override
  String get totalRides => 'Total Orders';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get dutyRating => 'Duty Rating';

  @override
  String get noRidesFound => 'No rides found';

  @override
  String get failedToLoadHistory => 'Failed to load history';

  @override
  String get all => 'All';

  @override
  String get paymentPending => 'Payment Pending';

  @override
  String stopsCount(int count) {
    return '$count stops';
  }

  @override
  String get rideDetails => 'Ride Details';

  @override
  String get pickupLocation => 'Pickup Location';

  @override
  String get dropLocation => 'Dropoff Location';

  @override
  String stopLocation(int number) {
    return 'Stop $number';
  }

  @override
  String get fareBreakdown => 'Fare Breakdown';

  @override
  String get netPayable => 'Net Payable';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get cash => 'Cash';

  @override
  String get customerDetails => 'Customer Details';

  @override
  String get callCustomer => 'Call Customer';

  @override
  String get goodsType => 'Goods Type';

  @override
  String get quantity => 'Quantity';

  @override
  String get weight => 'Weight';

  @override
  String get distance => 'Distance';

  @override
  String get duration => 'Duration';

  @override
  String get cancellationReason => 'Cancellation Reason';

  @override
  String get routeTimeline => 'Route Timeline';

  @override
  String get goodsSpecifications => 'Goods Specifications';

  @override
  String get vehicleMetadata => 'Vehicle Metadata';

  @override
  String get description => 'Description';

  @override
  String get estimatedWeight => 'Estimated Weight';

  @override
  String get vehicleName => 'Vehicle Name';

  @override
  String get vehicleNumber => 'Vehicle Number';

  @override
  String get modelColor => 'Model / Color';

  @override
  String get baseFare => 'Base Fare';

  @override
  String get weatherSurcharge => 'Weather Surcharge';

  @override
  String get trafficSurcharge => 'Traffic Surcharge';

  @override
  String get promoDiscount => 'Promo Discount';

  @override
  String get pickupSender => 'Pickup (Sender)';

  @override
  String get dropoffRecipient => 'Dropoff Recipient';

  @override
  String rideIdLabel(String id) {
    return 'Ride ID: $id';
  }

  @override
  String get todaysTotalEarnings => 'Today\'s Total Earnings';

  @override
  String get failedToLoadEarnings => 'Failed to load earnings stats';

  @override
  String get noTransactionsRecorded => 'No transactions recorded';

  @override
  String get mySupportTickets => 'My Support Tickets';

  @override
  String get newTicket => 'New Ticket';

  @override
  String get noSupportTicketsRaised => 'No support tickets raised';

  @override
  String get tapNewTicketSubtitle =>
      'Tap \'New Ticket\' to request assistance.';

  @override
  String get submitATicket => 'Submit a Ticket';

  @override
  String get explainIssueDetail =>
      'Explain your issue in detail. A support agent will verify it and reply shortly.';

  @override
  String get categoryRequired => 'Category*';

  @override
  String get selectIssueCategory => 'Select Issue Category';

  @override
  String get pleaseSelectCategoryError => 'Please select an issue category';

  @override
  String get subjectRequired => 'Subject*';

  @override
  String get briefSummaryHint => 'Brief summary of the issue';

  @override
  String get subjectRequiredError => 'Subject is required';

  @override
  String get subjectMinLengthError => 'Subject must be at least 5 characters';

  @override
  String get descriptionRequired => 'Description / Message*';

  @override
  String get describeProblemHint => 'Describe your problem in detail...';

  @override
  String get messageRequiredError => 'Message description is required';

  @override
  String get messageMinLengthError => 'Message must be at least 10 characters';

  @override
  String get submitTicket => 'Submit Ticket';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsAndConditions => 'Terms & Conditions';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get iAgreeTo => 'I agree to the ';

  @override
  String get and => ' and ';

  @override
  String get agreeSuffix => '';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get failedToLoadDetails => 'Failed to load details';

  @override
  String get defaultPrivacyPolicyHtml =>
      '<h1>Privacy Policy</h1><p>Welcome to ReachU Driver. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information.</p><h2>1. Information We Collect</h2><p>We collect personal information such as your name, phone number, email address, vehicle details, location data during active trips, and transaction details.</p><h2>2. How We Use Information</h2><p>We use your information to facilitate delivery rides, process payments, ensure safety, and improve driver platform experience.</p><h2>3. Location Tracking</h2><p>Background location access is required while on-duty to match you with nearby delivery requests and allow customers to track trip progress.</p><h2>4. Data Protection</h2><p>We implement strict security measures to protect your personal data against unauthorized access or disclosure.</p>';

  @override
  String get defaultTermsAndConditionsHtml =>
      '<h1>Terms & Conditions</h1><p>Please read these Terms & Conditions carefully before using the ReachU Driver application.</p><h2>1. Acceptance of Terms</h2><p>By registering and operating as a driver partner on ReachU, you agree to comply with all applicable terms, policies, and local transport regulations.</p><h2>2. Driver Responsibilities</h2><p>Drivers must maintain a valid driving license, accurate vehicle documentation, and provide safe, timely delivery service.</p><h2>3. Payments & Earnings</h2><p>Payouts and trip fares are calculated according to platform rates and transferred to verified driver bank accounts after applicable platform fees.</p><h2>4. Account Termination</h2><p>ReachU reserves the right to suspend or terminate accounts in cases of fraudulent activity, safety violations, or repeated policy non-compliance.</p>';

  @override
  String get reviewAndRating => 'Review & Rating';

  @override
  String get noRatingsYet => 'No ratings yet';

  @override
  String ratedByCustomers(int count) {
    return 'Rated by $count customers';
  }

  @override
  String get noReviewsYet => 'No Reviews Yet';

  @override
  String get noReviewsDesc => 'You haven\'t received any reviews yet.';

  @override
  String get noCommentProvided => 'No comment provided';

  @override
  String get ratingExcellent => 'Excellent';

  @override
  String get ratingGood => 'Good';

  @override
  String get ratingAverage => 'Average';

  @override
  String get ratingBelowAverage => 'Below Average';

  @override
  String get ratingPoor => 'Poor';

  @override
  String get customer => 'Customer';

  @override
  String get noInternetConnection => 'No Internet Connection';

  @override
  String get checkInternetConnection =>
      'Please check your mobile data or Wi-Fi connection.';

  @override
  String get internetRestored => 'Internet Connection Restored';

  @override
  String get retryConnection => 'Retry Connection';

  @override
  String get connectionTimedOut => 'Connection timed out. Please try again.';

  @override
  String get newUpdateAvailable => 'New Update Available!';

  @override
  String get updateRequiredTitle => 'Update Required';

  @override
  String updateRequiredDesc(String version) {
    return 'A newer, faster, and more secure version of Reachu is available. Please update to version $version to continue using the application.';
  }

  @override
  String get updateNow => 'UPDATE NOW';

  @override
  String get updateLater => 'LATER';

  @override
  String get underMaintenanceTitle => 'Under Maintenance';

  @override
  String get underMaintenanceDesc =>
      'We are currently performing scheduled maintenance to upgrade our system. We will be back online soon.';

  @override
  String estimatedBackIn(Object time) {
    return 'ESTIMATED BACK IN';
  }

  @override
  String get backOnlineSoon => 'We will be back online soon';

  @override
  String installedVersion(String version) {
    return 'Installed Version: $version';
  }

  @override
  String get couldNotOpenStore =>
      'Could not open Play Store. Please update manually.';

  @override
  String get detailedFareBreakdown => 'Detailed Fare Breakdown';

  @override
  String get checkPaymentStatus => 'Check Payment Status';

  @override
  String get checkingStatus => 'Checking Status...';

  @override
  String get details => 'Details';

  @override
  String get hide => 'Hide';

  @override
  String get collectCashFromCustomer => 'COLLECT CASH FROM CUSTOMER';

  @override
  String get customerOnlineFareDue => 'CUSTOMER ONLINE FARE DUE';

  @override
  String get reachuWalletCredit => 'ReachU Credit (To Your Wallet)';

  @override
  String promoReimbursementNote(String amount) {
    return '$amount promo discount will be credited to your ReachU Wallet by company.';
  }

  @override
  String waitingChargeNote(String amount) {
    return 'Includes $amount waiting charge for customer delay.';
  }

  @override
  String get paymentReceivedSuccess => 'Payment received successfully!';

  @override
  String get paymentStillPending => 'Payment is still pending from passenger.';

  @override
  String get waitingCharge => 'Waiting Charge';

  @override
  String get rentalCharge => 'Rental Charge';

  @override
  String get grossFare => 'Gross Fare';

  @override
  String get pendingDue => 'Pending Due / Previous Balance';

  @override
  String get tollFee => 'Toll Fee';

  @override
  String get cancellationFee => 'Cancellation Fee';

  @override
  String get nightSurcharge => 'Night Surcharge';

  @override
  String get surgeFee => 'Surge Fee';

  @override
  String get taxAndFees => 'Tax & Fees';

  @override
  String get platformFee => 'Platform Fee';

  @override
  String get pressBackAgainToExit => 'Press back again to exit app';

  @override
  String get pleaseAcceptOrDeclineRide =>
      'Please accept or decline incoming ride requests.';

  @override
  String get cashPayment => 'Cash Payment';

  @override
  String get onlineQr => 'Online QR';

  @override
  String get collectCashInstructions => 'Collect Cash Instructions';

  @override
  String collectCashStep1(String amount) {
    return '1. Count and receive the physical currency of $amount directly from the customer.';
  }

  @override
  String get collectCashStep2 =>
      '2. Only tap the confirmation button below after verifying you have the full cash amount in hand.';

  @override
  String get verifyingCashDeposit => 'Verifying Cash Deposit with Server...';

  @override
  String get pleaseHoldClosingRide =>
      'Please hold, closing ride automatically once processed.';

  @override
  String get customerOnlinePayment => 'Customer Online Payment';

  @override
  String get generatingQrCode => 'Generating QR Code...';

  @override
  String get failedToLoadQrCode => 'Failed to Load QR Code';

  @override
  String get scanQrToPay => 'SCAN QR TO PAY';

  @override
  String get pinchToZoomQr => 'Pinch to Zoom QR code if needed';

  @override
  String get tapToFullScreen => 'Tap to Full Screen';

  @override
  String get awaitingCustomerPayment => 'Awaiting Customer Payment...';

  @override
  String get confirmCashReceived => 'Confirm Cash Received';

  @override
  String get paymentReceivedToast =>
      'Payment received! Ride completed successfully.';

  @override
  String get invalidOrderIdError => 'Invalid Order ID. Cannot record payment.';

  @override
  String get cashPaymentRecordedWaiting =>
      'Cash payment recorded. Waiting for confirmation...';

  @override
  String get paymentReceivedTitle => 'Payment Received!';

  @override
  String amountPaidSuccessfully(String amount) {
    return '$amount Paid Successfully';
  }

  @override
  String get rideClosedReturningHome =>
      'Ride closed. Returning to home screen...';

  @override
  String get fragileGoods => 'Fragile Goods';

  @override
  String get yes => 'YES';

  @override
  String get no => 'NO';

  @override
  String contactLabel(String name, Object phone) {
    return 'Contact: $name';
  }

  @override
  String get permissionsRequired => 'Permissions Required';

  @override
  String get enableAllPermissionsSubtitle =>
      'Please enable all permissions to go online and receive bookings.';

  @override
  String get locationAlwaysTitle => 'Location (Always)';

  @override
  String get locationAlwaysSubtitle => 'Required for continuous tracking';

  @override
  String get batteryUnrestrictedTitle => 'Battery Unrestricted';

  @override
  String get batteryUnrestrictedSubtitle =>
      'Set to \"Unrestricted\" & enable \"Allow background activity\"';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsSubtitle => 'Required for booking alerts';

  @override
  String get displayOverAppsTitle => 'Display Over Other Apps';

  @override
  String get displayOverAppsSubtitle => 'Required for floating widget alerts';

  @override
  String get locationUsedInBackground => 'Location Used in Background';

  @override
  String get backgroundLocationDisclosureBody =>
      'ReachuDriver collects your location data even when the app is closed or not in use.\n\nThis is used to:\n  • Share your real-time position with loaders/users\n  • Assign you the nearest booking requests\n  • Keep the dispatch system updated while you\'re on duty\n\nLocation collection only runs while you are online (on duty) and stops immediately when you go offline.';

  @override
  String get changeInAppSettingsNote =>
      'You can change this at any time in App Settings.';

  @override
  String get iUnderstandContinue => 'I Understand — Continue';

  @override
  String get notNow => 'Not Now';

  @override
  String get lowWalletBalance => 'Low Wallet Balance';

  @override
  String lowWalletBalanceSubtitle(String limit) {
    return 'Please maintain a minimum wallet balance of ₹$limit to receive orders. Top up your wallet to continue receiving orders.';
  }

  @override
  String get minimumRequiredBalance => 'Minimum Required Balance';

  @override
  String lowBalanceDashboardWarning(String limit) {
    return 'Please maintain at least ₹$limit in your wallet to receive orders.';
  }

  @override
  String get activeForRides => 'Active for Rides';

  @override
  String get lowBalanceStatus => 'Low Balance';

  @override
  String get minimumLimit => 'Min. Limit';

  @override
  String get eShramBenefitsTitle => 'e-Shram Benefits';

  @override
  String get govtScheme => 'Govt Scheme';

  @override
  String get eShramSubHeader => 'Govt. Insurance & Pension Scheme';

  @override
  String get eShramDescription =>
      'Register on official Govt. e-Shram portal for accidental insurance cover & social security benefits for gig workers.';

  @override
  String get registerOnEShramPortal => 'Register on e-Shram Portal';

  @override
  String get eShramGovtBenefitsMenu => 'e-Shram Govt. Benefits';

  @override
  String get dismiss => 'Dismiss';

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
