import 'dart:math';

import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Color> colorList = [
    Colors.tealAccent,
    Colors.amber,
    Colors.brown,
    Colors.cyan,
    Colors.deepPurpleAccent,
    Colors.limeAccent,
  ];
  Random random = Random();

  Color _getRandomColor() {
    return colorList[random.nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            child: Column(
              children: [
                _authorRow(
                  "assets/images/1.jpg",
                  "Michael Adams",
                  15,
                  "Lifestyle",
                ),
                _newRow(
                  "assets/images/1.jpg",
                  "Tech Tent: Old phones and safe social",
                  "We also talk about the future of of work as the robots advance, and we ask whether a retro phone",
                ),
                _rowDevider(),
                _authorRow(
                  "assets/images/1.jpg",
                  "Michael Adams",
                  15,
                  "Techno",
                ),
                _newRow(
                  "assets/images/1.jpg",
                  "Google AI Defeats Human Go Champions",
                  "We also talk about the future of of work as the robots advance, and we ask whether a retro phone",
                ),
                _rowDevider(),
                _authorRow(
                  "assets/images/1.jpg",
                  "Michael Adams",
                  15,
                  "Bussiness",
                ),
                _newRow(
                  "assets/images/1.jpg",
                  "Thousands hit as glitch halts BA flights",
                  "We also talk about the future of of work as the robots advance, and we ask whether a retro phone",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _authorRow(String image, String author, int minutes, String category) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 10,
        top: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.0,
                        right: 15.0,
                      ),
                      child: Text(
                        author,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "$minutes min",
                            style: TextStyle(
                              color: Colors.grey,
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
                            category,
                            style: TextStyle(
                              color: _getRandomColor(),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_outline_sharp,
              size: 30,
              color: Colors.grey,
            ),
            // ),
          ),
        ],
      ),
    );
  }

  Widget _newRow(String image, String title, String description) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 70,
          ),
          child: Container(
            width: 125,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Transform.translate(
            offset: Offset(0, -15),
            child: Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _rowDevider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade300,
    );
  }
}
