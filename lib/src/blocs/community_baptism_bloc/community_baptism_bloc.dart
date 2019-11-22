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

class CommunityBaptismBloc
    extends Bloc<CommunityBaptismEvent, CommunityBaptismState> {
  @override
  CommunityBaptismState get initialState => CommunityBaptismUninitialized();

  @override
  Stream<CommunityBaptismState> mapEventToState(
      CommunityBaptismEvent event) async* {
    if (event is FetchCommunityBaptism) {
      yield CommunityBaptismLoading();
      try {
        // TODO implement code
        yield CommunityBaptismLoaded();
      } catch (e) {
        print(e);
        yield CommunityBaptismError(Exception(e));
      }
    }
  }
}
