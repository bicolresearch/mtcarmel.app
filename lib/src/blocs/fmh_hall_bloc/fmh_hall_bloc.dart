/*
*   Filename    :   fmh_hall_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:36 AM by Detective Conan
*   Updated     :   28/11/2019 10:36 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_event.dart';
import 'package:mt_carmel_app/src/blocs/fmh_hall_bloc/fmh_hall_state.dart';

class FmhHallBloc extends Bloc<FmhHallEvent, FmhHallState> {
  @override
  FmhHallState get initialState => FmhHallUninitialized();

  @override
  Stream<FmhHallState> mapEventToState(FmhHallEvent event) async* {
    if (event is FetchFmhHall) {
      yield FmhHallLoading();
      try {
        // TODO implement code
        yield FmhHallLoaded();
      } catch (e) {
        print(e);
        yield FmhHallError(Exception(e));
      }
    }
  }
}
