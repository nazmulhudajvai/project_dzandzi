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

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.background2Color,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        size: 24,
                        color: AppColors.grey13,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),

                    Spacer(),
                    Text(
                      "Terms & Conditions",
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
                SizedBox(height: 30.h),

                // Current Password
                title_terms(title: 'Last update 4 october 2024'),

                SizedBox(height: 10.h),

                // New Password
                details_term(
                  text:
                      'Welcome to  accessing and using our platform, you agree to be bound by these Terms & Conditions. '
                      'These terms are designed to protect both you as a user and  as a service provider.'
                      ' If you disagree with any part of these terms, we kindly ask that you refrain from using the platform.',
                ),
                SizedBox(height: 10.h),
                title_terms(title: '1. Acceptance of Terms'),

                SizedBox(height: 10.h),

                // New Password
                details_term(
                  text:
                      'By using the LangSwap platform, you agree to abide by these Terms & Conditions.'
                      ' If you do not agree to these terms, please refrain from using the platform.',
                ),
                SizedBox(height: 10.h),
                title_terms(title: '2. User Responsibilities'),

                SizedBox(height: 10.h),

                // New Password
                details_term(
                  text:
                      'You are responsible for maintaining the confidentiality of your account and for all activities that '
                      'occur under your account.'
                      ' You agree not to use LangSwap for any illegal or unauthorized purposes',
                ),
                SizedBox(height: 10.h),
                title_terms(title: '3. Privacy Policy'),

                SizedBox(height: 10.h),

                // New Password
                details_term(
                  text:
                      'our privacy is important to us. Our Privacy Policy outlines how we collect,'
                      ' use, and protect your personal data. By using LangSwap, you consent to the '
                      'collection and use of your data as described in our Privacy Policy.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class details_term extends StatelessWidget {
  const details_term({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        color: AppColors.title2Text,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.justify,
    );
  }
}

class title_terms extends StatelessWidget {
  const title_terms({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        color: AppColor.default2Color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
