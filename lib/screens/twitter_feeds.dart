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
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 5,
              bottom: 5,
            ),
            child: Card(
              child: Column(
                children: [
                  _authorRow(
                    "assets/images/1.jpg",
                    "Christina Meyers",
                    "@ch_meyers",
                    "Fri, 12 May 2017",
                    "14.30",
                  ),
                  _sentenceRow(
                    "We also talk about the future of work as the robots advance, and we ask whether a retro phone",
                  ),
                  _rowDevider(),
                  _iconsRow(),
                ],
              ),
            ),
          );
        },
      ),
      drawer: NavigationDrawer(),
    );
  }

  Widget _authorRow(
    String image,
    String author,
    String idName,
    String date,
    String hour,
  ) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
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
                        Transform.translate(
                          offset: Offset(0, -6),
                          child: Text(
                            " . ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
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
        ],
      ),
    );
  }

  Widget _sentenceRow(
    String description,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: 7,
        right: 10,
        top: 12,
        bottom: 18,
      ),
      child: Text(
        description,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _rowDevider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }

  Widget _iconsRow() {
    Color color = _getRandomColor();
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 14,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.ac_unit,
                color: color,
                size: 35,
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
          SizedBox(
            width: 130,
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
    );
  }
}
