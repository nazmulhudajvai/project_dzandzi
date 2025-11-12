import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class Project_peichart extends StatelessWidget {
  final int completionPercent; // Example: 0.6 = 60%

  const Project_peichart({super.key,  this.completionPercent = 20 });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F8FA), // Light background
     
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Project & Key Metrics",
              style: GoogleFonts.roboto(
                color: AppColors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
            SizedBox(height: 16.h),

          // Pie Chart
          SizedBox(
            height: 120.h,
            width: 120.w,
            child: PieChart(
              PieChartData(
                startDegreeOffset: 90,
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: [
                  PieChartSectionData(
                    color: const Color(0xFF1E5AA8), // Blue
                    // value: completionPercent * 100,
                    value: completionPercent.toDouble() ,
                    showTitle: false,

                  ),
                  PieChartSectionData(
                    color: const Color(0xFFE8E8E8), // Grey
                    // value: (1 - completionPercent) * 100,
                    value:100-completionPercent.toDouble(),
                    showTitle: false,
                  ),
                  
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Text below chart
          RichText(
            text: TextSpan(
              text: "Tasks completion ",
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
              ),
              children: [
                TextSpan(
                  text: "$completionPercent%",
                  style: GoogleFonts.roboto(
                    color: Colors.blue,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
