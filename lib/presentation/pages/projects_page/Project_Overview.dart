
import 'package:dzandzi/presentation/controllers/project_pages_controler/overview_controler.dart';
import 'package:dzandzi/presentation/pages/projects_page/Project_peichart.dart';
import 'package:dzandzi/presentation/widgets/employee_profile_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/Project_Overview_milestone.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_metric_card.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Project_Overview extends StatelessWidget {
  final String projectId;

  const Project_Overview({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectOverviewController(projectId));

    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text('Error: ${controller.errorMessage.value}'));
          }

          final data = controller.overviewData.value;
          if (data == null) {
            return const Center(child: Text("No data available"));
          }

          final task = data.taskAnalytics;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project_peichart(completionPercent:task.avarageProgress/100),
                Project_peichart(),
                SizedBox(height: 24.h),

                // Task cards
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Project_Over_metric_card(
                      title: 'Total Task',
                      value: '${task.totalTaskCount}',
                      icon: "assets/image/total_task.svg",
                      iconBackgroundColor: AppColors.totalProjectIcon,
                      valueColor: AppColors.totalProjectIcon,
                    ),
                    Project_Over_metric_card(
                      title: 'On-going Task',
                      value: '${task.ongoingTaskCount}',
                      icon: "assets/image/onGoing.svg",
                      iconBackgroundColor: AppColors.ongoingIcon,
                      valueColor: AppColors.ongoingIcon,
                    ),
                    Project_Over_metric_card(
                      title: 'Complete Task',
                      value: '${task.completedTaskCount}',
                      icon: "assets/image/complete_task.svg",
                      iconBackgroundColor: AppColors.completeProjectIconColor,
                      valueColor: AppColors.completeProjectIconColor,
                    ),
                    Project_Over_metric_card(
                      title: 'Budget Used',
                      value: '${data.inventoryBudget}',
                      icon: "assets/image/dollar.svg",
                      iconBackgroundColor: AppColors.budgetUserColor,
                      valueColor: AppColors.budgetUserColor,
                    ),
                  ],
                ),

                SizedBox(height: 12.h),
                _inventorySection(),
                SizedBox(height: 24.h),
                _milestonesSection(),
                SizedBox(height: 24.h),
                _activeTaskSection(),
                SizedBox(height: 30.h),
                _employeeSection(),
                SizedBox(height: 30.h),
                _recentActivitySection(data.taskAnalytics.recentActivities),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _inventorySection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
          _inventoryRow('Cement', '23%', AppColors.inProgressText),
          SizedBox(height: 7.h),
          _inventoryRow('Steel', '25%', AppColors.inventoryText),
          SizedBox(height: 7.h),
          _inventoryRow('Paint', '20%', AppColors.paintColor),
        ],
      ),
    );
  }

  Widget _inventoryRow(String name, String percent, Color color) {
    return Row(
      children: [
        CircleAvatar(radius: 7.r, backgroundColor: color),
        SizedBox(width: 8.w),
        Text(name, style: TextStyle(color: AppColors.grey13, fontSize: 14.sp)),
        const Spacer(),
        Text(percent,
            style: TextStyle(color: AppColors.textcolor2, fontSize: 14.sp)),
      ],
    );
  }

  Widget _milestonesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Milestone Timeline',
            style: GoogleFonts.roboto(
                color: AppColors.titleText,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500)),
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
      ],
    );
  }

  Widget _activeTaskSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Active Task',
                style: GoogleFonts.roboto(
                    color: AppColors.titleText,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            Text('View All',
                style: GoogleFonts.roboto(
                    color: AppColors.grey14,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 30.h),
        project_card(
            title: 'Foundation inspection',
            isProgress: false,
            progress: 50,
            isdayshow: false),
        project_card(
            title: 'Foundation inspection',
            isProgress: false,
            progress: 70,
            isdayshow: false),
      ],
    );
  }

  Widget _employeeSection() {

    // final d
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Today On Site',
                style: GoogleFonts.roboto(
                    color: AppColors.titleText,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            Text('View All',
                style: GoogleFonts.roboto(
                    color: AppColors.grey14,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 30.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(4, (index) {
              return Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: EmployeeProfileCard(
                    imagePath: 'assets/image/damyPic.png',
                    name: 'John Doe',
                    role: 'Owner'),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _recentActivitySection(List<dynamic> activities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Recent Activity',
                style: GoogleFonts.roboto(
                    color: AppColors.titleText,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500)),
            const Spacer(),
            Text('View All',
                style: GoogleFonts.roboto(
                    color: AppColors.grey14,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
          ],
        ),
        SizedBox(height: 30.h),
        ...activities.map((activity) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    '${activity["first_name"] ?? ""} ${activity["last_name"] ?? ""} ${activity["message"] ?? ""}',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textclr,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    activity["timestamp"] != null
                        ? activity["timestamp"].toString().substring(11, 16)
                        : '',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textclr,
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          );
        }).toList(),
      ],
    );
  }
}
