/*
*	Filename		:	services_screen.dart
*	Purpose			:	Displays the list of the services of the church
* Created			: 2019-06-11 15:52:50 by Detective Conan
*	Updated			: 2019-07-03 10:08:21 by Detective conan
*	Changes			: Implemented caching of images.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';


Widget serviceTile(ServiceItem serviceItem) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        Container(
          height: 60.0,
          child: CachedNetworkImage(
              imageUrl:
                  AppConstants.API_BASE_URL + serviceItem.coverPhoto,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(MountCarmelIcons.services)),
              fit: BoxFit.cover),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(serviceItem.name, style: AppConstants.OPTION_STYLE2),
                Text(serviceItem.description,
                    style: AppConstants.OPTION_STYLE1),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

IconData _serviceIcon(String serviceName) {
  switch (serviceName) {
    case AppConstants.JOIN_US:
      return MountCarmelIcons.joinus;
    case AppConstants.MAKE_REQUEST:
      return MountCarmelIcons.makearequest;
    case AppConstants.BAPTISM:
      return MountCarmelIcons.baptism;
    case AppConstants.COMMUNION:
      return MountCarmelIcons.communion;
    case AppConstants.CONFIRMATION:
      return MountCarmelIcons.confirmation;
    case AppConstants.WEDDING:
      return MountCarmelIcons.marriage;
    case AppConstants.PASSING:
      return MountCarmelIcons.passing;
    case AppConstants.JOIN_US:
      return MountCarmelIcons.joinus;
    case AppConstants.EVENTS:
      return MountCarmelIcons.events;
    default:
      return MountCarmelIcons.logo;
  }
}
