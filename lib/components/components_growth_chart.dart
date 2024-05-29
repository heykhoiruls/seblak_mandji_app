import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../configs/config_apps.dart';
import '../models/model_chartBottom.dart';
import '../models/model_bar.dart';

class ComponentsGrowthChart extends StatelessWidget {
  final String id;
  final List<double> height;
  final List<double> weight;
  final int ageInMonths;

  const ComponentsGrowthChart({
    super.key,
    required this.id,
    required this.height,
    required this.weight,
    required this.ageInMonths,
  });

  @override
  Widget build(BuildContext context) {
    Bar bar = Bar(
      heights: height,
      weights: weight,
    );

    bar.initialDataBar();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultSize * 0.25,
      ),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultRadius),
          ),
          border: Border.all(
            width: 2,
            color: colorPrimary,
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultSize * 0.5,
            vertical: defaultSize * 1.5,
          ),
          child: BarChart(
            BarChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return setBottomTitle(value, meta, id);
                    },
                  ),
                ),
              ),
              barGroups: bar.dataBar
                  .map(
                    (data) => BarChartGroupData(
                      x: data.x,
                      barsSpace: -14,
                      barRods: [
                        BarChartRodData(
                          toY: data.height,
                          color: colorSecondary,
                          width: 14,
                          fromY: data.weight - 20,
                        ),
                        BarChartRodData(
                          toY: data.weight,
                          color: colorPrimary,
                          width: 14,
                        ),
                      ],
                    ),
                  )
                  .toList(),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: colorAccent,
                  tooltipPadding: const EdgeInsets.only(
                    left: defaultSize,
                    right: defaultSize,
                    top: defaultRadius,
                    bottom: defaultSize * 0.5,
                  ),
                  tooltipRoundedRadius: defaultRadius * 0.8,
                  tooltipBorder: const BorderSide(
                    color: colorPrimary,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
