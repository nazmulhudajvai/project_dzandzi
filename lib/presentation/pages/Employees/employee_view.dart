import 'package:dzandzi/presentation/bottom_navigation2/view/second_bottom_navigation_view.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/employee/employee_card.dart';
import 'invite_user.dart';

class EmployeeView extends StatelessWidget {
  EmployeeView({super.key});

  final List<Map<String, dynamic>> employeeData = [
    {"name": "BuildSync", "email": 'buildsync@mail.com'},
    {"name": "SitePulse", "email": 'sitepulse@mail.com'},
    {"name": "ConstructFlow", "email": 'constructflow@mail.com'},
    {"name": "ProStruct", "email": 'prostruct@mail.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),

              /// ✅ Back Button Row
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
                      Text(
                        "Employees",
                        style: GoogleFonts.roboto(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              /// ✅ Search + Filter
              Row(
                children: [
                  Expanded(child: search_bar(onChanged: (String value) {  },)),
                  SizedBox(width: 5.w),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      filter_list(context);
                    },
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              /// ✅ Add New User
              InkWell(
                onTap: () {
                  Get.to(InviteUser());
                },
                child: Row(
                  children: [
                    Icon(Icons.add, color: AppColors.deepBlue),
                    const SizedBox(width: 6),
                    Text(
                      "Add New User",
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              /// ✅ Employee List
              Expanded(
                child: ListView.builder(
                  itemCount: employeeData.length,
                  itemBuilder: (context, index) {
                    final data = employeeData[index];
                    return EmployeeCard(
                      title: data["name"],
                      email: data["email"],
                    );
                  },
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  Future<Object?> filter_list(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(color: Colors.transparent),
              ),
              Positioned(
                top: 150,
                right: 40,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 150.w,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFilterOption(context, 'Admin'),
                        buildFilterOption(context, 'Developer'),
                        buildFilterOption(context, 'Project Manager'),
                        buildFilterOption(context, 'Designer'),
                        buildFilterOption(context, 'Worker'),
                        buildFilterOption(context, 'All Roles'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  Widget buildFilterOption(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(); // close the filter popup

        // Navigate based on which option is tapped
        if (label == 'All Roles') {
          Get.to(SecondBottomNavigationScreen()); // or your desired page
        }
        // You can add more conditions for others if needed:
        else if (label == 'Admin') {
          // Get.to(AdminPage());
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
