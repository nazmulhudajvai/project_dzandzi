// import 'package:dzandzi/presentation/widgets/custom_bottom_nav.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../../theams/app_color.dart';
// import '../../controllers/bottom_navbar_controller.dart';
// import '../../widgets/custom_button.dart';
// import '../../widgets/custom_input_widget.dart';
// import '../home/home_view.dart';

// // Make sure this path is correct

// class CompanyDetailsView extends StatelessWidget {
//   CompanyDetailsView({super.key});

//   final controller = Get.put(BottomNavController()); // Initialize controller

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.background2Color,
//       body: SafeArea(
//         child: Container(margin:EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Company Details',
//                 style: GoogleFonts.roboto(
//                     color: AppColor.grayBC,
//                     fontSize: 32,
//                     fontWeight: FontWeight.w600
//                 ),
//                 textAlign: TextAlign.left,
//               ),

//               SizedBox(height: 30.h,),
//               Text(
//                 'Company Name',
//                 style: GoogleFonts.roboto(
//                     color: AppColor.greyBC,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(height: 5.h,),
//               CustomInputWidget(hintText: 'Enter Full name', onChanged: (String value) {  },),
//               SizedBox(height: 10.h,),

//               Text(
//                 'Company Email',
//                 style: GoogleFonts.roboto(
//                     color: AppColor.greyBC,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(height: 5.h,),
//               CustomInputWidget(hintText: 'Enter email address', onChanged: (String value) {  },),SizedBox(height: 10.h,),
//               Text(
//                 'TIN Number',
//                 style: GoogleFonts.roboto(
//                     color: AppColor.greyBC,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(height: 5.h,),
//               CustomInputWidget(hintText: 'Enter TIN Number', onChanged: (String value) {  },),SizedBox(height: 10.h,),
//               Text(
//                 'Specialization',
//                 style: GoogleFonts.roboto(
//                     color: AppColor.greyBC,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500
//                 ),
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(height: 5.h,),
//               CustomInputWidget(hintText: 'Enter Details', onChanged: (String value) {  }),SizedBox(height: 50.h,),

//               InkWell(onTap:(){Get.to(HomeView());},child: CustomButton(title: 'Confirm',radius: 100,height:50.h ,width: 369.9.w,))
//             ],
//           ),
//         ),
//       ),

//     );
//   }
// }
