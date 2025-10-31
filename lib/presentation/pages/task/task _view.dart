import 'package:dzandzi/presentation/pages/document/add_document.dart';
import 'package:dzandzi/presentation/pages/task/create_new_task.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
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
            Padding(
              padding: EdgeInsetsGeometry.only(right: 15.w, left: 15.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back, color: AppColors.headerColor),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'Back to Company View',
                    style: TextStyle(
                      color: AppColor.blueColor,
                      fontSize: 16,
                      fontStyle: GoogleFonts.roboto().fontStyle,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Custom "Back" navigation row

                      // "Task" Title
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

                      // Search bar and filter icon
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: AppColors.textcolor,
                              decoration: InputDecoration(
                                hintText: '   Search here.....',
                                hintStyle: TextStyle(
                                  color: AppColors.textcolor,
                                ),
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
                    ],
                  ),
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
