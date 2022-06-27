import 'package:flutter/material.dart';
import 'package:myaquaponic/chart/chart_container.dart';
import 'package:myaquaponic/chart/line_chart.dart';
import 'package:myaquaponic/chart/pie_chart.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
        body: Container(
          color: Color(0xfff0f0f0),
          child: ListView(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            children: <Widget>[
              ChartContainer(
                title: 'Grafik pH',
                color: Color.fromRGBO(45, 108, 223, 1),
                chart: LineChartContent(),
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }
}
