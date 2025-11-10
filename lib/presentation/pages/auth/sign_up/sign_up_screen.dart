import 'package:dzandzi/presentation/controllers/auth/signup_controller.dart';

import 'package:dzandzi/presentation/widgets/buttons/custom_button.dart';
import 'package:dzandzi/presentation/widgets/buttons/custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theams/app_color2.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Your Account',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.h),

              // First Name
              _buildLabel("First Name"),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter First name',
                onChanged: (value) {
                  controller.firstNameController.text = value;
                },controller: null,
              ),

              SizedBox(height: 10.h),

              // Last Name
              _buildLabel("Last Name"),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter Last name',
                onChanged: (value) {
                  controller.lastNameController.text = value;
                }, controller: null,
              ),

              SizedBox(height: 10.h),

              // Email
              _buildLabel("Email Address"),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter email address',
                onChanged: (value) {
                  controller.emailController.text = value;
                },controller: null,
              ),

              SizedBox(height: 10.h),

              // Phone
              _buildLabel("Telephone Number"),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: 'Enter Telephone Number',
                onChanged: (value) {
                  controller.phoneController.text = value;
                },controller: null,
              ),

              SizedBox(height: 10.h),

              // Password
              _buildLabel("Password"),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: '********',
                onChanged: (value) {
                  controller.passwordController.text = value;
                },controller: null,
                obscureText: true,
              ),

              SizedBox(height: 10.h),

              // Confirm Password
              _buildLabel("Confirm Password"),
              CustomInputWidget(
                cwidth: 396.w,
                radius: 50.r,
                cheight: 50.h,
                hintText: '********',
                onChanged: (value) {
                  controller.confirmPasswordController.text = value;
                },controller: null,
                obscureText: true,
              ),

              SizedBox(height: 30.h),

              // Show Loading or Register button
              Obx(() => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                title: 'Register',
                radius: 100,
                height: 50.h,
                width: 369.9.w,
                onPress: () async{
                  controller.register();
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for building label text
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: AppColor.greyBC,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
