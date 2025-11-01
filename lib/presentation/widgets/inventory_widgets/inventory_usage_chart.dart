import 'package:dzandzi/theams/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InventoryUsageChart extends StatelessWidget {
  const InventoryUsageChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {'used': 2200.0, 'total': 2600.0},
      {'used': 1800.0, 'total': 2600.0},
      {'used': 2100.0, 'total': 2600.0},
      {'used': 800.0, 'total': 2600.0},
      {'used': 2000.0, 'total': 2600.0},
    ];

    final labels = ['Kitchen Remodel', 'Kitchen Remodel', 'Kitchen Remodel', 'Kitchen Remodel', 'Kitchen Remodel'];

    return Container(
      padding: EdgeInsets.only(top: 16.h, bottom: 40.h, left: 16.w, right: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 12.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inventory Usage by Project',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 40.h),
          AspectRatio(
            aspectRatio: 1.3,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 3200,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 48.w,
                      interval: 800,
                      getTitlesWidget: (value, meta) {
                        final int v = value.toInt();
                        const allowed = [0, 800, 1600, 2400, 3200];
                        if (!allowed.contains(v)) return const SizedBox.shrink();
                        return Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: Text(
                            v.toString(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black54,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40.h,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        final int index = value.toInt();
                        final text = (index >= 0 && index < labels.length)
                            ? labels[index]
                            : '';
                        return Padding(
                          padding: EdgeInsets.only(top: 16.h, right: 70.w),
                          child: Transform.rotate(
                            angle: -0.4,
                            child: Text(
                              text,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(show: false),
                // draw thin grey lines for left and bottom axes
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade300, width: 1),
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    top: BorderSide(color: Colors.transparent, width: 0),
                    right: BorderSide(color: Colors.transparent, width: 0),
                  ),
                ),
                barGroups: List.generate(data.length, (index) {
                  final used = data[index]['used']!;
                  final total = data[index]['total']!;
                  return _makeStackedBar(index, used, total);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeStackedBar(int x, double used, double total) {
    final double barWidth = 36.w;
    return BarChartGroupData(
      x: x,
      // negative space equal to bar width so rods perfectly overlap
      barsSpace: -barWidth,
      barRods: [
        // bottom light rod (full total) — give it rounded top corners too
        BarChartRodData(
          toY: total,
          width: barWidth,
          gradient: LinearGradient(
            colors: [
              AppColors.whiteColor,
              AppColors.chartGradColor.withOpacity(0.1),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          // color: Color(0xFFBBDEFB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r),
            topRight: Radius.circular(6.r),
          ),
        ),
        // top dark rod (used) with rounded top corners
        BarChartRodData(
          toY: used,
          width: barWidth,
          color: AppColors.chartColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6.r),
            topRight: Radius.circular(6.r),
          ),
        ),
      ],
    );
  }
}
