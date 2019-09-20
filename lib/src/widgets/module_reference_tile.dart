/*
*	 Filename		 :	 module_reference_tiles.dart
*	 Purpose		 :	 Displays the list of the services of the church
*  Created		 :   2019-06-11 15:52:50 by Detective Conan
*	 Updated			:   10/09/2019 9:50 AM PM by Detective Conan
*	 Changes			:   Fixed the height and width of container of logo.
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ModuleReferenceTile extends StatelessWidget {
  final ModuleReference moduleReference;

  const ModuleReferenceTile({BuildContext context, this.moduleReference});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 60.0,
              height: 60.0,
              child: (moduleReference.coverPhoto == null)
                  ? Container()
                  : TransitionToImage(
                      image: AdvancedNetworkImage(
                        "${AppConstants.API_BASE_URL}${moduleReference.coverPhoto}",
                        useDiskCache: true,
                        cacheRule: CacheRule(
                          maxAge: const Duration(days: 7),
                        ),
                      ),
                      loadingWidget: LoadingIndicator(),
                      fit: BoxFit.cover,
                    ),
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
}
