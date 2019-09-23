/*
*   Filename    :   services_bloc.dart
*   Purpose     :
*   Created     :   05/09/2019 6:30 PM by Detective Conan
*	 Updated			:   17/09/2019 2:41 PM PM by Detective Conan
*	 Changes			:   Added NoServicesLoad state.
*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_event.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_state.dart';
import 'package:mt_carmel_app/src/core/services/module_list_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {

  List<ModuleReference> _moduleReferences = [];

  List<ModuleReference> get moduleReferences => _moduleReferences;

  @override
  ServicesState get initialState => ServicesUninitialized();

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    if(event is FetchServices){
      if(_moduleReferences.isEmpty)yield ServicesLoading();
      try{
        _moduleReferences = await locator<ModuleListService>().getData();
      }catch(e){
        if (e.toString().contains("No connection")) {
          yield ServicesNoConnection();
          return;
        }
        yield ServicesError(Exception("e"));
        return;
      }
      if(_moduleReferences.isNotEmpty)
        yield ServicesLoaded();
      else
        yield NoServicesLoad();
    }
  }
}