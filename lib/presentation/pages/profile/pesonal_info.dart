import 'package:dzandzi/presentation/pages/auth/otp/change_password_view.dart';
import 'package:dzandzi/presentation/pages/auth/sign_up/sign_up_screen.dart';
import 'package:dzandzi/presentation/pages/projects_page/assigned_project_manager.dart';
import 'package:dzandzi/presentation/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theams/app_color.dart';
import '../../../theams/app_color2.dart';
import '../../controllers/bottom_navbar_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input_widget.dart';
import '../home/home_view.dart';

// Make sure this path is correct

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_outlined,
                      size: 24,
                      color: AppColors.grey13,
                    ),
                    Spacer(),
                    Text(
                      "Personal Information",
                      style: GoogleFonts.roboto(
                        color: AppColors.grey13,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                  ],
                ),

                SizedBox(height: 20.h),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    // allows the edit icon to overflow a bit
                    children: [
                      CircleAvatar(
                        radius: 62.r,
                        backgroundImage: const AssetImage(
                          'assets/image/pprofile.png',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 34.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: AppColors.editProfileColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/image/iedit.svg',
                              height: 20.h,
                              width: 20.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Column(
                  children: [
                    Row(
                      children: [
                        Custom_details(
                          title: 'First Name',
                          details: 'Rahim',
                          width: 180,
                          height: 44,
                        ),
                        SizedBox(width: 8.w),
                        Custom_details(
                          title: 'Last Name',
                          details: 'Rehman',
                          width: 180,
                          height: 44,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Custom_details(
                      title: 'Phone Number',
                      details: '01980012351',
                      width: 380,
                      height: 44,
                    ),
                    SizedBox(height: 10.h),
                    Custom_details(
                      title: 'Email Address',
                      details: 'rahimrehman@gmail.com',
                      width: 380,
                      height: 44,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.to(ChangePasswordView());
                  },
                  child: Text(
                    "Change Password",
                    style: GoogleFonts.roboto(
                      color: AppColors.subtitle2Color,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.subtitle2Color,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onPress: () async {
                    Get.to(ChangePasswordView());
                  },
                  title: 'Edit Details',
                  leadingIcon: 'assets/image/iedit.svg',
                  leadingIconHeight: 20.h,
                  leadingIconWeight: 20.w,
                  radius: 50.r,
                  leading: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Custom_details extends StatelessWidget {
  const Custom_details({
    super.key,
    required this.title,
    required this.details,
    required this.width,
    required this.height,
  });

  final String title;
  final String details;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.roboto(
            color: AppColors.textFeieldTitle,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 5.h),
        Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.startTitle),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 12),
            child: Text(
              details,
              style: GoogleFonts.roboto(
                color: AppColors.black12,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
