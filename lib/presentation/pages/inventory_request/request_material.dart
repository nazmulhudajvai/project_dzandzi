import 'package:dzandzi/presentation/widgets/buttons/custom_button.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/custom_textfield.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/number_selector.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestMaterial extends StatelessWidget {
  const RequestMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.headerColor,
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Text(
                      'Add New Documents',
                      style: TextStyle(
                        color: AppColors.headerColor,
                        fontSize: 24.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                Text(
                  'Project*',
                  style: TextStyle(
                    color: AppColors.textFeieldTitle,

                    fontSize: 16.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                    size: 24.sp,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                  ),
                  hint: Text(
                    'Select Project',
                    style: TextStyle(color: Colors.grey),
                  ),
                  items: <String>['Project 1', 'Project 2', 'Project 3']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  onChanged: (String? newValue) {},
                ),
                SizedBox(height: 20.h),

                TextProperty(
                  text: 'Quantity to Use*',
                  textColor: AppColors.textFeieldTitle,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 6.h),
                NumberSelector(),
                Text(
                  'Unit Type*',
                  style: TextStyle(
                    color: AppColors.textFeieldTitle,

                    fontSize: 16.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                    size: 24.sp,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                  ),
                  hint: Text(
                    'Select Project',
                    style: TextStyle(color: Colors.grey),
                  ),
                  items: <String>['Project 1', 'Project 2', 'Project 3']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  onChanged: (String? newValue) {},
                ),
                SizedBox(height: 20.h),
                Text(
                  'Priority*',
                  style: TextStyle(
                    color: AppColors.textFeieldTitle,

                    fontSize: 16.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                DropdownButtonFormField<String>(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                    size: 24.sp,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldColor,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48.r),
                      borderSide: BorderSide(color: AppColors.greyborder),
                    ),
                  ),
                  hint: Text(
                    'Select Project',
                    style: TextStyle(color: Colors.grey),
                  ),
                  items: <String>['Project 1', 'Project 2', 'Project 3']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                  onChanged: (String? newValue) {},
                ),
                SizedBox(height: 20),
                TextProperty(
                  text: 'Require Date',
                  textColor: AppColors.textFeieldTitle,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 6.h),
                CustomTextfield(
                  fillColor: AppColors.textFieldColor,
                  fieldText: 'fieldText',
                ),
                SizedBox(height: 20.sp),
                CustomButton(title: 'Submit Request', radius: 100, height: 43),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
