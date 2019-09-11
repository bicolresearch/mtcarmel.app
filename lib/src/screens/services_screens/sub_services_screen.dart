/*
*   Filename    :   sub_services_screen.dart
*   Purpose     :
*   Created     :   11/09/2019 2:46 PM by Detective Conan
*   Updated     :   11/09/2019 2:46 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_bloc.dart';
import 'package:mt_carmel_app/src/blocs/sub_services_bloc/sub_services_state.dart';
import 'package:mt_carmel_app/src/screens/services_screens/sub_services_list.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class SubServicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<SubServicesBloc, SubServicesState>(
              builder: (context, state) {
                if (state is SubServicesUninitialized ||
                    state is SubServicesLoading) {
                  return LoadingIndicator();
                }
                if (state is SubServicesLoaded) {
                  return SubServicesList();
                }
                if(state is SubServicesError){
                  return ErrorMessage.errMsg(errorMessage: "Something Went wrong");
                }
                return Container();
              },
            ),
          ),
          leftArrowBackButton(context: context),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }
}
