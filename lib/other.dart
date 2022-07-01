import 'package:flutter/material.dart';
import 'package:myaquaponic/dashboard.dart';
import 'package:myaquaponic/profile.dart';
import 'package:myaquaponic/start.dart';
import 'package:myaquaponic/tentangaplikasi.dart';
import 'package:myaquaponic/ubahpassword.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Text(
              'Lainnya',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(
            height: 15,
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage();
              }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text('Profil Kami',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UbahPassword();
              }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text('Spesifikasi',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AboutApp();
              }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text('Tentang Aplikasi',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Divider(
            height: 30,
            thickness: 2,
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return Dashboard();
          //     }));
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          //         child: Text('Keluar',
          //             style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w500,
          //                 color: Colors.grey)),
          //       ),
          //       Icon(
          //         Icons.arrow_forward_ios,
          //         color: Colors.grey,
          //       ),
          //     ],
          //   ),
          // ),
          // Divider(
          //   height: 15,
          //   thickness: 2,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StartPages();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout_sharp,
                    size: 30,
                  ),
                  // IconButton(
                  //   icon: Icon(
                  //     Icons.logout_sharp,
                  //     color: Color(0xff123456),
                  //     size: 30,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) {
                  //       return StartPages();
                  //     }));
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Keluar",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff123456),
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
