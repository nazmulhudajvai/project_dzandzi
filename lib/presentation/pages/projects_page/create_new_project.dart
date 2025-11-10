import 'package:dzandzi/presentation/pages/projects_page/assign_project_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theams/app_colors.dart';
import '../../../theams/app_color2.dart';
import '../../controllers/bottom_navbar_controller.dart';
import '../../widgets/buttons/custom_input_widget.dart';

// Make sure this path is correct

class CreateNewProjectView extends StatelessWidget {
  CreateNewProjectView({super.key});

  final controller = Get.put(BottomNavController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_outlined),
              ),
              SizedBox(height: 30.h),
              Text(
                'Create New Project',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Fill in the details to create a new project. All fields are required.',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 30.h),
              Text(
                'Project Name',
                style: GoogleFonts.roboto(
                  color: AppColor.greyBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5.h),
              CustomInputWidget(controller: null,
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter project name',
                onChanged: (String value) {},
              ),
              SizedBox(height: 10.h),

              Text(
                'Project Location',
                style: GoogleFonts.roboto(
                  color: AppColor.greyBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5.h),
              CustomInputWidget(controller: null,
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter project location',
                onChanged: (String value) {},
              ),
              SizedBox(height: 10.h),
              Text(
                'Status',
                style: GoogleFonts.roboto(
                  color: AppColor.greyBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5.h),
              Container(
                width: 400.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.textFieldColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.startTitle),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Active',
                        style: GoogleFonts.roboto(
                          color: AppColor.greyBC,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Icon(Icons.keyboard_arrow_down, color: AppColor.greyBC),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Custom_date(
                    title: 'Start Date',
                    titleDate: '5 Oct, 2025',
                    icon: Icons.calendar_today_outlined,
                  ),
                  SizedBox(width: 5.w),
                  Custom_date(
                    title: 'End date',
                    titleDate: '10 Oct, 2025',
                    icon: Icons.calendar_today_outlined,
                  ),
                ],
              ),
              SizedBox(height: 100.h),

              InkWell(
                onTap: () {
                  Get.to(AssignProjectManagerView());
                },
                child: Container(
                  width: 360.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.inProgressText,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Assign Project Manager',
                      style: GoogleFonts.roboto(
                        color: AppColors.inProgressText,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_date extends StatelessWidget {
  const Custom_date({
    super.key,
    required this.title,
    required this.titleDate,
    required this.icon,
  });

  final String title;
  final String titleDate;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            color: AppColor.greyBC,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        Container(
          width: 180.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.startTitle),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Row(
              children: [
                Icon(icon, color: AppColor.greyBC, size: 12),
                SizedBox(width: 5.w),
                Text(
                  titleDate,
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
