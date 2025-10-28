// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../theams/app_color.dart';
// import 'otp_verify_view.dart';
//
// /// Simple GetX controller for this screen
// class ForgetPasswordController extends GetxController {
//   var phoneController = TextEditingController();
// }
//
// class ForgetPasswordView extends StatelessWidget {
//   ForgetPasswordView({super.key});
//
//   // Instantiate the controller
//   final ForgetPasswordController controller = Get.put(
//     ForgetPasswordController(),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.blackLiteColor,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               top: 30.h,
//               left: 0,
//               right: 0,
//               child: SizedBox(
//                 height: 68,
//                 width: 139,
//                 child: Image.asset(
//                   'assets/image/logo.png',
//                   height: 213.h,
//                   width: 104.w,
//                 ),
//               ),
//             ),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 200),
//               curve: Curves.easeIn,
//               top: 100,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 30.w),
//                 children: [
//                   SizedBox(height: 20.h),
//                   Text(
//                     'Forgot Password',
//                     style: GoogleFonts.inter(
//                       color: AppColor.whiteColor,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: 1.20,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 5.h),
//                   Text(
//                     'Enter your mobile number, and Tinny will send a one-time password',
//                     style: GoogleFonts.inter(
//                       color: AppColor.textGreyColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       letterSpacing: 0.70,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 35.h),
//                   Positioned(
//                     top: 150.h,
//                     left: 0,
//                     right: 0,
//                     child: Image.asset(
//                       'assets/image/l1.png',
//                       height: 213.h,
//                       width: 104.w,
//                     ),
//                   ),
//                   SizedBox(height: 40.h),
//
//                   Text(
//                     'Enter Your Phone Number',
//                     style: GoogleFonts.inter(
//                       color: AppColor.whiteColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//
//                   SizedBox(height: 20.h),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
