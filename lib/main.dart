import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/feature/home_screen/home_screen.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/feature/inboarding/inboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FoochiOnboardingView.routeName,
      routes: {
        FoochiOnboardingView.routeName: (context) => FoochiOnboardingView(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
