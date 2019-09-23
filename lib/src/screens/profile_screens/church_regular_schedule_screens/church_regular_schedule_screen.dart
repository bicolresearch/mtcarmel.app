/*
*	 Filename		 :	 church_regular_schedule_screen_old.dart
*	 Purpose		 :	 Displays the different schedules of the church
*  Created		 :   2019-06-14 09:42:18 by Detective Conan
*	 Updated			:   18/09/2019 6:33 PM PM by Detective Conan
*	 Changes			:   Removed left arrow back button. Added branch fetching from locator
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_bloc.dart';

import 'package:mt_carmel_app/src/constants/regular_schedule_constants.dart';
import 'package:mt_carmel_app/src/core/services/branch_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/schedule.dart';
import 'package:mt_carmel_app/src/widgets/error_message.dart';

import 'package:mt_carmel_app/src/widgets/line.dart';

class ChurchRegularScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final branch = locator<BranchService>().branch;
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
                  child: Text(
                    "${branch.name}\n Regular Schedules",
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
                                        RegularScheduleConstants.HOLY_MASS)
                                    ? Column(children: [
                                        Text(
                                          "${RegularScheduleConstants.HOLY_MASS}",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .title
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        lineWidget(),
                                        _categoryScheduleTable(
                                            context,
                                            scheduleCategories[
                                                RegularScheduleConstants
                                                    .HOLY_MASS]),
                                      ])
                                    : Container(),
                                //Confessions
                                scheduleCategories.containsKey(
                                        RegularScheduleConstants.CONFESSION)
                                    ? Column(children: <Widget>[
                                        Text(
                                          "${RegularScheduleConstants.CONFESSION}",
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .title
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        lineWidget(),
                                        _categoryScheduleTable(
                                            context,
                                            scheduleCategories[
                                                RegularScheduleConstants
                                                    .CONFESSION])
                                      ])
                                    : Container(),
                                //Blessings
                                scheduleCategories.containsKey(
                                        RegularScheduleConstants.BLESSINGS)
                                    ? Column(
                                        children: <Widget>[
                                          Text(
                                            "${RegularScheduleConstants.BLESSINGS}",
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .title
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          lineWidget(),
                                          _categoryScheduleTable(
                                              context,
                                              scheduleCategories[
                                                  RegularScheduleConstants
                                                      .BLESSINGS]),
                                        ],
                                      )
                                    : Container(),
                                //Live Mass
                                scheduleCategories.containsKey(
                                        RegularScheduleConstants.LIVE_MASS)
                                    ? Column(
                                        children: <Widget>[
                                          _categoryScheduleTable(
                                              context,
                                              scheduleCategories[
                                                  RegularScheduleConstants
                                                      .LIVE_MASS]),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
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
    print(scheduleCategory);
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
