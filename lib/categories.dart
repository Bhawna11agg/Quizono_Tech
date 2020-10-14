import 'package:flutter/material.dart';
import 'package:quizono/question.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> names = [
    "Books",
    "Films",
    "Music",
    "Science",
    "Sports",
    "Celebrity",
  ];
  List<String> category = ["10", "11", "12", "17", "21", "26"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff1a1c1e),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30),),
        ),
        title: Text(
                "Categories",
               style: GoogleFonts.openSans(
                   textStyle: TextStyle(
                     color: Colors.white,
                ),
               ),
        ),
      ),
      backgroundColor: Color(0xff1a1c1e),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: category.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 12.0, mainAxisSpacing: 12.0),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  var route = new MaterialPageRoute(
                      builder: (BuildContext buildContext) {
                       return new Question(
                            amount: "10",
                            category: category[index],
                            difficulty: "easy");
                      });
                  Navigator.push(context, route);
                },
                child: new GridTile(
                    child: Card(
                      color: Color(0xff414449),
                       child: Center(
                            child: Text(names[index],
                              style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                  color: Color(0xffa6aab0),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                    )
                ),
              );
            },
          )),
    );
  }
}