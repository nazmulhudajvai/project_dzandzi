
import 'package:dzandzi/presentation/controllers/bottom_navbar_view2.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_allfile.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectPage extends StatelessWidget {
  ProjectPage({super.key});

  final List<Map<String, dynamic>> projectData = [
    {"name": "BuildSync", "progress": 50, "days": 14},
    {"name": "SitePulse", "progress": 30, "days": 14},
    {"name": "ConstructFlow", "progress": 80, "days": 14},
    {"name": "ProStruct", "progress": 50, "days": 14},
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

              Padding(
                padding: EdgeInsets.all(2.0.r),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/image/back_arrow.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Projects",
                      style: GoogleFonts.roboto(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              Row(
                children: [
                  Expanded(child: search_bar()),
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

              Row(
                children: [

                  GestureDetector(
                    onTap: () {
                      Get.to(Project_all_File());
                    },
                    child: Icon(Icons.add, color: AppColors.deepBlue),
                  ),

                  Icon(Icons.add, color: AppColors.deepBlue),

                  const SizedBox(width: 6),
                  Text(
                    "Create Project",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              Expanded(
                child: ListView.builder(
                  itemCount: projectData.length,
                  itemBuilder: (context, index) {
                    final data = projectData[index];

                    return project_card(
                      title: data["name"],
                      progress: data["progress"],
                      days: data["days"],
                      isdayshow: false,
                      isProgress: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
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
              // Tap outside to close
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
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFilterOption(context, 'Active'),
                        buildFilterOption(context, 'Complete'),
                        buildFilterOption(context, 'On-going'),
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
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
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
