/*
*   Filename    :   sub_services_bloc.dart
*   Purpose     :
*   Created     :   11/09/2019 12:52 PM by Detective Conan
*   Updated     :   11/09/2019 12:52 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_event.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_state.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/core/services/church_modules_service.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';

class SubServicesBloc extends Bloc<SubServicesEvent, SubServicesState> {
  ChurchModule _churchModule;
  ModuleReference _moduleReference;

  ModuleReference get moduleReference => _moduleReference;

  ChurchModule get churchModule => _churchModule;

  @override
  SubServicesState get initialState => SubServicesUninitialized();

  @override
  Stream<SubServicesState> mapEventToState(SubServicesEvent event) async* {
    if (event is FetchSubServices) {
      yield SubServicesLoading();
      try {
        _churchModule = await locator<ChurchModuleService>()
            .getChurchModule(event.moduleReference);
        _moduleReference = event.moduleReference;
        yield SubServicesLoaded();
      } catch (e) {
        print(e);
        if (e.toString().contains("No connection")) {
          yield SubServicesNoConnection(event.moduleReference);
          return;
        }
        yield SubServicesError(e, event.moduleReference);
        return;
      }
    }
  }
}
