import 'package:dzandzi/presentation/controllers/project_pages_controler/project_task_controler.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
 
import 'package:google_fonts/google_fonts.dart';

class ProjectTask extends StatelessWidget {
  ProjectTask({super.key, required this.ProjectId});

  final String ProjectId;

  final ProjectTaskController controller = Get.put(ProjectTaskController());

  @override
  Widget build(BuildContext context) {
    // fetch tasks on widget load
    controller.fetchTasks(ProjectId);

    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // existing title + filter code stays EXACTLY as it is
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
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTapDown: (TapDownDetails details) {
                    three_dot(context, details.globalPosition);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.r),
                    child: Icon(Icons.filter_list),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // ⬇ Replace ListView.builder with Obx widget
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.taskList.isEmpty) {
                  return const Center(child: Text("No tasks available"));
                }

                return ListView.builder(
                  itemCount: controller.taskList.length,
                  itemBuilder: (context, index) {
                    final task = controller.taskList[index];
                    return project_card(
                      title: task.title,
                      progress: task.progress,
                      days: 14, // You can calculate from startDate to endDate if needed
                      isdayshow: false,
                      isProgress: true,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
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
                            'All Tasks',
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
                            'Completed Task',
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
                            'Ongoing Task',
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
