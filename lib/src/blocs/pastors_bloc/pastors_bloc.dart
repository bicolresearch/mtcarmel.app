/*
*   Filename    :   pastors_bloc.dart
*   Purpose     :
*   Created     :   17/09/2019 4:50 PM by Detective Conan
*	 Updated			:   01/10/2019 12:41 PM PM by Detective Conan
*	 Changes			:   Use the CarmelitesService instead of PastorsService
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_event.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_state.dart';
import 'package:mt_carmel_app/src/core/services/carmelites_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';

class PastorsBloc extends Bloc<PastorsEvent, PastorsState> {
  List<Carmelite> _pastors = [];

  List<Carmelite> get pastors => _pastors;

  @override
  PastorsState get initialState => PastorsUninitialized();

  @override
  Stream<PastorsState> mapEventToState(PastorsEvent event) async* {
    if (event is FetchPastors) {
      yield PastorsLoading();
      try {
        _pastors = await locator<CarmelitesService>()
            .getCarmelites(CarmeliteType.PASTOR);
        if (_pastors.isEmpty)
          yield NoPastorsLoaded();
        else
          yield PastorsLoaded();
      } catch (e) {
        print(e);
        if (e.toString().contains("No connection")) {
          yield PastorsNoConnection();
          return;
        }
        yield PastorsError(Exception("Error in loading pastors."));
        return;
      }
    }
  }
}
