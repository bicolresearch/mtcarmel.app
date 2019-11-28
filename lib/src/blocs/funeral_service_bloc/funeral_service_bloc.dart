/*
*   Filename    :   funeral_service_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:17 AM by Detective Conan
*   Updated     :   28/11/2019 10:17 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_service_bloc/funeral_service_event.dart';
import 'package:mt_carmel_app/src/blocs/funeral_service_bloc/funeral_service_state.dart';

class FuneralServiceBloc
    extends Bloc<FuneralServiceEvent, FuneralServiceState> {
  @override
  FuneralServiceState get initialState => FuneralServiceUninitialized();

  @override
  Stream<FuneralServiceState> mapEventToState(
      FuneralServiceEvent event) async* {
    if (event is FetchFuneralService) {
      yield FuneralServiceLoading();
      try {
        // TODO implement code
        yield FuneralServiceLoaded();
      } catch (e) {
        print(e);
        yield FuneralServiceError(Exception(e));
      }
    }
  }
}
