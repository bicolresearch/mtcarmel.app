/*
*   Filename    :   adult_baptism_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:41 AM by Detective Conan
*   Updated     :   22/11/2019 9:41 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/adult_baptism_bloc/adult_baptism_state.dart';

class AdultBaptismBloc extends Bloc<AdultBaptismEvent, AdultBaptismState> {
  @override
  AdultBaptismState get initialState => AdultBaptismUninitialized();

  @override
  Stream<AdultBaptismState> mapEventToState(AdultBaptismEvent event) async* {
    if (event is FetchAdultBaptism) {
      yield AdultBaptismLoading();
      try {
        // TODO implement code
        yield AdultBaptismLoaded();
      } catch (e) {
        print(e);
        yield AdultBaptismError(Exception(e));
      }
    }
  }
}
