 
import 'package:dzandzi/presentation/controllers/project_pages_controler/project_list_view_controler.dart';
import 'package:dzandzi/presentation/pages/projects_page/create_new_project.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_allfile.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_card.dart';
 import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
 

class ProjectPage extends StatelessWidget {
  ProjectPage({super.key});

  final ProjectController projectController = Get.put(ProjectController());
  final TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.all(2.0.r),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        'assets/image/back_arrow.svg',
                        height: 24.h,
                        width: 24.w,
                      ),
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
              SizedBox(height: 40.h),

              // Search + Filter
              Row(
                children: [
                 Expanded(
                        child: Container(
                            width: double.infinity,
      padding: EdgeInsets.only(left: 10.r,top: 5.r),
                          decoration: BoxDecoration(
        color: AppColors.textFieldColor2,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
                          child: TextField(
                            controller: searchController,
                            onChanged: projectController.updateSearch,
                            decoration: InputDecoration(
                              hintText: "Search projects",
                              border:InputBorder.none ,
                              suffixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                  SizedBox(width: 5.w),
                  IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      filter_list(context);
                    },
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              // Create Project button
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CreateNewProjectView());
                    },
                    child: Icon(Icons.add, color: AppColors.deepBlue),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Create Project",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              // Project List
              Expanded(
                child: Obx(() {
                  if (projectController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (projectController.errorMessage.isNotEmpty) {
                    return Center(
                        child: Text(
                            "Error: ${projectController.errorMessage}"));
                  } else if (projectController.displayedProjects.isEmpty) {
                    return const Center(child: Text("No projects found"));
                  }

                  return ListView.builder(
                    itemCount: projectController.displayedProjects.length,
                    itemBuilder: (context, index) {
                      final project =
                          projectController.displayedProjects[index];
                      return InkWell(
                        onTap: () {
                          Get.to(() => Project_all_File(projectid: project.id));
                        },
                        child: project_card(
                          title: project.name,
                          progress: project.taskProgress.averageProgress,
                          days: project.startDate != null &&
                                  project.endDate != null
                              ? project.endDate!
                                  .difference(project.startDate!)
                                  .inDays
                              : 0,
                          isdayshow: false,
                          isProgress: true,
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
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
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(color: Colors.transparent),
              ),
              Positioned(
                top: 150,
                right: 40,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 150.w,
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
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFilterOption(context, 'All'),
                        buildFilterOption(context, 'Complete'),
                        buildFilterOption(context, 'On-going'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  Widget buildFilterOption(BuildContext context, String label) {
    return GestureDetector(
      onTap: () {
        projectController.updateFilter(label);
        Navigator.of(context).pop();
      },
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
