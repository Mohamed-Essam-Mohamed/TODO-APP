// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/feature/add_task/add_task.dart';
import 'package:todo_app/src/firebase/firebase_utels.dart';
import 'package:todo_app/src/model/task_model.dart';
import 'package:todo_app/src/provider/provider_list.dart';
import 'package:todo_app/src/utils/app_assests.dart';
import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';
import 'package:todo_app/src/widget/custom_task_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  int currentMonth = DateTime.now().month;
  DateTime _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    var siz = MediaQuery.of(context).size;
    if (provider.taskModelList.isEmpty) {
      provider.getAllTasks();
    }
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        title: FadeInRight(
          duration: const Duration(milliseconds: 1100),
          child: Text(
            "${months[currentMonth - 1]} ${DateTime.now().day},${DateTime.now().year}",
            style: AppTextStyle.textStyle24,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FadeInRight(
          duration: const Duration(milliseconds: 1100),
          child: FloatingActionButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(AddTask.routeName);
              bottomSheet();
            },
            backgroundColor: Color(0xff8687E7),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: FadeInRightBig(
        duration: const Duration(milliseconds: 1400),
        child: Container(
          padding: EdgeInsets.all(siz.height * 0.01),
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

              // caleder Date
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selectedDate
                  provider.changDate(selectedDate);
                },
                activeColor: const Color(0xff242969),
                headerProps: const EasyHeaderProps(
                  monthPickerType: MonthPickerType.switcher,
                  dateFormatter: DateFormatter.fullDateDayAsStrMY(),
                  monthStyle: TextStyle(color: Colors.white, fontSize: 20),
                  selectedDateStyle:
                      TextStyle(color: Colors.white, fontSize: 20),
                ),
                dayProps: const EasyDayProps(
                  todayHighlightStyle: TodayHighlightStyle.withBackground,
                  todayHighlightColor: Color.fromARGB(255, 127, 132, 115),
                  inactiveDayNumStyle:
                      TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Color(0xffC4C4C4),
                endIndent: siz.width * 0.05,
                indent: siz.width * 0.05,
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   padding: EdgeInsets.all(10),
              //   height: siz.height * .5,
              //   width: siz.width * .5,
              //   decoration: BoxDecoration(),
              //   child: Image.asset(AppAssets.backgroundHS),
              // ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CustomTaskWidget(
                    siz: siz,
                    taskModel: provider.taskModelList[index],
                  ),
                  // Text(
                  //   provider.taskModelList[index].title ?? '',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20,
                  //   ),
                  // ),
                  itemCount: provider.taskModelList.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddTask(),
    );
  }
}
