import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/home/home_view.dart';
import '../pages/projects_page/projects.dart';
import '../pages/inventory/inventory_view.dart';
import '../pages/document/document_view.dart';
import '../controllers/bottom_navbar_controller2.dart';
import '../widgets/Navigation/custom_bottom_nav2.dart';

class BottomNavView2 extends StatelessWidget {
  BottomNavView2({super.key});

  final BottomNavbarController2 controller = Get.put(BottomNavbarController2());

  final List<Widget> pages = [
    HomeView(), // Overview
    ProjectPage(), // Tasks
    DocumentView(), // Placeholder
    InventoryView(),
    DocumentView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        );
      }),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
