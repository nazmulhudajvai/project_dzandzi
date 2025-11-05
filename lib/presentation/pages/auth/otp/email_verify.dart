import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theams/app_color2.dart';
import '../../../controllers/auth/forget_password_controller.dart';
import '../../../widgets/buttons/custom_button.dart';
import '../../../widgets/buttons/custom_input_widget.dart';
import 'otp.dart';


class EmailVerifyView extends StatelessWidget {
  EmailVerifyView({super.key});
  final ForgetPasswordController controller = Get.put(ForgetPasswordController());

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
                Text(
                  'Trouble Logging In?',
                  style: GoogleFonts.roboto(
                    color: AppColor.grayBC,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Email Address',
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
                  hintText: 'Enter email address',
                  controller: controller.emailController,
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
                  onPress: controller.sendEmail,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
