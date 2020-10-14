import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home_screen.dart';
import 'screens/onboarding.dart';
import 'utilities/app_theme.dart';

/*
search for question that while debugging the app not found in the mobile when emulate it
*/ //todo: important to search

//
// Naming screens must be according the designs of it, for example when make the first screen which is welcome screen you can name it that or onboarding or walkthrough and it is the screen tha work only once

main() async {
//
  // main responsible for starting dart

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //we used .getInstance() to say that in the whole life of app there is one copy of this only and this is one of the solid principles
  //await means wait to apply this class to happen in the background while the app running so if we want to activate it we must give the main method async keyword
  //async and await tell processor to give us another thread line to work on with the thread line that the app work in because without the async and await the processor work only on one thread line which is the app itself

  bool seen = prefs.getBool('seen');
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = OnBoarding();
  } else {
    _screen = HomeScreen();
  }
  // we make a bool variable because we want to know if the screen seen by user or not through trying to get a boolean value true of false with .getBool
  //we made a condition to see if user see the screen or not

  runApp(NewsApp(_screen));
  //
  // runApp is responsible for starting flutter
}
    
class NewsApp extends StatelessWidget {
//every class must inherits from a widget
  //StatelessWidget is a widget does not contain a state ie while draw it on the screen it will not change and if we want it to change we must redraw it

  final Widget _screen;

  NewsApp(this._screen);

  @override
  Widget build(BuildContext context) {
    //
    // the root widget of the app
    return MaterialApp(
      //
      // MaterialApp is an advanced starting point instead of start from scratch to build the app
      debugShowCheckedModeBanner: false,
      home: this._screen,
      theme: AppTheme.appTheme,
      //
      // We use this to change the style and color of all the elements and make defaults
    );
  }
}
