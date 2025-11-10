import 'package:dzandzi/presentation/controllers/inventory_controllers/filter_controller.dart';
import 'package:dzandzi/presentation/controllers/inventory_controllers/inventory_controller.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/filter_bottom_sheet.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/stock_card.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/inventory_cards.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dzandzi/presentation/pages/inventory/item_detail.dart';

class OverviewTab extends StatelessWidget {
  final InventoryController controller = Get.put(InventoryController());
  final TextEditingController searchController = TextEditingController();

  OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // dynamic inventory cards using API data
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InventoryCards(
                  heading: 'Total Value',
                  value: '€${controller.totalValue.value.toStringAsFixed(0)}',
                  iconPath: ImageAssets.totalValue,
                  startColor: AppColors.totalValueColor,
                  endColor: AppColors.totalValueColor1,
                ),
                SizedBox(width: 16.w),
                InventoryCards(
                  heading: 'Total Items',
                  value: '${controller.totalItems.value}',
                  iconPath: ImageAssets.totalItems,
                  startColor: AppColors.itemsectionColor,
                  endColor: AppColors.totalItemTextColor,
                ),
              ],
            )),
        SizedBox(height: 16.h),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InventoryCards(
                  heading: 'in Stock',
                  value: '${controller.inStock.value}',
                  iconPath: ImageAssets.inStock,
                  startColor: AppColors.orangelight,
                  endColor: AppColors.orangeDeep,
                ),
                SizedBox(width: 16.w),
                InventoryCards(
                  heading: 'Need Attention',
                  value: '${controller.needAttention.value}',
                  iconPath: ImageAssets.needAttention,
                  startColor: AppColors.needAttentionColor1,
                  endColor: AppColors.needAttentionColor2,
                ),
              ],
            )),
        SizedBox(height: 24.h),
        Align(
          alignment: Alignment.centerLeft,
          child: TextProperty(
            text: 'Inventory Items',
            textColor: AppColors.textColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  controller.updateSearchQuery(value);
                },
                decoration: InputDecoration(
                  hintText: 'Search items...',
                  hintStyle: TextStyle(
                    color: AppColors.subtitleColor,
                    fontSize: 14.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.subtitleColor,
                    size: 20.sp,
                  ),
                  suffixIcon: Obx(() {
                    return controller.searchQuery.value.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: AppColors.subtitleColor,
                              size: 20.sp,
                            ),
                            onPressed: () {
                              searchController.clear();
                              controller.clearSearch();
                            },
                          )
                        : const SizedBox.shrink();
                  }),
                  filled: true,
                  fillColor: AppColors.whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(
                      color: AppColors.inventoryText,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            GestureDetector(
              onTap: () async {
                // open filter sheet; sheet will update FilterController when Apply tapped
                await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                  ),
                  builder: (context) => FilterBottomSheet(),
                );
              },
              child: Image.asset(ImageAssets.filter, width: 24.w, height: 13.h),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        // render filtered items reactively

        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = controller.filteredItems;
          
          if (items.isEmpty && controller.searchQuery.value.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  Icon(
                    Icons.search_off,
                    size: 48.sp,
                    color: AppColors.subtitleColor,
                  ),
                  SizedBox(height: 8.h),
                  TextProperty(
                    text: 'No items found for "${controller.searchQuery.value}"',
                    textColor: AppColors.subtitleColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            );
          }

          if (items.isEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: TextProperty(
                text: 'No items found',
                textColor: AppColors.subtitleColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            );
          }

          return Column(
            children: items.map((it) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('==========================================');
                      print('🎯 Tapped item: ${it.title}');
                      print('🎯 Item ID: ${it.id}');
                      print('🎯 Full item data: ${it.toJson()}');
                      print('==========================================');
                      
                      Get.to(() => ItemDetail(item: it));
                    },
                    child: StockCard(
                      heading: it.title,
                      costText: '€${it.valuePerUnit.toStringAsFixed(2)}',
                      quantity: it.quantity,
                      unit: it.unit,
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              );
            }).toList(),
          );
        }),



        // Obx(() {
        //   final items = filterController.filteredItems;
        //   if (items.isEmpty) {
        //     return Padding(
        //       padding: EdgeInsets.symmetric(vertical: 20.h),
        //       child: TextProperty(
        //         text: 'No items match the selected filters',
        //         textColor: AppColors.subtitleColor,
        //         fontSize: 14.sp,
        //         fontWeight: FontWeight.w400,
        //       ),
        //     );
        //   }

        //   return Column(
        //     children: items
        //         .map(
        //           (it) => Column(
        //             children: [
        //               GestureDetector(
        //                 onTap: () {
        //                   Get.to(() => ItemDetail(item: it));
        //                 },
        //                 child: StockCard(
        //                   heading: it.heading,
        //                   costText: it.costText,
        //                   quantity: it.quantity,
        //                   unit: it.unit,
        //                 ),
        //               ),
        //               SizedBox(height: 12.h),
        //             ],
        //           ),
        //         )
        //         .toList(),
        //   );
        // }),
        SizedBox(height: 24.h),
      ],
    );
  }
}
