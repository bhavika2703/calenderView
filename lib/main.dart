import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  return runApp(CalendarApp());
}

/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko'),
        const Locale('hi'),
        const Locale('en'),
      ],
      title: 'Calendar Demo',
      home: MyHomePage(),
      locale: const Locale('ko'),
    );
  }
}

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText(),
             Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 4),
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color:Color(0xFF5A297C),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Text(
                      '퀴즈완료',
                      style: TextStyle(
                          color: Color(0xFF5A297C),
                          fontSize: 12
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SfCalendar(
              view: CalendarView.month,
              cellBorderColor: Colors.transparent,
              initialDisplayDate: DateTime.now(),
              monthCellBuilder:
                  (BuildContext buildContext, MonthCellDetails details) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    details.date.day.toString(),
                  ),
                );
              },
              selectionDecoration: BoxDecoration(
                color: Colors.deepPurple,
                border: Border.all(color: Colors.deepPurple, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(80)),
                shape: BoxShape.circle,
              ),
              monthViewSettings: const MonthViewSettings(
                  monthCellStyle: MonthCellStyle(
                      todayBackgroundColor: Color(0xFF5A297C))),
              dataSource: MeetingDataSource(_getDataSource()),
            ),
            const Divider(color: Color(0xFFF0F0F1), thickness: 5),
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    '나의 레벨',
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 12),
                    child: const Center(
                      child: Text(
                        '앞으로 4번의 Level UP 남았어요!',
                        style: TextStyle(
                            color: Color(0xFF5A297C), fontSize: 17),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.lerp(
                            Alignment.bottomLeft,
                            Alignment.bottomRight,
                            0.20) as AlignmentGeometry,
                        child: Container(
                            height: 80,
                            width: 90,
                            child: Image.asset('assets/img.png')),
                      ),
                      Align(
                          alignment: Alignment.lerp(
                              Alignment.bottomLeft,
                              Alignment.bottomRight,
                              0.20) as AlignmentGeometry,
                          child: const Padding(
                            padding: EdgeInsets.only(top: 34, left: 10),
                            child: Text(
                              'Level. 1',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(89, 40, 124, 1),
                                  fontFamily: 'Spoqa Han Sans Neo',
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          )),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0))),
                        child: const ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                          child: LinearProgressIndicator(
                            value: 0.27,
                            minHeight: 15,
                            backgroundColor: Color(0xFFEAEAEB),
                            color: Color(0xFF5A297C),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text('정답률',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFEAEAEB),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '전달 정답률 : 87%',
                                  style: TextStyle(
                                      color: Color(0xFFACACAF),
                                      fontSize: 14),
                                ),
                                const Text('이번달 정답률은?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: const [
                                      Text('완료한 퀴즈',
                                          style: TextStyle(fontSize: 12)),
                                      Text('총 12번',
                                          style: TextStyle(
                                              color: Color(0xFFCD3E94),
                                              fontSize: 12)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text('한달기준',
                                    style: TextStyle(
                                        color: Color(0xFFACACAF),
                                        fontSize: 12)),
                                Text('90%',
                                    style: TextStyle(
                                        color: Color(0xFF5A297C),
                                        fontSize: 40)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.grey.shade200),
          ),
    ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Image.asset('assets/home.png'),
         Image.asset('assets/message.png'),
         Image.asset('assets/img3.png'),
         Image.asset('assets/person.png'),
       ],
     ),
        ),
      ),
    );
  }

  Align headerText() {
    return const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 12,right: 12,top: 6),
              child: Text(
                '진도',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
          );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    /* meetings.add(Meeting(
        '', startTime, endTime, const Color(0xFF0F8644), false));*/
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
