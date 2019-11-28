/*
*   Filename    :   marriage_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 8:34 AM by Detective Conan
*   Updated     :   28/11/2019 8:34 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_event.dart';
import 'package:mt_carmel_app/src/blocs/marriage_bloc/marriage_state.dart';

class MarriageBloc extends Bloc<MarriageEvent, MarriageState> {
  @override
  MarriageState get initialState => MarriageUninitialized();

  @override
  Stream<MarriageState> mapEventToState(MarriageEvent event) async* {
    if (event is FetchMarriage) {
      yield MarriageLoading();
      try {
        // TODO implement code
        yield MarriageLoaded();
      } catch (e) {
        print(e);
        yield MarriageError(Exception(e));
      }
    }
  }
}
