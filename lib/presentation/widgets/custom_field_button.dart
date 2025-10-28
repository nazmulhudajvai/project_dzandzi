import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // ✅ Added missing import
import 'package:google_fonts/google_fonts.dart';

import '../../theams/app_color.dart';


class CustomButtonMain extends StatelessWidget {
  final String text; // ✅ Make text customizable
  final String iconPath; // ✅ Optional icon path
  final VoidCallback? onTap; // ✅ Optional tap action

  const CustomButtonMain({
    super.key,
    required this.text,
    this.iconPath = 'assets/image/down.svg', // default icon
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // ✅ Add optional tap behavior
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            transform: const GradientRotation(3515),
            end: Alignment.bottomLeft,
            colors: [
              AppColor.blackLiteColor,
              AppColor.whiteLiteColor,
              AppColor.blackLiteColor,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          height: 40.h,
          width: 102.w,
          margin: const EdgeInsets.all(.45),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.center,
              colors: [
                AppColor.blackLiteColor,
                AppColor.whiteLiteColor,
                AppColor.whiteLiteColor,
                AppColor.blackLiteColor,
                AppColor.whiteLiteColor,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text, // ✅ Dynamic text
                style: GoogleFonts.inter(
                  color: AppColor.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 10.w),
              SvgPicture.asset(
                iconPath, // ✅ Dynamic icon path
                width: 10.67.w,
                height: 14.h,
                color: AppColor.whiteLiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
