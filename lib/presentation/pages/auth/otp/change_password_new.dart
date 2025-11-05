import 'package:dzandzi/presentation/pages/home/home_view.dart';
import 'package:dzandzi/presentation/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../../../theams/app_colors.dart';
import '../../../../theams/app_color2.dart';
import '../../../widgets/buttons/custom_input_widget.dart';
import 'change_password_view.dart';

class ChangePasswordNewView extends StatelessWidget {
  ChangePasswordNewView({super.key});


  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.background2Color,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(
                  "Verify Your Identity!",
                  style: GoogleFonts.roboto(
                    color: AppColors.grey13,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),

                SizedBox(height: 20.h),



                SizedBox(height: 10.h),
                Text(
                  'Enter New Password',
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
                  onChanged: (String value) {},
                  obscureText: true,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Confirm Password',
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
                  onChanged: (String value) {},
                  obscureText: true,
                ),
                SizedBox(height: 50.h),
                CustomButton(
                  title: 'Update',
                  radius: 50.r,
                  onPress: () async {
                    Get.to(HomeView());
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
