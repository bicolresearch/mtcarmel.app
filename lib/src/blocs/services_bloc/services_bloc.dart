/*
*   Filename    :   services_bloc.dart
*   Purpose     :
*   Created     :   05/09/2019 6:30 PM by Detective Conan
*	 Updated			:   24/09/2019 11:00 AM PM by Detective Conan
*	 Changes			:   Moved the saving of list of module reference to TabBloc
*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_event.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_state.dart';
import 'package:mt_carmel_app/src/core/services/module_list_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {

  @override
  ServicesState get initialState => ServicesUninitialized();

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    if (event is FetchServices) {
      yield ServicesLoading();
      List<ModuleReference> moduleReferences;
      try {
        moduleReferences = await locator<ModuleListService>().getData();
      } catch (e) {
        if (e.toString().contains("No connection")) {
          yield ServicesNoConnection();
          return;
        }
        yield ServicesError(Exception("$e"));
        return;
      }

      if (moduleReferences == null) {
        yield ServicesError(
            Exception("ServiceBloc.mapEventToState moduleReference is null!"));
        return;
      }

      if (moduleReferences.isNotEmpty)
        yield ServicesLoaded(moduleReferences);
      else
        yield NoServicesLoad();
    }
  }
}
