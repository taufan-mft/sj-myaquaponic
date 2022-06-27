import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:myaquaponic/Kamera.dart';
import 'package:myaquaponic/ketinggianair.dart';
import 'package:myaquaponic/login.dart';
import 'package:myaquaponic/other.dart';
import 'package:myaquaponic/pakanikan.dart';
import 'package:myaquaponic/ph.dart';
import 'package:myaquaponic/src/screens/logins.dart';
import 'package:myaquaponic/start.dart';
import 'package:myaquaponic/suhu.dart';
import 'package:myaquaponic/tanaman.dart';

// int currentIndex = 0;
// final List<Widget> body = [
//   Dashboard(),
//   CameraPage(),
//   OtherPage(),
// ];

// void ontap(int index) {
//   setState(() {
//     currentIndex = index;
//   });
// }

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: ontap,
      //   currentIndex: currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_outlined,
      //         ),
      //         label: 'Beranda'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_outlined,
      //         ),
      //         label: 'Beranda'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home_outlined,
      //         ),
      //         label: 'Beranda')
      //   ],
      // ),
      // appBar: AppBar(
      //   // title: Text(
      //   //   "Dashboard",
      //   //   style: TextStyle(color: Colors.black),
      //   // ),
      //   backgroundColor: Colors.white,
      //   leading: IconButton(
      //     icon: GestureDetector(
      //       child: Icon(
      //         Icons.menu,
      //         color: Colors.black,
      //       ),
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //       FocusScope.of(context).requestFocus(new FocusNode());
      //     },
      //   ),
      // ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: true,
          top: true,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  color: Colors.grey.shade200,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 25),
                      child: Text("Halo!",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 20, left: 25),
                    //   child: Text("Mulai berbudidaya",
                    //       style: TextStyle(
                    //           fontSize: 16, fontWeight: FontWeight.bold)),
                    // ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 270),
                  child: Image.asset(
                    "images/tangan.png",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ),
                // ListTile(
                //   title: ('Mulai berbudidaya'),
                //   subtitle: ('melalui dashboard ini'),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 90, left: 25),
                      child: Text("Mulai berbudidaya",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 25),
                      child: Text("melalui dashboard ini",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 30),
                      child: Text("Dashboard",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 20, left: 25),
                    //   child: Text("Amati akuaponik kamu melalui dashboard ini",
                    //       style: TextStyle(fontSize: 16)),
                    // ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 25, left: 25),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlue.shade50),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SuhuPages();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xff2B50A3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    "images/suhu.png",
                                  ),
                                ),

                                Text(
                                  "Suhu",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Image.asset(
                                  "images/arrow.png",
                                  width: MediaQuery.of(context).size.width / 8,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                )
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 10),
                                //   child: Icon(
                                //     Icons.arrow_forward_ios,
                                //     size: 35,
                                //   ),
                                // )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 25, left: 25),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.teal.shade100),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PhPages();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xff2B50A3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Image.asset(
                                    "images/ph.png",
                                    width: 60,
                                  ),
                                ),
                                Text(
                                  "pH",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Image.asset(
                                  "images/arrow.png",
                                  width: MediaQuery.of(context).size.width / 8,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 25, left: 25),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyanAccent.shade400),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AirPages();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xff2B50A3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Image.asset(
                                    "images/air.png",
                                    width: 60,
                                  ),
                                ),
                                Text(
                                  "Ketinggian Air",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Image.asset(
                                  "images/arrow.png",
                                  width: MediaQuery.of(context).size.width / 8,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 25, left: 25),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlue.shade600),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return TanamanPages();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xff2B50A3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Image.asset("images/tanaman.png"),
                                ),
                                Text(
                                  "Tanaman",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Image.asset(
                                  "images/arrow.png",
                                  width: MediaQuery.of(context).size.width / 8,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 25, left: 25, bottom: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlue.shade900),
                        padding: const EdgeInsets.all(8),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PakanPages();
                              }));
                            },
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Color(0xff2B50A3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Image.asset("images/ikan.png"),
                                ),
                                Text(
                                  "Pakan Ikan",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Image.asset(
                                  "images/arrow.png",
                                  width: MediaQuery.of(context).size.width / 8,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   color: Colors.lightBlue,
      //   backgroundColor: Colors.white,
      //   buttonBackgroundColor: Colors.white,
      //   items: <Widget>[
      //     Icon(Icons.home_outlined, size: 30),
      //     Icon(Icons.camera_alt_outlined, size: 30),
      //     Icon(Icons.grid_view, size: 30),
      //   ],
      //   onTap: (index) {
      //     _onItemTapped(index);
      //   },
      // ),
      // drawer: DrawerWidget(),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Color(0xffFFDD00),
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return TambahAset();
      //       }));
      //     },
      //     child: Icon(Icons.add_outlined)),
    );
  }
}
