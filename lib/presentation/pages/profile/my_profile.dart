import 'package:dzandzi/presentation/pages/profile/help_support.dart';
import 'package:dzandzi/presentation/pages/profile/pesonal_info.dart';
import 'package:dzandzi/presentation/pages/profile/terms_conditions.dart';
import 'package:dzandzi/presentation/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theams/app_colors.dart';
import '../../../theams/app_color2.dart';
import '../../controllers/bottom_navbar_controller.dart';
import '../projects_page/assigned_project_manager.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final controller = Get.put(BottomNavController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 28.0, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 32.r,
                      backgroundImage: AssetImage(
                        'assets/image/pprofile.png',
                      ), // or NetworkImage
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rahim Rehman',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: AppColors.titleText,
                          ),
                        ),
                        Text(
                          'rahimrehman@gmail.com',
                          style: GoogleFonts.roboto(
                            fontSize: 13.sp,
                            color: AppColors.editTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: GoogleFonts.roboto(
                        color: AppColor.greyBC,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5.h),
                    InkWell(
                      onTap: () {
                        Get.to(PersonalInfo());
                      },
                      child: profile_card(
                        image: 'assets/image/iperson.svg',
                        icon: Icons.arrow_forward_ios_sharp,
                        title: 'Personal Informations',
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      "Help & Support",
                      style: GoogleFonts.roboto(
                        color: AppColor.greyBC,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(HelpSupport());
                      },
                      child: profile_card(
                        image: 'assets/image/ihands.svg',
                        icon: Icons.arrow_forward_ios_sharp,
                        title: 'Help & Support',
                      ),
                    ),
                    SizedBox(height: 15.h),
                    InkWell(
                      onTap: () {
                        Get.to(TermsConditions());
                      },
                      child: profile_card(
                        image: 'assets/image/itandc.svg',
                        icon: Icons.arrow_forward_ios_sharp,
                        title: 'Terms & Conditions',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 105.h),
                InkWell(
                  onTap: () {
                    Get.to(AssignedProjectManager());
                  },
                  child: Container(
                    width: 360.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.blueColor, width: 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/image/ilogout.svg",
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            'Log Out',
                            style: GoogleFonts.roboto(
                              color: AppColor.blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}

class profile_card extends StatelessWidget {
  const profile_card({
    super.key,
    required this.image,
    required this.icon,
    required this.title,
  });

  final String image;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 52.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.grey13,
            offset: Offset(1, 1.5),
            blurStyle: BlurStyle.outer,
            blurRadius: .5,
            spreadRadius: .2,
          ),
        ],
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.0, right: 18.0),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 20.h,
              width: 20.w,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 5.w),
            Text(
              title,
              style: GoogleFonts.roboto(
                color: AppColor.greyBC,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
            Spacer(),
            Icon(icon, color: AppColor.greyBC, size: 20),
          ],
        ),
      ),
    );
  }
}
