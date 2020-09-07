import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizono/category.dart';

void main() {
  runApp(MyApp());
}

Future<List<Post>> fetchPost() async {
  final response = await http.get(
      'https://opentdb.com/api.php?amount=10&category=27&difficulty=easy&type=multiple');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)["results"];
    return jsonResponse.map((post) => new Post.fromMap(post)).toList();
  } else {
    throw Exception('Failed to load ');
  }
}

AsyncSnapshot snapshot_copy;

class Post {
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Post({this.question, this.correctAnswer, this.incorrectAnswers});

  Post.fromMap(Map<String, dynamic> data)
      : question = data["question"],
        correctAnswer = data["correct_answer"],
        incorrectAnswers = data["incorrect_answers"];
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<int>(
              groupValue: groupValue,
              value: value,
              activeColor: Color(0xff039BE5),
              hoverColor: Colors.lightBlueAccent,
              onChanged: (int newValue) {
                onChanged(newValue);
              },
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int _character = -1;
int index = 0;
int count = 0;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hi',
      home: SafeArea(
        child: Scaffold(
          body: Category(),
          // body: FutureBuilder<List<Post>>(
          //       future: fetchPost(),
          //     builder:(context,snapshot) {
          //             if (!snapshot.hasData) {
          //               return Center(child: CircularProgressIndicator());
          //             }
          //               snapshot_copy=snapshot;
          //       snapshot_copy.data[index].incorrectAnswers.add(snapshot_copy.data[index].correctAnswer);
          //       snapshot_copy.data[index].incorrectAnswers.shuffle();
          //               return MyApp2();
          //     }
          // ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Expanded(
          child: Container(
            color: Color(0xff01010D),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(20.0),
                    decoration: new BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12, offset: Offset(2.0, 2.0)),
                          //shadow to container
                        ]),
                    child: Text(
                      snapshot_copy.data[index].question,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //color: Colors.orange,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Color(0xff89CFF0), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: LabeledRadio(
                          label: snapshot_copy.data[index].incorrectAnswers[3],
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 1,
                          groupValue: _character,
                          onChanged: (int value) {
                            setState(() {
                              _character = value;
                              if (snapshot_copy
                                      .data[index].incorrectAnswers[3] ==
                                  snapshot_copy.data[index].correctAnswer) {
                                // count++;
                              }
                            });
                          },
                        ),
                        color: Color(0xff01010D),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Color(0xff89CFF0), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: LabeledRadio(
                          label: snapshot_copy.data[index].incorrectAnswers[0],
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 2,
                          groupValue: _character,
                          onChanged: (int value) {
                            setState(() {
                              _character = value;
                              if (snapshot_copy
                                      .data[index].incorrectAnswers[0] ==
                                  snapshot_copy.data[index].correctAnswer) {
                                // count++;
                              }
                            });
                          },
                        ),
                        color: Color(0xff01010D),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Color(0xff89CFF0), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: LabeledRadio(
                          label: snapshot_copy.data[index].incorrectAnswers[1],
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 3,
                          groupValue: _character,
                          onChanged: (int value) {
                            setState(() {
                              _character = value;
                              if (snapshot_copy
                                      .data[index].incorrectAnswers[1] ==
                                  snapshot_copy.data[index].correctAnswer) {
                                // count++;
                              }
                            });
                          },
                        ),
                        color: Color(0xff01010D),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Color(0xff89CFF0), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: LabeledRadio(
                          label: snapshot_copy.data[index].incorrectAnswers[2],
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 4,
                          groupValue: _character,
                          onChanged: (int value) {
                            setState(() {
                              _character = value;
                              if (snapshot_copy
                                      .data[index].incorrectAnswers[2] ==
                                  snapshot_copy.data[index].correctAnswer) {
                                //  count++;
                              }
                            });
                          },
                        ),
                        color: Color(0xff01010D),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          margin: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          decoration: new BoxDecoration(
                              color: Color(0xff039BE5),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(25.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(2.0, 2.0)),
                                //shadow to container
                              ]),
                          child: Text(
                            index < snapshot_copy.data.length - 1
                                ? "Next"
                                : "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          _character = -1;
                          if (index < snapshot_copy.data.length) {
                            index++;
                            snapshot_copy.data[index].incorrectAnswers
                                .add(snapshot_copy.data[index].correctAnswer);
                            snapshot_copy.data[index].incorrectAnswers
                                .shuffle();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyApp2()),
                            );
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Result()));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 50.0,
            height: 20.0,
            child: Text(
              "Hurray",
            ),
          ),
        ),
      ),
    );
  }
}
