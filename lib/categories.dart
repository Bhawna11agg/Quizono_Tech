import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> images = [
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
    "https://placeimg.com/500/500/any",
  ];
  List<String> names = [
    "Books",
    "Films",
    "Music",
    "Science",
    "Sports",
    "Art",
    "Celebrity",
    "Politics"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _settingModalBottomSheet(context);
                },
                child: new GridTile(
                    child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Container(
                          width: 120.0,
                          height: 120.0,
                          child: Image.network(images[index])),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Center(
                        child: Text(names[index]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                )),
              );
            },
          )),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new ListTile(
                    title: Text('Number of Questions'),
                    onTap: () => {},
                  ),
                ],
              ),
              new ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Text('Level of Difficulty'),
                  ],
                ),
                onTap: () => {},
              ),
            ],
          ),
        );
      });
}
