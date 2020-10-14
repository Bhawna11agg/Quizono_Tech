import 'package:flutter/material.dart';

import 'file:///C:/Users/Bhawna%20Aggarwal/Desktop/quizono/lib/ui/categories.dart';
import 'file:///C:/Users/Bhawna%20Aggarwal/Desktop/quizono/lib/ui/question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Categories(),
        ),
      ),
    );
  }
}