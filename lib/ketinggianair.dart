import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class AirPages extends StatefulWidget {
  const AirPages({Key? key}) : super(key: key);

  @override
  State<AirPages> createState() => _AirPagesState();
}

class _AirPagesState extends State<AirPages> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.reference().child("waterlevel");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Ketinggian Air",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        ),
      ),
      body: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 30),
                          child: Image.asset("images/air2.png",
                              width: 130, height: 130),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 30),
                          child: Column(
                            children: [
                              // if (snapshot.value <= 2) ...[
                              //   Text("ON"),
                              // ] else ...[
                              //   Text("OFF")
                              // ],
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  "Ketinggian Air",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 20),
                                child: Text(
                                  snapshot.value.toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 30),
                                child: Text(
                                  "Status Pompa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 5, left: 30),
                              //   child: Text(
                              //     "ON",
                              //     style: TextStyle(
                              //         fontSize: 25,
                              //         fontWeight: FontWeight.w800),
                              //   ),
                              // ),

                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 30),
                                child: snapshot.value >= 2
                                    ? Text(
                                        "ON",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 25),
                                      )
                                    : Text("OFF",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 25)),
                              ),

                              // Center(
                              //     child: snapshot.value <= 2
                              //         ? Text("ON",
                              //             style: TextStyle(
                              //                 fontSize: 45,
                              //                 fontWeight: FontWeight.w800))
                              //         : Text("OFF"))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset("images/parametersuhu.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20),
                      child: Image.asset(
                        "images/grafiksuhu.png",
                        width: MediaQuery.of(context).size.height / 1,
                        height: MediaQuery.of(context).size.height / 3,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
