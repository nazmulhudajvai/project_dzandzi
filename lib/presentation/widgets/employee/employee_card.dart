import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.title, required this.email});

  final String title;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      margin: EdgeInsets.only(bottom: 10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Avatar
            CircleAvatar(
              radius: 20.r,
              backgroundImage: const AssetImage('assets/image/pprofile.png'),
            ),
            SizedBox(width: 10.w),

            /// Name, Role, Email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.activeStatus,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                "Admin",
                                style: GoogleFonts.roboto(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// ✅ Menu icon on the right
                      InkWell(
                        child: SvgPicture.asset(
                          'assets/image/imenu.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    email,
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
