import 'package:dzandzi/presentation/pages/auth/otp/email_verify.dart';
import 'package:dzandzi/presentation/pages/auth/sign_up/sign_up_screen.dart';
import 'package:dzandzi/presentation/pages/common/company_details.dart';
import 'package:dzandzi/presentation/widgets/buttons/custom_button.dart';
import 'package:dzandzi/presentation/widgets/buttons/custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theams/app_color2.dart';
import '../../../bottom_navigation_bar/view/bottom_navigation_view.dart';
import '../../../controllers/auth/login_controller.dart';

// Controller for UI state only
class LoginView extends StatelessWidget {
  LoginView({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: GoogleFonts.roboto(
                    color: AppColor.grayBC,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 30.h),
                Text(
                  'Email Address',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h),
                CustomInputWidget(
                  cwidth: 396.w,
                  radius: 50.r,
                  cheight: 50.h,
                  hintText: 'Enter email address',
                  onChanged: (String value) {
                    controller.emailController.text = value;
                  },controller: null
                ),
                SizedBox(height: 10.h),

                Text(
                  'Telephone Number',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h),
                CustomInputWidget(
                  cwidth: 396.w,
                  radius: 50.r,
                  cheight: 50.h,
                  hintText: 'Enter Telephone Number',
                  onChanged: (String value) {
                    controller.phoneController.text = value;
                  },controller: null
                ),
                SizedBox(height: 10.h),
                Text(
                  'Password',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h),
                CustomInputWidget(
                  cwidth: 396.w,
                  radius: 50.r,
                  cheight: 50.h,
                  hintText: '********',
                  onChanged: (String value) {
                    controller.passwordController.text = value;
                  },
                  obscureText: true, controller: null,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 02.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () { Get.to(SignUpView()); },
                        child: Text(
                          'Create New Account',
                          style: GoogleFonts.roboto(
                            color: AppColor.greyBC,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () { Get.to(EmailVerifyView()); },
                        child: Text(
                          'Forget Password',
                          style: GoogleFonts.roboto(
                            color: AppColor.greyBC,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),

                // Show Loading or Register button
                Obx(() => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                  title: 'Log In',
                  radius: 100,
                  height: 50.h,
                  width: 369.9.w,
                  onPress: controller.login,
                )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
