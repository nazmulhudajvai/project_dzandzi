import 'package:dzandzi/presentation/bottom_navigation_bar/controller/bottom_navigation_bar_controller.dart';
import 'package:dzandzi/presentation/pages/Employees/employee_view.dart';
import 'package:dzandzi/presentation/pages/home/home_view.dart';
import 'package:dzandzi/presentation/pages/inventory/inventory_view.dart';
import 'package:dzandzi/presentation/pages/profile/my_profile.dart';
import 'package:dzandzi/presentation/pages/projects_page/projects.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatelessWidget {
  final BottomNavigationBarController controller = Get.put(
    BottomNavigationBarController(),
  );

  final List<Widget> pages = [
    HomeView(),
    ProjectPage(),
    EmployeeView(),
    InventoryView(),
    ProfileView(),
  ];
  BottomNavigationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: AppColors.pageBackgroundColor,
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => SafeArea(
          top: false,
          bottom: false,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.r,
                  offset: Offset(0, -2.h),
                ),
              ],
            ),
            padding: EdgeInsets.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // item 0
                _navItemWidget(
                  context,
                  index: 0,
                  assetWidget: SvgPicture.asset(
                    ImageAssets.home,
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: 'Home',
                  controller: controller,
                ),
                // item 1
                _navItemWidget(
                  context,
                  index: 1,
                  assetWidget: SvgPicture.asset(
                    ImageAssets.project,
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: 'Projects',
                  controller: controller,
                ),
                // item 2
                _navItemWidget(
                  context,
                  index: 2,
                  assetWidget: SvgPicture.asset(
                    ImageAssets.people,
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: 'Employees',
                  controller: controller,
                ),
                // item 3
                _navItemWidget(
                  context,
                  index: 3,
                  assetWidget: SvgPicture.asset(
                    ImageAssets.inventory,
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: 'Inventory',
                  controller: controller,
                ),
                // item 4
                _navItemWidget(
                  context,
                  index: 4,
                  assetWidget: SvgPicture.asset(
                    ImageAssets.profile,
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: 'Profile',
                  controller: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // helper widget placed inline to avoid creating new file
  Widget _navItemWidget(
    BuildContext context, {
    required int index,
    required Widget assetWidget,
    required String label,
    required BottomNavigationBarController controller,
  }) {
    final bool isSelected = controller.selectedIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeTabIndex(index),
      child: Container(
        color: Colors.transparent,
        width: MediaQuery.of(context).size.width / 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: 6.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: isSelected ? AppColor.blueLiteColor : Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 6.h),
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
              child: Center(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    isSelected ? AppColor.blueLiteColor : Colors.grey,
                    BlendMode.srcIn,
                  ),
                  child: assetWidget,
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                color: isSelected ? AppColor.blueLiteColor : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
