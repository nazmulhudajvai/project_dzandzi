import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../task/create_new_task.dart';

class ProjectTask extends StatelessWidget {
  ProjectTask({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> projectData = [
    {"name": "Foundation inspection", "progress": 30, "days": 14},
    {"name": "Electrical wiring - 2nd floor", "progress": 85, "days": 14},
    {"name": "Wall framing", "progress": 70, "days": 14},
    {"name": "Dairy-Store", "progress": 100, "days": 14},
    {"name": "Dairy-Store", "progress": 100, "days": 14},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Active Task",
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    filter_list(context);
                  },
                ),
              ],
            ),
            SizedBox(height: 20.h),

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
    );
  }

  Future<Object?> filter_list(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            Positioned(
              top: 200,
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
}
