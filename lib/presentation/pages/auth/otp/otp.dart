import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../theams/app_color2.dart';
import '../../../controllers/auth/forget_password_controller.dart';
import '../../../widgets/buttons/custom_button.dart';
import 'change_password_new.dart';
class OtpView extends StatelessWidget {
  OtpView({super.key});
  final ForgetPasswordController controller = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments['email'] ?? '';
    controller.emailController.text = email;

    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify Your Identity!',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.h),
              PinCodeTextField(
                appContext: context,
                controller: controller.otpController,  // ✅ use controller from GetX
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                textStyle: GoogleFonts.roboto(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 70,
                  fieldWidth: 60,
                  activeFillColor: AppColor.whiteColor,
                  inactiveFillColor: AppColor.whiteColor,
                  selectedFillColor: AppColor.blueColor,
                  activeColor: AppColor.blueColor,
                  selectedColor: AppColor.blueColor,
                  inactiveColor: AppColor.greyColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (_) {},
              ),
              SizedBox(height: 50.h),
              Obx(() => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : CustomButton(
                title: 'Send',
                radius: 100,
                height: 50.h,
                width: 369.9.w,
                onPress: controller.verifyOtp,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
