/*
*   Filename    :   profile_constants.dart
*   Purpose     :
*   Created     :   09/10/2019 9:51 AM by Detective Conan
*   Updated     :   09/10/2019 9:51 AM by Detective Conan
*   Changes     :   
*/

class ProfileFeatureConstants {
  static const String BIBLE = "Holy Bible";
  static const String REGULAR_MASS_SCHEDULE = "Mass Schedule";
  static const String LOCATION_MAP = "Location Map";
  static const String PRIESTS = "Carmelite Priests";
  static const String PASTORS = "Carmelite Pastors";
  static const String NUNS = "Carmelite Nuns";
  static const String CONTACT_DETAILS = "Contact Details";
  static const String ABOUT_THE_PARISH = "History";
  static const String SHARE_APP = "Share app";
  static const String CHANGE_BRANCH = "Change branch";
  static const String LOGOUT = "Logout";
  static const String PRAYER_REQUEST_APPROVAL = "Prayer Requests Approval";
  static const String PRAYER_REQUEST = "Prayer Requests";
  static const String MASS_REQUEST = "Mass Requests";

  static const List<String> ProfileFeatureCommonList = [
//    BIBLE,
    PRAYER_REQUEST,
    PRAYER_REQUEST_APPROVAL,
    REGULAR_MASS_SCHEDULE,
    LOCATION_MAP,
    PRIESTS,
    PASTORS,
    NUNS,
    CONTACT_DETAILS,
    ABOUT_THE_PARISH,
//    CHANGE_BRANCH,
  ];

  static const CARMELITE_PRIEST_TYPE = "107";
  static const CARMELITE_PASTOR_TYPE = "108";
  static const CARMELITE_NUN_TYPE = "109";
}
