import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myaquaponic/dashboard.dart';
import 'package:myaquaponic/login.dart';
import 'package:myaquaponic/registrasi.dart';
import 'package:myaquaponic/src/screens/google_signin.dart';
import 'package:myaquaponic/src/screens/logins.dart';
import 'package:myaquaponic/src/screens/register.dart';
import 'package:provider/provider.dart';

class StartPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                "images/akuaponik.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 60.0, right: 60.0),
              child: Text(
                "My Aquaponic",
                style: TextStyle(
                    color: Color(0xff123456),
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "NunitoSans"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 40.0, right: 40.0),
              child: Text(
                "Amati budidaya tanaman dan ikan milikmu dalam satu aplikasi ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff123456),
                    fontSize: 16.0,
                    fontFamily: "NunitoSans"),
              ),
            ),
            SafeArea(
              top: false,
              bottom: true,
              child: Container(
                  width: 380,
                  height: 50,
                  margin: EdgeInsets.only(top: 40, right: 30, left: 30),
                  child: TextButton(
                    // icon: Icon(
                    //   Icons.email_outlined,
                    //   color: Colors.black,
                    // ),
                    style: TextButton.styleFrom(
                        shape: StadiumBorder(), backgroundColor: Colors.yellow),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ),
                  )),
            ),
            SafeArea(
              top: false,
              bottom: true,
              child: Container(
                  width: 380,
                  height: 50,
                  margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      side: BorderSide(
                        width: 1.5,
                        color: Colors.blue,
                      ),
                    ),
                    // icon: FaIcon(
                    //   FontAwesomeIcons.google,
                    //   color: Colors.red,
                    // ),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()));
                    },
                    child: Text(
                      "Daftar Baru",
                      style: TextStyle(
                          color: Color(0xff123456),
                          fontSize: (16.0),
                          fontFamily: "NunitoSans",
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
