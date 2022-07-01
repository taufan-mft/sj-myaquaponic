import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myaquaponic/start.dart';

class TanamanPages extends StatefulWidget {
  @override
  State<TanamanPages> createState() => _TanamanPagesState();
}

class _TanamanPagesState extends State<TanamanPages> {
  @override
  // bool value = false;
  // final dbRef = FirebaseDatabase.instance.reference();

  // onUpdate() {
  //   setState(() {
  //     value = !value;
  //   });
  // }

  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.reference().child("distance");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Tanaman",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue.shade300,
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
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.asset("images/kangkung.png",
                              width: 200, height: 200),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 40),
                              //   child: Text(
                              //     "Hari ke",
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.normal, fontSize: 18),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 5, left: 10),
                              //   child: Text(
                              //     "30",
                              //     style: TextStyle(
                              //         fontSize: 25, fontWeight: FontWeight.w800),
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Tinggi Tanaman",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 0),
                                child: Text(
                                  snapshot.value.toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // FloatingActionButton.extended(
                              //   onPressed: () {
                              //     onUpdate();
                              //     writeData();
                              //   },
                              //   label: value ? Text('ON') : Text('OFF'),
                              //   elevation: 20,
                              //   backgroundColor:
                              //       value ? Colors.blue : Colors.grey,
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, left: 10),
                                child: snapshot.value > 25
                                    ? Text(
                                        "PANEN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 25),
                                      )
                                    : Text("BELUM PANEN",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 25)),
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.only(top: 20, left: 80),
                              //   child: Text(
                              //     "Larutan Down",
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.normal, fontSize: 18),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 5, left: 10),
                              //   child: Text(
                              //     "OFF",
                              //     style: TextStyle(
                              //         fontSize: 25, fontWeight: FontWeight.w800),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30),
                    //   child: Text(
                    //     "Lihat pertumbuhan tanamanmu melalui kamera",
                    //     style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10.0),
                    //   child: Container(
                    //       width: 150,
                    //       height: 50,
                    //       child: TextButton(
                    //         style: TextButton.styleFrom(
                    //             shape: StadiumBorder(),
                    //             backgroundColor: Colors.yellow),
                    //         onPressed: () {
                    //           Navigator.push(context,
                    //               MaterialPageRoute(builder: (context) {
                    //             return StartPages();
                    //           }));
                    //         },
                    //         child: Text(
                    //           "Lihat Tanamanku",
                    //           style: TextStyle(color: Colors.black, fontSize: 14),
                    //         ),
                    //       )),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
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

  // Future<void> writeData() async {
  //   // dbRef.child("Node1").set({"distance:": 0});
  //   dbRef.child("LightState").set({"switch": !value});
  // }
}
