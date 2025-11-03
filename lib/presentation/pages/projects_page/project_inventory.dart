import 'package:dzandzi/presentation/widgets/projects_common_widgets/Project_inventory_item_card.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/project_employ_widget.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' show Get, GetNavigation;
import 'package:google_fonts/google_fonts.dart';

class Project_inventory extends StatelessWidget {
  const Project_inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 7.r,
                                  backgroundColor: AppColors.inProgressText,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Cement',
                                  style: TextStyle(
                                    color: AppColors.grey13,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '23%',
                                  style: TextStyle(
                                    color: AppColors.textcolor2,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7.h),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 7.r,
                                  backgroundColor: AppColors.inventoryText,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Steel',
                                  style: TextStyle(
                                    color: AppColors.grey13,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '25%',
                                  style: TextStyle(
                                    color: AppColors.textcolor2,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7.h),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 7.r,
                                  backgroundColor: AppColors.paintColor,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Paint',
                                  style: TextStyle(
                                    color: AppColors.grey13,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '20%',
                                  style: TextStyle(
                                    color: AppColors.textcolor2,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
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

                      InventoryItemCard(
                        quantity: '120 Bags',
                        materialName: 'Cement ',
                        materialTitle: 'Metarial',
                        price: '500',
                        statusText: 'Sufficient',
                        statusColor: AppColors.greenTextcolor,
                      ),
                      InventoryItemCard(
                        quantity: '180 Bags',
                        materialName: 'Bag',
                        materialTitle: 'Metarial',
                        price: '800',
                        statusText: 'Sufficient',
                        statusColor: AppColors.inventoryText,
                      ),
                      InventoryItemCard(
                        quantity: '700 Gallons',
                        materialName: 'Paint',
                        materialTitle: 'Metarial',
                        price: '300',
                        statusText: 'Medium',
                        statusColor: AppColors.mediumorg,
                      ),
                      InventoryItemCard(
                        quantity: '120 Units',
                        materialName: 'Dril ',
                        materialTitle: 'Metarial',
                        price: '900',
                        statusText: 'Sufficient',
                        statusColor: AppColor.greenColor,
                      ),

                      InventoryItemCard(
                        quantity: '700 Bags',
                        materialName: 'Cement ',
                        materialTitle: 'Metarial',
                        price: '850',
                        statusText: 'Low',
                        statusColor: AppColors.inventoryRedText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNav2(),
    );
  }

  // Updated signature: accepts tapPosition to position the popup where user tapped
  Future<Object?> filter_Emply(BuildContext context, Offset tapPosition) {
    final screenSize = MediaQuery.of(context).size;
    // approximate dialog width to prevent overflow (tweak if you change dialog width)
    const double dialogWidth = 220.0;
    // calculate right offset from global tap x so we can use Positioned(right: ...)
    double right = screenSize.width - tapPosition.dx - 8.0; // small margin
    // if right would be negative or too large, clamp it
    if (right < 8.0) right = 8.0;
    if (right > screenSize.width - 8.0) right = 8.0;

    // top should be slightly below the tap so it appears like a contextual menu
    double top = tapPosition.dy;
    // ensure it doesn't go off the bottom
    final maxTop =
        screenSize.height - 200.0; // keep some margin; adjust if needed
    if (top > maxTop) top = maxTop;

    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, anim1, anim2) {
        return Stack(
          children: [
            // full-screen transparent layer to allow tapping outside to dismiss
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'View All',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'View Sufficient',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GestureDetector(
                        onTap: () {
                          Get.back();

                          // Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 50.0.r,
                            top: 10.r,
                            bottom: 10.r,
                            left: 10.r,
                          ),
                          child: Text(
                            'View Low',
                            style: GoogleFonts.roboto(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
      transitionDuration: Duration(milliseconds: 200),
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
