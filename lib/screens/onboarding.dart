import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pageModule.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //
  // We use it when we want to reuse a widget something without redraw it from scratch but if it is stateless we should redraw it from scratch to reuse it that means stateless you can not add the new thing you should recreate the old part and add to it the new one but stateful you can only add the new one and the old part will remain and do not need to recreate it
//circles not selected color="#70787b"
//circle selected color="#cc0001"

  List<PageModel> pages;

  //
  // we make as this because it is now null and it does not have a state so it will not run until we give it a value
  static const IconData gem = const IconDataRegular(0xf3a5);

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  // static const IconData circle = const IconDataSolid(0xf52b);

//You should notice that if one of the elements in any list lost the screen that the index in will have an error
//so we should use the view module
  void _addPages() {
    pages = List<PageModel>();
    pages.add(PageModel(
      'Welcome!',
      'Making friends is easy as waving your hand back and forth in easy step.',
      gem,
      'assets/images/8.jpg',
    ));
    pages.add(PageModel(
      'You are in #2 page',
      '2- Making friends is easy as waving your hand back and forth in easy step.',
      Icons.ac_unit,
      'assets/images/1.jpg',
    ));
    pages.add(PageModel(
      'You are in #3 page',
      '3- Making friends is easy as waving your hand back and forth in easy step.',
      Icons.add_business_outlined,
      'assets/images/2.jpg',
    ));
    pages.add(PageModel(
      'You are in #4 page',
      '4- Making friends is easy as waving your hand back and forth in easy step.',
      Icons.airport_shuttle_rounded,
      'assets/images/3.jpg',
    ));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Scaffold(
      //
      // it will make the start easier for building a flutter app because it give us things

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //
      // elevation to rise the element up of the background an create a shadaw to the eye of client
      // ),
      body: Stack(
        children: [
          Container(
            color: Hexcolor('#263238'),
          ),
          PageView.builder(
            //
            // PageView is a multi-view screen and builder is a method and has properties
            itemBuilder: (context, index) {
              //
              // one of method properties is item builder and it takes context (the current content) and index
              //We use context because he want to know where they draw it? any widget any element and it comes from BuildContext class as in the widget build class
              //page view contains multiple screens so we use the index to call this method itemBuilder every time we add another screen view and because the multi screen are a list so we use the index
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(pages[index].image,),
                          fit: BoxFit.cover),
                    ),
                  ),
                  //the container can contain images through decoration then box decoration
                  //We should seperate all of our code by comma to allow the ide format the code correctly
                  //to import image and make it to the screen we should get the image in png then move it to the assets images we create then we write the code then add it to yaml file in assets section as assets/images/image-name.png
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //
                    // it aligns according to the other widgets
                    mainAxisAlignment: MainAxisAlignment.center,
                    //
                    // it aligns according to its content
                    children: [
                      Transform.translate(
                        child: Icon(
                          pages[index].icon,
                          size: 100,
                          color: Hexcolor('#ffffff'),
                        ),
                        offset: Offset(0, -100),
                      ),
                      //
                      // to control the x and y of an element through controlling the offset
                      Text(
                        pages[index].title,
                        style: TextStyle(
                          color: Hexcolor('#ffffff'),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 35,
                          right: 35,
                          top: 15,
                          bottom: 30,
                        ),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            color: Hexcolor('#9e9e9e'),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            // itemCount: 4,
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
          Transform.translate(
            child: Align(
              alignment: Alignment.center,
              child: _displayPageIndicators(pages.length),
            ),
            offset: Offset(0, 100),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: SizedBox(
                //
                // he force the child to take the dimensions that he give them to him
                width: 380,
                // width: double.infinity,
                //if we put that it should take the whole width of the parent
                height: 50,
                child: RaisedButton(
                  color: Hexcolor('#cc0001'),
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Hexcolor('#ffffff'),
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          _updateSeen();
                          return HomeScreen();
                        },
                      ),
                    );
                    //with it I can navigate between screens of the app
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 12.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
    //
    // to serve the value true in the key seen to make the program know what to do if we get true
  }
}