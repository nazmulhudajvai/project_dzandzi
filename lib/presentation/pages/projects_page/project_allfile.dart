import 'package:dzandzi/presentation/controllers/bottom_navbar_view.dart';
import 'package:dzandzi/presentation/controllers/bottom_navbar_view2.dart';
import 'package:dzandzi/presentation/controllers/project_tabBarControler.dart';
import 'package:dzandzi/presentation/pages/projects_page/Project_Overview.dart';
import 'package:dzandzi/presentation/pages/projects_page/Project_emploly.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_document.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_inventory.dart';
import 'package:dzandzi/presentation/pages/projects_page/project_task.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Project_all_File extends StatelessWidget {
  Project_all_File({super.key});

  final ProjectTabbarcontroler controller = Get.put(ProjectTabbarcontroler());

  final List<String> _tabs = [
    'Overview',
    'Task',
    'Inventory',
    'Employees',
    'Documents',
  ];

  final List<Widget> _pages = [
    Project_Overview(),
    ProjectTask(),
    Project_inventory(),
    Project_employ(),
    ProjectDocument(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Project Menu',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor:AppColors.pageBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          
          Container(
            color:AppColors.pageBackgroundColor,
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
