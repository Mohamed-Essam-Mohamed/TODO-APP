// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/src/feature/add_task/add_task.dart';
import 'package:todo_app/src/feature/auth/login/login_screen.dart';
import 'package:todo_app/src/feature/auth/register/register_screen.dart';
import 'package:todo_app/src/feature/home_screen/home_screen.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/src/feature/inboarding/inboard.dart';
import 'package:todo_app/src/provider/provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: App.routeName,
          routes: {
            FochOnboardingView.routeName: (context) => FochOnboardingView(),
            HomeScreen.routeName: (context) => HomeScreen(),
            AddTask.routeName: (context) => AddTask(),
            App.routeName: (context) => App(),
            loginScreen.routeName: (context) => loginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
          },
        );
      },
    );
  }
}
