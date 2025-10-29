import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class project_card extends StatelessWidget {
  const project_card({
    super.key,
    required this.title,
    required this.progress,
    required this.days,
  });

  final String title;
  final int progress;
  final int days;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.activeStatus,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Active",
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              SizedBox(height: 4),
              Text(
                "$progress%",
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),

          LinearProgressIndicator(
            value: progress / 100,
            minHeight: 10.h,
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.liniarIndicatorColor,
            backgroundColor: Colors.grey.shade300,
          ),

          SizedBox(height: 20.h),

          Row(
            children: [
              Icon(Icons.person, size: 12.sp, color: AppColors.smallUsercolor),
              SizedBox(width: 4.w),
              Text(
                "Mikel Clark",
                style: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.smallUsercolor,
                ),
              ),
              SizedBox(width: 160.w),
              Icon(Icons.calendar_month, size: 12.sp),
              SizedBox(width: 8.w),
              Text(
                "$days Days left",
                style: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greydeep,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
