/*
*	Filename		:	church_schedule_screen.dart
*	Purpose			:	Displays the different schedules of the church
* Created			: 2019-06-14 09:42:18 by Detective Conan
*	Updated			: 2019-07-02 13:47:22 by Detective Conan
*	Changes			: Added CircularProgressIndicator while loading and failed message
*/

import 'package:flutter/material.dart';
import 'package:mt_carmel_app/src/constants/app_constants.dart';

import 'package:http/http.dart' as http;
import 'package:mt_carmel_app/src/models/church_schedule.dart';
import 'package:mt_carmel_app/src/widgets/LoadingIndicator.dart';
import 'package:mt_carmel_app/src/widgets/failed_message.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mt_carmel_app/src/widgets/left_arrow_back_button.dart';
import 'package:mt_carmel_app/src/widgets/line.dart';

class ChurchScheduleScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  ChurchScheduleScreen();

  @override
  _ChurchScheduleScreenState createState() => _ChurchScheduleScreenState();
}

class _ChurchScheduleScreenState extends State<ChurchScheduleScreen> {
  List<ChurchSchedule> _churchScheduleList = [];

  List<ChurchSchedule> _holyMassSchedule = [];
  List<ChurchSchedule> _confessionSchedule = [];
  List<ChurchSchedule> _blessingSchedule = [];
  List<ChurchSchedule> _liveMassSchedule = [];

  var _isLoading = true;
  var _isJsonFailed = false;

  @override
  void initState() {
    super.initState();
    this.getJasonData();
  }

  Future<void> getJasonData() async {
    var response = await http.get(AppConstants.CHURCH_SCHEDULE_JSON_URL);
    if (this.mounted) {
      setState(() {
        if (response.statusCode == 200) {
          _churchScheduleList = (json.decode(response.body) as List)
              .map((data) => new ChurchSchedule.fromJson(data))
              .toList();
          _sortSchedules();
        } else {
          print(response.statusCode);
          _isJsonFailed = true;
        }
        _isLoading = false;
      });
    }
  }

  _sortSchedules() {
    for (ChurchSchedule schedule in _churchScheduleList) {
      switch (schedule.name) {
        case "Holy Mass": // holy mass
          _holyMassSchedule.add(schedule);
          break;
        case "Confession": //confesions
          _confessionSchedule.add(schedule);
          break;
        case "Blessings": // Blessings
          _blessingSchedule.add(schedule);
          break;
        case "Live Mass": // Live Mass
          _liveMassSchedule.add(schedule);
          break;
        default:
          break;
      }
    }
  }

//  Container(
//  padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
//  child: Column(
//  mainAxisAlignment: MainAxisAlignment.center,
//  crossAxisAlignment: CrossAxisAlignment.center,
//  children: <Widget>[

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _isLoading
              ? Expanded(child: LoadingIndicator())
              : _isJsonFailed
                  ? failedMessage()
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            child: Text(
                              "Church Schedules",
                              style: AppConstants.OPTION_STYLE3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          lineWidget(),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  children: <Widget>[
                                    // Holy mass
                                    _holyMassSchedule.isEmpty
                                        ? Container()
                                        : _scheduleTypeTable(
                                            context, _holyMassSchedule),
                                    // Confession
                                    _confessionSchedule.isEmpty
                                        ? Container()
                                        : _scheduleTypeTable(
                                            context, _confessionSchedule),
                                    // Blessings
                                    _blessingSchedule.isEmpty
                                        ? Container()
                                        : _scheduleTypeTable(
                                            context, _blessingSchedule),
                                    // Live Mass
                                    _liveMassSchedule.isEmpty
                                        ? Container()
                                        : _scheduleTypeTable(
                                            context, _liveMassSchedule),
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

  Widget _scheduleTypeTable(context, List<ChurchSchedule> schedules) {
    List<ChurchSchedule> sundaySchedules = [];
    List<ChurchSchedule> saturdaySchedules = [];
    List<ChurchSchedule> weekdaySchedules = [];
    List<ChurchSchedule> everydaySchedules = [];

    for (ChurchSchedule schedule in schedules) {
      switch (schedule.day) {
        case "Sunday":
          sundaySchedules.add(schedule);
          break;
        case "Weekday":
          weekdaySchedules.add(schedule);
          break;
        case "Saturday":
          saturdaySchedules.add(schedule);
          break;
        case "Everyday":
          everydaySchedules.add(schedule);
          break;
        default:
          break;
      }
    }

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            children: <Widget>[
              Text(
                "${schedules[0].name}",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 20.0,
                    fontFamily: "Helvetica",
                    fontWeight: FontWeight.bold),
              ),
              lineWidget()
            ],
          ),
        ),
        // Sundays
        sundaySchedules.isNotEmpty
            ? _dayScheduleTable(context, sundaySchedules)
            : Container(),
        //Saturdays
        saturdaySchedules.isNotEmpty
            ? _dayScheduleTable(context, saturdaySchedules)
            : Container(),
        // weekdays
        weekdaySchedules.isNotEmpty
            ? _dayScheduleTable(context, weekdaySchedules)
            : Container(),
        // everyday
        everydaySchedules.isNotEmpty
            ? _dayScheduleTable(context, everydaySchedules)
            : Container(),
      ],
    );
  }

  Widget _dayScheduleTable(context, List<ChurchSchedule> schedules) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${schedules[0].day}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontFamily: "Helvetica",
                fontWeight: FontWeight.bold),
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
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: "Helvetica",
                      fontWeight: FontWeight.normal,
                    ),
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
}
