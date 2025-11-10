import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dzandzi/theams/app_colors.dart';

class search_bar extends StatelessWidget {
  const search_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      decoration: BoxDecoration(
        color: AppColors.textFieldColor2,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: AppColors.textColor,
              decoration: InputDecoration(
                hintText: "Search here...",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textcolor,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/image/search.svg',
            height: 16.93.h,
            width: 16.93.w,
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
