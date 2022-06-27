import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myaquaponic/chart/line_chart_data.dart';

class LineChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData:
            FlBorderData(border: Border.all(color: Colors.white, width: 0.5)),
        gridData: FlGridData(
          drawHorizontalLine: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (value) => TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '04.00';
                case 2:
                  return '08.00';
                case 3:
                  return '12.00';
                case 4:
                  return '16.00';
                case 5:
                  return '20.00';
                case 6:
                  return '24.00';
                // case 7:
                //   return 'Sun';
              }
              return '';
            },
          ),
          leftTitles: SideTitles(
            interval: 4,
            showTitles: true,
            getTextStyles: (value) => TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            getTitles: (value) {
              if (value.toInt() == 0)
                return '';
              else
                return value.toInt().toString();
            },
          ),
        ),
        minX: 1,
        minY: 0,
        maxX: 7,
        maxY: 16,
        lineBarsData: lineChartBarData,
      ),
    );
  }
}
