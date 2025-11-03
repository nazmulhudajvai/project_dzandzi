import 'package:dzandzi/presentation/pages/task/create_new_task.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Top Fixed Section (same as Overview)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Row
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.liniarIndicatorColor,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Back to Company View',
                          style: TextStyle(
                            color: AppColors.liniarIndicatorColor,
                            fontSize: 16.sp,
                            fontStyle: GoogleFonts.roboto().fontStyle,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 16.h),
                    Text(
                      'Task',
                      style: TextStyle(
                        color: AppColors.textclrblack,
                        fontSize: 24.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // 🔹 Search bar and filter icon
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            cursorColor: AppColors.textcolor,
                            decoration: InputDecoration(
                              hintText: '   Search here.....',
                              hintStyle: TextStyle(color: AppColors.textcolor),
                              suffixIcon: Icon(
                                Icons.search,
                                color: AppColors.textcolor,
                              ),
                              filled: true,
                              fillColor: AppColors.textFieldColor2,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                horizontal: 16.w,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(48.r),
                                borderSide: BorderSide(
                                  color: AppColors.borderColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(48.r),
                                borderSide: BorderSide(
                                  color: AppColors.borderColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(48.r),
                                borderSide: BorderSide(
                                  color: AppColors.borderColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // 🔹 Active Task Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Active Task',
                          style: TextStyle(
                            color: AppColors.defaultTextColor,
                            fontSize: 15.sp,
                            fontStyle: GoogleFonts.roboto().fontStyle,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton.icon(
                          icon: Image.asset(
                            "assets/icon/add.png",
                            height: 15.h,
                            width: 15.w,
                          ),
                          label: Text(
                            'Create Task',
                            style: TextStyle(
                              color: AppColors.deepBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                          onPressed: () {
                            Get.to(CreateNewTaskView());
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    // 🔹 Project Cards
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 50,
                      isdayshow: false,
                    ),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 70,
                      isdayshow: false,
                    ),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 80,
                      isdayshow: false,
                    ),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 50,
                      isdayshow: false,
                    ),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 40,
                      isdayshow: false,
                    ),
                    project_card(
                      title: 'Foundation inspection',
                      isProgress: false,
                      progress: 80,
                      isdayshow: false,
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
