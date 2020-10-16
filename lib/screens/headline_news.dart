import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

import 'home_tabs/favorites.dart';
import 'home_tabs/popular.dart';

class HeadLineNews extends StatefulWidget {
  HeadLineNews({Key key}) : super(key: key);

  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        // The default color is blue unless we change it in theme
        title: Text(
          'Headline News',
          style: TextStyle(color: Hexcolor('ffffff')),
        ),
        centerTitle: false,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "FAVORATES",
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
            Favorites(),
            Popular(),
            Favorites(),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}
