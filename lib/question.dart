import 'package:flutter/material.dart';
import 'package:quizono/module/Post.dart';
import 'Oven_Trivia_Call.dart';
import 'ui/Result.dart';
import 'package:google_fonts/google_fonts.dart';

AsyncSnapshot snapshot_copy;

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
              activeColor: Colors.white,
              hoverColor: Colors.white,
              onChanged: (int newValue) {
                onChanged(newValue);
              },
            ),
            Text(
              label,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
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
int correct = 0;

class Question extends StatefulWidget {
  final String amount;
  final String category;
  final String difficulty;
  Question({Key key, this.amount, this.category, this.difficulty})
      : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder<List<Post>>(
              future: fetchPost(widget.category),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                snapshot_copy = snapshot;
                snapshot_copy.data[index].incorrectAnswers
                    .add(snapshot_copy.data[index].correctAnswer);
                snapshot_copy.data[index].incorrectAnswers.shuffle();
                return MyApp2();
              }),
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
            color: Color(0xff1a1c1e),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(20.0),
                    decoration: new BoxDecoration(
                        color: Color(0xff1a1c1e),
                        borderRadius:
                        new BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12, offset: Offset(2.0, 2.0)),
                          //shadow to container
                        ]),
                    child: Text(
                      snapshot_copy.data[index].question,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
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
                              color: Color(0xff414449), width: 2.0),
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
                                correct++;
                              }
                            });
                          },
                        ),
                        color: Color(0xff414449),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Color(0xff414449), width: 2.0),
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
                                 correct++;
                              }
                            });
                          },
                        ),
                        color: Color(0xff414449),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Color(0xff414449), width: 2.0),
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
                                 correct++;
                              }
                            });
                          },
                        ),
                        color: Color(0xff414449),
                      ),
                      Card(
                        margin: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 20.0),
                        shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Color(0xff414449), width: 2.0),
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
                                 correct++;
                              }
                            });
                          },
                        ),
                        color:Color(0xff414449),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const  EdgeInsets.fromLTRB(50, 10, 50, 10),
                          child: Card(
                            color: Color(0xff1a1c1e),
                            child: Text(
                              index < snapshot_copy.data.length - 1
                                  ? "Next"
                                  : "Submit",
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
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
                            index=0;
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