/*
*   Filename    :   confirmation_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 10:03 AM by Detective Conan
*   Updated     :   22/11/2019 10:03 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_event.dart';
import 'package:mt_carmel_app/src/blocs/confiramtion_bloc/confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  @override
  ConfirmationState get initialState => ConfirmationUninitialized();

  @override
  Stream<ConfirmationState> mapEventToState(ConfirmationEvent event) async* {
    if (event is FetchConfirmation) {
      yield ConfirmationLoading();
      try {
        // TODO implement code
        yield ConfirmationLoaded();
      } catch (e) {
        print(e);
        yield ConfirmationError(Exception(e));
      }
    }
  }
}
