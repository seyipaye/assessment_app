import 'package:assessment_app/presentation/modules/match_details/match_details_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class BarChartSample5 extends StatelessWidget {
  const BarChartSample5({super.key, required this.data});

  final GraphPoints data;

  static const double barWidth = 5;
  static const shadowOpacity = 0.2;
  static const mainItems = <int, List<double>>{
    0: [2, 3, 2.5, 8],
    1: [-1.8, -2.7, -3, -6.5],
    2: [1.5, 2, 3.5, 6],
    3: [1.5, 1.5, 4, 6.5],
    4: [-2, -2, -5, -9],
    5: [-1.2, -1.5, -4.3, -10],
    6: [1.2, 4.8, 5, 5],
  };

  BarChartGroupData generateGroup(
    GraphPoint point,
  ) {
    final isHome = !point.value.isNegative;
    return BarChartGroupData(
      x: point.minute.toInt(),
      groupVertically: true,
      // showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: isHome ? point.value : 0,
          width: barWidth,
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(0),
        ),
        BarChartRodData(
          toY: isHome ? 0 : point.value,
          width: barWidth,
          color: AppColors.darkRed,
          borderRadius: BorderRadius.circular(0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 + 48,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 100,
          minY: -100,
          groupsSpace: 2,
          titlesData: const FlTitlesData(
            show: false,
          ),
          gridData: const FlGridData(
            show: false,
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: data.map((e) => generateGroup(e)).toList(),
        ),
      ),
    );
  }
}
