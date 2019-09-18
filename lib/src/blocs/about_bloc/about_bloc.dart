/*
*   Filename    :   about_bloc.dart
*   Purpose     :
*   Created     :   18/09/2019 10:17 AM by Detective Conan
*   Updated     :   18/09/2019 10:17 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_event.dart';
import 'package:mt_carmel_app/src/blocs/about_bloc/about_state.dart';
import 'package:mt_carmel_app/src/core/services/about_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/about.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {

  About _about;

  About get about => _about;

  @override
  AboutState get initialState => AboutUninitialized();

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {
    if(event is FetchAbout){
      yield AboutLoading();
      try {
        _about = await locator<AboutService>().getData();
        yield AboutLoaded();
      } catch (e) {
        print(e);
        yield AboutError(e);
      }
    }
  }
}