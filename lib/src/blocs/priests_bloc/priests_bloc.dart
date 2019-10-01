/*
*   Filename    :   priests_bloc.dart
*   Purpose     :
*   Created     :   17/09/2019 2:59 PM by Detective Conan
*	 Updated			:   01/10/2019 12:42 PM PM by Detective Conan
*	 Changes			:   Use the CarmelitesService instead of PastorsService
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/abstracts/abstract_data_state.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_event.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_state.dart';
import 'package:mt_carmel_app/src/core/services/carmelites_service.dart';
import 'package:mt_carmel_app/src/core/services/send_help_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';

class PriestsBloc extends Bloc<PriestsEvent, PriestsState> {
  List<Carmelite> _priests = [];

  @override
  PriestsState get initialState => PriestsUninitialized();

  @override
  Stream<PriestsState> mapEventToState(PriestsEvent event) async* {
    if (event is FetchPriests) {
      yield PriestsLoading();
      try {
        _priests =
            await locator<CarmelitesService>().getCarmelites(CarmeliteType.PRIEST);
        if (_priests.isNotEmpty) {
          print("Priests.mapEventToState $_priests");
          yield PriestsLoaded();
        } else {
          yield NoPriestsLoaded();
        }
      } catch (e) {
        print(e);
        if (e.toString().contains("No connection")) {
          yield PriestsNoConnection();
          return;
        }
        yield PriestsError(e);
      }
    }
  }

  List<Carmelite> get priests => _priests;
}
