import 'package:autobazzaar/components/navigation.dart';
import 'package:flutter/material.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized(); // ✅ Must be here

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Navigation());
  }
}


class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}