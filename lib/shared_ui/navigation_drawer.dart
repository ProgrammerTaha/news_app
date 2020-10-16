import 'package:flutter/material.dart';
import '../models/nav_menu.dart';
import '../screens/headline_news.dart';
import '../screens/home_screen.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navigationMenu = [
    NavMenuItem("Explore", HomeScreen()),
    NavMenuItem("Headline News", HeadLineNews()),
    // NavMenuItem("Read Later", ),
    // NavMenuItem("Videos", ),
    // NavMenuItem("Photos", ),
    // NavMenuItem("Setting", ),
    // NavMenuItem("Logout", ),
  ];

  List<String> navMenu = [
    "Explore",
    "Headline News",
    "Read Later",
    "Videos",
    "Photos",
    "Setting",
    "Logout",
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 75,
          left: 24,
        ),
        child: ListView.builder(
          itemBuilder: (context, int index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navigationMenu[index].title,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade300,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return navigationMenu[index].destination;
                      },
                    ),
                  );
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
