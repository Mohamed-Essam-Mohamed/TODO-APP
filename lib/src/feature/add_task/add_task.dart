// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/firebase/firebase_utels.dart';
import 'package:todo_app/src/model/task_model.dart';
import 'package:todo_app/src/provider/provider_list.dart';

import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';
import 'package:todo_app/src/widget/app_text_form_field.dart';

class AddTask extends StatefulWidget {
  static const String routeName = "AddTask";

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<Color> myColors = [
    AppColors.color1,
    AppColors.color2,
    AppColors.color3,
    AppColors.color4,
    AppColors.color5,
    AppColors.color6,
  ];
  late ListProvider provider;
  DateTime dateTimePiker = DateTime.now();

  GlobalKey<FormState> formState = GlobalKey();
  String title = '';
  String note = '';

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ListProvider>(context);
    var siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: Form(
        key: formState,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                thickness: 3,
                color: Colors.grey.shade500,
                endIndent: siz.width * 0.3,
                indent: siz.width * 0.3,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: siz.height * 0.01,
                    ),
                    Text(
                      "Title",
                      style: AppTextStyle.textStyle24.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: siz.height * 0.01,
                    ),
                    AppTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (value.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        title = value;
                      },
                      siz: siz,
                      hintText: "Enter title here",
                    ),
                    SizedBox(
                      height: siz.height * .03,
                    ),
                    Text(
                      "Note",
                      style: AppTextStyle.textStyle24.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: siz.height * .01,
                    ),
                    AppTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Can\'t be empty';
                        }
                        if (value.length < 4) {
                          return 'Too short';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        note = value;
                      },
                      siz: siz,
                      hintText: "Enter note here",
                    ),
                    SizedBox(
                      height: siz.height * .03,
                    ),
                    Text(
                      "Select Date",
                      style: AppTextStyle.textStyle24.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showCalenter();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${dateTimePiker.day}/${dateTimePiker.month}/${dateTimePiker.year}",
                          style: AppTextStyle.textStyle24.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: siz.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        selectedContainerColor(myColors[0]),
                        unselectedContainerColor(myColors[1]),
                        unselectedContainerColor(myColors[2]),
                        unselectedContainerColor(myColors[3]),
                        unselectedContainerColor(myColors[4]),
                        unselectedContainerColor(myColors[5]),
                      ],
                    ),
                    SizedBox(
                      height: siz.height * 0.02,
                    ),
                    MaterialButton(
                      onPressed: () {
                        buttonAddTask();
                      },
                      color: AppColors.colorBottom,
                      minWidth: double.infinity,
                      // disabledColor: AppColors.colorButtom,
                      height: siz.height * .05,
                      child: Text(
                        "Create Task",
                        style: AppTextStyle.textStyle16.copyWith(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectedContainerColor(Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        Icons.done,
        size: 35,
        color: AppColors.kSecondary,
      ),
    );
  }

  Widget unselectedContainerColor(Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  void showCalenter() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chosenDate != null) {
      dateTimePiker = chosenDate;
    }
    setState(() {});
  }

  void buttonAddTask() {
    if (formState.currentState!.validate()) {
      // add task to firebase
      FirebaseUtils.addTaskFireStore(
        TaskModel(
          title: title,
          note: note,
          dateTime: dateTimePiker,
        ),
      ).then((value) => null).onError((error, stackTrace) {
        print(error.toString());
      });
      provider.getAllTasks();
      Navigator.of(context).pop();
    }
  }
}
