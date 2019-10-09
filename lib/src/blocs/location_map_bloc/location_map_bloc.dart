/*
*   Filename    :   location_map_bloc.dart
*   Purpose     :
*   Created     :   17/09/2019 6:04 PM by Detective Conan
*   Updated     :   17/09/2019 6:04 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_event.dart';
import 'package:mt_carmel_app/src/blocs/location_map_bloc/location_map_state.dart';
import 'package:mt_carmel_app/src/core/services/location_map_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

class LocationMapBloc extends Bloc<LocationMapEvent, LocationMapState> {
  LatLng _centerLocation;

  LatLng get centerLocation => _centerLocation;
  List<LatLng> _points = [];

  @override
  LocationMapState get initialState => LocationMapUninitialized();

  @override
  Stream<LocationMapState> mapEventToState(LocationMapEvent event) async* {
    if (event is FetchLocationMap) {
      _centerLocation = null;
      _points = [];
      yield LocationMapLoading();
      try {
        final locationMapService = locator<LocationMapService>();
        await locationMapService.getMapData();
        _centerLocation = locationMapService.centerLocation;
        _points = locationMapService.points;
        yield LocationMapLoaded();
      } catch (e) {
        print(e);
        if (e.toString().contains("No connection")) {
          yield LocationMapNoConnection();
          return;
        }
        yield LocationMapError(
            Exception("Erron in loading map location and boundaries."));
      }
    }
  }

  List<LatLng> get points => _points;
}
