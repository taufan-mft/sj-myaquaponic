import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myaquaponic/Kamera.dart';
import 'package:myaquaponic/dashboard.dart';

import 'package:myaquaponic/other.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List<Widget> _listPages = [
    Dashboard(),
    // LoadFirbaseStorageImage(),
    CameraPage(),
    // ImageGrid(),
    OtherPage(),
  ];

  // int currentIndex = 0;

  // List listOfColors = [
  //   Container(
  //     color: Colors.blueAccent,
  //   ),
  //   Container(
  //     color: Colors.redAccent,
  //   ),
  //   Container(
  //     color: Colors.orangeAccent,
  //   ),
  //   Container(
  //     color: Colors.cyanAccent,
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listPages[_page],
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Dashboard"),
            TabData(iconData: Icons.camera_alt_outlined, title: "Kamera"),
            TabData(iconData: Icons.grid_view, title: "Lainnya")
          ],
          onTabChangedListener: (position) {
            setState(() {
              _page = position;
            });
          },
        ));
  }
}
