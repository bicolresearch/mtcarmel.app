/*
*   Filename    :   pastors_bloc.dart
*   Purpose     :
*   Created     :   17/09/2019 4:50 PM by Detective Conan
*	 Updated			:   30/09/2019 6:36 PM PM by Detective Conan
*	 Changes			:   Implemented caching of url response
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_event.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_state.dart';
import 'package:mt_carmel_app/src/core/services/pastors_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/carmelite.dart';

class PastorsBloc extends Bloc<PastorsEvent, PastorsState> {

  List<Carmelite> _pastors = [];

  List<Carmelite> get pastors => _pastors;

  @override
  PastorsState get initialState => PastorsUninitialized();

  @override
  Stream<PastorsState> mapEventToState(PastorsEvent event) async* {
    if(event is FetchPastors){
      yield PastorsLoading();
      try {
        _pastors = await locator<PastorsService>().getPastors();
        if(_pastors.isEmpty)
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