import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextfield extends StatelessWidget {
  final Color? fillColor;
  final String fieldText;
  final Color? enColor;
  final Color? foColor;
  final bool isPassword;
  final String? prefixIcon; // asset path to image
  final TextEditingController? controller;
  final Color? hintTextColor;
  final double? borderRadius;
  final int? maxLines;

  const CustomTextfield({
    super.key,
    this.fillColor,
    required this.fieldText,
    this.enColor,
    this.foColor,
    this.isPassword = false,
    this.prefixIcon,
    this.controller,
    this.hintTextColor,
    this.borderRadius,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isObscure = isPassword.obs;

    return Obx(() {
      return TextField(
        maxLines: maxLines,
        controller: controller,
        obscureText: isObscure.value,
        cursorColor: Colors.black,
        cursorHeight: 20,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Image.asset(
                    prefixIcon!,
                    height: 16.h,
                    width: 16.w,
                    fit: BoxFit.contain,
                  ),
                )
              : null,

          prefixIconConstraints: BoxConstraints(
            minWidth: 0,
            minHeight: 0,
            maxHeight: 24.h,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 0,
            minHeight: 0,
            maxHeight: 24.h,
          ),

          suffixIcon: isPassword
              ? Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 12.w),
                  child: GestureDetector(
                    onTap: () => isObscure.value = !isObscure.value,
                    child: Icon(
                      isObscure.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 16.h,
                      color: const Color(0xFFC4CDD5),
                    ),
                  ),
                )
              : null,

          isDense: true,
          filled: true,
          fillColor: fillColor ?? const Color(0xFFFFFFFF),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 20.w,
          ),
          border: InputBorder.none,
          hintText: fieldText,
          hintStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: hintTextColor ?? AppColors.hintTextColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
            borderSide: BorderSide(color: enColor ?? AppColors.startTitle),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
            borderSide: BorderSide(color: foColor ?? AppColors.startTitle),
          ),
        ),
      );
    });
  }
}