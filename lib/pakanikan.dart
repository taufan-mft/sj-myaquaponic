import 'package:flutter/material.dart';

class PakanPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Pakan Ikan",
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 30),
                    child: Image.asset("images/pakan.png",
                        width: 150, height: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 40),
                    child: Column(
                      children: [
                        Text(
                          "Pakan Pagi",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "08.00 AM",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 10),
                          child: Text(
                            "Pakan Sore",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "17.00 PM",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
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
      ),
    );
  }
}
