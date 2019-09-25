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
import 'package:mt_carmel_app/src/models/branch.dart';
import 'package:mt_carmel_app/src/models/church_module.dart';
import 'package:mt_carmel_app/src/models/feed.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  //Branch
  Branch _branch;

  Branch get branch => _branch;

  setBranch(Branch value) {
    _branch = value;

  } // news Feed
  List<PostData> _postData = [];

  List<PostData> get postData => _postData;

  setPostData(List<PostData> value) {
    _postData = value;
  }

  // Services
  List<ModuleReference> _moduleReferences = [];

  List<ModuleReference> get moduleReferences => _moduleReferences;

  setModuleReferences(List<ModuleReference> value) {
    _moduleReferences = value;
  }

  // Send Help

  List<SendHelpData> _sendHelpDataList = [];

  setSendHelpDataList(List<SendHelpData> value) {
    _sendHelpDataList = value;
  }

  List<SendHelpData> get sendHelpDataList => _sendHelpDataList;

  @override
  AppTab get initialState => AppTab.NewsFeed;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      if (event.tab != null) yield event.tab;
    }
  }
}
