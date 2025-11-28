import 'dart:math' as math;
import 'package:dzandzi/theams/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/inventory/project_usage_filter_controller.dart';

class MostUsedItemsChart extends StatelessWidget {
  const MostUsedItemsChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProjectUsageFilterController>();

    return Obx(() {
      final items = controller.mostUsedItems;
      
      if (items.isEmpty) {
        return Container(
          padding: const EdgeInsets.all(40),
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
          child: Center(
            child: Column(
              children: [
                Icon(Icons.pie_chart, size: 48, color: AppColors.subtitleColor),
                SizedBox(height: 16),
                Text(
                  'No usage data available',
                  style: TextStyle(color: AppColors.subtitleColor, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      }

      final colors = [
        AppColors.greenTextcolor,
        AppColors.lightblue,
        AppColors.chartPurple,
        AppColors.chartOrange,
        AppColors.chartYellow,
      ];

      // Get values from totalRequested field
      final values = items.map((item) => item.totalRequested.toDouble()).toList();
      
      // Calculate total for percentages
      final double total = values.fold(0.0, (p, e) => p + e);
      
      // Generate titles with item name and percentage
      final titles = items.asMap().entries.map((entry) {
        final percentage = (entry.value.totalRequested / total * 100).toStringAsFixed(0);
        return '${entry.value.title} $percentage%';
      }).toList();

      final double startDegreeOffset = -90.0;
      double cumulative = 0.0;

      final sections = List.generate(items.length > 5 ? 5 : items.length, (i) {
        final sweepDeg = (values[i] / total) * 360.0;
        final startDeg = startDegreeOffset + cumulative;
        final midDeg = startDeg + sweepDeg / 2.0;
        final midRad = midDeg * math.pi / 180.0;

        double rotate = midRad;
        final normalized = (rotate % (2 * math.pi) + 2 * math.pi) % (2 * math.pi);
        if (normalized > math.pi / 2 && normalized < 3 * math.pi / 2) {
          rotate += math.pi;
        }

        cumulative += sweepDeg;

        return _makeSection(
          value: values[i],
          color: colors[i % colors.length],
          title: titles[i],
          titleColor: colors[i % colors.length],
          angle: rotate,
          badgeOffset: 1.25,
          inventoryId: items[i].inventoryId, // Store inventoryId dynamically
        );
      });

      return Container(
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
                  centerSpaceRadius: 50,
                  startDegreeOffset: startDegreeOffset,
                  sections: sections,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  PieChartSectionData _makeSection({
    required double value,
    required Color color,
    required String title,
    required Color titleColor,
    required double angle,
    required String inventoryId, // Dynamic inventoryId
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
