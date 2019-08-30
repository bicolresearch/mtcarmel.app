/*
*	Filename		:	<filename.extension>
*	Purpose			:	
* Created			: 2019-06-04 16:46:46 by Detective Conan
*  Updated     :   2019-08-30 14:09 by Detective conan
*  Changes     :   Added methods for adding of events.
*/
import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mt_carmel_app/src/helpers/date_time_helper.dart';
import 'package:mt_carmel_app/src/models/schedule.dart';
import '../presentations/mount_carmel_icons.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
//  DateTime(2019, 1, 1): ['New Year\'s Day'],
//  DateTime(2019, 1, 6): ['Epiphany'],
//  DateTime(2019, 2, 14): ['Valentine\'s Day'],
//  DateTime(2019, 4, 21): ['Easter Sunday'],
//  DateTime(2019, 4, 22): ['Easter Monday'],
};

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  // TODO temporary
  final _regularSchedules = [
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "19:00:00", "20:30:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "18:15:00", "19:15:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "17:00:00", "18:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "15:45:00", "16:45:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "12:15:00", "13:15:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "11:00:00", "12:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "09:45:00", "10:45:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "08:30:00", "09:30:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "07:15:00", "08:15:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Holy Mass", "Sunday", "en", "06:00:00", "07:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Confession", "Sunday", "en", "14:00:00", "16:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Confession", "Saturday", "en", "17:00:00", "17:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Confession", "Saturday", "en", "06:30:00", "07:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Confession", "Weekday", "en", "10:15:00", "13:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Confession", "Weekday", "en", "14:15:00", "16:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
    Schedule("1", "1", "Prayer", "Everyday", "en", "18:15:00", "19:00:00",
        "2019-08-28 17:38:48.402", "2019-08-28 17:38:48.402", null),
  ];

  Map<String, List> _recurrentSchedules = {};

  final Map<int, String> _days = {
    1:"Monday",
    2:"Tuesday",
    3:"Wednesday",
    4:"Thursday",
    5:"Friday",
    6:"Saturday",
    7:"Sunday",
  };

  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  Map<DateTime, List> _visibleHolidays;

  List _selectedEvents;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _getRecurrentSchedules();
    _selectedDay = DateTime.now();

    _events = _getVisibleRecurrentEvents(
        _selectedDay.subtract(Duration(days: _selectedDay.day - 1)),
        _selectedDay.add(Duration(days: 31 - _selectedDay.day)));

    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;
    _visibleHolidays = _holidays;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      _visibleEvents = Map.fromEntries(
        _events.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );

      _visibleHolidays = Map.fromEntries(
        _holidays.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );

      _visibleEvents.addAll(_getVisibleRecurrentEvents(first, last));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.only(top: 30.0),0
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Switch out 2 lines below to play with TableCalendar's settings
              //-----------------------
              //_buildTableCalendar(),
              _buildTableCalendarWithBuilders(),
              const SizedBox(height: 8.0),
              _buildScheduledEventLabel(),
              Expanded(child: _buildEventList()),
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text('Back',
                          style: Theme.of(context).primaryTextTheme.title))),
            ],
          ),
        ),
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'en_US',
      events: _visibleEvents,
      holidays: _visibleHolidays,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.twoWeeks: '2 weeks',
        CalendarFormat.week: 'Week',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[500],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.brown, width: 2.0),
//        ),
        child: TableCalendar(
          locale: 'en_US',
          events: _visibleEvents,
          holidays: _visibleHolidays,
          initialCalendarFormat: CalendarFormat.month,
          formatAnimation: FormatAnimation.slide,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          availableGestures: AvailableGestures.all,
          availableCalendarFormats: const {
            CalendarFormat.month: '',
            CalendarFormat.week: '',
          },
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            weekendStyle: TextStyle().copyWith(color: Colors.brown[800]),
            holidayStyle: TextStyle().copyWith(color: Colors.brown[800]),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekendStyle: TextStyle().copyWith(color: Colors.brown[600]),
          ),
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            formatButtonVisible: false,
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Colors.brown,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: Colors.brown,
            ),
          ),
          builders: CalendarBuilders(
            selectedDayBuilder: (context, date, _) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Container(
                  margin: const EdgeInsets.all(2.0),
                  padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                  //color: Colors.brown[500],
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    //color: Colors.brown,
                    border: Border.all(color: Colors.brown),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${date.day}',
                    style: TextStyle().copyWith(fontSize: 16.0),
                  ),
                ),
              );
            },
            todayDayBuilder: (context, date, _) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                //color: Colors.amber[400],
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  //color: Colors.brown,
                  border: Border.all(color: Colors.blueAccent),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${date.day}',
                  style: TextStyle().copyWith(fontSize: 16.0),
                ),
              );
            },
//            markersBuilder: (context, date, events, holidays) {
//              final children = <Widget>[];
//
//              if (events.isNotEmpty) {
//                children.add(
//                  Positioned(
//                    right: 1,
//                    bottom: 1,
//                    child: _buildEventsMarker(date, events),
//                  ),
//                );
//              }
//
//              if (holidays.isNotEmpty) {
//                children.add(
//                  Positioned(
//                    right: -2,
//                    top: -2,
//                    child: _buildHolidaysMarker(),
//                  ),
//                );
//              }
//
//              return children;
//            },
          ),
          onDaySelected: (date, events) {
            _onDaySelected(date, events);
            _controller.forward(from: 0.0);
          },
          onVisibleDaysChanged: _onVisibleDaysChanged,
        ),
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Utils.isSameDay(date, _selectedDay)
            ? Colors.brown[500]
            : Utils.isSameDay(date, DateTime.now())
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Stack(
        children: [
          Icon(
            MountCarmelIcons.events,
            size: 16.0,
          ),
          Text(
            '${events.length}',
            style: TextStyle().copyWith(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.event,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents.map((event) {
        print(event.runtimeType);
        return (event.runtimeType == Schedule)
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(blurRadius: 0.50, color: Colors.white)
                    ]),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Icon(MountCarmelIcons.events, color: Colors.brown),
                  title: Text(event.name),
                  subtitle: Text("${event.timeFrom} - ${event.timeTo}"),
                  onTap: () => print('$event tapped!'),
                ),
              )
            : Container();
      }).toList(),
    );
  }

  Widget _buildScheduledEventLabel() {
    final dateTimeHelper = DateTimeHelper();
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
      child: ListTile(
        leading: Icon(MountCarmelIcons.events, color: Colors.white),
        title: Text(
          '${dateTimeHelper.monthString(_selectedDay)} ${dateTimeHelper.dayString(_selectedDay)}, ${_selectedDay.year} Scheduled Events',
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .primaryTextTheme
              .subtitle
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void _getRecurrentSchedules() {
    for (var schedule in _regularSchedules) {
      if (_days.values.contains(schedule.day))
        _addSchedule(schedule, _recurrentSchedules, schedule.day);
      else {
        if (schedule.day == "Everyday") {
          for (var day in _days.values)
            _addSchedule(schedule, _recurrentSchedules, day);
        }
        if (schedule.day == "Weekday") {
          for (var day in _days.values) {
            if (day == "Sunday" || day == "Saturday") continue;

            _addSchedule(schedule, _recurrentSchedules, day);
          }
        }
      }
    }
  }

  _addSchedule(
      Schedule schedule, Map<String, List> recurrentSchedules, String day) {
    // check if the string is name of the day return if not.
    if (!_days.values.contains(day)) return;

    if (recurrentSchedules.containsKey(day)) {
      recurrentSchedules[day].add(schedule);
    } else {
      recurrentSchedules.putIfAbsent(day, () => [schedule]);
    }
  }

  Map<DateTime, List> _getVisibleRecurrentEvents(
      DateTime first, DateTime last) {
    final visibleDayCount = last.difference(first).inDays;
    final DateTime date = first;
    Map<DateTime, List> recurrentEvents = {};
    for (int i = 0; i <= visibleDayCount; i++) {
      final iterationDate = date.add(Duration(days: i));

      if (_recurrentSchedules.containsKey(_days[iterationDate.weekday])) {
        _addEvent(iterationDate, recurrentEvents,
            _recurrentSchedules[_days[iterationDate.weekday]]);
      }

    }
    print("${recurrentEvents.length}");
    return recurrentEvents;
  }

  void _addEvent(DateTime iterationDate, Map<DateTime, List> events, List schedule) {

      if (events.containsKey(iterationDate))
        events[iterationDate]
            .addAll(schedule);
      else
        events.putIfAbsent(
            iterationDate, () => schedule);
  }


}

class Event {
  final DateTime dateTime;
  final String eventName;
  final String venue;

  Event(this.dateTime, this.eventName, this.venue);
}
