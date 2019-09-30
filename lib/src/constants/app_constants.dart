/*
*	 Filename		 :	 app_constants.dart
*	 Purpose		 :	 Constants used within the app.
*  Created		 :   2019-06-17 19:23:44
*	 Updated			:   25/09/2019 3:03 PM PM by Detective Conan
*	 Changes			:   Updated url of sendhelp and services
*/

class AppConstants {
  static const String APP_TITLE = "Mount Carmel";
  static const String FONT_FAMILY = 'Helvetica';
  static const String MT_CARMEL_LOGO_PATH = 'assets/images/mt_carmel_logo.png';

  // site api
  static const String API_BASE_URL = "https://api.mountcarmel.ph/";

  static const String BRANCH_LOCATIONS_JSON_URL = "branch_locations/";

  static const String BRANCHES_JSON_URL = "branches/";

  static const String LIVE_STREAM_URL =
      "https://api.mountcarmel.ph/live_streams/";
  static const String USER_PROFILE_JSON =
      "https://api.mountcarmel.ph/users/user/id/";

  static const String BIBLE_JSON_BASE_URL = 'http://bible-api.com/';
  static const String KJV_TRANSLATION_PATH = 'tranlation=kjv';

  static const String LIVE_STREAM_JSON_URL =
      "https://api.mountcarmel.ph/live_streams/";
  static const String FEEDS_JSON_URL = "posts/";
  static const String ADS_JSON_URL = "https://api.mountcarmel.ph/ads/";

  static const String TRANSACTION_JSON_URL =
      'https://api.mountcarmel.ph/donations';
  static const String PRIESTS_JSON_URL =
      'https://api.mountcarmel.ph/carmelites/';
  static const String PASTORS_JSON_URL = 'https://api.mountcarmel.ph/pastors/';
  static const String ABOUT_JSON_URL = 'https://api.mountcarmel.ph/histories/';
  static const String CONTACT_DETAILS_JSON_URL =
      'https://api.mountcarmel.ph/contacts/';
  static const String CHURCH_SCHEDULE_JSON_URL =
      'https://api.mountcarmel.ph/schedules';
  static const String SERVICES_JSON_URL = 'modules/';
  static const String SUB_SERVICES_BASE_JSON_URL =
      "sub_modules/";
  static const String MAP_JSON_URL = 'https://api.mountcarmel.ph/maps/';
  static const String BOUNDARIES_JSON_URL =
      'https://api.mountcarmel.ph/boundaries/';
  static const String SEND_HELP_JSON_URL =
      "branch_donations/";

  static const String DEFAULT_BRANCH_ID = "1";
  static const String CARMEL_NAME = "Carmel";
  static const String LOCATION_NAME = "Ordo Carmelitarum Discalceatorum";
  static const String NATIONAL_SHRINE_TEXT =
      'National Shrine of Our Lady of Mount Carmel';
  static const double AD_GROUP_HEIGHT = 200.0;
  static const String INTRO_WELCOME =
      'Welcome! This is the official mobile application of the National Shrine of Our Lady of Mount Carmel located at Dona Juana, New Manila Quezon City, Philippines';
  static const String SWIPE_LEFT_INSTRUCTION = "Swipe left to continue";
  static const String NEWS_AND_UPDATES = "News & Updates";
  static const String NEWS_AND_UPDATES_DESCRIPTION =
      "see all the news, updates, projects, schedules, and announcement made by the shrine";
  static const String SEND_HELP = "Send Help";
  static const String SEND_HELP_DESCRIPTION =
      "send help by donating money to the shrine and their special projects and advocacies";
  static const String SERVICES_OFFERED = "Services Offered";
  static const String SERVICES_OFFERED_DESCRIPTION =
      "avail services such as christening, wedding, passing, prayer request and mass request";
  static const String TRANSPARENCY_FEATURE = "Transparency Feature";
  static const String TRANSPARENCY_FEATURE_DESCRIPTION =
      "watch and guard incoming donations for the shrine and their special projects and advocacies";

  static const String sample_message =
      "lorem ipsum dolor sit amet. conse ctetur adipiscing elit. Integer necodio, Praesent libero. Sed cursus.";

  // services
  static const String JOIN_US = 'Join us';
  static const String MAKE_REQUEST = 'Make a request';
  static const String BAPTISM = 'Baptism';
  static const String COMMUNION = 'Communion';
  static const String CONFIRMATION = 'Confirmation';
  static const String WEDDING = 'Wedding';
  static const String PASSING = 'Passing';
  static const String EVENTS = 'Events';
}
