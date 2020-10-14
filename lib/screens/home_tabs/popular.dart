import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //
      // to make a list of things that have indexes
      itemCount: 20,
      //
      // itemCount is the number of indexes ie the items
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(
            right: 5,
            left: 5,
            top: 5,
          ),
          child: Card(
            child: Column(
              children: [
                _drawSingleCard(
                  "assets/images/1.jpg",
                  "The World Global Warming Annual Summit",
                  "Michael Adams",
                  20,
                ),
                _rowDevider(),
                // Padding(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _drawSingleCard(
      String image, String title, String author, int minutes) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            height: 100,
            child: Image(
              image: ExactAssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            //to take the rest space for itself and use it
            child: Column(
              children: [
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      bottom: 15,
                    ),
                    child: Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28,
                    right: 28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        author,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          Text(
                            "$minutes min",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _rowDevider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade200,
    );
  }
}
