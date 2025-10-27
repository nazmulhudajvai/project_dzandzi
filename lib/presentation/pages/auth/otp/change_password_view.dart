import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../../../core/routes/app_pages.dart';
import '../../../../theams/app_color.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RxBool isLoading = false.obs;

  void resetPassword() async {
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    if (newPassword != confirmPassword) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      isLoading.value = true;

      // Simulate network request
      await Future.delayed(Duration(seconds: 2));

      Get.snackbar('Success', 'Password has been reset');
      // Optionally navigate back or to login page
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.blackLiteColor,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 20.h,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 68,
                  width: 139,
                  child: Image.asset(
                    'assets/image/logo.png',
                    height: 213.h,
                    width: 104.w,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                top: 70,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      'Reset your password',
                      style: GoogleFonts.inter(
                        color: AppColor.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Please enter a new password below and confirm it.',
                      style: GoogleFonts.inter(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),
                    Positioned(
                      top: 0.h,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/image/bro2.png',
                        height: 186.h,
                        width: 197.7.w,
                      ),
                    ),
                    SizedBox(height: 37.h),
                    Text(
                      'Password',
                      style: GoogleFonts.inter(
                        color: AppColor.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10.h),

                    SizedBox(height: 20.h),
                    Text(
                      'Confirm Password',
                      style: GoogleFonts.inter(
                        color: AppColor.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10.h),

                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
