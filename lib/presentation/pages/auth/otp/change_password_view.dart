import 'package:dzandzi/presentation/pages/home/home_view.dart';
import 'package:dzandzi/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../../../core/routes/app_pages.dart';
import '../../../../theams/app_colors.dart';
import '../../../../theams/app_color2.dart';
import '../../../widgets/custom_input_widget.dart';

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
        backgroundColor: AppColor.background2Color,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_outlined,
                      size: 24,
                      color: AppColors.grey13,
                    ),
                    Spacer(),
                    Text(
                      "Personal Information",
                      style: GoogleFonts.roboto(
                        color: AppColors.grey13,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    // allows the edit icon to overflow a bit
                    children: [
                      CircleAvatar(
                        radius: 62.r,
                        backgroundImage: const AssetImage(
                          'assets/image/pprofile.png',
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 34.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: AppColors.editProfileColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/image/iedit.svg',
                              height: 20.h,
                              width: 20.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Current Password',
                  style: GoogleFonts.roboto(
                    color: AppColor.greyBC,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h),
                CustomInputWidget(
                  radius: 50.r,
                  cheight: 50.h,
                  hintText: '********',
                  onChanged: (String value) {},
                  obscureText: true,
                ),
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
