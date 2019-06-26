/*
*	Filename		:	<filename.extension>
*	Purpose			:	
* Created			: 2019-06-17 19:23:44
*	Updated			:	2019-06-25 16:23:50 by jo 
*	Changes			: updated api url, added new api url for services, map and boundaries
*/


import 'package:flutter/material.dart';

class AppConstants{
  static const FIRST_USAGE_FLAG_NAME = "first_usage_flag";
  // TODO: to be replaced by actual url
  static const TOTAL_TRANSACTION_JSON_URL = 'http://192.168.254.109/api/transparency.json';
  
  // site api
  static const API_BASE_URL = "https://api.mountcarmel.ph/";

  static const BIBLE_JSON_BASE_URL = 'http://bible-api.com/';
  static const KJV_TRANSLATION_PATH = 'tranlation=kjv';

  static const FEEDS_JSON_URL = "https://api.mountcarmel.ph/posts";
  static const ADS_JSON_URL = "https://api.mountcarmel.ph/ads";

  static const TRANSACTION_JSON_URL = 'https://api.mountcarmel.ph/donations';
  static const PRIESTS_JSON_URL = 'https://api.mountcarmel.ph/priests';
  static const PASTORS_JSON_URL = 'https://api.mountcarmel.ph/pastors';
  static const ABOUT_JSON_URL = 'https://api.mountcarmel.ph/history';
  static const CONTACT_DETAILS_JSON_URL = 'https://api.mountcarmel.ph/contacts';
  static const CHURCH_SCHEDULE_JSON_URL = 'https://api.mountcarmel.ph/schedules';
  static const SERVICES_JSON_URL = 'https://api.mountcarmel.ph/modules';
  static const MAP_JSON_URL = 'https://api.mountcarmel.ph/maps';
  static const BOUNDARIES_JSON_URL = 'https://api.mountcarmel.ph/boundaries';


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

  static const String confraternity_message = "Be an active part of the mission and service of the Carmelite Church";
  static const String make_request_message = "Be closer to God with the help of the church through prayers, holy masses and liturgy";
  static const String baptism_message = "Be part of the christian community and follow the word of the Lord";
  static const String communion_message = "Be part of the christian community and follow the word of the Lord";
  static const String passing_message = "Provide christian services and a peaceful resting place for our late loved ones";
  static const String event_message = "Celebrate marriage or events in the delightful premises of the church";
  //Textstyle

  static const TextStyle OPTION_STYLE1 = TextStyle(
                      color: Colors.brown, fontSize: 12.0, fontWeight: FontWeight.normal,
                      fontFamily: "Helvetica");
  static const TextStyle OPTION_STYLE2 = TextStyle(
                      color: Colors.brown, fontSize: 16.0, fontWeight: FontWeight.bold,
                      fontFamily: "Helvetica" );
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