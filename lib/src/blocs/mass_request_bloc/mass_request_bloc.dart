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
import 'package:mt_carmel_app/src/core/services/profiles_api/mass_request_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';
import 'package:mt_carmel_app/src/models/mass_request.dart';

class MassRequestBloc extends Bloc<MassRequestEvent, MassRequestState> {
  @override
  MassRequestState get initialState => MassRequestUninitialized();

//  MassRequest get massRequest => _massRequest;
//  MassRequest _massRequest;
  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<MassRequestState> mapEventToState(MassRequestEvent event) async* {
    if (event is FetchMassRequest) {
      yield MassRequestLoading();
      try {
//        _massRequest =
//            await locator<MassRequestService>().getMassRequest(event.id);
        _moduleAndDataActions =
            await locator<MassRequestService>().getMassRequests();
        yield MassRequestLoaded();
      } catch (e) {
        print(e);
        yield MassRequestError(Exception(e));
      }
    }
  }
}
