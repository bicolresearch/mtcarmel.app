/*
*	 Filename		 :	 church_regular_schedule_screen_old.dart
*	 Purpose		 :	 Displays the different schedules of the church
*  Created		 :   2019-06-14 09:42:18 by Detective Conan
*	 Updated			:   13/09/2019 2:03 PM PM by Detective Conan
*	 Changes			:   Modified for bloc implementation.
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_bloc.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';
import 'package:mt_carmel_app/src/models/schedule.dart';
import 'package:mt_carmel_app/src/utils/schedule_type.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class ChurchRegularScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, List<Schedule>>> scheduleCategories =
        BlocProvider.of<ChurchRegularScheduleBloc>(context).schedulesCategories;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 80.0,
                  child: Text(
                    "${AppConstants.COMPANY_NAME}\n Regular Schedules",
                    style: Theme.of(context)
                        .primaryTextTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                lineWidget(),
                Expanded(
                  child: scheduleCategories.keys.isEmpty
                      ? ErrorMessage.errMsg(
                          errorMessage: "No church regular schedule!")
                      : SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: <Widget>[
                                //Holy Mass
                                scheduleCategories.containsKey(
                                        ScheduleType.HolyMassSchedule)
                                    ? _categoryScheduleTable(
                                        context,
                                        scheduleCategories[
                                            ScheduleType.HolyMassSchedule])
                                    : Container(),
                                //Confessions
                                scheduleCategories.containsKey(
                                        ScheduleType.ConfessionSchedule)
                                    ? _categoryScheduleTable(
                                        context,
                                        scheduleCategories[
                                            ScheduleType.ConfessionSchedule])
                                    : Container(),
                                //Blessings
                                scheduleCategories.containsKey(
                                        ScheduleType.BlessingSchedule)
                                    ? _categoryScheduleTable(
                                        context,
                                        scheduleCategories[
                                            ScheduleType.BlessingSchedule])
                                    : Container(),
                                //Live Mass
                                scheduleCategories.containsKey(
                                        ScheduleType.LiveMassSchedule)
                                    ? _categoryScheduleTable(
                                        context,
                                        scheduleCategories[
                                            ScheduleType.LiveMassSchedule])
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          leftArrowBackButton(context: context),
        ],
      ),
    ));
  }

  Widget _dayScheduleTable(context, List<Schedule> schedules) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${schedules[0].day}",
            style: Theme.of(context)
                .primaryTextTheme
                .subhead
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Container(
            child: ListView.builder(
              physics: ScrollPhysics(parent: ScrollPhysics()),
              shrinkWrap: true,
              itemCount: schedules.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    "${schedules[index].timeFrom} - ${schedules[index].timeTo}",
                    style: Theme.of(context).primaryTextTheme.subhead,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _categoryScheduleTable(
      BuildContext context, Map<String, List<Schedule>> scheduleCategory) {
    return Column(
      children: <Widget>[
        //TODO create key constants
        scheduleCategory.containsKey("Sundays")
            ? _dayScheduleTable(context, scheduleCategory["Sundays"])
            : Container(),
        scheduleCategory.containsKey("Saturdays")
            ? _dayScheduleTable(context, scheduleCategory["Saturdays"])
            : Container(),
        scheduleCategory.containsKey("Weekdays")
            ? _dayScheduleTable(context, scheduleCategory["Weekdays"])
            : Container(),
        scheduleCategory.containsKey("Everyday")
            ? _dayScheduleTable(context, scheduleCategory["Everyday"])
            : Container(),
      ],
    );
  }
}
