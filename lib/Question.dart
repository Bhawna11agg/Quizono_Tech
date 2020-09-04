import 'package:flutter/material.dart';
import 'main.dart';
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
          ),
        ],
      ),
    );
  }
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
              onChanged: (int newValue) {
                onChanged(newValue);
              },
            ),
            Text(label,
              style:TextStyle(
                color: Color(0xff794A97),
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
class  Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Expanded(
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
child: LabeledRadio(
label: snapshot.data[index].incorrectAnswers[3],
padding: const EdgeInsets.symmetric(
horizontal: 5.0),
value: 1,
groupValue: _character,
onChanged: (int value) {
setState(() {
_character = value;
if( snapshot.data[index].incorrectAnswers[3]== snapshot.data[index].correctAnswer){
count++;
}
});
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
child: LabeledRadio(
label: snapshot.data[index].incorrectAnswers[0],
padding: const EdgeInsets.symmetric(
horizontal: 5.0),
value: 2,
groupValue: _character,
onChanged: (int value) {
setState(() {
_character = value;
if( snapshot.data[index].incorrectAnswers[0]== snapshot.data[index].correctAnswer){
count++;
}
});
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
child: LabeledRadio(
label: snapshot.data[index].incorrectAnswers[1],
padding: const EdgeInsets.symmetric(
horizontal: 5.0),
value: 3,
groupValue: _character,
onChanged: (int value) {
setState(() {
_character = value;
if( snapshot.data[index].incorrectAnswers[1]== snapshot.data[index].correctAnswer){
count++;
}
});
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
child: LabeledRadio(
label: snapshot.data[index].incorrectAnswers[2],
padding: const EdgeInsets.symmetric(
horizontal: 5.0),
value: 4,
groupValue: _character,
onChanged: (int value) {
setState(() {
_character = value;
if( snapshot.data[index].incorrectAnswers[2]== snapshot.data[index].correctAnswer){
count++;
}
});
},
),
),
GestureDetector(
child:Container(
padding: EdgeInsets.all(10.0),
margin: EdgeInsets.all(15.0),
decoration: new BoxDecoration(
color: Colors.white,
borderRadius: new BorderRadius.all(
Radius.circular(10.0)),
boxShadow: [
BoxShadow(color: Colors.black12,
offset: Offset(2.0, 2.0)),
//shadow to container
]
),
child:Text(
"Submit",
style: TextStyle(
color: Color(0xff794A97),
fontSize: 20.0,
fontWeight: FontWeight.bold,
),
) ,
//color: Colors.orange,
),
onTap: (){
_character=-1;
index++;
if(index<=8)
Navigator.push(
context,
MaterialPageRoute(builder: (context) => MyApp()),
);
},
),
],
),
],
),
),
),
),
  }
}
