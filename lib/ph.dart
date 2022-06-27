import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:myaquaponic/chart/chart.dart';
import 'package:myaquaponic/chart/chart_container.dart';
import 'package:myaquaponic/chart/line_chart.dart';

class PhPages extends StatefulWidget {
  State<PhPages> createState() => _PhPagesState();
}

class _PhPagesState extends State<PhPages> {
  late var dbR = FirebaseDatabase.instance.reference();

  // @override
  // void initState() {
  //   super.initState();

  //   _ref = FirebaseDatabase.instance.ref().child("Node1");
  // }

  @override
  Widget build(BuildContext context) {
    // var value;
    final ref = FirebaseDatabase.instance.reference().child("ph");
    // ref.once().then((DataSnapshot snapshot) {
    //   Map<dynamic, dynamic> values = snapshot.value;
    //   values.forEach((key, value) {
    //     print(values["ph"]);
    //   });
    // });
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "pH",
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
                            padding: const EdgeInsets.only(top: 30, left: 20),
                            child: Image.asset("images/ph2.png",
                                width: 150, height: 150),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 40, left: 5),
                                  child: Text(
                                    "pH",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(
                                    snapshot.value.toString(),
                                    // '${values}',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 5),
                                  child: Text(
                                    "Status",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 10),
                                  child: snapshot.value > 7
                                      ? Text(
                                          "Basa",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 25),
                                        )
                                      : Text("Asam",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 25)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                    "Larutan Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 20),
                                  child: snapshot.value > 7
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
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 20),
                                  child: Text(
                                    "Larutan Down",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 25),
                                  child: snapshot.value > 7
                                      ? Text(
                                          "OFF",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 25),
                                        )
                                      : Text("ON",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 25)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Image.asset("images/parametersuhu.png"),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 5, bottom: 20),
                      //   child: Image.asset(
                      //     "images/grafiksuhu.png",
                      //     width: MediaQuery.of(context).size.height / 1,
                      //     height: MediaQuery.of(context).size.height / 3,
                      //   ),
                      // )
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ChartPage(
                                title: 'Grafik',
                              );
                            }));
                          },
                          child: Text("Lihat grafik",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "NunitoSans")),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
