import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShWeightStatisticsCard extends StatefulWidget {
  const ShWeightStatisticsCard({super.key, required this.weights});

  final Map<String, int> weights;

  @override
  State<ShWeightStatisticsCard> createState() => _ShWeightStatisticsCardState();
}

// final List<double> weightList = [18, 17, 10, 2.5, 2, 2, 2];

// final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

class _ShWeightStatisticsCardState extends State<ShWeightStatisticsCard> {
  List<double> weightList = [];
  List<String> days = [];

  @override
  initState() {
    super.initState();
    widget.weights.forEach((key, value) {
      days.add(key);
      weightList.add(value.toDouble());
    });
  }

  int touchedGroupIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weight change chart',
            style: AagAppFonts.s14w500.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                borderData: FlBorderData(
                  show: true,
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: AagAppColors.black,
                      width: 1,
                    ),
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    drawBelowEverything: true,
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          textAlign: TextAlign.left,
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 36,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            days[index],
                            style: AagAppFonts.s12w400,
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => const FlLine(
                    dashArray: [5],
                    color: AagAppColors.black,
                    strokeWidth: 1,
                  ),
                ),
                groupsSpace: 10,
                barGroups: weightList.asMap().entries.map((e) {
                  final index = e.key;
                  final data = e.value;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: data,
                        color: AagAppColors.blue,
                        width: 10,
                      ),
                    ],
                    showingTooltipIndicators:
                        touchedGroupIndex == index ? [0] : [],
                  );
                }).toList(),
                // max from weight list
                maxY: weightList.reduce((a, b) => a > b ? a : b) + 5,
                barTouchData: BarTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => Colors.transparent,
                    tooltipMargin: 0,
                    getTooltipItem: (
                      BarChartGroupData group,
                      int groupIndex,
                      BarChartRodData rod,
                      int rodIndex,
                    ) {
                      return BarTooltipItem(
                        rod.toY.toString(),
                        AagAppFonts.s12w400.copyWith(
                          color: AagAppColors.blue,
                        ),
                      );
                    },
                  ),
                  touchCallback: (event, response) {
                    if (event.isInterestedForInteractions &&
                        response != null &&
                        response.spot != null) {
                      setState(() {
                        touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                      });
                    } else {
                      setState(() {
                        touchedGroupIndex = -1;
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BarData {
  const _BarData(this.value);
  final double value;
}
