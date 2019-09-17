/*
*   Filename    :   priests_page.dart
*   Purpose     :
*   Created     :   17/09/2019 3:21 PM by Detective Conan
*   Updated     :   17/09/2019 3:21 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_bloc.dart';
import 'package:mt_carmel_app/src/blocs/priests_bloc/priests_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/priests_screens/priests_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class PriestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriestsBloc, PriestsState>(
      builder: (context, state) {
        if (state is PriestsLoading || state is PriestsUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is PriestsLoaded) {
          return PriestsScreen();
        }
        if (state is PriestsError) {
          return Scaffold(
              body: ErrorMessage.errMsg(errorMessage: "Something went wrong"));
        }
        if (state is NoPriestsLoaded) {
          return Scaffold(
              body: ErrorMessage.errMsg(errorMessage: "No priests loaded"));
        }
        return Container();
      },
    );
  }
}
