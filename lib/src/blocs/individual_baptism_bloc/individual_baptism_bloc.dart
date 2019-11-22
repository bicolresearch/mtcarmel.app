/*
*   Filename    :   individual_baptism_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:16 AM by Detective Conan
*   Updated     :   22/11/2019 9:16 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/individual_baptism_bloc/individual_baptism_state.dart';

class IndividualBaptismBloc
    extends Bloc<IndividualBaptismEvent, IndividualBaptismState> {
  @override
  IndividualBaptismState get initialState => IndividualBaptismUninitialized();

  @override
  Stream<IndividualBaptismState> mapEventToState(
      IndividualBaptismEvent event) async* {
    if (event is FetchIndividualBaptism) {
      yield IndividualBaptismLoading();
      try {
        // TODO implement code
        yield IndividualBaptismLoaded();
      } catch (e) {
        print(e);
        yield IndividualBaptismError(Exception(e));
      }
    }
  }
}
