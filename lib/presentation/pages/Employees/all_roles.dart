import 'package:dzandzi/presentation/pages/projects_page/project_document.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/presentation/widgets/custom_document_card.dart';
import 'package:dzandzi/presentation/widgets/employee_profile_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theams/app_color2.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/buttons/custom_input_widget.dart';
import '../../widgets/employee/employee_card.dart';
import '../common/company_details.dart';

class AllRoles extends StatelessWidget {
  const AllRoles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.liniarIndicatorColor,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Back to Company View',
                      style: TextStyle(
                        color: AppColors.liniarIndicatorColor,
                        fontSize: 16.sp,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Employee',
                        style: TextStyle(
                          color: AppColors.textclrblack,
                          fontSize: 24.sp,
                          fontStyle: GoogleFonts.roboto().fontStyle,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: AppColors.textcolor,
                              decoration: InputDecoration(
                                hintText: '   Search here.....',
                                hintStyle: TextStyle(
                                  color: AppColors.textcolor,
                                ),
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.textcolor,
                                ),
                                filled: true,
                                fillColor: AppColors.textFieldColor2,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 16.w,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(48.r),
                                  borderSide: BorderSide(
                                    color: AppColors.borderColor,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(48.r),
                                  borderSide: BorderSide(
                                    color: AppColors.borderColor,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(48.r),
                                  borderSide: BorderSide(
                                    color: AppColors.borderColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          IconButton(
                            icon: const Icon(Icons.filter_list),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'All Role',
                          style: TextStyle(
                            color: AppColors.defaultTextColor,
                            fontSize: 20.sp,
                            fontStyle: GoogleFonts.roboto().fontStyle,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 157.w / 153.h,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee1.png',
                            name: 'John Doe',
                            role: 'Software Engineer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee2.png',
                            name: 'Jane Smith',
                            role: 'Product Manager',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee1.png',
                            name: 'Alice Johnson',
                            role: 'UX Designer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee2.png',
                            name: 'Bob Brown',
                            role: 'Data Analyst',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee1.png',
                            name: 'John Doe',
                            role: 'Software Engineer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee2.png',
                            name: 'Jane Smith',
                            role: 'Product Manager',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee1.png',
                            name: 'Alice Johnson',
                            role: 'UX Designer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/employee/employee2.png',
                            name: 'Bob Brown',
                            role: 'Data Analyst',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
