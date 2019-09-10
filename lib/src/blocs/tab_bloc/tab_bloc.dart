/*
*   Filename    :   tab_bloc.dart
*   Purpose     :
*   Created     :   02/09/2019 9:59 AM by Detective Conan
*   Updated     :   02/09/2019 9:59 AM by Detective Conan
*   Changes     :   
*/

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/tab_bloc/tab.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.NewsFeed;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      if (event.tab != null) yield event.tab;
    }
  }
}
