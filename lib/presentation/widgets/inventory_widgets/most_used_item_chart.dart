import 'dart:math' as math;
import 'package:dzandzi/theams/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MostUsedItemsChart extends StatelessWidget {
  const MostUsedItemsChart({super.key});

  @override
  Widget build(BuildContext context) {
    // data arrays
    final values = [6.0, 20.0, 10.0, 55.0, 38.0];
    final colors = [
      AppColors.greenTextcolor,
      AppColors.lightblue,
      AppColors.chartPurple,
      AppColors.chartOrange,
      AppColors.chartYellow,
    ];
    final titles = [
      'Paints 6%',
      'Wood Planks 20%',
      'Drywall 10%',
      'Nails 55%',
      'Screws 38%',
    ];
    final titleColors = [
      AppColors.greenTextcolor,
      AppColors.lightblue,
      AppColors.chartPurple,
      AppColors.chartOrange,
      AppColors.chartYellow,
    ];

    final double total = values.fold(0.0, (p, e) => p + e);
    final double startDegreeOffset = -90.0; // keep same start as PieChartData
    double cumulative = 0.0;

    // generate sections with automatically computed mid-angle rotation
    final sections = List.generate(values.length, (i) {
      final sweepDeg = (values[i] / total) * 360.0;
      final startDeg = startDegreeOffset + cumulative;
      final midDeg = startDeg + sweepDeg / 2.0;
      final midRad = midDeg * math.pi / 180.0;

      // normalize rotation and flip if label would be upside-down
      double rotate = midRad;
      final normalized = (rotate % (2 * math.pi) + 2 * math.pi) % (2 * math.pi);
      if (normalized > math.pi / 2 && normalized < 3 * math.pi / 2) {
        rotate += math.pi; // flip to keep text readable
      }

      cumulative += sweepDeg;

      return _makeSection(
        value: values[i],
        color: colors[i],
        title: titles[i],
        titleColor: titleColors[i],
        angle: rotate,
        badgeOffset: 1.25, // margin from center; tweak as needed
      );
    });

    return Container(
      // margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 70),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Most Used Items',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 30),
          AspectRatio(
            aspectRatio: 1.0,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 60,
                startDegreeOffset: startDegreeOffset,
                sections: sections,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PieChartSectionData _makeSection({
    required double value,
    required Color color,
    required String title,
    required Color titleColor,
    required double angle, // rotation in radians
    double badgeOffset = 0.25,
  }) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: 30,
      title: '',
      badgeWidget: Transform.rotate(
        angle: angle,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: titleColor,
          ),
        ),
      ),
      badgePositionPercentageOffset: 2.5,
    );
  }
}
