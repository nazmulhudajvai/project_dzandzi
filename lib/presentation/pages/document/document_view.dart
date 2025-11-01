import 'package:dzandzi/presentation/pages/document/add_document.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/presentation/widgets/custom_document_card.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class DocumentView extends StatelessWidget {
  const DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                        'Document',
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
                              color: AppColors.deepBlue,
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
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
