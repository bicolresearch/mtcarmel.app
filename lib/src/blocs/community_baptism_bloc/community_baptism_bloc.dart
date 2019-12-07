/*
*   Filename    :   community_baptism_bloc.dart
*   Purpose     :
*   Created     :   22/11/2019 9:28 AM by Detective Conan
*   Updated     :   22/11/2019 9:28 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/community_baptism_bloc/community_baptism_event.dart';
import 'package:mt_carmel_app/src/blocs/community_baptism_bloc/community_baptism_state.dart';
import 'package:mt_carmel_app/src/core/services/profiles_api/community_baptism_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/helpers/module_and_data_actions.dart';

class CommunityBaptismBloc
    extends Bloc<CommunityBaptismEvent, CommunityBaptismState> {
  @override
  CommunityBaptismState get initialState => CommunityBaptismUninitialized();

  ModuleAndDataActions _moduleAndDataActions;

  ModuleAndDataActions get moduleAndDataActions => _moduleAndDataActions;

  @override
  Stream<CommunityBaptismState> mapEventToState(
      CommunityBaptismEvent event) async* {
    if (event is FetchCommunityBaptism) {
      yield CommunityBaptismLoading();
      try {
        _moduleAndDataActions =
            await locator<CommunityBaptismService>().getModuleAndDataActions();
        if (_moduleAndDataActions.modules.length == 0) {
          yield NoCommunityBaptismLoaded();
          return;
        }
        yield CommunityBaptismLoaded();
      } catch (e) {
        print(e);
        yield CommunityBaptismError(Exception(e));
      }
    }
  }
}
