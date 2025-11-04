import 'package:dzandzi/presentation/bottom_navigation2/controller/second_bottom_navigation_bar_controller.dart';
import 'package:dzandzi/presentation/pages/Employees/all_roles.dart';
import 'package:dzandzi/presentation/pages/document/document_view.dart';
import 'package:dzandzi/presentation/pages/employee2/overview.dart';
import 'package:dzandzi/presentation/pages/inventory_request/inventory_request.dart';
import 'package:dzandzi/presentation/pages/task/task%20_view.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SecondBottomNavigationScreen extends StatelessWidget {
  final SecondBottomNavigationBarController controller = Get.put(
    SecondBottomNavigationBarController(),
  );

  final List<Widget> pages = [
    Overview(),
    TaskView(),
    AllRoles(),
    InventoryRequest(),
    DocumentView(),
  ];
  SecondBottomNavigationScreen({super.key});
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
                    ImageAssets.overview,
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: 'Overview',
                  controller: controller,
                ),
                // item 1
                _navItemWidget(
                  context,
                  index: 1,
                  assetWidget: SvgPicture.asset(
                    ImageAssets.task,
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: 'Task',
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
                    ImageAssets.document,
                    width: 20.w,
                    height: 20.h,
                  ),
                  label: 'Document',
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
    required SecondBottomNavigationBarController controller,
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
