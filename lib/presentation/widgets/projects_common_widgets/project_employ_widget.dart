import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String role;

  const EmployeeProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185.5.h,
      width: 195.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 28.r, backgroundImage: AssetImage(imagePath)),
          SizedBox(height: 12.h),
          Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            role,
            style: GoogleFonts.roboto(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.persondegi,
            ),
          ),
        ],
      ),
    );
  }
}
