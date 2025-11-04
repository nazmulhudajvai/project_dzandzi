import 'package:dzandzi/presentation/controllers/inventory_controllers/number_controller.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NumberSelector extends StatelessWidget {
  final NumberController controller = Get.put(NumberController());

  NumberSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5)),
        color: AppColors.textFieldColor,
      ),
      child: Row(
        children: [
          Obx(
            () => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${controller.currentValue}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintTextColor,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.increment();
                  },
                  child: Icon(Icons.arrow_drop_up, size: 19),
                ),

                GestureDetector(
                  onTap: () {
                    controller.decrement();
                  },
                  child: Icon(Icons.arrow_drop_down, size: 19),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
