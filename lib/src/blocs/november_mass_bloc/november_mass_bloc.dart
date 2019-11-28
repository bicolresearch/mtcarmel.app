/*
*   Filename    :   november_mass_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:29 AM by Detective Conan
*   Updated     :   28/11/2019 10:29 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_event.dart';
import 'package:mt_carmel_app/src/blocs/november_mass_bloc/november_mass_state.dart';

class NovemberMassBloc extends Bloc<NovemberMassEvent, NovemberMassState> {
  @override
  NovemberMassState get initialState => NovemberMassUninitialized();

  @override
  Stream<NovemberMassState> mapEventToState(NovemberMassEvent event) async* {
    if (event is FetchNovemberMass) {
      yield NovemberMassLoading();
      try {
        // TODO implement code
        yield NovemberMassLoaded();
      } catch (e) {
        print(e);
        yield NovemberMassError(Exception(e));
      }
    }
  }
}
