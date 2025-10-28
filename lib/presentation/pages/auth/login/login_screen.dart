import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theams/app_color.dart';

import '../../home/home_view.dart';
import '../otp/forget_password_view.dart';
import '../sign_up/sign_up_screen.dart';

class LoginController extends GetxController {
  var isRemembered = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Dummy login method
  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }

    Get.snackbar('Success', 'Logged in successfully!');
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

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
              // Logo
              if (!isKeyboardOpen)
                Positioned(
                  top: 120.h,
                  left: 0,
                  right: 0,
                  child: Image.asset('assets/image/logo.png', height: 80.h),
                ),

              // Form
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                top: isKeyboardOpen ? 60.h : 220.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Welcome back, Champion!',
                      style: GoogleFonts.inter(
                        color: AppColor.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Login to your account',
                      style: GoogleFonts.roboto(
                        color: AppColor.textGreyColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25.h),

                    // Email
                    Text(
                      'Phone Number',
                      style: GoogleFonts.inter(
                        color: AppColor.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // Password
                    Text(
                      'Password',
                      style: GoogleFonts.inter(
                        color: AppColor.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Remember Me + Forgot Password
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => controller.isRemembered.toggle(),
                            child: Obx(
                              () => Container(
                                width: 17,
                                height: 17,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: controller.isRemembered.value
                                        ? AppColor.greenColor
                                        : AppColor.whiteLiteColor,
                                  ),
                                ),
                                child: controller.isRemembered.value
                                    ? Icon(
                                        Icons.check,
                                        color: AppColor.greenColor,
                                        size: 14,
                                      )
                                    : null,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Remember me',
                            style: GoogleFonts.inter(
                              color: AppColor.whiteLiteColor,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () => Get.to(() => SignUpView()),
                            child: Text(
                              'Forget Password?',
                              style: GoogleFonts.inter(
                                color: AppColor.greenColor,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Login Button
                    SizedBox(height: 20.h),

                    // Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: GoogleFonts.inter(
                            color: AppColor.whiteLiteColor,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        GestureDetector(
                          onTap: () => Get.to(() => SignUpView()),
                          child: Text(
                            'Register',
                            style: GoogleFonts.inter(
                              color: AppColor.greenColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
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
