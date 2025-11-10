import 'package:dzandzi/presentation/controllers/bottom_navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavView extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  final List<Widget> pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Projects Page')),
    Center(child: Text('Employees Page')),
    Center(child: Text('Inventory Page')),
    Center(child: Text('Profile Page')),
  ];

  BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        // ✅ Use IndexedStack so pages don’t rebuild each time
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
      );
    });
  }
}
