/*
*   Filename    :   announcement_bloc.dart
*   Purpose     :
*   Created     :   28/09/2019 9:44 PM by Detective Conan
*   Updated     :   28/09/2019 9:44 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  @override
  AnnouncementState get initialState => AnnouncementUninitialize();

  @override
  Stream<AnnouncementState> mapEventToState(AnnouncementEvent event) async* {
    if(event is AnnouncementFetch){
      yield AnnouncementLoading();

    }
  }
}