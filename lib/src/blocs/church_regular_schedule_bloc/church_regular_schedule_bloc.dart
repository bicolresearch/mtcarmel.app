/*
*   Filename    :   church_regular_schedule_bloc.dart
*   Purpose     :
*   Created     :   13/09/2019 1:49 PM by Detective Conan
*   Updated     :   13/09/2019 1:49 PM by Detective Conan
*   Changes     :   
*/
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_event.dart';
import 'package:mt_carmel_app/src/blocs/church_regular_schedule_bloc/church_regular_schedule_state.dart';
import 'package:mt_carmel_app/src/constants/regular_schedule_constants.dart';
import 'package:mt_carmel_app/src/core/services/church_regular_schedule_service.dart';
import 'package:mt_carmel_app/src/core/services/service_locator.dart';
import 'package:mt_carmel_app/src/models/schedule.dart';
import 'package:mt_carmel_app/src/utils/schedule_type.dart';

class ChurchRegularScheduleBloc
    extends Bloc<ChurchRegularScheduleEvent, ChurchRegularScheduleState> {

  List<Schedule> _churchScheduleList = [];
  List<Schedule> _holyMassSchedule = [];
  List<Schedule> _confessionSchedule = [];
  List<Schedule> _blessingSchedule = [];
  List<Schedule> _liveMassSchedule = [];
  Map<String, Map<String, List<Schedule>>> _schedulesCategories = {};

  Map<String, Map<String, List<Schedule>>> get schedulesCategories =>
      _schedulesCategories;

  @override
  ChurchRegularScheduleState get initialState =>
      ChurchRegularScheduleUninitialized();

  @override
  Stream<ChurchRegularScheduleState> mapEventToState(
      ChurchRegularScheduleEvent event) async* {
    if (event is FetchChurchRegularSchedule) {
      yield ChurchRegularScheduleLoading();
      try {
        _churchScheduleList =
            await locator<ChurchRegularScheduleService>().getData();

        _sortSchedules();

        _scheduleType(ScheduleType.HolyMassSchedule);
        _scheduleType(ScheduleType.ConfessionSchedule);
        _scheduleType(ScheduleType.BlessingSchedule);
        _scheduleType(ScheduleType.LiveMassSchedule);
        yield ChurchRegularScheduleLoaded();
      } catch (e) {
        print(e);
        yield ChurchRegularScheduleError(e);
      }
    }
  }

  _sortSchedules() {
    for (Schedule schedule in _churchScheduleList) {
      switch (schedule.name) {
        case RegularScheduleConstants.HOLY_MASS: // holy mass
          _holyMassSchedule.add(schedule);
          break;
        case RegularScheduleConstants.CONFESSION: //confessions
          _confessionSchedule.add(schedule);
          break;
        case RegularScheduleConstants.BLESSINGS: // Blessings
          _blessingSchedule.add(schedule);
          break;
        case RegularScheduleConstants.LIVE_MASS: // Live Mass
          _liveMassSchedule.add(schedule);
          break;
        default:
          break;
      }
    }
    _holyMassSchedule.sort((a, b) => DateTime.parse("2000-01-01 ${a.timeFrom}")
        .compareTo(DateTime.parse("2000-01-01 ${b.timeFrom}")));
    _confessionSchedule.sort((a, b) =>
        DateTime.parse("2000-01-01 ${a.timeFrom}")
            .compareTo(DateTime.parse("2000-01-01 ${b.timeFrom}")));
    _blessingSchedule.sort((a, b) => DateTime.parse("2000-01-01 ${a.timeFrom}")
        .compareTo(DateTime.parse("2000-01-01 ${b.timeFrom}")));
    _liveMassSchedule.sort((a, b) => DateTime.parse("2000-01-01 ${a.timeFrom}")
        .compareTo(DateTime.parse("2000-01-01 ${b.timeFrom}")));
  }

  _scheduleType(ScheduleType scheduleType) {
    var scheduleDayMap = Map<String, List<Schedule>>();
    var key;
    List<Schedule> schedules;
    switch (scheduleType) {
      case ScheduleType.HolyMassSchedule:
        schedules = _holyMassSchedule;
        key = RegularScheduleConstants.HOLY_MASS;
        break;
      case ScheduleType.ConfessionSchedule:
        schedules = _confessionSchedule;
        key = RegularScheduleConstants.CONFESSION;
        break;
      case ScheduleType.BlessingSchedule:
        schedules = _blessingSchedule;
        key = RegularScheduleConstants.BLESSINGS;
        break;
      case ScheduleType.LiveMassSchedule:
        schedules = _liveMassSchedule;
        key = RegularScheduleConstants.LIVE_MASS;
        break;
    }

    List<Schedule> sundaySchedules = [];
    List<Schedule> saturdaySchedules = [];
    List<Schedule> weekdaySchedules = [];
    List<Schedule> everydaySchedules = [];

    for (Schedule schedule in schedules) {
      switch (schedule.day) {
        case "Sunday":
        case "Sundays":
          sundaySchedules.add(schedule);
          break;
        case "Weekday":
        case "Weekdays":
          weekdaySchedules.add(schedule);
          break;
        case "Saturday":
        case "Saturdays":
          saturdaySchedules.add(schedule);
          break;
        case "Everyday":
          everydaySchedules.add(schedule);
          break;
        default:
          break;
      }
    }

    if (sundaySchedules.isNotEmpty) {
      if (!scheduleDayMap.containsKey("Sundays"))
        scheduleDayMap.putIfAbsent("Sundays", () => sundaySchedules);
      else {
        scheduleDayMap["Sundays"].addAll(sundaySchedules);
      }
    }

    if (saturdaySchedules.isNotEmpty) {
      if (!scheduleDayMap.containsKey("Saturdays"))
        scheduleDayMap.putIfAbsent("Saturdays", () => saturdaySchedules);
      else {
        scheduleDayMap["Saturdays"].addAll(saturdaySchedules);
      }
    }

    if (everydaySchedules.isNotEmpty) {
      if (!scheduleDayMap.containsKey("Everyday"))
        scheduleDayMap.putIfAbsent("Everyday", () => everydaySchedules);
      else {
        scheduleDayMap["Everyday"].addAll(everydaySchedules);
      }
    }

    if (weekdaySchedules.isNotEmpty) {
      if (!scheduleDayMap.containsKey("Weekdays"))
        scheduleDayMap.putIfAbsent("Weekdays", () => weekdaySchedules);
      else {
        scheduleDayMap["Weekdays"].addAll(weekdaySchedules);
      }
    }

    // put all the days for schedule category
    if (_schedulesCategories.containsKey(key))
      //clear
      _schedulesCategories.remove(key);

    if (scheduleDayMap.isNotEmpty) {
      if (!_schedulesCategories.containsKey(key))
        _schedulesCategories.putIfAbsent(key, () => scheduleDayMap);
      else {
        _schedulesCategories[key].addAll(scheduleDayMap);
      }
    }
  }
}
