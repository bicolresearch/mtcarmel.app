/*
*   Filename    :   liturgical_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 8:57 AM by Detective Conan
*   Updated     :   22/11/2019 8:57 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_event.dart';
import 'package:mt_carmel_app/src/blocs/liturgical_bloc/liturgical_state.dart';

class LiturgicalBloc extends Bloc<LiturgicalEvent, LiturgicalState> {
  @override
  LiturgicalState get initialState => LiturgicalUninitialized();

  @override
  Stream<LiturgicalState> mapEventToState(LiturgicalEvent event) async* {
    if (event is FetchLiturgical) {
      yield LiturgicalLoading();
      try {
        // TODO implement code
        yield LiturgicalLoaded();
      } catch (e) {
        print(e);
        yield LiturgicalError(Exception("$e"));
      }
    }
  }
}
