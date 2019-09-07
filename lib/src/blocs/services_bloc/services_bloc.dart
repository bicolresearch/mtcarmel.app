/*
*   Filename    :   services_bloc.dart
*   Purpose     :
*   Created     :   05/09/2019 6:30 PM by Detective Conan
*   Updated     :   05/09/2019 6:30 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_event.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  @override
  ServicesState get initialState => ServicesUninitialized();

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    if(event is FetchServices){
      yield ServicesLoading();
    }
  }
}