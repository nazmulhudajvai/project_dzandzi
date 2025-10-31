import 'package:dzandzi/presentation/pages/document/add_document.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/presentation/widgets/custom_document_card.dart';
import 'package:dzandzi/presentation/widgets/key_metric_card.dart';
import 'package:dzandzi/presentation/widgets/milestone_card.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    // Use SafeArea to avoid system UI (like notches)
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom "Back" navigation row
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: AppColors.liniarIndicatorColor,
                    ),
                    SizedBox(width: 18.w),
                    Text(
                      'Back to Company View',
                      style: TextStyle(
                        color: AppColors.liniarIndicatorColor,
                        fontSize: 16,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // "Document" Title
                Text(
                  'Project Summary',
                  style: TextStyle(
                    color: AppColors.titleText,
                    fontSize: 20.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Image.asset(
                      "assets/icon/mdi_clock-outline.png",
                      height: 20.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Dateline: September 30, 2023',
                      style: TextStyle(
                        color: AppColors.grey17,
                        fontSize: 16.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Image.asset("assets/icon/uil_calender.png", height: 20.h),
                    SizedBox(width: 8.w),
                    Text(
                      'Duration: 120 days',
                      style: TextStyle(
                        color: AppColors.grey17,
                        fontSize: 16.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                Text(
                  'Project Description',
                  style: TextStyle(
                    color: AppColors.textclrblack,
                    fontSize: 24.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Commercial building construction with 5 floors, including office spaces, meeting rooms, and recreational areas. The project includes electrical, plumbing, and HVAC systems installation.',
                  style: TextStyle(
                    color: AppColors.grey17,
                    fontSize: 16.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),

                Text(
                  'Key Metrics',
                  style: TextStyle(
                    color: AppColors.textclrblack,
                    fontSize: 24.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12.h),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.4, // This makes the cards wider than tall
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    KeyMetricCard(
                      title: 'Total Task',
                      value: '24',
                      icon: "assets/icon/total.png",
                      iconBackgroundColor: AppColors.totalProjectIcon,
                      valueColor: AppColors.totalProjectIcon,
                    ),
                    KeyMetricCard(
                      title: 'On-going Task',
                      value: '12',
                      icon: "assets/icon/ongoing.png",
                      iconBackgroundColor: AppColors.ongoingIcon,
                      valueColor: AppColors.ongoingIcon,
                    ),
                    KeyMetricCard(
                      title: 'Complete Tak',
                      value: '12',
                      icon: "assets/icon/right.png",
                      iconBackgroundColor: AppColors.completeProjectIconColor,
                      valueColor: AppColors.completeProjectIconColor,
                    ),
                    KeyMetricCard(
                      title: 'Inventory Used',
                      value: '68%',
                      icon: "assets/icon/used.png",
                      iconBackgroundColor: AppColors.inProgressText,
                      valueColor: AppColors.inProgressText,
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 7.r,
                            backgroundColor: AppColors.inProgressText,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Cement',
                            style: TextStyle(
                              color: AppColors.grey17,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '23%',
                            style: TextStyle(
                              color: AppColors.textcolor2,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7.h),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 7.r,
                            backgroundColor: AppColors.greenColor,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Steel',
                            style: TextStyle(
                              color: AppColors.grey17,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '25%',
                            style: TextStyle(
                              color: AppColors.textcolor2,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7.h),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 7.r,
                            backgroundColor: AppColors.paintColor,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Paint',
                            style: TextStyle(
                              color: AppColors.grey17,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '20%',
                            style: TextStyle(
                              color: AppColors.textcolor2,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                // "Document" Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Milestone Timeline',
                      style: TextStyle(
                        color: AppColors.titleText,
                        fontSize: 20.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    MilestoneCard(
                      title: "Foundation Completion",
                      date: "Oct 30, 2023",
                      status: "Complete",
                      statusColor: Colors.green,
                      progress: 1.0,
                      daysLeft: "",
                    ),
                    MilestoneCard(
                      title: "Framing & Structure",
                      date: "Nov 15, 2023",
                      status: "Complete",
                      statusColor: Colors.green,
                      progress: 1.0,
                      daysLeft: "",
                    ),
                    MilestoneCard(
                      title: "Electrical & Plumbing",
                      date: "Dec 5, 2023",
                      status: "On Task",
                      statusColor: Colors.blue,
                      progress: 0.75,
                      daysLeft: "3 Days Left",
                    ),
                    MilestoneCard(
                      title: "Interior Finishes",
                      date: "Dec 20, 2023",
                      status: "On Task",
                      statusColor: Colors.orange,
                      progress: 0.2,
                      daysLeft: "10 Days Left",
                    ),
                    MilestoneCard(
                      title: "Interior Finishes",
                      date: "Dec 20, 2023",
                      status: "14 days left",
                      statusColor: Colors.red,
                      progress: 0.0,
                      daysLeft: "Not Started",
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // "Document" Title
                Text(
                  'Active Task',
                  style: TextStyle(
                    color: AppColors.titleText,
                    fontSize: 20.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // List of Document Cards
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
