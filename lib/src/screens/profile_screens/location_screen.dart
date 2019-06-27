/*
*  Filename    :    location_screen.dart
*  Purpose     :    Displays the location of church in map.
*  Created     :    2019-06-26 08:47 by Detective Conan
*  Updated     :    2019-06-26 08:47 by Detective Conan
*  Changes     :
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mt_carmel_app/src/model/maps.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {


  //TODO change the model name to MapLocation
  List<Maps> _mapList = [];
  Set<Polygon> _boundary;

  @override
  void initState() {
    super.initState();
    this.getJsonMapData();
  }

  Future<void> getJsonMapData() async {
    var response = await http.get(AppConstants.MAP_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _mapList = (json.decode(response.body) as List)
              .map((data) => new Maps.fromJson(data))
              .toList();
          List<LatLng> points = [];

          if(_mapList.isNotEmpty) {
            for (var point in _mapList) {
              points.add(LatLng(
                  double.parse(point.lat),
                  double.parse(point.lng)));
            }
            _boundary = <Polygon>{Polygon(polygonId: PolygonId("boundary"
            ),
                fillColor: Color.fromARGB(191, 0x7E , 0x52, 0x32),
                strokeColor: Color.fromARGB(255, 0x7E , 0x52, 0x32),
                strokeWidth: 3,
                points: points)};
          }

        } else {
          print(response.statusCode);
        }
      });
    }
  }
  //TODO replace with the location from api
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
              polygons: _boundary,
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
