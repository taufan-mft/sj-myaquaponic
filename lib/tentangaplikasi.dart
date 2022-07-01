import 'package:flutter/material.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            )),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Text(
            //     'Tentang Aplikasi',
            //     style: TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.blue),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                "images/logo.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('My Aquaponic',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 40, right: 40),
              child: Text(
                'My Aquaponic merupakan sebuah aplikasi android yang dapat memantau kualitas air ikan dan pertumbuhan tanaman kangkung.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
              child: Text(
                'My Aquaponic dapat memantau, ph, suhu, ketinggian air, pakan ikan, ketinggian tanaman dan melihat tanaman melalui kamera',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          ],
        ),
      )),
    );
  }
}
