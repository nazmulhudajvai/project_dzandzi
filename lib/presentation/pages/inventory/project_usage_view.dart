import 'package:dzandzi/presentation/widgets/inventory_widgets/chart_container.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/inventory_usage_chart.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/most_used_item_chart.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/inventory/project_usage_filter_controller.dart';
import '../../widgets/inventory_widgets/project_filter_dialog.dart';

class ProjectUsageView extends StatelessWidget {
  const ProjectUsageView({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.put(ProjectUsageFilterController());

    return Obx(() => Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) => filterController.setSearchQuery(value),
                decoration: InputDecoration(
                  hintText: 'Search projects...',
                  hintStyle: TextStyle(color: AppColors.subtitleColor, fontSize: 14.sp),
                  suffixIcon: filterController.searchQuery.value.isNotEmpty
                      ? GestureDetector(
                          onTap: () => filterController.clearSearch(),
                          child: Icon(Icons.clear, color: AppColors.subtitleColor, size: 20.sp),
                        )
                      : Icon(Icons.search, color: AppColors.subtitleColor, size: 20.sp),
                  filled: true,
                  fillColor: AppColors.borderColor.withOpacity(0.2),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.r), borderSide: BorderSide(color: AppColors.borderColor)),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.r), borderSide: BorderSide(color: AppColors.borderColor)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50.r), borderSide: BorderSide(color: AppColors.borderColor, width: 1.5)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  constraints: BoxConstraints(maxHeight: 56.h, minHeight: 40.h),
                ),
              ),
            ),
            SizedBox(width: 20.w),
            GestureDetector(
              onTap: () => Get.dialog(ProjectFilterDialog()),
              child: Stack(
                children: [
                  Icon(Icons.filter_list, color: AppColors.subtitleColor, size: 24.sp),
                  if (filterController.selectedFilter.value != 'All')
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(color: AppColors.blueColor, shape: BoxShape.circle),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        
        if (filterController.isLoading.value)
          Center(child: Padding(padding: EdgeInsets.all(40.h), child: CircularProgressIndicator(color: AppColors.blueColor)))
        else ...[
          if (filterController.searchQuery.value.isNotEmpty || filterController.selectedFilter.value != 'All')
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${filterController.filteredProjects.length} results', style: TextStyle(color: AppColors.subtitleColor, fontSize: 12.sp)),
                  GestureDetector(
                    onTap: () {
                      filterController.clearSearch();
                      filterController.clearFilter();
                    },
                    child: Text('Clear all', style: TextStyle(color: AppColors.blueColor, fontSize: 12.sp)),
                  ),
                ],
              ),
            ),
          
          InventoryUsageChart(),
          SizedBox(height: 20.h),
          MostUsedItemsChart(),
          SizedBox(height: 20.h),
          
          if (filterController.filteredProjects.isEmpty)
            Center(child: Padding(padding: EdgeInsets.all(40.h), child: Text('No projects found', style: TextStyle(color: AppColors.subtitleColor))))
          else
            ...filterController.filteredProjects.map((project) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: ChartContainer(
                title: project.projectName,
                itemsUsed: project.totalItems,
                lastUpdated: project.formattedDate,
                totalValue: project.totalValue,
              ),
            )).toList(),
        ],
        
        SizedBox(height: 40.h),
      ],
    ));
  }
}
