 import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theams/app_color2.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_input_widget.dart';
 import '../common/company_details.dart';

class InviteUser extends StatelessWidget {
  const InviteUser({super.key});

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.all(2.0.r),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/image/back_arrow.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                      const Spacer(),

                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Text(
                'Invite User',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 30.h),
              Text(
                "Invite someone to your company by email or by sharing a link.",
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black.withOpacity(.5),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Send an Email Invitation',
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
                hintText: 'Enter Last name',
                onChanged: (String value) {},controller: null,
              ),
              SizedBox(height: 10.h),
              Text(
                'Select Role',
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
                cwidth: 396.w,
                cheight: 50.h,
                hintText: 'Enter email address',
                onChanged: (String value) {},controller: null,
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey.shade400, thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey.shade400, thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'Copy Invite Link',
                style: GoogleFonts.roboto(
                  color: AppColor.greyBC,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  CustomInputWidget(
                    radius: 50.r,
                    cwidth: 256.w,
                    cheight: 44.h,
                    hintText: 'Enter Link',
                    onChanged: (String value) {},controller: null,
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    width: 80.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColor.blueColor.withOpacity(.7),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/image/icopy.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        Text(
                          'copy',
                          style: GoogleFonts.roboto(
                            color: AppColor.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              SizedBox(height: 50.h),
              CustomButton(
                leading: true,
                leadingIcon: 'assets/image/imail.svg',
                title: 'Send',
                radius: 100,
                height: 50.h,
                width: 369.9.w,
                onPress: () async {
                  Get.to(CompanyDetailsView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
