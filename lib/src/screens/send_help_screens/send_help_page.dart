/*
*   Filename    :   send_help_page.dart
*   Purpose     :
*   Created     :   12/09/2019 1:12 PM by Detective Conan
*	 Updated			:   17/09/2019 2:47 PM PM by Detective Conan
*	 Changes			:   Added message when no send help loaded.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_bloc.dart';
import 'package:mt_carmel_app/src/blocs/send_help_bloc/send_help_state.dart';
import 'package:mt_carmel_app/src/screens/send_help_screens/send_help_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class SendHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendHelpBloc, SendHelpState>(
      builder: (context, state) {
        if(state is SendHelpLoading)
          return LoadingIndicator();
        if(state is SendHelpLoaded){
          return SendHelpScreen();
        }
        if(state is NoSendHelpLoaded)
        {
          return ErrorMessage.errMsg(errorMessage: "No sendh help loaded.");
        }
        if(state is SendHelpError)
          {
            return ErrorMessage.errMsg(errorMessage: "Something went wrong");
          }
        return Container();
      },
    );
  }
}
