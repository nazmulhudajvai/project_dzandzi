import 'package:dzandzi/presentation/pages/home/home_view.dart';
import 'package:dzandzi/presentation/pages/profile/my_profile.dart';
import 'package:dzandzi/theams/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/routes/app_pages.dart';
import '../../theams/app_color2.dart';
import '../controllers/bottom_navbar_controller.dart';
import '../pages/projects_page/projects.dart';
// ✅ add this import for route names

class CustomBottomNav extends StatelessWidget {
  final BottomNavController controller = Get.find();

  final List<_NavItem> items = [
    _NavItem(iconPath: 'assets/image/ihome.svg', label: 'Home'),
    _NavItem(iconPath: 'assets/image/iproject.svg', label: 'Projects'),
    _NavItem(iconPath: 'assets/image/ipeople.svg', label: 'Employees'),
    _NavItem(iconPath: 'assets/image/iinventory.svg', label: 'Inventory'),
    _NavItem(iconPath: 'assets/image/iprofile.svg', label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = controller.selectedIndex.value == index;

            return GestureDetector(
              onTap: () {
                controller.changeTab(index);

                // ✅ Route navigation logic
                switch (index) {
                  case 0:
                    Get.to(HomeView());
                    break;
                  case 1:
                    Get.to(ProjectPage());
                    break;
                  case 2:
                    // Get.to(ProjectsView());
                    break;
                  case 3:
                    // Get.to(ProjectsView());
                    break;
                  case 4:
                    Get.to(ProfileView());
                    break;
                }
              },
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width / items.length,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 6.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColor.blueLiteColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isSelected
                            ? AppColor.blueLiteColor.withOpacity(0.2)
                            : Colors.transparent,
                      ),
                      padding: EdgeInsets.all(6.w),
                      child: SvgPicture.asset(
                        item.iconPath,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          isSelected ? AppColor.blueLiteColor : Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: isSelected
                            ? AppColor.blueLiteColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}

class _NavItem {
  final String iconPath;
  final String label;

  _NavItem({required this.iconPath, required this.label});
}
