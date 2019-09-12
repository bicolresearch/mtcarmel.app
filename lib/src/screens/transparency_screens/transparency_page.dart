/*
*   Filename    :   transparency_page.dart
*   Purpose     :
*   Created     :   12/09/2019 5:03 PM by Detective Conan
*   Updated     :   12/09/2019 5:03 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_bloc.dart';
import 'package:mt_carmel_app/src/blocs/transparency_bloc/transparency_state.dart';
import 'package:mt_carmel_app/src/screens/transparency_screens/transparency_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class TransparencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransparencyBloc, TransparencyState>(
      builder: (context, state) {
        if (state is TransparencyLoading ||
            state is TransparencyUninitialized) {
          return LoadingIndicator();
        }
        if (state is TransparencyLoaded) {
          return TransparencyScreen();
        }
        if (state is TransparencyError) {
          ErrorMessage.errMsg(errorMessage: "Something went wrong!");
        }
        return Container();
      },
    );
  }
}
