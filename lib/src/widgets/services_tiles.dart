/*
*	 Filename		 :	 services_tiles.dart
*	 Purpose		 :	 Displays the list of the services of the church
*  Created		 :   2019-06-11 15:52:50 by Detective Conan
*  Updated     :   2019-07-12 16:46 by Detective conan
*  Changes     :   The text style inherits the property to the provider.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/service_item.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

Widget serviceTile(BuildContext context, ServiceItem serviceItem) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        Container(
          height: 60.0,
          child: CachedNetworkImage(
              key: Key(serviceItem.coverPhoto.replaceAll("/", "")),
              imageUrl: AppConstants.API_BASE_URL + serviceItem.coverPhoto,
              placeholder: (context, url) => LoadingIndicator(),
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
                Text(serviceItem.name,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(serviceItem.description,
                    style: Theme.of(context).primaryTextTheme.caption),
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
