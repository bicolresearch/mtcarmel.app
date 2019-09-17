/*
*   Filename    :   pastors_bloc.dart
*   Purpose     :
*   Created     :   17/09/2019 4:50 PM by Detective Conan
*   Updated     :   17/09/2019 4:50 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_event.dart';
import 'package:mt_carmel_app/src/blocs/pastors_bloc/pastors_state.dart';
import 'package:mt_carmel_app/src/core/services/pastors_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/pastor.dart';

class PastorsBloc extends Bloc<PastorsEvent, PastorsState> {

  List<Pastor> _pastors = [];

  List<Pastor> get pastors => _pastors;

  @override
  PastorsState get initialState => PastorsUninitialized();

  @override
  Stream<PastorsState> mapEventToState(PastorsEvent event) async* {
    if(event is FetchPastors){
      yield PastorsLoading();
      try {
        _pastors = await locator<PastorsService>().getData();
        if(_pastors.isEmpty)
          yield NoPastorsLoaded();
        else
          yield PastorsLoaded();
      } catch (e) {
        print(e);
        PastorsError(Exception("Error in loading pastors."));
      }
    }
  }
}