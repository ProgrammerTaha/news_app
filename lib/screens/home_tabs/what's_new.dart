import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //
      // allow me when the content be bigger than the screen allow me to scroll through the screen and make it bigger not scroll the items inside the app and it is the same as the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _drawHeader(),
          Container(
            color: Hexcolor('fafafa'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _drawTopStories(),
                _drawTopStoriesCards(),
                _drawRecentUpdates(),
                _drawRecentUpdatesCards('SPORT', Hexcolor('ff5722'),
                    "Vettel is Ferrari Number One - Hamilton"),
                _drawRecentUpdatesCards('LIFESTYLE', Hexcolor('afb42b'),
                    "The City in Pakistan that Loves a British HairStyles"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _titleStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
    TextStyle _descriptionStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      //
      // Media Query will let me be flexible in the sizes so it will take the whole width and the whole height but I can determine the percent it will take
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "How Terriers & Royals Gatecrashed Final",
                style: _titleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
                style: _descriptionStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawTopStories() {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        top: 15,
      ),
      child: Text(
        "Top Stories",
        style: TextStyle(
          color: Hexcolor("616161"),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _drawTopStoriesCards() {
    return Padding(
      padding: EdgeInsets.only(
        right: 5,
        left: 5,
        top: 5,
      ),
      child: Card(
        child: Column(
          children: [
            _drawSingleCard(),
            _rowDevider(),
            _drawSingleCard(),
            _rowDevider(),
            _drawSingleCard(),
            // Padding(),
          ],
        ),
      ),
    );
  }

  Widget _drawSingleCard() {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            height: 100,
            child: Image(
              image: ExactAssetImage('assets/images/1.jpg'),
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
                      "The World Global Warming Annual Summit",
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
                        "Michael Adams",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_rounded, color: Colors.grey,),
                          Text(
                            "20 min",
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

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        top: 15,
      ),
      child: Text(
        "Recent Updates",
        style: TextStyle(
          color: Hexcolor("616161"),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _drawRecentUpdatesCards(String flag, Color color, String title) {
    return Padding(
      padding: EdgeInsets.only(
        right: 5,
        left: 5,
        top: 5,
      ),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/images/1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 100,
                height: 23,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    flag,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 10,
              ),
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 8,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 4,),
                    child: Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "20 min",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
