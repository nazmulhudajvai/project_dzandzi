
 import 'package:dzandzi/presentation/controllers/project_pages_controler/project_employes_controler.dart' show EmployeeController;
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_employ_widget.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Project_employ extends StatelessWidget {
  final String projectId;
  Project_employ({super.key, required this.projectId});

  final EmployeeController controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    controller.fetchEmployees(projectId);

    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
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
                            onTapDown: (details) {
                              filter_Employee(context, details.globalPosition);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.r),
                              child: Icon(Icons.filter_list),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                     
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (controller.employees.isEmpty) {
                          return const Center(child: Text("No employees found"));
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 16.w,
                            childAspectRatio: 157.w / 153.h,
                          ),
                          itemCount: controller.employees.length,
                          itemBuilder: (context, index) {
                            final emp = controller.employees[index];
                            return EmployeeProfileCard(
                              imagePath: emp.avatarUrl ?? 'assets/image/damyPic.png',
                              name: '${emp.firstName} ${emp.lastName}',
                              role: emp.role,
                            );
                          },
                        );
                      }),
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

  // keep your popup filter same
  Future<Object?> filter_Employee(BuildContext context, Offset tapPosition) async {
    final screenSize = MediaQuery.of(context).size;
    const double dialogWidth = 220.0;
    double right = screenSize.width - tapPosition.dx - 8.0;
    if (right < 8.0) right = 8.0;
    if (right > screenSize.width - 8.0) right = 8.0;
    double top = tapPosition.dy;
    final maxTop = screenSize.height - 200.0;
    if (top > maxTop) top = maxTop;

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
                      buildFilterOption(context, 'View All'),
                      SizedBox(height: 10.h),
                      buildFilterOption(context, 'View Engineer'),
                      SizedBox(height: 10.h),
                      buildFilterOption(context, 'View Designer'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) =>
          FadeTransition(opacity: anim1, child: child),
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
