/*
*   Filename    :   mass_request_bloc.dart
*   Purpose     :
*   Created     :   21/11/2019 10:01 AM by Detective Conan
*   Updated     :   21/11/2019 10:01 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_event.dart';
import 'package:mt_carmel_app/src/blocs/mass_request_bloc/mass_request_state.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';

class MassRequestBloc extends Bloc<MassRequestEvent, MassRequestState> {
  @override
  MassRequestState get initialState => MassRequestUninitialized();


  @override
  Stream<MassRequestState> mapEventToState(MassRequestEvent event) async* {
    if(event is FetchMassRequest){
//      yield MassRequestLoading();

      yield MassRequestLoaded();
    }
  }
}