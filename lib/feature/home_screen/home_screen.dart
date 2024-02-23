// ignore_for_file: prefer_const_constructors

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/feature/add_task/add_task.dart';
import 'package:todo_app/utils/app_assests.dart';
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
    var siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        title: Text(
          "${months[currentMonth - 1]} ${DateTime.now().day},${DateTime.now().year}",
          style: AppTextStyle.textStyle24,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).pushNamed(AddTask.routeName);
            bottomSheet();
          },
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
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: siz.height * .5,
              width: siz.width * .5,
              decoration: BoxDecoration(),
              child: Image.asset(AppAssets.backgroundHS),
            )
          ],
        ),
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      context: context,
      builder: (context) => AddTask(),
    );
  }
}
