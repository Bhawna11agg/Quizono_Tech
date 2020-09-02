import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}
Future<List<Post>> fetchPost() async {
  final response = await http.get('https://quizapi.io/api/v1/questions?apiKey=k5ADHozGxgWj6zmb6xNCW13gOCxtFBQ1HapJkHzR&category=sql&difficulty=Easy&limit=10');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((post) => new Post.fromJson(post)).toList();
  }
  else {
    throw Exception('Failed to load ');
  }
}
class Post {
  String question;
  Answers answers;
  Post({this.question,this.answers});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      question: json['question'],
      answers: Answers.fromJson(json['answers']),
     // question: json['question'],
    );
  }
}
class Answers{
  String answer_a;
  String answer_b;
  String answer_c;
  String answer_d;
  Answers({this.answer_a,this.answer_b,this.answer_c,this.answer_d});
  factory Answers.fromJson(Map<String, dynamic> json){
   return Answers( answer_a:json['answer_a'],
    answer_b:json['answer_b'],
    answer_c:json['answer_c'],
    answer_d:json['answer_d'],
   );
  }
}
class LinkedLabelRadio extends StatelessWidget {
  const LinkedLabelRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Radio<bool>(
              groupValue: groupValue,
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              }),
          RichText(
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: Color(0xff794A97),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print('Label has been tapped.');
              },
          ),
        ],
      ),
    );
  }
}

bool _character = false;
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hi',
      home: SafeArea(
        child: Scaffold(
          body: FutureBuilder<List<Post>>(
              future: fetchPost(),
              builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        else {
                          return Expanded(
                            child: Container(
                              color: Colors.pinkAccent,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      margin: EdgeInsets.all(20.0),
                                      decoration: new BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: new BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(color: Colors.black12,
                                                offset: Offset(2.0, 2.0)),
                                            //shadow to container
                                          ]
                                      ),
                                      child:Text(
                                        snapshot.data[index].question,
                                        style: TextStyle(
                                          color: Color(0xff794A97),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ) ,
                                      //color: Colors.orange,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Card(
                                          margin: EdgeInsets.fromLTRB(
                                              40.0, 0.0, 40.0, 10.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0),
                                          ),
                                          child:  LinkedLabelRadio(
                                            label: snapshot.data[index].answers.answer_a,
                                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                                            value: true,
                                            groupValue: _character,
                                            onChanged: (bool newValue) {
                                                _character = newValue;
                                            },
                                          ),
                                        ),
                                        Card(
                                          margin: EdgeInsets.fromLTRB(
                                              40.0, 0.0, 40.0, 10.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0),
                                          ),
                                          child:  LinkedLabelRadio(
                                            label: snapshot.data[index].answers.answer_a,
                                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                                            value: true,
                                            groupValue: _character,
                                            onChanged: (bool newValue) {
                                              _character = newValue;
                                            },
                                          ),
                                        ),

                                        Card(
                                          margin: EdgeInsets.fromLTRB(
                                              40.0, 0.0, 40.0, 10.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0),
                                          ),
                                          child:  LinkedLabelRadio(
                                            label: snapshot.data[index].answers.answer_a,
                                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                                            value: true,
                                            groupValue: _character,
                                            onChanged: (bool newValue) {
                                              _character = newValue;
                                            },
                                          ),
                                        ),
                                        Card(
                                          margin: EdgeInsets.fromLTRB(
                                              40.0, 0.0, 40.0, 10.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0),
                                          ),
                                          child:  LinkedLabelRadio(
                                            label: snapshot.data[index].answers.answer_a,
                                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                                            value: true,
                                            groupValue: _character,
                                            onChanged: (bool newValue) {
                                              _character = newValue;
                                            },
                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      }
                  );
              }
          ),
        ),
      ),
    );
  }
}
