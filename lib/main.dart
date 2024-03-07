// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/feature/add_task/add_task.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        FochOnboardingView.routeName: (context) => FochOnboardingView(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddTask.routeName: (context) => AddTask(),
      },
    );
  }
}
