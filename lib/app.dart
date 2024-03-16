// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/feature/auth/login/login_screen.dart';
import 'package:todo_app/src/feature/auth/register/register_screen.dart';
import 'package:todo_app/src/utils/app_assests.dart';
import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';
import 'package:todo_app/src/widget/custom_button.dart';

class App extends StatelessWidget {
  const App({super.key});
  static const String routeName = "App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            height: 80.h,
          ),
          Text(
            'Welcome to UpTodo',
            style:
                AppTextStyle.textStyle32.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            'Please login to your account or create',
            style:
                AppTextStyle.textStyle16.copyWith(color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            'new account to continue',
            style:
                AppTextStyle.textStyle16.copyWith(color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),
          Container(
            // width: 212.w,
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
            child: Image.asset(
              AppAssets.kOnboardingFirst,
              fit: BoxFit.fill,
              height: 277.h,
              width: 212.w,
            ),
          ),
          Spacer(),
          CustomButton(
            title: "LOGIN",
            press: () {
              Navigator.of(context).pushNamed(loginScreen.routeName);
            },
            backgroundColor: AppColors.colorBottom,
            width: 20.w,
          ),
          SizedBox(
            height: 28.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterScreen.routeName);
              },
              height: 50.h,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: AppColors.colorBottom,
                ),
              ),
              child: Text(
                "CREATE ACCOUNT",
                style: AppTextStyle.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 67.h,
          ),
        ],
      ),
    );
  }
}
