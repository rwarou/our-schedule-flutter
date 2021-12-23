import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late Map<String, List<dynamic>> datas = {
    '20211222': ['놀고', '먹기'],
    '20211223': ['놀고', '먹기'],
  };
  late List<dynamic> selectedList = [];

  // @override
  // void initState() {
  //   super.initState();
  // }

  yyyyMMdd(DateTime date) {
    return '${date.year}${date.month}${date.day}';
  }

  selectedDataList(DateTime date) {
    return datas[yyyyMMdd(date)] ?? [];
  }

  headerStyle() {
    return HeaderStyle(
      // 타이틀 폰트 스타일 설정
      titleTextStyle:
          TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
      // 타이틀 날짜 포맷 설정
      titleTextFormatter: (date, locale) {
        return DateFormat('yyyy년 MM월 dd일').format(date);
      },
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // 포맷 버튼 텍스트 스타일 설정
      formatButtonTextStyle: TextStyle(fontSize: 15),
      // 포맷 버튼 박스 스타일 설정
      formatButtonDecoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      // 왼쪽 버튼 설정
      leftChevronIcon: Icon(Icons.chevron_left),
      // 오른쪽 버튼 설정
      rightChevronIcon: Icon(Icons.chevron_right),
    );
  }

  tableCalendar() {
    return TableCalendar(
      focusedDay: DateTime.now(),
      // 활성화의 첫 날
      firstDay: DateTime.now(),
      // 활성화의 마지막 날
      lastDay: DateTime.utc(2030, 12, 31),
      // 해더 스타일 설정
      headerStyle: headerStyle(),
      // 달력 포맷 설정
      availableCalendarFormats: const {
        CalendarFormat.month: "Month",
        CalendarFormat.week: "Week"
      },
      // default = month, 2weeks, week
      calendarFormat: _calendarFormat,
      // 주말 설정
      weekendDays: const [DateTime.saturday, DateTime.sunday],
      // 주말, 평일 스타일 설정
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),
      // 달력 날짜 스타일 설정
      calendarStyle: const CalendarStyle(
        // 날짜 기본 스타일 설정
        defaultTextStyle: TextStyle(),
        defaultDecoration: BoxDecoration(),
        // 주말 날짜 스타일 설정
        weekendTextStyle: TextStyle(color: Colors.red),
        weekendDecoration: BoxDecoration(),
        // 오늘 날짜 스타일 설정
        todayTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        // 선택 날짜 스타일 설정
        selectedTextStyle: TextStyle(color: Colors.white),
        selectedDecoration: BoxDecoration(
          color: Colors.lime,
          shape: BoxShape.circle,
        ),
      ),
      rowHeight: 60,
      // 이벤트 리스트 출력
      eventLoader: (currentSelectedDate) {
        print('eventloader $currentSelectedDate');
        return selectedDataList(currentSelectedDate);
      },
      // 달력에 표시되는 날짜 하나하나 호출, return은 같은 날일 때 색을 표시해주기 위함
      selectedDayPredicate: (currentSelectedDate) {
        // print(
        //     'selectedDayPredicate $currentSelectedDate / _selectedDay $_selectedDay');
        return isSameDay(_selectedDay, currentSelectedDate);
      },
      // 날짜 선택
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          // print('selectedDay $selectedDay / focusedDay $focusedDay');
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      // 포맷 선택
      onFormatChanged: (format) {
        setState(
          () {
            // print('format $format');
            _calendarFormat = format;
          },
        );
      },
      // 달력 넘김
      onPageChanged: (focusedDay) {
        // print('focusedDay $focusedDay');
        _focusedDay = focusedDay;
      },
      calendarBuilders: CalendarBuilders(),
    );
  }

  calendarDataList() {
    List<dynamic> list = selectedDataList(_selectedDay);
    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.red.withOpacity((index + 1) / 10),
              ),
              child: Text(
                list[index],
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tableCalendar(),
        calendarDataList(),
      ],
    );
  }
}
