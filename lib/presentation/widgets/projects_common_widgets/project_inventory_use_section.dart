import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class inventory_use extends StatelessWidget {
  const inventory_use({
    super.key,
    required this.name,
    required this.percent,
    required this.color,
  });

  final String name;
  final int percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 7.r, backgroundColor: color),
        SizedBox(width: 8.w),
        Text(name, style: TextStyle(color: AppColors.grey13, fontSize: 14.sp)),
        const Spacer(),
        Text("$percent%", style: TextStyle(color: AppColors.textcolor2, fontSize: 14.sp)),
      ],
    );
  }
}