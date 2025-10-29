import 'package:dzandzi/presentation/pages/document/add_document.dart';
import 'package:dzandzi/presentation/widgets/custom_document_card.dart';
import 'package:dzandzi/theams/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class DocumentView extends StatelessWidget {
  const DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    // Use SafeArea to avoid system UI (like notches)
    return Scaffold(
      backgroundColor: AppColor.pageBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Custom "Back" navigation row
                Row(
                  children: [
                    const Icon(Icons.arrow_back, color: AppColor.buttonColor),
                    SizedBox(width: 8.w),
                    Text(
                      'Back to Company View',
                      style: TextStyle(
                        color: AppColor.buttonColor,
                        fontSize: 16,
                        fontStyle: GoogleFonts.roboto().fontStyle,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // "Document" Title
                Text(
                  'Document',
                  style: TextStyle(
                    color: AppColor.textclrblack,
                    fontSize: 24.sp,
                    fontStyle: GoogleFonts.roboto().fontStyle,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),

                // Search bar and filter icon
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: AppColor.Textcolor,
                        decoration: InputDecoration(
                          hintText: '   Search here.....',
                          hintStyle: TextStyle(color: AppColor.Textcolor),
                          suffixIcon: Icon(
                            Icons.search,
                            color: AppColor.Textcolor,
                          ),
                          filled: true,
                          fillColor: AppColor.textFieldColor2,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12.h,
                            horizontal: 16.w,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48.r),

                            borderSide: BorderSide(color: AppColor.borderColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48.r),
                            borderSide: BorderSide(color: AppColor.borderColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48.r),
                            borderSide: BorderSide(color: AppColor.borderColor),
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

                // Upload button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    icon: Image.asset(
                      "assets/icon/upload.png",
                      height: 20.h,
                      width: 20.w,
                    ),
                    label: Text(
                      'Upload Document',
                      style: TextStyle(
                        color: AppColor.deepBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                    onPressed: () {
                      Get.to(AddDocument());
                    },
                  ),
                ),
                SizedBox(height: 10.h),

                // List of Document Cards
                Column(
                  children: List.generate(
                    4,
                    (index) => const DocumentCard(
                      projectName: 'Housezeo',
                      uploadDate: '1/10/2023',
                      fileSize: '3.2MB',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
