import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/presentation/widgets/key_metric_card.dart';
import 'package:dzandzi/presentation/widgets/milestone_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_build_sync_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Row
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: AppColors.liniarIndicatorColor,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Back to Company View',
                          style: TextStyle(
                            color: AppColors.liniarIndicatorColor,
                            fontSize: 16.sp,
                            fontStyle: GoogleFonts.roboto().fontStyle,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  // BuildSync Card (fixed position)
                  ProjectBuildSyncCard(
                    title: "BuildSync",
                    progress: 50,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),

            // 🔹 Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
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
                        Image.asset(
                          "assets/icon/uil_calender.png",
                          height: 20.h,
                        ),
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

                    // 🔹 Key Metrics
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
                      childAspectRatio: 1.4,
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
                          title: 'Complete Task',
                          value: '12',
                          icon: "assets/icon/right.png",
                          iconBackgroundColor:
                              AppColors.completeProjectIconColor,
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
                    SizedBox(height: 20.h),

                    // 🔹 Milestone Section
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

                    SizedBox(height: 24.h),

                    // 🔹 Active Task
                    Text(
                      'Active Task',
                      style: TextStyle(
                        color: AppColors.titleText,
                        fontSize: 20.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 50,
                      isdayshow: false,
                    ),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 70,
                      isdayshow: false,
                    ),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 80,
                      isdayshow: false,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
