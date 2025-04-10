import 'package:autobazzaar/components/navigation.dart';
// import 'package:autobazzaar/presentation/screens/Home/home_main.dart';
// import 'package:autobazzaar/presentation/screens/login/splash_screen.dart';
// import 'package:autobazzaar/presentation/screens/login/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Navigation());
  }
}


