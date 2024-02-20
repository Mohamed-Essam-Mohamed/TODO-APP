import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List months = [
    'jan',
    'feb',
    'mar',
    'apr',
    'may',
    'jun',
    'jul',
    'aug',
    'sep',
    'oct',
    'nov',
    'dec'
  ];

  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  int currentMonth = DateTime.now().month;
  DateTime _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xff8687E7),
          child: Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        title: Text(
          "${months[currentMonth - 1]} ${DateTime.now().day},${DateTime.now().year}",
          style: AppTextStyle.textStyle24,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Today",
              style: AppTextStyle.textStyle24,
            ),
            const SizedBox(
              height: 5,
            ),

            /// caleder Date
            EasyDateTimeLine(
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selectedDate
              },
              activeColor: const Color(0xff242969),
              headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                dateFormatter: DateFormatter.fullDateDayAsStrMY(),
                monthStyle: TextStyle(color: Colors.white, fontSize: 20),
                selectedDateStyle: TextStyle(color: Colors.white, fontSize: 20),
              ),
              dayProps: const EasyDayProps(
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: Color.fromARGB(255, 127, 132, 115),
                inactiveDayNumStyle:
                    TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
