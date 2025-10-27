import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theams/app_color.dart';
import '../../../widgets/custome_otp_field.dart';
import 'change_password_view.dart';

class OtpVerifyView extends StatelessWidget {
  OtpVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackLiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 30.h,
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
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'One-Time Password',
                    style: GoogleFonts.inter(
                      color: AppColor.whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'You should have received a four digit code, please enter it below.',
                    style: GoogleFonts.inter(
                      color: AppColor.textGreyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 35.h),
                  Positioned(
                    top: 150.h,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/image/bro.png',
                      height: 213.h,
                      width: 104.w,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        color: AppColor.textGreyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.7,
                      ),
                      children: [
                        TextSpan(text: 'Enter the OTP sent to '),
                        TextSpan(
                          text: '- (01757976790)',
                          style: GoogleFonts.inter(
                            color: AppColor.whiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CustomeOtpField(text: '2'),
                      SizedBox(width: 20),
                      CustomeOtpField(text: '2'),
                      SizedBox(width: 20),
                      CustomeOtpField(text: '2'),
                      SizedBox(width: 20),
                      CustomeOtpField(text: '2'),
                    ],
                  ),
                  SizedBox(height: 30.h),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
