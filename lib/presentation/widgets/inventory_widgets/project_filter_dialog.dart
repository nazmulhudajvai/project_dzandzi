import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../theams/app_colors.dart';
import '../../controllers/inventory/project_usage_filter_controller.dart';

class ProjectFilterDialog extends StatelessWidget {
  const ProjectFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProjectUsageFilterController>();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter Projects',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close, color: AppColors.subtitleColor, size: 24.sp),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Obx(() => _buildFilterOption('All Projects', 'All', controller.selectedFilter.value == 'All', controller)),
            SizedBox(height: 12.h),
            Obx(() => _buildFilterOption('Active Projects', 'Active', controller.selectedFilter.value == 'Active', controller)),
            SizedBox(height: 12.h),
            Obx(() => _buildFilterOption('Inactive Projects', 'Inactive', controller.selectedFilter.value == 'Inactive', controller)),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      controller.clearFilter();
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.borderColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text('Clear', style: TextStyle(color: AppColors.black, fontSize: 14.sp)),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blueColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text('Apply', style: TextStyle(color: AppColors.whiteColor, fontSize: 14.sp)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption(String title, String value, bool isSelected, ProjectUsageFilterController controller) {
    return InkWell(
      onTap: () => controller.setFilter(value),
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blueColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.blueColor : AppColors.borderColor,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? AppColors.blueColor : AppColors.subtitleColor,
              size: 20.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? AppColors.blueColor : AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
