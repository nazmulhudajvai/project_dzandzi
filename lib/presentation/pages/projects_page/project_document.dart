import 'dart:io';
import 'package:dzandzi/presentation/controllers/project_pages_controler/project_document_controler.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';

class ProjectDocument extends StatelessWidget {
  final String projectId;
  ProjectDocument({super.key, required this.projectId});

  final ProjectDocumentController controller =
      Get.put(ProjectDocumentController());

  @override
  Widget build(BuildContext context) {
    controller.fetchDocuments(projectId);

    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
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

                // Dynamic rows
                ...controller.documents.map((doc) {
                  return Column(
                    children: [
                      tableRow(doc.title, doc.type, doc.url, context),
                      divider(),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget tableRow(String name, String type, String url, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.r, horizontal: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 80.w,
              child: Text(
                name,
                style: GoogleFonts.roboto(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
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
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTapDown: (TapDownDetails details) {
                  three_dot(context, details.globalPosition, type, url, name);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 15.r),
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

  // ============================
  // Three-dot popup
  // ============================
  Future<Object?> three_dot(BuildContext context, Offset tapPosition,
      String type, String url, String title) {
    final screenSize = MediaQuery.of(context).size;
    const double dialogWidth = 220.0;

    double right = screenSize.width - tapPosition.dx - 8.0;
    if (right < 8.0) right = 8.0;
    if (right > screenSize.width - 8.0) right = 8.0;

    double top = tapPosition.dy;
    final maxTop = screenSize.height - 200.0;
    if (top > maxTop) top = maxTop;

    String viewText = type == 'IMAGE' ? 'View Image' : 'View PDF';
    String downloadText = type == 'IMAGE' ? 'Download Image' : 'Download PDF';

    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // View PDF/Image
                      GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop();
                          String? filePath =
                              await downloadFileWithHttp(url, title);
                          if (filePath != null) {
                            await OpenFilex.open(filePath);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.r),
                          child: Text(
                            viewText,
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      // View Details (optional)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Get.snackbar('Details', 'View Details clicked');
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.r),
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
                      // Download PDF/Image
                      GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop();
                          showDownload(context, url, title, type);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.r),
                          child: Text(
                            downloadText,
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

  // ============================
  // Show download dialog
  // ============================
  void showDownload(
      BuildContext context, String url, String title, String type) {
    String downloadText = type == 'IMAGE' ? 'Download Image' : 'Download PDF';

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColor.blackColor.withOpacity(0.6),
      builder: (context) {
        return Dialog(
          backgroundColor: AppColor.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Are you sure you want to download?",
                  style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () async {
                    Get.back();
                    await downloadFileWithHttp(url, title);
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
                          downloadText,
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
                  onTap: () => Get.back(),
                  child: Container(
                    height: 44.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.liniarIndicatorColor),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
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

  // ============================
  // HTTP download helper
  // ============================
  Future<String?> downloadFileWithHttp(String url, String fileName) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$fileName');

      // If already exists, return path
      if (await file.exists()) return file.path;

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        Get.snackbar('Downloaded', '$fileName saved to ${dir.path}');
        return file.path;
      } else {
        Get.snackbar("Error", "Failed to download $fileName");
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", "Download failed: $e");
      return null;
    }
  }
}
