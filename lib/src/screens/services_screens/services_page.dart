/*
*   Filename    :   services_page.dart
*   Purpose     :
*   Created     :   11/09/2019 10:02 AM by Detective Conan
*   Updated     :   11/09/2019 10:02 AM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/services_bloc/services_state.dart';
import 'package:mt_carmel_app/src/screens/services_screens/services_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        if (state is ServicesUninitialized || state is ServicesLoading) {
          return LoadingIndicator();
        }
        if (state is ServicesLoaded) {
          return ServicesScreen();
        }
        if (state is ServicesError) {
          return ErrorMessage.errMsg(errorMessage: "Something went wrong!");
        }

        if (state is NoServicesLoad) {
          return ErrorMessage.errMsg(errorMessage: "No services loaded!");
        }
        return Container();
      },
    );
  }
}
