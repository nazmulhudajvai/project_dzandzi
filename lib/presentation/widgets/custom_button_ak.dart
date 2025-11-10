
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonAk extends StatelessWidget {
  final Color? imageColor;
  final double? borderRadius;
  final Color? iconColor;
  final IconData? icon;
  final Color? borderColor;
  final String text;
  final String? iconImagePath;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onTap;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? iconSize;
  final String? prefixIcon;

  const CustomButtonAk({
    this.imageColor,
    this.borderRadius,
    this.iconColor,
    super.key,
    required this.text,
    required this.onTap,
    this.iconImagePath,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.borderColor,
    this.icon,
    this.width,
    this.height,
    this.iconSize,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
          color: buttonColor ?? AppColors.liniarIndicatorColor
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: SvgPicture.asset(prefixIcon!),
              ),
            if (iconImagePath != null)
              Image.asset(
                iconImagePath!,
                height: height,
                width: width,
                color: imageColor,
              ),
            if (iconImagePath != null) SizedBox(width: 8.h),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? 16.sp,
                color: textColor ?? Colors.white,
              ),
            ),
            if (icon != null)
              Row(
                children: [
                  SizedBox(width: 8.w),
                  Icon(icon!, color: iconColor ?? Colors.white, size: iconSize),
                ], 
              ),
          ],
        ),
      ),
    );
  }
}