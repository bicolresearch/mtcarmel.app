/*
*   Filename    :   module_model_bloc.dart
*   Purpose     :
*   Created     :   04/12/2019 3:34 PM by Detective Conan
*   Updated     :   04/12/2019 3:34 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_event.dart';
import 'package:mt_carmel_app/src/blocs/module_model_bloc/module_model_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/module_model_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/module_model.dart';

class ModuleModelBloc extends Bloc<ModuleModelEvent, ModuleModelState> {
  @override
  ModuleModelState get initialState => ModuleModelUninitialized();

  DataActionModuleModel _dataActionModuleModel;

  DataActionModuleModel get dataActionModuleModel => _dataActionModuleModel;

  @override
  Stream<ModuleModelState> mapEventToState(ModuleModelEvent event) async* {
    if (event is FetchModuleModel) {
      yield ModuleModelLoading();
      try {
        _dataActionModuleModel = await locator<ModuleModelService>()
            .getDataActionModuleModels(event.moduleDir);
        if (_dataActionModuleModel == null) {
          yield NoModuleModelLoaded();
          return;
        }
        yield ModuleModelLoaded();
      } catch (e) {
        print(e);
        yield ModuleModelError(Exception(e));
      }
    }
  }
}
