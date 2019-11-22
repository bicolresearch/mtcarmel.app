/*
*   Filename    :   first_communion_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:53 AM by Detective Conan
*   Updated     :   22/11/2019 9:53 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_event.dart';
import 'package:mt_carmel_app/src/blocs/first_communion_bloc/first_communion_state.dart';

class FirstCommunionBloc
    extends Bloc<FirstCommunionEvent, FirstCommunionState> {
  @override
  FirstCommunionState get initialState => FirstCommunionUninitialized();

  @override
  Stream<FirstCommunionState> mapEventToState(
      FirstCommunionEvent event) async* {
    if (event is FetchFirstCommunion) {
      yield FirstCommunionLoading();
      try {
        // TODO implement code
        yield FirstCommunionLoaded();
      } catch (e) {
        print(e);
        yield FirstCommunionError(Exception(e));
      }
    }
  }
}
