import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../theams/app_color2.dart';

class CustomCardProgressCards extends StatelessWidget {
  final String heading;
  final int value;
  final String iconPath;
  final String iconPath2;
  final Color startColor;
  final Color boxsColor;
  final Color endColor;

  const CustomCardProgressCards({
    super.key,
    required this.heading,
    required this.iconPath2,
    required this.value,
    required this.iconPath,
    required this.startColor,
    required this.endColor,
    required this.boxsColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [startColor, endColor],
        ),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey13.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: boxsColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      iconPath,
                      width: 20.w,
                      height: 20.h,
                      color: AppColor.whiteColor.withOpacity(.8),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                TextProperty(
                  text: heading,
                  textColor: AppColors.whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                Spacer(),
                Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.whiteColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      iconPath2,
                      width: 20.w,
                      height: 20.h,
                      color: AppColor.blackColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              "$value",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
