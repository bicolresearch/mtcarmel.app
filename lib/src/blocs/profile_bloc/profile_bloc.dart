/*
*   Filename    :   profile_bloc.dart
*   Purpose     :
*   Created     :   13/09/2019 9:49 AM by Detective Conan
*   Updated     :   13/09/2019 9:49 AM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:mt_carmel_app/src/blocs/profile_bloc/profile_event.dart';
import 'package:mt_carmel_app/src/blocs/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  @override
  ProfileState get initialState => ProfileUninitialized();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if(event is FetchProfile){
      // TODO modify code when profile is ready
      //  yield ProfileLoading();
      yield ProfileLoaded();
    }
  }
}