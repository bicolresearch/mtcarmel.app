import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';


Widget serviceTile(String serviceName, String description){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: ListTile(title: Text(serviceName, 
      style: AppConstants.OPTION_STYLE2),
      subtitle: Text('$description',
      style: AppConstants.OPTION_STYLE1),
      leading: Icon(_serviceIcon(serviceName),
        size: 60.0,
        color: Colors.brown,
        ),
    ),
  );
}

IconData  _serviceIcon(String serviceName) {
    switch(serviceName)
    {
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