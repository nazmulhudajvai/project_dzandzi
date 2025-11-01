import 'package:dzandzi/presentation/controllers/inventory_controllers/custom_dropdown_field_controller.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/custom_dropdown_field.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/custom_textfield.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/number_selector.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UseInProject extends StatelessWidget {
  final CustomDropdownFieldController controller = Get.put(
    CustomDropdownFieldController(),
  );

  UseInProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      ImageAssets.back,
                      width: 19.sp,
                      height: 16.sp,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Item Details',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextProperty(
                          text: 'Wood Planks',
                          textColor: AppColors.textColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 8.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Available: ',
                                style: TextStyle(
                                  color: AppColors.subtitleColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ' 42 Pieces',
                                style: TextStyle(
                                  color: AppColors.subtitleColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.inventoryText,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextProperty(
                        text: 'In Stock',
                        textColor: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TextProperty(
                text: 'Project*',
                textColor: AppColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 6.h),
              CustomDropdownField(
                hintTextColor: AppColors.subtitleColor,
                height: 48.h,
                contentPadding: EdgeInsets.all( 12.sp),
                hintText: 'Select Project',
                items: ['Project 1', 'Project 2', 'Project 3'],
                selectedValue: controller.selectedProject,
              ),
              SizedBox(height: 18.h),
              TextProperty(
                text: 'Quantity to Use*',
                textColor: AppColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 6.h),
              NumberSelector(),
              SizedBox(height: 18.h),
              TextProperty(
                text: 'Date',
                textColor: AppColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 6.h),
              CustomTextfield(
                
                fillColor: AppColors.textFieldColor,
                fieldText: 'fieldText'
              ),
              SizedBox(height: 18.h),
              TextProperty(
                text: 'Note*',
                textColor: AppColors.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 6.h),
              CustomTextfield(
                borderRadius: 12.r,
                maxLines: 4,
                fillColor: AppColors.textFieldColor,
                fieldText: 'fieldText'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
