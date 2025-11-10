import 'package:dzandzi/presentation/controllers/inventory_controllers/custom_tabbar_widget_controller.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CustomTabBarWidgetController());

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.liniarIndicatorColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(controller.selectedTabs.length, (
            selectedTabIndex,
          ) {
            final isSelected =
                controller.selectedTabIndex.value == selectedTabIndex;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => controller.selectTab(selectedTabIndex),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.liniarIndicatorColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(
                        color: isSelected
                            ? Colors.transparent
                            : Colors.transparent,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 6.w),
                    child: Center(
                      child: Text(
                        controller.selectedTabs[selectedTabIndex],
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: isSelected
                              ? AppColors.whiteColor
                              : AppColors.liniarIndicatorColor.withOpacity(0.4),
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
        
                if (selectedTabIndex != controller.selectedTabs.length - 1)
                  SizedBox(width: 4.w),
              ],
            );
          }),
        ),
      );
    });
  }
}
