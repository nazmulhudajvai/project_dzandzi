import 'package:dzandzi/theams/app_colors.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentCard extends StatelessWidget {
  final String projectName;
  final String uploadDate;
  final String fileSize;

  const DocumentCard({
    super.key,
    required this.projectName,
    required this.uploadDate,
    required this.fileSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey15.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey15.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icon/fileicon.png",
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'Response Answers',
                  style: TextStyle(
                    fontStyle: GoogleFonts.inter().fontStyle,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project: $projectName',
                      style: TextStyle(
                        fontStyle: GoogleFonts.inter().fontStyle,
                        color: AppColors.grey14,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Uploaded: $uploadDate',
                      style: TextStyle(
                        fontStyle: GoogleFonts.inter().fontStyle,
                        color: AppColors.grey14,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Size: $fileSize',
                style: TextStyle(
                  fontStyle: GoogleFonts.inter().fontStyle,
                  color: AppColors.grey14,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 32,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.buttonColor,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
              child: Text(
                'View Documents',
                style: TextStyle(fontSize: 12.sp, color: AppColor.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
