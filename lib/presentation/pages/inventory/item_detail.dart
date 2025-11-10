import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/presentation/controllers/inventory_controllers/inventory_controller.dart';
import 'package:dzandzi/presentation/pages/inventory/edit_inventory.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemDetail extends StatelessWidget {
  final AddItemModel item;
  final InventoryController controller = Get.find<InventoryController>();
  
  ItemDetail({super.key, required this.item});

  String get _status {
    if (item.quantity == 0) return 'Out of Stock';
    if (item.quantity < 50) return 'Low Stock';
    return 'In Stock';
  }

  Color get _statusColor {
    if (item.quantity == 0) return AppColors.inventoryRedText;
    if (item.quantity < 50) return AppColors.lowStockColor;
    return AppColors.inventoryText;
  }

  String _displayPrice() {
    return '€${item.valuePerUnit.toStringAsFixed(item.valuePerUnit.truncateToDouble() == item.valuePerUnit ? 0 : 2)}';
  }

  void _showDeleteDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        title: Text(
          'Delete Item',
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${item.title}"?\n\nThis action cannot be undone.',
          style: TextStyle(
            color: AppColors.subtitleColor,
            fontSize: 14.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.subtitleColor,
                fontSize: 14.sp,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Get.back(); // Close dialog
              
              print('🗑️ Attempting to delete item with ID: ${item.id}');

              final success = await controller.deleteItem(item.id!);

              if (success) {
                Get.back(); // Close detail page
                Get.snackbar(
                  'Success',
                  'Item "${item.title}" deleted successfully',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                );
              } else {
                Get.snackbar(
                  'Error',
                  'Failed to delete item. Check console logs.',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  duration: const Duration(seconds: 3),
                );
              }
            },
            child: Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      ImageAssets.back,
                      width: 19.sp,
                      height: 16.sp,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Item Details',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 19.sp), // Balance the back button
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextProperty(
                            text: item.title,
                            textColor: AppColors.textColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 8.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Quantity: ',
                                  style: TextStyle(
                                    color: AppColors.subtitleColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '${item.quantity} ${item.unit}',
                                  style: TextStyle(
                                    color: AppColors.blueColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: _statusColor,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: TextProperty(
                        text: _status,
                        textColor: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextProperty(
                          text: 'Item Details',
                          textColor: AppColors.textColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('📝 Edit clicked for item: ${item.title}');
                                print('📝 Item ID: ${item.id}');
                                
                                if (item.id != null && item.id!.isNotEmpty) {
                                  Get.to(() => EditInventory(item: item));
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Cannot edit: Item ID is missing',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.orange,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: AppColors.blueColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Image.asset(
                                  ImageAssets.edit,
                                  width: 16.sp,
                                  height: 16.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            GestureDetector(
                              onTap: () {
                                print('🗑️ Delete clicked for item: ${item.title}');
                                print('🗑️ Item ID: ${item.id}');
                                
                                if (item.id != null && item.id!.isNotEmpty) {
                                  _showDeleteDialog(context);
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Cannot delete: Item ID is missing',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.orange,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  color: Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Image.asset(
                                  ImageAssets.delete,
                                  width: 16.sp,
                                  height: 16.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(ImageAssets.hexa, height: 20.h, width: 20.w),
                              SizedBox(height: 8.h),
                              TextProperty(
                                text: 'Category',
                                textColor: AppColors.subtitleColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(height: 4.h),
                              TextProperty(
                                text: item.category,
                                textColor: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(ImageAssets.dollar, height: 20.h, width: 20.w),
                              SizedBox(height: 8.h),
                              TextProperty(
                                text: 'Value/Unit',
                                textColor: AppColors.subtitleColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(height: 4.h),
                              TextProperty(
                                text: _displayPrice(),
                                textColor: AppColors.textColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (item.id != null) ...[
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.subtitleColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, size: 16.sp, color: AppColors.subtitleColor),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          'Item ID: ${item.id}',
                          style: TextStyle(
                            color: AppColors.subtitleColor,
                            fontSize: 11.sp,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
