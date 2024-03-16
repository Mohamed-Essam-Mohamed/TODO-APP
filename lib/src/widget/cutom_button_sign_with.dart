// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';

class CustomButtonSignWith extends StatelessWidget {
  String svgPath;
  String title;
  void Function()? onPressed;
  CustomButtonSignWith(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50.h,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.colorBottom,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath),
          SizedBox(
            width: 20.w,
          ),
          Text(
            title,
            style: AppTextStyle.textStyle16.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
