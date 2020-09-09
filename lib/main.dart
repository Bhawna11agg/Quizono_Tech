import 'package:flutter/material.dart';

import 'package:quizono/categories.dart';
import 'package:quizono/question.dart';

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
      title: 'hi',
      home: SafeArea(
        child: Scaffold(
          body: Categories(),
        ),
      ),
    );
  }
}
