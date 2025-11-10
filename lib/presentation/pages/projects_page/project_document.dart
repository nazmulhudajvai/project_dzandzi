import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart' show AppColors;
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
      backgroundColor: AppColors.pageBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Name",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Type",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "Action",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
    );
  }

  Widget tableRow(String name, String type, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              type,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              // Replaced IconButton with GestureDetector to capture tap position
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (TapDownDetails details) {
                  // pass the global tap position to three_dot
                  three_dot(context, details.globalPosition);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 0.r,
                    top: 0.r,
                    bottom: 0.r,
                    left: 15.r,
                  ),
                  child: Icon(Icons.more_horiz),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget divider() => Center(
    child: SizedBox(
      width: 340.w,
      child: Divider(height: 1.h, thickness: 1),
    ),
  );

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
    final maxTop =
        screenSize.height - 200.0; // keep some margin; adjust if needed
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
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'View PDF',
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
                            'View Details',
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
                          Get.back();
                          showDownload(context);
                          // Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'Download',
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

  void showDownload(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColor.blackColor.withOpacity(
        0.6,
      ), // fully transparent background
      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.whiteColor, // semi-transparent box
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name ",
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.downTextcolor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Project Proposal",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.downTextcolor2,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Type ",
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.downTextcolor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "PDF",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.downTextcolor2,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Date Uploaded",
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.downTextcolor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Dec 10, 2025",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.downTextcolor2,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Size",
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.downTextcolor,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "2.4 MB",
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.downTextcolor2,
                  ),
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/image/download_icon.svg',
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        "Download PDF",
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.inProgressText,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.back();
                    downloadOption(context);
                  },
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }

  void downloadOption(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColor.blackColor.withOpacity(
        0.6,
      ), // fully transparent background

      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.whiteColor, // semi-transparent box
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "Are you sure to download ",
                  style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),

                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.snackbar(
                      'Downloading ..',
                      ' you downloadin a Pdf file',
                    );
                  },
                  child: Container(
                    height: 44.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.inProgressText),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/image/download_icon.svg',
                          height: 16.h,
                          width: 16.w,
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "Download PDF",
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.inProgressText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 44.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.liniarIndicatorColor),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        "Cencel",
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.liniarIndicatorColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
