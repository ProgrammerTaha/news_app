import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  List<String> navMenu = [
    "Home",
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
                  navMenu[index],
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade300,
                ),
                onTap: () {},
              ),
            );
          },
          itemCount: 8,
        ),
      ),
    );
  }
}
