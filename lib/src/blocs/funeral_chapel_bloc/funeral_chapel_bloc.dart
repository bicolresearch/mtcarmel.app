/*
*   Filename    :   funeral_chapel_bloc.dart
*   Purpose     :
*   Created     :   28/11/2019 10:21 AM by Detective Conan
*   Updated     :   28/11/2019 10:21 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_event.dart';
import 'package:mt_carmel_app/src/blocs/funeral_chapel_bloc/funeral_chapel_state.dart';

class FuneralChapelBloc extends Bloc<FuneralChapelEvent, FuneralChapelState> {
  @override
  FuneralChapelState get initialState => FuneralChapelUninitialized();

  @override
  Stream<FuneralChapelState> mapEventToState(FuneralChapelEvent event) async* {
    if (event is FetchFuneralChapel) {
      yield FuneralChapelLoading();
      try {
        // TODO implement code
        yield FuneralChapelLoaded();
      } catch (e) {
        print(e);
        yield FuneralChapelError(Exception(e));
      }
    }
  }
}
