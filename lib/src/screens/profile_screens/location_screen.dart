/*
*  Filename    :   location_screen.dart
*  Purpose     :	
*  Created     :   2019-06-26 08:47 by Detective Conan
*  Updated     :   2019-06-26 08:47 by Detective Conan 
*  Changes     :
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mt_carmel_app/src/presentations/mount_carmel_icons.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static LatLng _location = LatLng(14.614253, 121.030581);

  BitmapDescriptor _markerIcon;

  CameraPosition _initialPosition =
      CameraPosition(zoom: 16.0, target: _location);
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _createMarkerImageFromAsset(context);
    _controller.complete(controller);
    _markers.add(Marker(
      position: _location,
      markerId: MarkerId("mountCarmelLocationId"),
      icon: _markerIcon,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Location Map'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                myLocationButtonEnabled: false,
                onMapCreated: _onMapCreated,
                initialCameraPosition: _initialPosition,
                markers: _markers),
          ],
        ));
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/mt_logo.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }
}
