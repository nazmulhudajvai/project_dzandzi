import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropdownField extends StatelessWidget {
  final double? fontSize;
  final String hintText;
  final BorderSide? borderSide;
  final List<String> items;
  final RxString selectedValue;
  final RxString? selectedValue1;
  final double? height;
  final Color? hintTextColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Color? fillColor;
  final EdgeInsets contentPadding;

  const CustomDropdownField({
    super.key,
    this.fontSize,
    this.hintTextColor,
    required this.hintText,
    this.borderSide,
    required this.items,
    required this.selectedValue,
    this.selectedValue1,
    this.height,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.fillColor,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: Obx(
          () => DropdownButtonFormField<String>(
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down_outlined, size: 20.h),
            hint: Flexible(
              child: Text(
                hintText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: hintTextColor ?? AppColors.hintTextColor,
                  fontSize: fontSize ?? 12.sp,
                ),
              ),
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintTextColor ?? AppColors.hintTextColor,
                fontSize: fontSize ?? 14.sp,
              ),
              filled: true,
              fillColor: fillColor ?? AppColors.textFieldColor,
              contentPadding: contentPadding,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? AppColors.startTitle, width: borderWidth ?? 0.5.w),
                borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? AppColors.startTitle, width: borderWidth ?? 0.5.w),
                borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
              ),
            ),
            // ignore: deprecated_member_use
            value: selectedValue.value.isEmpty ? null : selectedValue.value,
            items: items
                .map(
                  (value) => DropdownMenuItem(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 14.sp)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                selectedValue.value = value;
              }
            },
          ),
        ),
      ),
    );
  }
}
