import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectDocument extends StatelessWidget {
  const ProjectDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background2Color,
      body: SafeArea(
        child: Column(
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
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                "Name",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Type",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Action",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ROWS SECTION (STATIC 12 ITEMS)
                      tableRow("Project Proposal", "PDF", context),
                      divider(),
                      tableRow("Site Photo", "JPG", context),
                      divider(),
                      tableRow("Budget Estimate", "PDF", context),
                      divider(),
                      tableRow("Contrct Agreement", "Document", context),
                      divider(),
                      tableRow("Progress Report", "PDF", context),
                      divider(),
                      tableRow("Project Overview", "PDF", context),
                      divider(),
                      tableRow("Project time", "PDF", context),
                      divider(),
                      tableRow("Project feedback", "PDF", context),
                      divider(),
                      tableRow("Project Proposal", "PDF", context),
                      divider(),
                      tableRow("Project Overview", "PDF", context),
                      divider(),
                      tableRow("Project time", "PDF", context),
                      divider(),
                      tableRow("Project feedback", "PDF", context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tableRow(String name, String type, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              type,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  three_dot(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() => Divider(height: 1.h, thickness: 1);

  Future<Object?> three_dot(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            Positioned(
              top: 150,
              right: 40,
              child: Material(
                color: Colors.transparent,
                child: Container(
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
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'Active',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'Complete',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'On-going',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

  void showTransparentDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), // Dark overlay behind dialog
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent, // Dialog background = transparent
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95), // Card background
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon (optional)
                  const Icon(Icons.check_circle, color: Colors.green, size: 48),
                  const SizedBox(height: 16),

                  // Title
                  Text(
                    "Success!",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Message
                  const Text(
                    "All code pulled from main branch.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),

                  // OK Button
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
