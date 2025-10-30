import 'package:dzandzi/presentation/widgets/inventory_widgets/in_stock_card.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/inventory_cards.dart';
import 'package:dzandzi/presentation/widgets/projects_common_widgets/search_bar.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InventoryCards(
              heading: 'Total Value',
              value: '€2,450',
              iconPath: ImageAssets.totalValue,
              startColor: AppColors.totalValueColor,
              endColor: AppColors.totalValueColor1,
            ),
            SizedBox(width: 16.w),
            InventoryCards(
              heading: 'Total Items',
              value: '124',
              iconPath: ImageAssets.totalItems,
              startColor: AppColors.itemsectionColor,
              endColor: AppColors.totalItemTextColor,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InventoryCards(
              heading: 'in Stock',
              value: '98',
              iconPath: ImageAssets.inStock,
              startColor: AppColors.oragelight,
              endColor: AppColors.orageDeep,
            ),
            SizedBox(width: 16.w),
            InventoryCards(
              heading: 'Total Items',
              value: '26',
              iconPath: ImageAssets.needAttention,
              startColor: AppColors.needAttentionColor1,
              endColor: AppColors.needAttentionColor2,
            ),
          ],
        ),
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
            Expanded(child: search_bar()),
            SizedBox(width: 16.w),
            GestureDetector(
              onTap: () {
                Get.snackbar('Filter', 'Tapped to filter inventory items');
              },
              child: Image.asset(ImageAssets.filter, width: 24.w, height: 13.h),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        InStockCard()
      ],
    );
  }
}
