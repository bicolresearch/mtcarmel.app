import 'package:flutter/material.dart';

class AppConstants{
  static const FIRST_USAGE_FLAG_NAME = "first_usage_flag";
  // TODO: to be replaced by actual url
  static const ADS_JSON_URL = "http://192.168.254.109/api/ads.json";
  static const ADS_API_BASE_URL = "http://192.168.254.109/api/";
  static const FEEDS_API_BASE_URL = "http://192.168.254.109/api/";
  static const API_BASE_URL = "http://192.168.254.109/api/";
  static const FEEDS_JSON_URL = "http://192.168.254.109/api/news.json";
  static const TRANSACTION_JSON_URL = 'http://192.168.254.109/api/transparency_list.json';
  static const PRIESTS_JSON_URL = 'http://192.168.254.109/api/priests.json';
  static const COMPANY_NAME = "Mount Carmel Basilica";
  static const LOCATION_NAME = "Quezon City, Philippines";
  static const AD_GROUP_HEIGHT = 200.0;
  static const INTRO_WELCOME = 'Welcome! This is the official mobile application of the National Shrine of Our Lady of Mount Carmel located at Dona Juana, New Manila Quezon City, Philippines';
  static const SWIPE_LEFT_INSTRUCTION = "Swipe left to continue";
  static const NEWS_AND_UPDATES = "News & Updates";
  static const NEWS_AND_UPDATES_DESCRIPTION = "see all the news, updates, projects, schedules, and announcement made by the shrine";
  static const SEND_HELP = "Send Help";
  static const SEND_HELP_DESCRIPTION = "send help by donating money to the shrine and their special projects and advocacies";
  static const SERVICES_OFFERED = "Services Offered";
  static const SERVICES_OFFERED_DESCRIPTION = "avail services such as christening, wedding, passing, prayer request and mass request";
  static const TRANSPARENCY_FEATURE = "Transparency Feature";
  static const TRANSPARENCY_FEATURE_DESCRIPTION = "watch and guard incoming donations for the shrine and their special projects and advocacies";

  static const String sample_message = "lorem ipsum dolor sit amet. conse ctetur adipiscing elit. Integer necodio, Praesent libero. Sed cursus.";

  //Textstyle

  static const TextStyle OPTION_STYLE1 = TextStyle(
                      color: Colors.brown, fontSize: 12.0, fontWeight: FontWeight.normal,
                      fontFamily: "Helvetica");
  static const TextStyle OPTION_STYLE2 = TextStyle(
                      color: Colors.brown, fontSize: 16.0, fontWeight: FontWeight.bold,
                      fontFamily: "Helvetica");
  static const TextStyle OPTION_STYLE3 = TextStyle(
                      color: Colors.brown, fontSize: 20.0, fontWeight: FontWeight.bold,
                      fontFamily: "Helvetica");

  // services
  static const String JOIN_US = 'Join us';
  static const String MAKE_REQUEST = 'Make a request';
  static const String BAPTISIM = 'Baptism';
  static const String COMMUNION = 'Communion';
  static const String CONFIRMATION = 'Confirmation';
  static const String WEDDING = 'Wedding';
  static const String PASSING = 'Passing';
  static const String EVENTS = 'Events';

}