/*
*   Filename    :   church_regular_schedule_page.dart
*   Purpose     :
*   Created     :   13/09/2019 2:00 PM by Detective Conan
*   Updated     :   13/09/2019 2:00 PM by Detective Conan
*   Changes     :   
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_screen.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ChurchRegularSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChurchRegularScheduleBloc, ChurchRegularScheduleState>(
      builder: (context, state) {
        if (state is ChurchRegularScheduleLoading ||
            state is ChurchRegularScheduleUninitialized)
          return Scaffold(body: LoadingIndicator());
        if (state is ChurchRegularScheduleLoaded) {
          return ChurchRegularScheduleScreen();
        }
        if (state is ChurchRegularScheduleError) {
          return Scaffold(
              body: ErrorMessage.errMsg(errorMessage: "Something went wrong"));
        }
        return Container();
      },
    );
  }
}
