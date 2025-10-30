import 'package:dzandzi/presentation/pages/home/home_view.dart';
import 'package:dzandzi/presentation/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../../../core/routes/app_pages.dart';
import '../../../theams/app_colors.dart';
import '../../../../theams/app_color2.dart';
import '../../widgets/buttons/custom_input_widget.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.background2Color,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_outlined,
                      size: 24,
                      color: AppColors.grey13,
                    ),
                    const Spacer(),
                    Text(
                      "Help & Support",
                      style: GoogleFonts.roboto(
                        color: AppColors.grey13,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 20.h),

                // Profile Avatar
                Center(
                  child: CircleAvatar(
                    radius: 62.r,
                    backgroundImage: const AssetImage(
                      'assets/image/pprofile.png',
                    ),
                  ),
                ),

                SizedBox(height: 30.h),

                // Current Password
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
                  onChanged: (String value) {},
                ),
                SizedBox(height: 10.h),

                // New Password
                Text(
                  'Descriptions',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),
                CustomInputWidget(
                  cwidth: 396.w,
                  radius: 20.r,
                  width: 400.w,
                  cheight: 163.h,
                  hintText: 'Write here....',
                  onChanged: (_) {},
                ),
                SizedBox(height: 30.h),
                CustomButton(title: 'Submit', radius: 50),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
