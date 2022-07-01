import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class SuhuPages extends StatefulWidget {
  const SuhuPages({Key? key}) : super(key: key);

  @override
  State<SuhuPages> createState() => _SuhuPagesState();
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff68737d),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  var dt = DateTime.fromMillisecondsSinceEpoch((value*1000000000).toInt()).toLocal();

// 12 Hour format:
  var d12 = DateFormat('hh:mm').format(dt);
print(value);
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    child: Text(d12, style: style,),
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff67727d),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 5:
      text = '5C';
      break;
    case 10:
      text = '10C';
      break;
    case 15:
      text = '15C';
      break;
    case 20:
      text = '20C';
      break;
    case 30:
      text = '30C';
      break;
    case 40:
      text = '40C';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

class _SuhuPagesState extends State<SuhuPages> {
  final ref = FirebaseDatabase.instance.reference().child("suhu");

  List<FlSpot> tempsPoint = [];

  @override
  void initState() {
    super.initState();
    ref.onValue.listen((event) {
      print('temperature');
      final data = event.snapshot.value;
      print(data['suhu']);
      tempsPoint.add(FlSpot(DateTime.now().toUtc().millisecondsSinceEpoch/1000000000, double.parse(data['suhu'].toString())));
      setState(() {
        print(tempsPoint.length.toString());
      });
    });
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: ((1656552368342/1000000000)-(1656551176404/1000000000)),
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      lineBarsData: [
        LineChartBarData(
          spots: tempsPoint,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Suhu",
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
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
