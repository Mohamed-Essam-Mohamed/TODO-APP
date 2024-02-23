// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_text_style.dart';

class AddTask extends StatelessWidget {
  static const String routeName = "AddTask";
  List<Color> myColors = [
    AppColors.color1,
    AppColors.color2,
    AppColors.color3,
    AppColors.color4,
    AppColors.color5,
    AppColors.color6,
  ];
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: Form(
        key: formState,
        child: Container(
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
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
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
                      TextFormField(
                        maxLines: 1,
                        minLines: 1,
                        style: AppTextStyle.textStyle16,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (value.length < 4) {
                            return 'Too short';
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: AppColors.kBackgroundTextfield,
                          filled: true,
                          hintText: "Enter title here",
                          hintStyle: AppTextStyle.textStyle16,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(siz.height * .01),
                            borderSide: BorderSide(
                              color: AppColors.kSecondary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(siz.height * .01),
                            borderSide: BorderSide(
                              color: AppColors.kSecondary,
                            ),
                          ),
                        ),
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
                      TextFormField(
                        maxLines: 1,
                        minLines: 1,
                        style: AppTextStyle.textStyle16,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (value.length < 4) {
                            return 'Too short';
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: AppColors.kBackgroundTextfield,
                          filled: true,
                          hintText: "Enter note here",
                          hintStyle: AppTextStyle.textStyle16,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(siz.height * .01),
                            borderSide: BorderSide(
                              color: AppColors.kSecondary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(siz.height * .01),
                            borderSide: BorderSide(
                              color: AppColors.kSecondary,
                            ),
                          ),
                        ),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "21/2/2024",
                          style: AppTextStyle.textStyle24.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
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
                        child: Text(
                          "Create Task",
                          style:
                              AppTextStyle.textStyle16.copyWith(fontSize: 20),
                        ),
                        color: AppColors.colorButtom,
                        minWidth: double.infinity,
                        // disabledColor: AppColors.colorButtom,
                        height: siz.height * .05,
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

  void buttonAddTask() {
    if (formState.currentState!.validate()) {}
  }
}
