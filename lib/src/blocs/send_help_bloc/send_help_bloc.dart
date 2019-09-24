/*
*   Filename    :   send_help_bloc.dart
*   Purpose     :
*   Created     :   12/09/2019 12:10 PM by Detective Conan
*	 Updated			:   24/09/2019 12:48 PM PM by Detective Conan
*	 Changes			:   Moved the sendHelpList to TabBloc
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_event.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_state.dart';
import 'package:mt_carmel_app/src/core/services/send_help_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/send_help.dart';

class SendHelpBloc extends Bloc<SendHelpEvent, SendHelpState> {
  @override
  SendHelpState get initialState => SendHelpUninitialized();

  @override
  Stream<SendHelpState> mapEventToState(SendHelpEvent event) async* {
    if (event is FetchSendHelp) {
      yield SendHelpLoading();
      List<SendHelpData> sendHelpDataList;
      try {
        sendHelpDataList = await locator<SendHelpService>().getData();
        if (sendHelpDataList.isNotEmpty) {
          yield SendHelpLoaded(sendHelpDataList);
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
