import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartContainer extends StatelessWidget {
  final String title;
  final int itemsUsed;
  final String lastUpdated;
  final double totalValue;

  const ChartContainer({
    super.key,
    required this.title,
    required this.itemsUsed,
    required this.lastUpdated,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    String formatCurrency(double value) {
      if (value >= 1000) {
        return '€${(value / 1000).toStringAsFixed(value >= 10000 ? 0 : 1)}k';
      }
      return '€${value.toStringAsFixed(0)}';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 4),
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
                  text: title,
                  textColor: AppColors.textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$itemsUsed items used • ',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.subtitleColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Last updated $lastUpdated',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.subtitleColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextProperty(
            text: formatCurrency(totalValue),
            textColor: AppColors.defaultTextColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
