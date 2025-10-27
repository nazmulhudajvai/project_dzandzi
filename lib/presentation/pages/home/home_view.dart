import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../theams/app_color.dart';
import '../../controllers/bottom_navbar_controller.dart';

// Make sure this path is correct

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(BottomNavController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackLiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('assets/image/logo.png', height: 36.h, width: 73.w),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.toNamed('/signup'); // example: navigate to signup
                  },
                  child: SvgPicture.asset(
                    'assets/image/Vector-2.svg',
                    width: 24.w,
                    height: 24.h,
                    color: AppColor.whiteLiteColor,
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
