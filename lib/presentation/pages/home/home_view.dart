import 'package:dzandzi/presentation/pages/projects_page/create_new_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theams/app_color.dart';
import '../../../theams/app_color2.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/custom_bottom_nav.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22.r,
                          backgroundImage: AssetImage(
                            'assets/image/pprofile.png',
                          ), // or NetworkImage
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome Back!',
                              style: GoogleFonts.roboto(
                                fontSize: 13.sp,
                                color: AppColors.editTextColor,
                              ),
                            ),
                            Text(
                              'Rahim Rehman',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: AppColors.titleText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColor.blueLiteColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          'assets/image/inotification.svg',
                          height: 24.h,
                          width: 24.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                // Search bar
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
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  'All your activities in one place',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                    color: AppColor.textColor2,
                  ),
                ),

                SizedBox(height: 16.h),
                InkWell(
                  onTap: () {
                    Get.to(CreateNewProjectView());
                  },
                  child: Center(
                    child: Container(
                      width: 350.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppColors.liniarIndicatorColor,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColors.liniarIndicatorColor,
                          ),
                          Text(
                            'Create Project',
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.liniarIndicatorColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Stat cards
                SizedBox(height: 24.h),

                // Create project button
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
