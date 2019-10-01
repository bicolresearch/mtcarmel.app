/*
*   Filename    :   send_help_bloc.dart
*   Purpose     :
*   Created     :   12/09/2019 12:10 PM by Detective Conan
*	 Updated			:   01/10/2019 10:52 AM PM by Detective Conan
*	 Changes			:   Checking of sendHelpDataList. If not empty request is not necessary.
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

  List<SendHelpData> _sendHelpDataList = [];

  @override
  Stream<SendHelpState> mapEventToState(SendHelpEvent event) async* {
    if (event is FetchSendHelp) {
      if (_sendHelpDataList.isNotEmpty) {
        yield SendHelpLoaded(_sendHelpDataList);
        return;
      }
      yield SendHelpLoading();
      try {
        _sendHelpDataList = await locator<SendHelpService>().getData();
        if (_sendHelpDataList.isNotEmpty) {
          yield SendHelpLoaded(_sendHelpDataList);
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
