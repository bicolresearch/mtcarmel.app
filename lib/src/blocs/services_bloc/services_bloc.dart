/*
*   Filename    :   services_bloc.dart
*   Purpose     :
*   Created     :   05/09/2019 6:30 PM by Detective Conan
*	 Updated			:   01/10/2019 10:40 AM PM by Detective Conan
*	 Changes			:   Checking of moduleReferences. If not empty request is not necessary.
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

  @override
  ServicesState get initialState => ServicesUninitialized();

  @override
  Stream<ServicesState> mapEventToState(ServicesEvent event) async* {
    if (event is FetchServices) {
      if (_moduleReferences.isNotEmpty) {
        yield ServicesLoaded(_moduleReferences);
        return;
      }
      yield ServicesLoading();
      try {
        _moduleReferences = await locator<ModuleListService>().getData();
      } catch (e) {
        if (e.toString().contains("No connection")) {
          yield ServicesNoConnection();
          return;
        }
        yield ServicesError(Exception("$e"));
        return;
      }

      if (_moduleReferences == null) {
        yield ServicesError(
            Exception("ServiceBloc.mapEventToState moduleReference is null!"));
        return;
      }

      if (_moduleReferences.isNotEmpty)
        yield ServicesLoaded(_moduleReferences);
      else
        yield NoServicesLoad();
    }
  }
}
