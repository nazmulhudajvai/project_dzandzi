import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InventoryItemCard extends StatelessWidget {
  const InventoryItemCard({
    super.key,
    required this.materialTitle,
    required this.materialName,
    required this.price,
    required this.quantity,
    required this.statusText,
    required this.statusColor,
  });

  final String materialTitle;
  final String materialName;
  final String price;
  final String quantity;

  /// 🔹 Only this part (text + color) is customizable
  final String statusText;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Text(
                materialTitle,
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greymetarial,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                materialName,
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ],
          ),

          // Right section
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$$price',
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greymetarial,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                quantity,
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                statusText,
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
