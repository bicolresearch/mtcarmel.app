/*
*   Filename    :   communion_of_the_sick_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:57 AM by Detective Conan
*   Updated     :   22/11/2019 9:57 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_event.dart';
import 'package:mt_carmel_app/src/blocs/communion_of_the_sick_bloc/communion_of_the_sick_state.dart';

class CommunionOfTheSickBloc
    extends Bloc<CommunionOfTheSickEvent, CommunionOfTheSickState> {
  @override
  CommunionOfTheSickState get initialState => CommunionOfTheSickUninitialized();

  @override
  Stream<CommunionOfTheSickState> mapEventToState(
      CommunionOfTheSickEvent event) async* {
    if (event is FetchCommunionOfTheSick) {
      yield CommunionOfTheSickLoading();
      try {
        // TODO implement code
        yield CommunionOfTheSickLoaded();
      } catch (e) {
        print(e);
        yield CommunionOfTheSickError(Exception(e));
      }
    }
  }
}
