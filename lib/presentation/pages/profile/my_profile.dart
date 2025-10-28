import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../theams/app_color.dart';
import '../../controllers/bottom_navbar_controller.dart';

class MyProfileView extends StatelessWidget {
  MyProfileView({super.key});

  final controller = Get.put(BottomNavController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Spacer(),
                  Text(
                    'My Profile',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 40.h),
              SizedBox(
                height: 72.h,
                width: 72.w,
                child: CircleAvatar(
                  backgroundColor: AppColor.whiteColor,
                  backgroundImage: AssetImage('assets/image/pps.png'),
                ),
              ),
              SizedBox(height: 20.h),

              Container(
                height: 71.h,
                width: 336.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.containerColor5,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Assist Software Engineer skilled in AI, full-stack dev, DB optimization, and CI/CD, delivering secure systems.',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColor.whiteLiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColor.whiteColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 48.h,
                    width: 336.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.whiteLiteColor,
                        width: .3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.blackLiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Jubayer Ahmad',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.whiteLiteColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Birthday',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColor.whiteColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 48.h,
                    width: 336.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.whiteLiteColor,
                        width: .3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.blackLiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '01/01/2001',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.whiteLiteColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Gender',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColor.whiteColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 48.h,
                    width: 336.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.whiteLiteColor,
                        width: .3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.blackLiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Male',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.whiteLiteColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
