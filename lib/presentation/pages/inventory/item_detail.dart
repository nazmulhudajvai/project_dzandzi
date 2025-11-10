import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemDetail extends StatelessWidget {
  final AddItemModel item;
  const ItemDetail({super.key, required this.item});

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
                        'Item Details',
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
                    Column(
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
                                text: ' ${item.quantity} ${item.unit}',
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
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 2.h,
                      ),
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
                                // Edit item action
                              },
                              child: Image.asset(
                                ImageAssets.edit,
                                width: 16.sp,
                                height: 16.sp,
                              ),
                            ),
                            SizedBox(width: 13.w),
                            GestureDetector(
                              onTap: () {
                                // Delete item action
                              },
                              child: Image.asset(
                                ImageAssets.delete,
                                width: 16.sp,
                                height: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageAssets.mapLoc,
                              height: 14.h,
                              width: 12.w,
                            ),
                            SizedBox(width: 4.w),
                            TextProperty(
                              text: 'Category',
                              textColor: AppColors.subtitleColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              ImageAssets.hexa,
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 6.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextProperty(
                                  text: 'Category',
                                  textColor: AppColors.subtitleColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextProperty(
                                  text: item.category,
                                  textColor: AppColors.textColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              ImageAssets.dollar,
                              height: 14.h,
                              width: 12.w,
                            ),
                            SizedBox(width: 6.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextProperty(
                                  text: 'Value',
                                  textColor: AppColors.subtitleColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                TextProperty(
                                  text: _displayPrice(),
                                  textColor: AppColors.textColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              TextProperty(
                text: 'Description',
                textColor: AppColors.subtitleColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),
              TextProperty(
                text: 'No additional description provided.',
                textColor: AppColors.textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
