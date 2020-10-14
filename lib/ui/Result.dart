import 'package:flutter/material.dart';
import 'package:quizono/question.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}
class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: Card(
                color: Color(0xffA9A9A9),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        correct>=6 ?"Congratulations!!" : "Better Luck next time!",
                      style: TextStyle(
                        color: Color(0xff696969),
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                          correct>=6 ?"You have scored above 60% score" : "You have scored below 60% score",
                        style: TextStyle(
                          color: Color(0xff696969),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}