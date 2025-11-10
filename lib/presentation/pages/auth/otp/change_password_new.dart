import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theams/app_color2.dart';
import '../../../controllers/auth/forget_password_controller.dart';
import '../../../widgets/buttons/custom_button.dart';
import '../../../widgets/buttons/custom_input_widget.dart';

class ChangePasswordNewView extends StatelessWidget {
  ChangePasswordNewView({super.key});
  final ForgetPasswordController controller = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments['email'] ?? '';
    final otp = Get.arguments['otp'] ?? '';
    controller.emailController.text = email;
    controller.otpController.text = otp;

    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verify Your Identity!",
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Enter New Password',
                style: GoogleFonts.roboto(
                  color: AppColor.greyBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: '********',
                obscureText: true,
                controller: controller.newPasswordController,
                onChanged: (_) {},
              ),
              SizedBox(height: 10.h),
              Text(
                'Confirm Password',
                style: GoogleFonts.roboto(
                  color: AppColor.greyBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: '********',
                obscureText: true,
                controller: controller.confirmPasswordController,
                onChanged: (_) {},
              ),
              SizedBox(height: 50.h),
              Obx(() => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                title: 'Update',
                radius: 50.r,
                onPress: controller.resetPassword,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
