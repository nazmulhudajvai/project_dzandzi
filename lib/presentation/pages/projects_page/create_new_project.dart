  import 'package:dzandzi/presentation/controllers/project_pages_controler/create_project_controler.dart';
import 'package:dzandzi/presentation/data/models/create_project_model.dart';
import 'package:dzandzi/presentation/pages/projects_page/assign_project_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
 
import '../../../theams/app_colors.dart';
import '../../../theams/app_color2.dart';
import '../../widgets/buttons/custom_input_widget.dart';

class CreateNewProjectView extends StatelessWidget {
  CreateNewProjectView({super.key});

  final controller = Get.put(CreateProjectController());
  
  get ProjectCreateApi => null;
  
  get refreshToken => null;
 

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
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_outlined),
              ),
              SizedBox(height: 30.h),
              Text(
                'Create New Project',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Fill in the details to create a new project. All fields are required.',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 16.sp,
                ),
              ),

              SizedBox(height: 30.h),
              Text('Project Name',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 5.h),
              CustomInputWidget(
                controller: controller.nameController,
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter project name',
                onChanged: (value) {},
              ),

              SizedBox(height: 10.h),
              Text('Project Location',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 5.h),
              CustomInputWidget(
                controller: controller.locationController,
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter project location',
                onChanged: (value) {},
              ),

              SizedBox(height: 10.h),
              Text('Status',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),

              SizedBox(height: 5.h),
              Obx(() => Container(
                    width: 400.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.textFieldColor,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: AppColors.startTitle),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only( left: 5.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.status.value,
                          items: ["ACTIVE", "IN_PROGRESS", "COMPLETED"]
                              .map((e) =>
                                  DropdownMenuItem(value: e, child: Text(e)))
                              .toList(),
                          onChanged: (value) {
                            controller.status.value = value!;
                          },
                        ),
                      ),
                    ),
                  )),

              SizedBox(height: 10.h),
              Row(
                children: [
                  Obx(() => Custom_date(
                        title: 'Start Date',
                        titleDate: controller.startDate.value == null
                            ? 'Select date'
                            : controller.startDate.value!
                                .toString()
                                .split(" ")
                                .first,
                        icon: Icons.calendar_today_outlined,
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                            initialDate: DateTime.now(),
                          );
                          if (date != null) {
                            controller.startDate.value = date.toUtc();
                          }
                        },
                      )),
                  SizedBox(width: 5.w),
                  Obx(() => Custom_date(
                        title: 'End Date',
                        titleDate: controller.endDate.value == null
                            ? 'Select date'
                            : controller.endDate.value!
                                .toString()
                                .split(" ")
                                .first,
                        icon: Icons.calendar_today_outlined,
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                            initialDate: DateTime.now(),
                          );
                          if (date != null) {
                            controller.endDate.value = date.toUtc();
                          }
                        },
                      )),
                ],
              ),

              SizedBox(height: 50.h),

              // Assign Manager
              InkWell(
                onTap: () {
                  Get.to(AssignProjectManagerView(), arguments: controller);
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
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Submit Button
              InkWell(
                onTap: () async {
  bool success = await ProjectCreateApi.createProject(
    // create_post_model(),   // You can pass an empty dummy model
    // refreshToken,          // Your saved token
  );

  if (success) {
    Get.snackbar("Success", "Project created successfully!");
  } else {
    Get.snackbar("Error", "Failed to create project");
  }
},

                child: Container(
                  width: 360.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Text(
                      'Create Project',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
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
    required this.onTap,
  });

  final String title;
  final String titleDate;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              color: AppColor.greyBC,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
