import 'package:dzandzi/presentation/pages/projects_page/Project_peichart.dart';
import 'package:dzandzi/presentation/widgets/employee_profile_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/Project_Overview_milestone.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_metric_card.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Project_Overview extends StatelessWidget {
  const Project_Overview({super.key});

  @override
  Widget build(BuildContext context) {
    // Use SafeArea to avoid system UI (like notches)
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Project_peichart(),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.4,
                  // This makes the cards wider than tall
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Project_Over_metric_card(
                      title: 'Total Task',
                      value: '24',
                      icon: "assets/image/total_task.svg",
                      iconBackgroundColor: AppColors.totalProjectIcon,
                      valueColor: AppColors.totalProjectIcon,
                    ),
                    Project_Over_metric_card(
                      title: 'On-going Task',
                      value: '12',
                      icon: "assets/image/onGoing.svg",
                      iconBackgroundColor: AppColors.ongoingIcon,
                      valueColor: AppColors.ongoingIcon,
                    ),
                    Project_Over_metric_card(
                      title: 'Complete Tak',
                      value: '12',
                      icon: "assets/image/complete_task.svg",
                      iconBackgroundColor: AppColors.completeProjectIconColor,
                      valueColor: AppColors.completeProjectIconColor,
                    ),
                    Project_Over_metric_card(
                      title: 'Budget Used',
                      value: '2560',
                      icon: "assets/image/dollar.svg",
                      iconBackgroundColor: AppColors.budgetUserColor,
                      valueColor: AppColors.budgetUserColor,
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
                              color: AppColors.grey13,
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
                            backgroundColor: AppColors.inventoryText,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Steel',
                            style: TextStyle(
                              color: AppColors.grey13,
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
                              color: AppColors.grey13,
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

                    Project_Over_milestone(
                      title: "Foundation Completion",
                      date: "Oct 30, 2023",
                      status: "Complete",
                      statusColor: Colors.green,
                      progress: 1.0,
                      daysLeft: "",
                    ),
                    Project_Over_milestone(
                      title: "Framing & Structure",
                      date: "Nov 15, 2023",
                      status: "Complete",
                      statusColor: Colors.green,
                      progress: 1.0,
                      daysLeft: "",
                    ),
                    Project_Over_milestone(
                      title: "Electrical & Plumbing",
                      date: "Dec 5, 2023",
                      status: "On Task",
                      statusColor: Colors.blue,
                      progress: 0.75,
                      daysLeft: "3 Days Left",
                    ),
                    Project_Over_milestone(
                      title: "Interior Finishes",
                      date: "Dec 20, 2023",
                      status: "On Task",
                      statusColor: Colors.orange,
                      progress: 0.2,
                      daysLeft: "10 Days Left",
                    ),
                    Project_Over_milestone(
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
                Row(
                  children: [
                    Text(
                      'Active Task',
                      style: GoogleFonts.roboto(
                        color: AppColors.titleText,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: GoogleFonts.roboto(
                        color: AppColors.grey14,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

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
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Text(
                      'Today On Site',
                      style: GoogleFonts.roboto(
                        color: AppColors.titleText,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: GoogleFonts.roboto(
                        color: AppColors.grey14,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      EmployeeProfileCard(
                        imagePath: 'assets/image/damyPic.png',
                        name: 'John Doe',
                        role: 'Owner',
                      ),
                      SizedBox(width: 10.w),
                      EmployeeProfileCard(
                        imagePath: 'assets/image/damyPic.png',
                        name: 'John Doe',
                        role: 'Owner',
                      ),
                      SizedBox(width: 10.w),
                      EmployeeProfileCard(
                        imagePath: 'assets/image/damyPic.png',
                        name: 'John Doe',
                        role: 'Owner',
                      ),
                      SizedBox(width: 10.w),
                      EmployeeProfileCard(
                        imagePath: 'assets/image/damyPic.png',
                        name: 'John Doe',
                        role: 'Owner',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Text(
                      'Recent Activity',
                      style: GoogleFonts.roboto(
                        color: AppColors.titleText,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'View All',
                      style: GoogleFonts.roboto(
                        color: AppColors.grey14,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                Row(
                  children: [
                    Text(
                      'Rahim Updated Inventory',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '11:20 AM',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Rahim Updated Inventory',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '11:20 AM',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Rahim Updated Inventory',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '11:20 AM',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Rahim Updated Inventory',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '11:20 AM',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Oli Updated Inventory',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '11:20 AM',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Rafsan Updated Inventory',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '11:20 AM',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
