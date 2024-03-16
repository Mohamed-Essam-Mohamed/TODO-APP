// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors_in_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:todo_app/src/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String title;
  void Function()? press;
  Color backgroundColor;
  double width;
  CustomButton(
      {Key? key,
      required this.title,
      required this.press,
      required this.backgroundColor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: MaterialButton(
        onPressed: press,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        height: 50.h,
        child: Text(
          title,
          style: AppTextStyle.textStyle24.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
