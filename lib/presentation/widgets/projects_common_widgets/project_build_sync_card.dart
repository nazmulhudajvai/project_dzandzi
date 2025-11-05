import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectBuildSyncCard extends StatelessWidget {
  const ProjectBuildSyncCard({
    super.key,
    required this.title,
    required this.progress,
    this.days = 14,
    required EdgeInsets padding,
  });

  final String title;
  final int progress;
  final int days;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16.r),

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
              gradient: LinearGradient(
                colors: [
                  AppColors.projecSectiontColor2,
                  AppColors.projecSectiontColor1,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -54.h,
                  left: -46.w,
                  child: Container(
                    height: 109.h,
                    width: 109.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.indicatorbackground.withOpacity(0.1),
                    ),
                  ),
                ),
                Positioned(
                  top: -44.h,
                  right: -56.w,
                  child: Container(
                    height: 109.h,
                    width: 109.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.indicatorbackground.withOpacity(0.1),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title & Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.activeStatus,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Active',
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
                      // Location
                      Text(
                        'London',
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.liteblue,
                        ),
                      ),

                      // Progress %
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 4),
                          Text(
                            "$progress%",
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),

                      // Linear progress bar
                      LinearProgressIndicator(
                        value: progress / 100,
                        minHeight: 10.h,
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.lightBlue,
                        backgroundColor: AppColors.indicatorbackground
                            .withOpacity(0.2),
                      ),

                      SizedBox(height: 20.h),

                      // Person & Days
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 12.sp,
                            color: AppColors.personcolor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "Mikel Clark",
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          SizedBox(width: 165.w),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                size: 12.sp,
                                color: AppColors.liteblue,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "$days Days left",
                                style: GoogleFonts.roboto(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom-left gradient background circle
        ],
      ),
    );
  }
}
