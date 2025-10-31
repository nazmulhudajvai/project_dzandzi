import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_employ_widget.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' show Get, GetNavigation;
import 'package:google_fonts/google_fonts.dart';

class Project_employ extends StatelessWidget {
  Project_employ({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [

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
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Role',
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.filter_list),
                            onPressed: () {
                              filter_Emply(context);
                            },
                          ),
                        ],
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
                            imagePath: 'assets/image/damyPic.png',
                            name: 'John Doe',
                            role: 'Software Engineer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/image/damyPic.png',
                            name: 'Jane Smith',
                            role: 'Product Manager',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/image/damyPic.png',
                            name: 'Alice Johnson',
                            role: 'UX Designer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/image/damyPic.png',
                            name: 'Bob Brown',
                            role: 'Data Analyst',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/image/damyPic.png',
                            name: 'John Doe',
                            role: 'Software Engineer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/image/damyPic.png',
                            name: 'Jane Smith',
                            role: 'Product Manager',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/image/damyPic.png',
                            name: 'Alice Johnson',
                            role: 'UX Designer',
                          ),
                          EmployeeProfileCard(
                            imagePath: 'assets/image/damyPic.png',
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
      // bottomNavigationBar: CustomBottomNav2(),
    );
  }
  Future<Object?> filter_Emply(BuildContext context) {
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