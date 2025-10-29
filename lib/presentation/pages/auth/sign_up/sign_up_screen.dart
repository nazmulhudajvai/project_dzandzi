import 'package:dzandzi/presentation/pages/common/company_details.dart';
import 'package:dzandzi/presentation/widgets/custom_button.dart';
import 'package:dzandzi/presentation/widgets/custom_field_button.dart';
import 'package:dzandzi/presentation/widgets/custom_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theams/app_color.dart';
import '../../../../theams/app_color2.dart';

// Controller for UI state only
class SignUpController extends GetxController {
  var isRemembered = false.obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
}

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        backgroundColor: AppColor.background2Color,
        body: SafeArea(
          child: Container(margin:EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Create Your Account',
                style: GoogleFonts.roboto(
                  color: AppColor.grayBC,
                  fontSize: 32,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.left,
              ),

              SizedBox(height: 30.h,),
                Text(
                  'First Name',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h,),
                CustomInputWidget(hintText: 'Enter First name', onChanged: (String value) {  },),
                SizedBox(height: 10.h,),
                Text(
                  'Last Name',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h,),
                CustomInputWidget(hintText: 'Enter Last name', onChanged: (String value) {  },),SizedBox(height: 10.h,),
                Text(
                  'Email Address',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h,),
                CustomInputWidget(hintText: 'Enter email address', onChanged: (String value) {  },),SizedBox(height: 10.h,),
                Text(
                  'Telephone Number',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h,),
                CustomInputWidget(hintText: 'Enter Telephone Number', onChanged: (String value) {  },),SizedBox(height: 10.h,),
                Text(
                  'Password',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h,),
                CustomInputWidget(hintText: '********', onChanged: (String value) {  },obscureText: true,),SizedBox(height: 10.h,),
                Text(
                  'Confirm Password',
                  style: GoogleFonts.roboto(
                      color: AppColor.greyBC,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5.h,),
                CustomInputWidget(hintText: '********', onChanged: (String value) {  },obscureText: true,),SizedBox(height: 50.h,),
                InkWell(onTap:(){Get.to(CompanyDetailsView());},child: CustomButton(title: 'Register',radius: 100,height:50.h ,width: 369.9.w,))
            ],
            ),
          ),
        ),
      );
  }
}
