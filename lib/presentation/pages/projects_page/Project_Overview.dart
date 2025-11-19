import 'package:dzandzi/presentation/controllers/project_pages_controler/overview_controler.dart';
import 'package:dzandzi/presentation/controllers/project_pages_controler/project_inventory_controler.dart';
import 'package:dzandzi/presentation/controllers/project_pages_controler/project_task_controler.dart';
import 'package:dzandzi/presentation/data/models/project_overview_model.dart';
import 'package:dzandzi/presentation/pages/projects_page/Project_peichart.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/Project_Overview_milestone.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_inventory_use_section.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_metric_card.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Project_Overview extends StatelessWidget {
  final String projectId;

  const Project_Overview({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectOverviewController(projectId));
    final taskControler = Get.put(InventoryController());
    final firstThree = taskControler.inventoryItems.take(3).toList();

    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Text('Error: ${controller.errorMessage.value}'),
            );
          }

          final data = controller.overviewData.value;
          if (data == null) {
            return const Center(child: Text("No data available"));
          }

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Project_peichart(
                  completionPercent: data.taskAnalytics?.averageProgress ?? 0,
                ),
                SizedBox(height: 24.h),

                // Task metric cards
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
                      value: '${data.taskAnalytics?.totalTaskCount ?? 0}',
                      icon: "assets/image/total_task.svg",
                      iconBackgroundColor: AppColors.totalProjectIcon,
                      valueColor: AppColors.totalProjectIcon,
                    ),
                    Project_Over_metric_card(
                      title: 'On-going Task',
                      value: '${data.taskAnalytics?.ongoingTaskCount ?? 0}',
                      icon: "assets/image/onGoing.svg",
                      iconBackgroundColor: AppColors.ongoingIcon,
                      valueColor: AppColors.ongoingIcon,
                    ),
                    Project_Over_metric_card(
                      title: 'Complete Task',
                      value: '${data.taskAnalytics?.completedTaskCount ?? 0}',
                      icon: "assets/image/complete_task.svg",
                      iconBackgroundColor: AppColors.completeProjectIconColor,
                      valueColor: AppColors.completeProjectIconColor,
                    ),
                    Project_Over_metric_card(
                      title: 'Budget Used',
                      value: '${data.inventoryBudget ?? 0}',
                      icon: "assets/image/dollar.svg",
                      iconBackgroundColor: AppColors.budgetUserColor,
                      valueColor: AppColors.budgetUserColor,
                    ),
                  ],
                ),

                SizedBox(height: 12.h),
                _inventorySection(context, firstThree),
                SizedBox(height: 24.h),
                _milestonesSection(data),
                SizedBox(height: 24.h),
                _activeTaskSection(data),
                SizedBox(height: 30.h),
                _recentActivitySection(
                  data.taskAnalytics?.recentActivities ?? [],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _inventorySection(context, controler) {
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
          Text(
            'Inventory Use',
            style: GoogleFonts.roboto(
              color: AppColors.grey13,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.h),

          // inventory_use(name: 'Cement', percent: 20 , color: AppColors.inProgressText),
          ListView.builder(
            itemCount: controler.length,
            shrinkWrap: true,

             physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              
              final items = controler[index];
              var parcentage = items.reserveditem != 0
                  ? (items.reserveditem / items.useditem) * 100
                  : 0;

              if (parcentage.isInfinite) {
                parcentage = 0;
              }
              Color color;
              if (parcentage >= 90) {
                color = AppColors.chartOrange;
              } else if (parcentage >= 50) {
                color = AppColors.chartYellow;
              } else if (parcentage >= 10) {
                color = AppColors.greenColor;
              } else {
                color = AppColors.greenColor;
              }
              return Padding(
                 padding:   EdgeInsets.only( bottom :8.0.r),
                child: inventory_use(
                  name: items.title,
                  percent: parcentage,
                  color: color,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _milestonesSection(ProjectOverviewModel data) {
    final maxTasks = data.taskAnalytics?.maximumProgress5Tasks ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Milestone Timeline',
          style: GoogleFonts.roboto(
            color: AppColors.titleText,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12.h),
        ...maxTasks.map((task) {
          final endDate = task.endDate != null
              ? DateTime.tryParse(task.endDate!)
              : null;
          final formattedDate = endDate != null
              ? DateFormat('MMM d, yyyy').format(endDate)
              : '';
          return Project_Over_milestone(
            title: task.title ?? '',
            date: formattedDate,
            status: task.status ?? '',
            statusColor: _getStatusColor(task.status),
            progress: (task.progress ?? 0) / 100,
            daysLeft: endDate != null ? _calculateDaysLeft(endDate) : '',
          );
        }).toList(),
      ],
    );
  }

  Widget _activeTaskSection(ProjectOverviewModel data) {
    final tasks = data.taskAnalytics?.lastThreeActiveTasks ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            const Spacer(),
          ],
        ),
        SizedBox(height: 20.h),
        ...tasks.map((task) {
          return project_card(
            title: task.title ?? '',
            progress: (task.progress ?? 0),
            days: 14,
            isdayshow: false,
            isProgress: true,
          );
        }).toList(),
      ],
    );
  }

  Widget _recentActivitySection(List<dynamic> activities) {
    if (activities.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            const Spacer(),
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
        SizedBox(height: 20.h),
        ...activities.map((activity) {
          final timestamp =
              (activity.timestamp != null && activity.timestamp!.isNotEmpty)
              ? DateTime.tryParse(activity.timestamp!)
              : null;
          final formattedTime = timestamp != null
              ? DateFormat('hh:mm a').format(timestamp)
              : '';

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${activity.firstName ?? ''} ${activity.lastName ?? ''} ${activity.message ?? ''}',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textclr,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  if (formattedTime.isNotEmpty)
                    Text(
                      formattedTime,
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
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

  Color _getStatusColor(String? status) {
    switch (status?.toUpperCase()) {
      case 'DONE':
      case 'COMPLETE':
        return Colors.green;
      case 'TODO':
        return Colors.blue;
      case 'ONGOING':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _calculateDaysLeft(DateTime endDate) {
    final difference = endDate.difference(DateTime.now()).inDays;
    if (difference <= 0) return "Due";
    return "$difference Days Left";
  }
}
