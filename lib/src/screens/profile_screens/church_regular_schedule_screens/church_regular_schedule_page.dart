/*
*   Filename    :   church_regular_schedule_page.dart
*   Purpose     :
*   Created     :   13/09/2019 2:00 PM by Detective Conan
*	 Updated			:   23/09/2019 10:09 AM PM by Detective Conan
*	 Changes			:   Added connectivity check.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_event.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_state.dart';
import 'package:mt_carmel_app/src/screens/profile_screens/church_regular_schedule_screens/church_regular_schedule_screen.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/loading_indicator.dart';

class ChurchRegularSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ChurchRegularScheduleBloc,
                ChurchRegularScheduleState>(
              builder: (context, state) {
                if (state is ChurchRegularScheduleLoading ||
                    state is ChurchRegularScheduleUninitialized)
                  return Scaffold(body: LoadingIndicator());
                if (state is ChurchRegularScheduleLoaded) {
                  return ChurchRegularScheduleScreen();
                }
                if (state is ChurchRegularScheduleError) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("Something went wrong!")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<ChurchRegularScheduleBloc>(context)
                                .dispatch(FetchChurchRegularSchedule());
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is NoChurchRegularSchedule) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("No schedules.")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Reload",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<ChurchRegularScheduleBloc>(context)
                                .dispatch(FetchChurchRegularSchedule());
                          },
                        ),
                      ],
                    ),
                  );
                }
                if (state is ChurchRegularScheduleNoConnection) {
                  return Scaffold(
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(child: Text("NO connection!")),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Colors.brown,
                          child: Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            BlocProvider.of<ChurchRegularScheduleBloc>(context)
                                .dispatch(FetchChurchRegularSchedule());
                          },
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: leftArrowBackButton(context: context),
          ),
        ],
      ),
    );
  }
}
