import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared_ui/navigation_drawer.dart';
import "home_tabs/favorites.dart";
import "home_tabs/popular.dart";
import "home_tabs/what's_new.dart";

class HomeScreen extends StatefulWidget {
  //stateful has a state and it is the object that used to follow the changes in the screen and stateless does not have a state
  //stateless if I want to change something I must to redraw all of it from scratch
  //stateful so we add a change and benefit from the old draw without drawing all of the draw from scratch only adding the change
  //while home screen extends from a stateful widget and a stateful widget force us to use a class contain a state which is createState
  @override
  _HomeScreenState createState() => _HomeScreenState();
//
// so createState force me to create a new copy of homescreenState class so homescreen can follow the state through extending from the state that have special properties allow it to follow the state
}

enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //to extend from more than 1 class we use with keyword
  //
  // State is a special widget has special properties allow it to follow the state and it will be of type homescreen

  TabController _tabController;

  //
  // I create a variable to control the tabs

  @override
  void initState() {
    //
    // I extend it from the state and use it only if I want to create the state that follow the state of tabs and we make it here to make it following thee state automatically
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    //the screen updates 60f/s so to updates from one frame to another we need a ticker provider and we can use it through extending from SingleTickerProviderStateMixin and this allow us to follow state 60f/s
    //vsync tell me who will update the state 60f/s and I tell him this means initState and to have ability to tell me it need the class to extend from which is SingleTickerProviderStateMixin
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        // The default color is blue unless we change it in theme
        title: Text(
          'Explore',
          style: TextStyle(color: Hexcolor('ffffff')),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _popOutMenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "WHAT'S NEW",
            ),
            Tab(
              text: "POPULAR",
            ),
            Tab(
              text: "FAVORITES",
            ),
          ],
          controller: _tabController,
        ),
        //
        // here I made a tab bar and I put it in the bottom of the appbar because it contains of action, bottom, drawer and I use the tabs which take a list of the tabs and then used the controller to control the tabs but out side of the tabs property
      ),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
            Favorites(),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text(
              "About",
            ),
            value: PopOutMenu.ABOUT,
          ),
          PopupMenuItem(
            child: Text(
              "Help",
            ),
            value: PopOutMenu.HELP,
          ),
          PopupMenuItem(
            child: Text(
              "Contact",
            ),
            value: PopOutMenu.CONTACT,
          ),
          PopupMenuItem(
            child: Text(
              "Setings",
            ),
            value: PopOutMenu.SETTINGS,
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {},
      icon: Icon(Icons.more_vert),
      offset: Offset(0,300),
    );
  }
}
