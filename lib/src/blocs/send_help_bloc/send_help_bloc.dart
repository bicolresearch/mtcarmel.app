/*
*   Filename    :   send_help_bloc.dart
*   Purpose     :
*   Created     :   12/09/2019 12:10 PM by Detective Conan
*   Updated     :   12/09/2019 12:10 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_event.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_state.dart';
import 'package:mt_carmel_app/src/core/services/send_help_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';

class SendHelpBloc extends Bloc<SendHelpEvent, SendHelpState> {
  List<SendHelpData> _sendHelpDataList = [];

  List<SendHelpData> get sendHelpDataList => _sendHelpDataList;

  @override
  SendHelpState get initialState => SendHelpUninitialized();

  @override
  Stream<SendHelpState> mapEventToState(SendHelpEvent event) async* {
    if (event is FetchSendHelp) {
//      if (_sendHelpDataList.isEmpty)
        yield SendHelpLoading();
      try {
        _sendHelpDataList = await locator<SendHelpService>().getData();
        if (_sendHelpDataList.isNotEmpty) {
          yield SendHelpLoaded();
        } else {
          yield NoSendHelpLoaded();
        }
      } catch (e) {
        print(e);
        if (e.toString().contains("No connection")) {
          yield SendHelpNoConnection();
          return;
        }
        yield SendHelpError(e);
      }
    }
  }
}
