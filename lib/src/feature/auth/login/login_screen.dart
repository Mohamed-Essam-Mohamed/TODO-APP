// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/src/feature/auth/register/register_screen.dart';
import 'package:todo_app/src/feature/auth/widget/password_textformfield.dart';
import 'package:todo_app/src/feature/auth/widget/sign_textformfield.dart';
import 'package:todo_app/src/feature/home_screen/home_screen.dart';
import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';
import 'package:todo_app/src/widget/cutom_button_sign_with.dart';
import 'package:todo_app/src/widget/my_divider.dart';

import 'package:todo_app/src/widget/custom_button.dart';
import 'package:todo_app/dialog_utils.dart' as Utils;

class loginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController email =
      TextEditingController(text: 'esammww.com@gmail.com');

  TextEditingController password = TextEditingController(text: 'Mohamed@2003');

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 35.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Login",
                style: AppTextStyle.textStyle32
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: AppColors.kSecondary,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              SignTextFormField(
                hintText: 'Enter your Email',
                controller: email,
                validator: (text) {
                  if (text!.isEmpty) {
                    return "please enter email";
                  }
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: AppColors.kSecondary,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              PasswoedTextFormField(
                hintText: 'Enter your password',
                controller: password,
                validator: (text) {
                  if (text!.isEmpty) {
                    return "please enter password";
                  }
                },
              ),
              SizedBox(
                height: 45.h,
              ),
              CustomButton(
                title: "Login",
                press: () {
                  login();
                },
                backgroundColor: AppColors.colorBottom,
                width: 0.w,
              ),
              SizedBox(
                height: 25.h,
              ),
              MyDivider(),
              SizedBox(
                height: 26.h,
              ),
              CustomButtonSignWith(
                svgPath: 'assets/svg/google.svg',
                title: "Login whith Google",
                onPressed: () {},
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButtonSignWith(
                svgPath: 'assets/svg/facebook.svg',
                title: "Login whith Facebok",
                onPressed: () {},
              ),
              // Spacer(),\
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account?",
                    style: AppTextStyle.textStyle16.copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RegisterScreen.routeName);
                    },
                    child: Text(
                      'Register',
                      style: AppTextStyle.textStyle16.copyWith(
                        color: AppColors.colorBottom,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    Utils.showLoading(context, 'Loading...');
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Utils.hideLoading(context);

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
        Utils.showSnackBar(
            context: context,
            message: 'Login Successfully',
            icon: Icon(Icons.done));
      }
    } on FirebaseAuthException catch (e) {
      print('${e.code.toString()} ???????????????????????????');
      Utils.hideLoading(context);
      Utils.showSnackBar(
          context: context,
          message: '${e.code.toString()}',
          icon: Icon(Icons.error),
          color: Colors.red);
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      //   Utils.hideLoading(context);
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      //   Utils.hideLoading(context);
      // }
    }
  }
}
