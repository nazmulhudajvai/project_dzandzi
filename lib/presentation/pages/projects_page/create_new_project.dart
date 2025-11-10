// presentation/pages/projects_page/create_new_project_view.dart

import 'package:dzandzi/presentation/pages/projects_page/assign_project_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theams/app_colors.dart';
import '../../../theams/app_color2.dart';
import '../../controllers/project/project_controller.dart';
import '../../widgets/buttons/custom_input_widget.dart';

class CreateNewProjectView extends StatelessWidget {
  CreateNewProjectView({super.key});

  // Inject controller
  final CreateProjectController ctrl = Get.put(CreateProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_outlined),
              ),
              SizedBox(height: 30.h),
              Text(
                'Create New Project',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Fill in the details to create a new project. All fields are required.',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30.h),

              // Project Name
              Text('Project Name',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 5.h),
              CustomInputWidget(
                controller: null,
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter project name',
                onChanged: (v) => ctrl.projectName.value = v,
              ),
              SizedBox(height: 10.h),

              // Project Location
              Text('Project Location',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 5.h),
              CustomInputWidget(
                controller: null,
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter project location',
                onChanged: (v) => ctrl.projectLocation.value = v,
              ),
              SizedBox(height: 10.h),

              // Status Dropdown
              Text('Status',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 5.h),
              Obx(() => Container(
                width: 400.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.textFieldColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.startTitle),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: ctrl.status.value,
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: AppColor.greyBC),
                    isExpanded: true,
                    style: GoogleFonts.roboto(
                        color: AppColor.greyBC, fontSize: 14.sp),
                    dropdownColor: AppColors.textFieldColor,
                    borderRadius: BorderRadius.circular(20),
                    items: ctrl.statusItems
                        .map((item) => DropdownMenuItem(
                        value: item, child: Text(item)))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) ctrl.status.value = value;
                    },
                  ),
                ),
              )),
              SizedBox(height: 10.h),

              // Start & End Date
              Row(
                children: [
                  Obx(() => CustomDate(
                    title: 'Start Date',
                    titleDate: ctrl.startDateText,
                    icon: Icons.calendar_today_outlined,
                    onTap: () => ctrl.pickDate(
                        context: context, isStart: true),
                  )),
                  SizedBox(width: 5.w),
                  Obx(() => CustomDate(
                    title: 'End date',
                    titleDate: ctrl.endDateText,
                    icon: Icons.calendar_today_outlined,
                    onTap: () => ctrl.pickDate(
                        context: context, isStart: false),
                  )),
                ],
              ),
              SizedBox(height: 100.h),

              // Assign Project Manager Button
              InkWell(
                onTap: () => Get.to(() => AssignProjectManagerView()),
                child: Container(
                  width: 360.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.inProgressText, width: 1),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Assign Project Manager',
                      style: GoogleFonts.roboto(
                          color: AppColors.inProgressText,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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

// Updated CustomDate with onTap
class CustomDate extends StatelessWidget {
  const CustomDate({
    super.key,
    required this.title,
    required this.titleDate,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String titleDate;
  final IconData icon;
  final VoidCallback onTap;

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
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5.h),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: 180.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: AppColors.textFieldColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.startTitle),
            ),
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Row(
              children: [
                Icon(icon, color: AppColor.greyBC, size: 16),
                SizedBox(width: 8.w),
                Text(
                  titleDate,
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}