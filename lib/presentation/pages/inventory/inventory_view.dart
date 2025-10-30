import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/custom_tabbar_view.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/cutom_tabbar_widget.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/Navigation/custom_bottom_nav.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 30.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    ImageAssets.back,
                    width: 19.sp,
                    height: 16.sp,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Inventory',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap: () {
                Get.snackbar('Add item', 'Tapped to add inventory');
              },
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColor.defaultColor, size: 20.sp),
                  SizedBox(width: 10.sp),
                  Text(
                    'Add Inventory',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CustomTabBarWidget(),
            SizedBox(height: 20.h),
            CustomTabbarView(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav(),
    );
  }
}
