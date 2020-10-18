import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class FacebookFeeds extends StatefulWidget {
  FacebookFeeds({Key key}) : super(key: key);

  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  List<Color> colorList = [
    Colors.tealAccent,
    Colors.amber,
    Colors.brown,
    Colors.cyan,
    Colors.deepPurpleAccent,
    Colors.limeAccent,
    Colors.blue,
    Colors.cyan,
    Colors.green,
  ];
  Random random = Random();
  Color _getRandomColor() {
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Facebook Feeds',
          style: TextStyle(
            color: Hexcolor('ffffff'),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                _newImageCard(
                  "assets/images/1.jpg",
                  "Christina Meyers",
                  "Fri, 12 May 2017",
                  "14.30",
                  "We also talk about the future of work as the robots",
                  "#advance",
                  "#retro",
                  "#Facebook",
                  "assets/images/1.jpg",
                ),
                _newTextCard(
                  "assets/images/1.jpg",
                  "Jared Adams",
                  "Fri, 12 May 2017",
                  "14.30",
                  "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
                ),
              ],
            );
          }),
      drawer: NavigationDrawer(),
    );
  }

  Widget _newTextCard(
    String image,
    String author,
    String date,
    String hour,
    String description,
  ) {
    Color color = _getRandomColor();
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: ExactAssetImage(image),
                      radius: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                author,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                " · ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                hour,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: color,
                        size: 23,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "25",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 3,
                right: 7,
                top: 15,
                bottom: 10,
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey.shade300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: Text(
                    "10 COMMENTS",
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                ),
                Row(
                  children: [
                    FlatButton(
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          color: color,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text(
                        "OPEN",
                        style: TextStyle(
                          color: color,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _newImageCard(
    String image,
    String author,
    String date,
    String hour,
    String description,
    String tag1,
    String tag2,
    String tag3,
    String image2,
  ) {
    Color color = _getRandomColor();
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: ExactAssetImage(image),
                      radius: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                author,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                date,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                " · ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                hour,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: color,
                        size: 23,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      "25",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 3,
                right: 7,
                top: 15,
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-43, -10),
              child: Wrap(
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      tag1,
                      style: TextStyle(
                        fontSize: 15,
                        color: color,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      tag2,
                      style: TextStyle(
                        fontSize: 15,
                        color: color,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      tag3,
                      style: TextStyle(
                        fontSize: 15,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -10),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage(
                        image2,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  child: Text(
                    "10 COMMENTS",
                    style: TextStyle(
                      color: color,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {},
                ),
                Row(
                  children: [
                    FlatButton(
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          color: color,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text(
                        "OPEN",
                        style: TextStyle(
                          color: color,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
