import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
    CameraPage(),
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
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _page,
        onItemSelected: (index) {
          setState(() {
            _page = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.blueAccent,
            // inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            title: Text('Kamera'),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.grid_view),
            title: Text('Lainnya'),
          ),
        ],
      ),
    );
  }
}
