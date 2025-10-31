import 'package:dzandzi/presentation/controllers/inventory_controllers/custom_dropdown_field_controller.dart';
import 'package:dzandzi/presentation/controllers/inventory_controllers/filter_controller.dart';
import 'package:dzandzi/presentation/widgets/buttons/custom_button.dart';
import 'package:dzandzi/presentation/widgets/custom_button_ak.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/custom_dropdown_field.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  final CustomDropdownFieldController controller = Get.put(
    CustomDropdownFieldController(),
  );

  // use existing FilterController if available, otherwise create it once
  final FilterController filterController = Get.isRegistered<FilterController>()
      ? Get.find<FilterController>()
      : Get.put(FilterController());

  FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          color: AppColors.whiteColor,
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextProperty(
              text: 'Filter Inventory',
              textColor: AppColors.textColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20.h),
            TextProperty(
              text: 'Status',
              textColor: AppColors.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 4.h),
            CustomDropdownField(
              fillColor: AppColors.textFieldColor,
              borderRadius: 50.r,
              // borderWidth: 1,
              borderColor: AppColors.borderColor,
              hintText: 'All Status',
              items: ['All', 'In Stock', 'Out of Stock', 'Low Stock'],
              selectedValue: controller.selectedStatus,
            ),
            SizedBox(height: 20.h),
            TextProperty(
              text: 'Category',
              textColor: AppColors.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 4.h),
            CustomDropdownField(
              hintText: 'All Categories',
              items: ['All', 'Materials', 'Tools', 'Hardware', 'Electrcal', 'Plumbing'],
              selectedValue: controller.selectedCategory,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: CustomButtonAk(
                    buttonColor: AppColors.whiteColor,
                    borderColor: AppColors.defaultTextColor,
                    textColor: AppColors.defaultTextColor,
                    borderRadius: 50.r,
                    text: 'Reset',
                    onTap: () {
                      // reset the dropdown controller values and the main filter controller
                      controller.selectedStatus.value = 'All';
                      controller.selectedCategory.value = 'All';
                      filterController.resetFilters();
                      // keep bottom sheet open, so user can see reset results
                    },
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: CustomButtonAk(
                    borderRadius: 50.r,
                    text: 'Apply Filter',
                    onTap: () {
                      // apply filter using values from dropdown controller
                      final String status = controller.selectedStatus.value;
                      final String category = controller.selectedCategory.value;
                      filterController.applyFilter(status: status, category: category);
                      Navigator.of(context).pop(); // close sheet after apply
                    }
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
