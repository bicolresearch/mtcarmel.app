/*
*  Filename    :    location_screen.dart
*  Purpose     :    Displays the location of church in map.
*  Created     :    2019-06-26 08:47 by Detective Conan
*	 Updated	   :    2019-07-01 15:10:12 by Detective Conan
*	 Changes		 :    Modified for the new model of the api. One api call for boundaries and center.
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'dart:convert';

import 'package:mt_carmel_app/src/models/location_map.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Set<Polygon> _polygon;

  static LatLng _location = LatLng(14.614253, 121.030581);

  @override
  void initState() {
    super.initState();
    this.getJsonMapData();
  }

  Future<void> getJsonMapData() async {
    final branchId = await locator<BranchService>().branch.id;
    await Future.delayed(Duration(milliseconds: 800));
    var response =
        await http.get("${AppConstants.MAP_JSON_URL}?branch_id=$branchId");
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          final body = json.decode(response.body);

          LocationMap locationMap = LocationMap.fromJson(body);

          List<LatLng> points = [];

          if (locationMap.mapBoundaries.isNotEmpty) {
            for (var boundary in locationMap.mapBoundaries) {
              points.add(LatLng(
                  double.parse(boundary.lat), double.parse(boundary.lng)));
            }

            _polygon = <Polygon>{
              Polygon(
                  polygonId: PolygonId("boundary"),
                  fillColor: Color.fromARGB(65, 0x7E, 0x52, 0x32),
                  strokeColor: Color.fromARGB(191, 0x7E, 0x52, 0x32),
                  strokeWidth: 3,
                  points: points)
            };
          }

          if (locationMap.mapCenter.isNotEmpty) {
            _location = LatLng(
                double.parse(locationMap.mapCenter[0].lat_center),
                double.parse(locationMap.mapCenter[0].lng_center));
          }
        } else {
          print(response.statusCode);
        }
      });
    }
  }

  BitmapDescriptor _markerIcon;

  CameraPosition _initialPosition =
      CameraPosition(zoom: 14.0, target: _location);
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
}
