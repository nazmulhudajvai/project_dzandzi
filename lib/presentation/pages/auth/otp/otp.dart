import 'package:dzandzi/presentation/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../theams/app_color2.dart';
import 'change_password_new.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose(); // ✅ Always dispose controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: SingleChildScrollView(
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
                  controller: otpController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  textStyle:   GoogleFonts.roboto(
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
                  onCompleted: (v) {
                    debugPrint("Completed: $v");
                  },
                  onChanged: (value) {
                    debugPrint(value);
                  },
                ),

                SizedBox(height: 50.h),

                CustomButton(
                  title: 'Send',
                  radius: 100,
                  height: 50.h,
                  width: 369.9.w,
                  onPress: () async {
                    // Optional: check length before navigating
                    if (otpController.text.length == 4) {
                      Get.to(() => ChangePasswordNewView());
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please enter all 4 digits',
                        backgroundColor: AppColor.redColor,
                        colorText: AppColor.whiteColor,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
