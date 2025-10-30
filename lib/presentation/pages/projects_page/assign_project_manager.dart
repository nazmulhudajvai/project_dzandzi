import 'package:dzandzi/presentation/pages/auth/sign_up/sign_up_screen.dart';
import 'package:dzandzi/presentation/pages/projects_page/assigned_project_manager.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theams/app_colors.dart';
import '../../../theams/app_color2.dart';
import '../../controllers/bottom_navbar_controller.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_input_widget.dart';
import '../home/home_view.dart';

// Make sure this path is correct

class AssignProjectManagerView extends StatelessWidget {
  AssignProjectManagerView({super.key});

  final controller = Get.put(BottomNavController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 399.w,
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: AppColors.textFieldColor2,
                    borderRadius: BorderRadius.circular(42.r),
                    border: Border.all(color: AppColors.searchColor),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8.w),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here…..',
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.roboto(
                              color: AppColors.textcolor,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search_outlined,
                        color: AppColors.textColor.withOpacity(.5),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundImage: AssetImage(
                        'assets/image/pprofile.png',
                      ), // or NetworkImage
                    ),
                    SizedBox(width: 10.w),

                    Text(
                      'Rahim Rehman',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: AppColors.titleText,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Added',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.blueLiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                suggested_manager(),
                SizedBox(height: 10.h),
                suggested_manager(),
                SizedBox(height: 10.h),
                suggested_manager(),
                SizedBox(height: 10.h),
                suggested_manager(),
                SizedBox(height: 10.h),
                suggested_manager(),
                SizedBox(height: 10.h),
                suggested_manager(),
                SizedBox(height: 10.h),

                SizedBox(height: 100.h),
                InkWell(
                  onTap: () {
                    Get.to(AssignedProjectManager());
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
                        'Next',
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
      ),
    );
  }
}

class suggested_manager extends StatelessWidget {
  const suggested_manager({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: AssetImage(
            'assets/image/pprofile.png',
          ), // or NetworkImage
        ),
        SizedBox(width: 10.w),

        Text(
          'Rahim Rehman',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            color: AppColors.titleText,
          ),
        ),
        Spacer(),
        Text(
          'Add',
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColor.greyBC,
          ),
        ),
      ],
    );
  }
}
