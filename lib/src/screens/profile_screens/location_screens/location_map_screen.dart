/*
*   Filename    :   location_map_screen.dart
*   Purpose     :
*   Created     :   18/09/2019 9:11 AM by Detective Conan
*   Updated     :   18/09/2019 9:11 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/location_map.dart';

class LocationMapScreen extends StatefulWidget {
  @override
  _LocationMapScreenState createState() => _LocationMapScreenState();
}

class _LocationMapScreenState extends State<LocationMapScreen> {
  Set<Polygon> _polygon;

  LatLng _location;

  @override
  void initState() {
    super.initState();
  }



  BitmapDescriptor _markerIcon;

  CameraPosition _initialPosition;
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
    _location = BlocProvider.of<LocationMapBloc>(context).centerLocation;
    _initialPosition = CameraPosition(zoom: 14.0, target: _location);
    _setPolygon(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              size: 40.0,
              color: Colors.brown,
            ),
            backgroundColor: Colors.white,
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                polygons: _polygon,
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
          imageConfiguration, AppConstants.MT_CARMEL_LOGO_PATH)
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  void _setPolygon(BuildContext context) {
    final points = BlocProvider.of<LocationMapBloc>(context).points??[];
    _polygon = <Polygon>{
      Polygon(
          polygonId: PolygonId("boundary"),
          fillColor: Color.fromARGB(65, 0x7E, 0x52, 0x32),
          strokeColor: Color.fromARGB(191, 0x7E, 0x52, 0x32),
          strokeWidth: 3,
          points: points)
    };
  }
}
