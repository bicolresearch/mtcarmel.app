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
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

Widget serviceReferenceTile(
    BuildContext context, ModuleReference serviceReference) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: (serviceReference.coverPhoto == null)
              ? Container()
              : Container(
                  height: 60.0,
                  child: CachedNetworkImage(
                      key: Key(serviceReference.coverPhoto
                          .replaceAll("/", "")
                          .replaceAll(".", "")),
                      imageUrl: AppConstants.API_BASE_URL +
                          serviceReference.coverPhoto,
                      placeholder: (context, url) => LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          Icon(MountCarmelIcons.services),
                      fit: BoxFit.cover),
                ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(serviceReference.name,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(serviceReference.description,
                    style: Theme.of(context).primaryTextTheme.caption),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
