/*
*	Filename		:	<filename.extension>
*	Purpose			:	
* Created			: 2019-06-04 16:46:46 by Detective Conan
*	Updated			:	2019-06-04 16:46:46 by Detective Conan 
*	Changes			:
*/
import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mt_carmel_app/src/helpers/date_time_helper.dart';
import '../presentations/mount_carmel_icons.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants/app_constants.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2019, 1, 1): ['New Year\'s Day'],
  DateTime(2019, 1, 6): ['Epiphany'],
  DateTime(2019, 2, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class CalendarPage extends StatefulWidget {
  CalendarPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  Map<DateTime, List> _visibleHolidays;
  List _selectedEvents;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2',
        'Event C2',
        'Event D2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8',
        'Event C8',
        'Event D8'
      ],
      _selectedDay.add(Duration(days: 3)):
          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10',
        'Event C10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12',
        'Event C12',
        'Event D12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14',
        'Event C14'
      ],
    };

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        //padding: EdgeInsets.only(top: 30.0),
        child: Scaffold(
          body: Column(
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
                      child: Text('Back', style: Theme.of(context)
                      .primaryTextTheme
                      .title))),
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
      padding: EdgeInsets.all(8.0),
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
            formatButtonVisible: false, leftChevronIcon: Icon(Icons.chevron_left, color: Colors.brown,),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.brown,),
          ),
          builders: CalendarBuilders(
            selectedDayBuilder: (context, date, _) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Container(
                  margin: const EdgeInsets.all(4.0),
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
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  leading: Icon(MountCarmelIcons.events, color: Colors.brown),
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
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
          style: Theme.of(context).primaryTextTheme.subtitle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
