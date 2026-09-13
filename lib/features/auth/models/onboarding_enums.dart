class DocumentStatus {
  static const String draft = 'draft';
  static const String pending = 'pending';
  static const String verified = 'verified';
  static const String rejected = 'rejected';
}

class StepStatus {
  static const String notStarted = 'not_started';
  static const String inProgress = 'in_progress';
  static const String submitted = 'submitted';
  static const String verified = 'verified';
  static const String rejected = 'rejected';
  static const String skipped = 'skipped';
}

class OverallStatus {
  static const String notStarted = 'not_started';
  static const String inProgress = 'in_progress';
  static const String pendingReview = 'pending_review';
  static const String actionRequired = 'action_required';
  static const String approved = 'approved';
  static const String rejected = 'rejected';
}

class RegistrationSteps {
  static const String phoneVerification = 'phone_verification';
  static const String personalInfo = 'personal_info';
  static const String drivingLicense = 'driving_license';
  static const String aadhar = 'aadhar';
  static const String pan = 'pan';
  static const String profilePhoto = 'profile_photo';
  static const String vehiclePreference = 'vehicle_preference';
  static const String vehicleDetails = 'vehicle_details';
}
