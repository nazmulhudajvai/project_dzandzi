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
                          GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (TapDownDetails details) {
                  // pass the global tap position to three_dot
                  three_dot(context, details.globalPosition);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 0.r, top: 0.r, bottom: 0.r, left: 15.r),
                  child: Icon(Icons.filter_list),
                ),
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
  // Updated signature: accepts tapPosition to position the popup where user tapped
  Future<Object?> three_dot(BuildContext context, Offset tapPosition) {
    final screenSize = MediaQuery.of(context).size;
    // approximate dialog width to prevent overflow (tweak if you change dialog width)
    const double dialogWidth = 220.0;
    // calculate right offset from global tap x so we can use Positioned(right: ...)
    double right = screenSize.width - tapPosition.dx - 8.0; // small margin
    // if right would be negative or too large, clamp it
    if (right < 8.0) right = 8.0;
    if (right > screenSize.width - 8.0) right = 8.0;

    // top should be slightly below the tap so it appears like a contextual menu
    double top = tapPosition.dy;
    // ensure it doesn't go off the bottom
    final maxTop = screenSize.height - 200.0; // keep some margin; adjust if needed
    if (top > maxTop) top = maxTop;

    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            // full-screen transparent layer to allow tapping outside to dismiss
            Positioned.fill(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(color: Colors.transparent),
              ),
            ),

            Positioned(
              top: top,
              right: right,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: dialogWidth,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 50.0.r, top: 10.r, bottom: 10.r, left: 10.r),
                          child: Text('View All',
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 50.0.r, top: 10.r, bottom: 10.r, left: 10.r),
                          child: Text('View Engineer',
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                         
                          // Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: 50.0.r, top: 10.r, bottom: 10.r, left: 10.r),
                          child: Text('View Designer',
                              style: GoogleFonts.roboto(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
      transitionDuration: Duration(milliseconds: 200),
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