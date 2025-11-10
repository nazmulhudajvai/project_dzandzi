import 'package:dzandzi/presentation/controllers/project_tabBarControler.dart';
import 'package:dzandzi/presentation/pages/projects_page/Project_Overview.dart';
import 'package:dzandzi/presentation/pages/projects_page/Project_emploly.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_document.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_inventory.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_task.dart';
 import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_build_sync_card.dart';
 import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../employee2/overview.dart';
 
class Project_all_File extends StatelessWidget {

  Project_all_File( {super.key, required this.projectid});
  final ProjectTabbarcontroler controller = Get.put(ProjectTabbarcontroler());  
  
  final dynamic projectid;
  final List<String> _tabs = [
    'Overview',
    'Task',
    'Inventory',
    'Employees',
    'Documents',
  ];
  

  @override
  Widget build(BuildContext context) {

final List<Widget> _pages = [
    Project_Overview(projectId: projectid),
    ProjectTask(),
    Project_inventory(),
    Project_employ(),
    ProjectDocument(),
  ];

    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,

      body: Column(
        children: [
          SizedBox(height: 40.h),
          Container(
            color: AppColors.pageBackgroundColor,
            padding: EdgeInsets.all(12.0.r),
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
          SizedBox(height: 20.h),
          ProjectBuildSyncCard(
            title: 'Build Sync',
            progress: 50,
            padding: EdgeInsets.all(12.r),
          ),
          InkWell(
            onTap: () {
              Get.to(Overview());
            },
            child: Container(
              width: 323.w,
              height: 52.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColor.blueColor, width: 1),
              ),
              child: Center(
                child: Text(
                  'Enter Project',
                  style: GoogleFonts.roboto(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blueColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: AppColors.pageBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_tabs.length, (index) {
                  return Obx(() {
                    final isSelected = controller.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () => controller.changeIndex(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          _tabs[index],
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: isSelected
                                ? AppColors.inProgressText
                                : AppColors.tabbarBackg,
                          ),
                        ),
                      ),
                    );
                  });
                }),
              ),
            ),
          ),

          // 🔹 Dynamic Page Content Based on Selected Tab
          Expanded(
            child: Obx(() {
              return _pages[controller.selectedIndex.value];
            }),
          ),
        ],
      ),
    );
  }
}
