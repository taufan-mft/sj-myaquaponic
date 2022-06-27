import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_progress_type.dart';

class SuhuPages extends StatefulWidget {
  const SuhuPages({Key? key}) : super(key: key);

  @override
  State<SuhuPages> createState() => _SuhuPagesState();
}

class _SuhuPagesState extends State<SuhuPages> {
  // bool isLoading = false;
  final ref = FirebaseDatabase.instance.reference().child("suhu");
  // final dbR = FirebaseDatabase.instance.reference();

  // var intValue;

  @override
  // void initState() {
  //   super.initState();

  //   dbR.child('Node1').once().then((DataSnapshot snapshot) {
  //     double temp = snapshot.value['distance'];

  //     isLoading = true;
  //   });
  // }

  // onUpdate() {
  //   setState(() {
  //     value = !value;
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Suhu",
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
                          padding: const EdgeInsets.only(top: 100, left: 50),
                          child: Image.asset("images/suhu2.png",
                              width: 200, height: 200),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 60),
                          child: Column(
                            children: [
                              Text(
                                "Suhu",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  snapshot.value.toString(),
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(top: 50, left: 10),
                              //   child: Text(
                              //     "Water Heater",
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.normal,
                              //         fontSize: 18),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 10),
                              //   child: Text(
                              //     "ON",
                              //     style: TextStyle(
                              //         fontSize: 25,
                              //         fontWeight: FontWeight.w800),
                              //   ),
                              // ),

                              // SizedBox(
                              //   height: 20,
                              // ),
                              // FloatingActionButton.extended(
                              //   onPressed: () {
                              //     setState(() {
                              //       dbR.child("LightState").set({"switch": value});
                              //       value = !value;
                              //     });
                              //   },
                              //   label: value ? Text('ON') : Text('OFF'),
                              //   elevation: 20,
                              //   backgroundColor: value ? Colors.blue : Colors.grey,
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Image.asset("images/parametersuhu.png"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Container(
                    //     padding: EdgeInsets.all(15),
                    //     child: Table(
                    //       border: TableBorder.all(
                    //           width: 1, color: Colors.black45), //table border
                    //       children: [
                    //         TableRow(children: [
                    //           TableCell(child: Text("Nilai Suhu")),
                    //           TableCell(child: Text("Range Suhu Ideal")),
                    //           TableCell(child: Text("Status")),
                    //           TableCell(child: Text("Keterangan"))
                    //         ]),
                    //         TableRow(children: [
                    //           TableCell(child: Text("1.")),
                    //           TableCell(child: Text("Krishna Karki")),
                    //           TableCell(child: Text("Nepal, Kathmandu")),
                    //           TableCell(child: Text("Nepal"))
                    //         ]),
                    //         TableRow(children: [
                    //           TableCell(child: Text("2.")),
                    //           TableCell(child: Text("John Wick")),
                    //           TableCell(child: Text("New York, USA")),
                    //           TableCell(child: Text("USA"))
                    //         ]),
                    //         TableRow(children: [
                    //           TableCell(child: Text("3.")),
                    //           TableCell(child: Text("Fedrick May")),
                    //           TableCell(child: Text("Berlin, Germany")),
                    //           TableCell(child: Text("Germany"))
                    //         ]),
                    //       ],
                    //     )),
                    // GFProgressBar(
                    //     percentage: 0.9,
                    //     width: 100,
                    //     radius: 90,
                    //     type: GFProgressType.circular,
                    //     backgroundColor: Colors.black26,
                    //     progressBarColor: GFColors.DANGER)

                    // Padding(
                    //   padding: const EdgeInsets.only(top: 5, bottom: 20),
                    //   child: Image.asset(
                    //     "images/grafiksuhu.png",
                    //     width: MediaQuery.of(context).size.height / 1,
                    //     height: MediaQuery.of(context).size.height / 3,
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
