import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Books"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Films"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Music"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Science"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Sports"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Art"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Celebrity"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _settingModalBottomSheet(context);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Center(
                          child: Text("Politics"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                title: Text('Number of Questions'),
                onTap: () => {},
              ),
              new ListTile(
                title: new Text('Level of Difficulty'),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}
