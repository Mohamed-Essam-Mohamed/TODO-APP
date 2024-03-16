// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/src/feature/auth/login/login_screen.dart';
import 'package:todo_app/src/feature/auth/widget/password_textformfield.dart';
import 'package:todo_app/src/feature/auth/widget/sign_textformfield.dart';
import 'package:todo_app/src/utils/app_colors.dart';
import 'package:todo_app/src/utils/app_text_style.dart';
import 'package:todo_app/src/widget/custom_button.dart';
import 'package:todo_app/src/widget/cutom_button_sign_with.dart';
import 'package:todo_app/src/widget/my_divider.dart';
import 'package:todo_app/dialog_utils.dart' as Utils;

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController userName = TextEditingController(text: 'Mohamed Esam');

  TextEditingController email =
      TextEditingController(text: 'esammww.com@gmail.com');

  TextEditingController password = TextEditingController(text: 'Mohamed@2003');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kBackground,
        appBar: AppBar(
          backgroundColor: AppColors.kBackground,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 35.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Register",
                    style: AppTextStyle.textStyle32
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Text(
                    'Username',
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
                    hintText: 'Enter your Username',
                    controller: userName,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'please enter username';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.h,
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
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email.text);
                      if (!emailValid) {
                        return 'enter valid email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 15.h,
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
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (!regex.hasMatch(text)) {
                        return 'enter valid password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    title: "Register",
                    press: () {
                      register();
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
                    onPressed: () async {},
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
                        "Already have an account?",
                        style: AppTextStyle.textStyle16.copyWith(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(loginScreen.routeName);
                        },
                        child: Text(
                          'Login',
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
        ));
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      Utils.showLoading(context, 'Loading...');
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        Utils.hideLoading(context);
        Navigator.of(context)
            .pushNamedAndRemoveUntil(loginScreen.routeName, (route) => false);

        Utils.showSnackBar(
          context: context,
          message: 'Register Successfully...',
          icon: Icon(
            Icons.done,
            color: Colors.white,
          ),
        );
      } on FirebaseAuthException catch (e) {
        Utils.hideLoading(context);
        Utils.showSnackBar(
            context: context,
            message: '${e.code.toString()}',
            icon: Icon(Icons.error),
            color: Colors.red);
        // if (e.code == 'weak-password') {
        //   Utils.showMessage(
        //     context,
        //     'The password provided is too weak.',
        //     'ok',
        //     (context) {
        //       Navigator.of(context).pop();
        //     },
        //   );
        //   print('The password provided is too weak.');
        // } else if (e.code == 'email-already-in-use') {
        //   Utils.showMessage(
        //     context,
        //     'The account already exists for that email.',
        //     'ok',
        //     (context) {
        //       Navigator.of(context).pop();
        //     },
        //   );
        //   print('The account already exists for that email.');
        // }
      } catch (e) {
        Utils.showMessage(
          context,
          'password or email invalid',
          'ok',
          (context) {
            Navigator.of(context).pop();
          },
        );
      }
    }
  }
  //? firebase auth with google
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   if (googleUser == null) {
  //     return Future.error('cansel login');
  //   }

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
}
