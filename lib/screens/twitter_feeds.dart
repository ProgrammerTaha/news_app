import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  TwitterFeeds({Key key}) : super(key: key);

  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
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
          'Twitter Feeds',
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
                _newCard(
                  "assets/images/1.jpg",
                  "Christina Meyers",
                  "@ch_meyers",
                  "Fri, 12 May 2017",
                  "14.30",
                  "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
                ),
                _newCard(
                  "assets/images/3.jpg",
                  "Thomas Montgomery",
                  "@thomas",
                  "Fri, 12 May 2017",
                  "14.30",
                  "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
                ),
                _newCard(
                  "assets/images/8.jpg",
                  "Jared Adams",
                  "@AdamsJared",
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

  Widget _newCard(
    String image,
    String author,
    String idName,
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
              children: [
                CircleAvatar(
                  backgroundImage: ExactAssetImage(image),
                  radius: 25,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 13,
                      ),
                      child: Row(
                        children: [
                          Text(
                            author,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                            ),
                            child: Text(
                              idName,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        -21,
                        6,
                      ),
                      child: Row(
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
                bottom: 15,
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
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.repeat,
                        color: color,
                        size: 35,
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
                Row(
                  children: [
                    FlatButton(
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          color: color,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text(
                        "OPEN",
                        style: TextStyle(
                          color: color,
                          fontSize: 18,
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
