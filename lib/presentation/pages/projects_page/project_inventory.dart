 import 'package:dzandzi/presentation/controllers/project_pages_controler/project_inventory_controler.dart';
 import 'package:dzandzi/presentation/widgets/projects_common_widgets/Project_inventory_item_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_inventory_use_section.dart';
 import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Project_inventory extends StatelessWidget {
  Project_inventory({Key? key, required this.ProjectId}) : super(key: key);
  
 final ProjectId;
  final InventoryController controller = Get.put(InventoryController());

  @override
  Widget build(BuildContext context) {
    controller.fetchInventoryData(ProjectId); 

    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 🔹 keep your existing "Inventory Use" container same
                      Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Inventory Use',
                              style: TextStyle(
                                color: AppColors.grey13,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 7.h),
                           inventory_use(name:'Cement', percent: 48, color: Colors.green),
                           SizedBox(height: 5.h),
                           inventory_use(name: 'Steel', percent: 30, color: Colors.blue),
                            SizedBox(height: 5.h),
                           inventory_use(name: 'Steel', percent: 30, color: Colors.yellow),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'All Catagory',
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.filter_list),
                            onPressed: () {
                              filter_Emply(context, Offset(454, 500));
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),

                      // 🔹 replace static InventoryItemCards with dynamic list
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (controller.inventoryItems.isEmpty) {
                          return const Center(child: Text("No inventory found"));
                        }

                        return Column(
                          children: controller.inventoryItems.map((item) {
                            // decide color based on stock
                            final statusText = item.isLowOnStock
                                ? 'Low'
                                : 'Sufficient';
                            final statusColor = item.isLowOnStock
                                ? AppColors.inventoryRedText
                                : AppColors.greenTextcolor;

                            return InventoryItemCard(
                              quantity:
                                  '${item.availableQuantity} ${item.unit}',
                              materialName: item.title,
                              materialTitle: item.category,
                              price: item.valuePerUnit.toString(),
                              statusText: statusText,
                              statusColor: statusColor,
                            );
                          }).toList(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ⬇ keep your existing filter_Emply function exactly the same
  Future<Object?> filter_Emply(BuildContext context, Offset tapPosition) {
    final screenSize = MediaQuery.of(context).size;
    const double dialogWidth = 220.0;
    double right = screenSize.width - tapPosition.dx - 8.0;
    if (right < 8.0) right = 8.0;
    if (right > screenSize.width - 8.0) right = 8.0;

    double top = tapPosition.dy;
    final maxTop = screenSize.height - 200.0;
    if (top > maxTop) top = maxTop;

    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              top: top,
              right: right,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: dialogWidth,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildFilterOption(context, 'View All'),
                      SizedBox(height: 10.h),
                      buildFilterOption(context, 'View Sufficient'),
                      SizedBox(height: 10.h),
                      buildFilterOption(context, 'View Low'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) =>
          FadeTransition(opacity: anim1, child: child),
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  Widget buildFilterOption(BuildContext context, String label) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
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
