import 'package:flutter/material.dart';

class TableSuhu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100], //background color of scaffold
        appBar: AppBar(
          title: Text("Flutter Table"), //title of app
          backgroundColor: Colors.redAccent, //background color of app bar
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: Table(
              border: TableBorder.all(
                  width: 1, color: Colors.black45), //table border
              children: [
                TableRow(children: [
                  TableCell(child: Text("S/N")),
                  TableCell(child: Text("Name")),
                  TableCell(child: Text("Address")),
                  TableCell(child: Text("Nation"))
                ]),
                TableRow(children: [
                  TableCell(child: Text("1.")),
                  TableCell(child: Text("Krishna Karki")),
                  TableCell(child: Text("Nepal, Kathmandu")),
                  TableCell(child: Text("Nepal"))
                ]),
                TableRow(children: [
                  TableCell(child: Text("2.")),
                  TableCell(child: Text("John Wick")),
                  TableCell(child: Text("New York, USA")),
                  TableCell(child: Text("USA"))
                ]),
                TableRow(children: [
                  TableCell(child: Text("3.")),
                  TableCell(child: Text("Fedrick May")),
                  TableCell(child: Text("Berlin, Germany")),
                  TableCell(child: Text("Germany"))
                ]),
              ],
            )));
  }
}
