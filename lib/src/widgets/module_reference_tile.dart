/*
*	 Filename		 :	 module_reference_tiles.dart
*	 Purpose		 :	 Displays the list of the services of the church
*  Created		 :   2019-06-11 15:52:50 by Detective Conan
*  Updated     :   2019-08-02 11:37 by Detective conan
*  Changes     :   Replaced services to module
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

Widget moduleReferenceTile(
    BuildContext context, ModuleReference moduleReference) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: (moduleReference.coverPhoto == null)
              ? Container()
              : Container(
                  height: 60.0,
                  child: CachedNetworkImage(
                      key: Key(moduleReference.coverPhoto
                          .replaceAll("/", "")
                          .replaceAll(".", "")),
                      imageUrl: AppConstants.API_BASE_URL +
                          moduleReference.coverPhoto,
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
                Text(moduleReference.name,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(moduleReference.description,
                    style: Theme.of(context).primaryTextTheme.caption),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
