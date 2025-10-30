import 'package:dzandzi/presentation/controllers/inventory_controllers/custom_tabbar_widget_controller.dart';
import 'package:dzandzi/presentation/pages/inventory/overview_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabbarView extends StatelessWidget {
  const CustomTabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomTabBarWidgetController>();

    final List<Widget> tabViews = [
      OverviewTab(),
      Center(child: Text('Group Message Tab Content')),

      // const OverviewTab(),
      // GroupMessageTab(),
      // const NotesTab(),
    ];

    return Obx(() {
      return tabViews[controller.selectedTabIndex.value];
    });
  }
}