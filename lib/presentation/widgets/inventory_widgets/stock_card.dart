import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StockCard extends StatelessWidget {
  final String heading;
  final String costText;
  final int quantity;
  final String unit;

  const StockCard({
    super.key,
    required this.heading,
    required this.costText,
    required this.quantity,
    this.unit = 'pcs',
  });

  String get _status {
    if (quantity == 0) return 'Out of Stock';
    if (quantity < 50) return 'Low Stock';
    return 'In Stock';
  }

  Color get _statusColor {
    if (quantity == 0) return AppColors.inventoryRedText;
    if (quantity < 50) return AppColors.lowStockColor; // Low stock color
    return AppColors.inventoryText; // In stock color
  }

  String _displayPrice(String input) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return '€0';

    // Extract numeric value and format with currency
    final numeric = double.tryParse(trimmed.split(RegExp(r'\s+')).first);
    if (numeric != null) {
      return '€${numeric.toStringAsFixed(2)}';
    }

    // If already formatted with currency, return as is
    if (trimmed.startsWith('€') || trimmed.startsWith('\$')) {
      return trimmed.split(RegExp(r'\s+')).first;
    }

    return '€$trimmed';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextProperty(
                text: heading,
                textColor: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: _statusColor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: TextProperty(
                  text: _status,
                  textColor: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextProperty(
                text: _displayPrice(costText),
                textColor: AppColors.subtitleColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: 8.w),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$quantity ',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: unit,
                      style: TextStyle(
                        color: AppColors.subtitleColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
