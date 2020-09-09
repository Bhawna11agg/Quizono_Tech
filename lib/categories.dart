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
  int _value = 0;
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
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        new Text('Number of Questions'),
                                        Wrap(
                                          alignment: WrapAlignment.center,
                                          spacing: 12.0,
                                          children: <Widget>[
                                            ChoiceChip(
                                              pressElevation: 0.0,
                                              selectedColor: Colors.transparent,
                                              backgroundColor: Colors.grey[100],
                                              label: Text("10"),
                                              selected: _value == 0,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _value = selected ? 0 : null;
                                                });
                                              },
                                            ),
                                            ChoiceChip(
                                              pressElevation: 0.0,
                                              selectedColor: Colors.transparent,
                                              backgroundColor: Colors.grey[100],
                                              label: Text("20"),
                                              selected: _value == 1,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _value = selected ? 1 : null;
                                                });
                                              },
                                            ),
                                            ChoiceChip(
                                              pressElevation: 0.0,
                                              selectedColor: Colors.transparent,
                                              backgroundColor: Colors.grey[100],
                                              label: Text("50"),
                                              selected: _value == 2,
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  _value = selected ? 2 : null;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    onTap: () => {
                                    },
                                  ),
                                ],
                              ),
                              new ListTile(
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    new Text('Level of Difficulty'),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 12.0,
                                      children: <Widget>[
                                        ChoiceChip(
                                          pressElevation: 0.0,
                                          selectedColor: Colors.transparent,
                                          backgroundColor: Colors.grey[100],
                                          label: Text("Low"),
                                          selected: _value == 0,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _value = selected ? 0 : null;
                                            });
                                          },
                                        ),
                                        ChoiceChip(
                                          pressElevation: 0.0,
                                          selectedColor: Colors.transparent,
                                          backgroundColor: Colors.grey[100],
                                          label: Text("Medium"),
                                          selected: _value == 1,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _value = selected ? 1 : null;
                                            });
                                          },
                                        ),
                                        ChoiceChip(
                                          pressElevation: 0.0,
                                          selectedColor: Colors.transparent,
                                          backgroundColor: Colors.grey[100],
                                          label: Text("Hard"),
                                          selected: _value == 2,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              _value = selected ? 2 : null;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () => {},
                              ),
                            ],
                          ),
                        );
                      });
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
