import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import '../../../theams/app_color2.dart'; // For BackdropFilter

class CustomInputController extends GetxController {
  final RxBool isObscured;
  final TextEditingController textController;
  final bool _isInternalController;

  CustomInputController({
    required this.textController,
    required bool obscureText,
    bool isInternalController = false,
  }) : isObscured = obscureText.obs,
       _isInternalController = isInternalController;

  void toggleObscure() {
    isObscured.value = !isObscured.value;
  }

  void updateText(String text) {
    textController.text = text;
  }

  @override
  void onClose() {
    if (_isInternalController) {
      textController.dispose();
    }
    super.onClose();
  }
}

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    super.key,
    this.hintText = '',
    this.backIconTap2,
    this.backIconTap,
    required this.onChanged,
    this.onTap,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.leading = false,
    this.backIcon = false,
    this.backIcon2 = false,
    this.textAlign = false,
    this.leadingIcon = '',
    this.imageIcon = '',
    this.backImage = '',
    this.keyboardType = TextInputType.text,
    this.backImageTap,
    this.backImageAdd = false,
    this.contentPadding = true,
    this.clock = false,
    this.shadow = false,
    this.linearGradient = false,
    this.passwordIcon = '',
    this.borderRadius = 4.0,
    this.borderColor = AppColor.defaultDeepColor,
    this.hintTextColor = AppColor.hintTextColor,
    this.borderShadowColor = AppColor.boxShadowColor,
    this.textColor = AppColor.textColor,
    this.leadingHeight = 14.0,
    this.leadingWidth = 17.0,
    this.height = 46.0,
    this.width = double.infinity,
    this.hintFontFamily = 'Roboto',
    this.hintFontSize = 14.0,
    this.hintFontWeight = FontWeight.w300,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = 'Roboto',
    this.vertical = 14.0,
    this.horizontal = 15.0,
    this.leadingRight = 0.0,
    this.leadingTop = 0.0,
    this.leadingLeft = 10.0,
    this.backImageWidth = 24.0,
    this.backImageHeight = 24.0,
    this.borderWidth = .5,
    this.backgroundColor = AppColor.textAreaColor,
    this.leadingColor = AppColor.hintTextColor,
    this.maxLines = 1,
    this.textEditingController,
    this.settingsIconWidget,
    this.leadingIconWidget,
    this.borderGradientColors = const [Colors.blue, Colors.cyan],
    this.glassEffect = false,
    required this.cheight,
    required this.radius,
    required this.cwidth,
  });

  final Widget? leadingIconWidget;
  final String hintText, hintFontFamily, fontFamily;
  final double borderRadius,
      fontSize,
      hintFontSize,
      leadingHeight,
      leadingWidth,
      leadingRight,
      leadingTop,
      leadingLeft,
      backImageWidth,
      backImageHeight;
  final Color borderColor,
      textColor,
      hintTextColor,
      backgroundColor,
      leadingColor,
      borderShadowColor;
  final double height, width, horizontal, vertical, borderWidth;
  final bool obscureText,
      readOnly,
      contentPadding,
      leading,
      clock,
      backIcon,
      backIcon2,
      backImageAdd,
      linearGradient,
      shadow,
      textAlign,
      glassEffect;
  final String passwordIcon, leadingIcon, imageIcon, backImage;
  final ValueChanged<String> onChanged;
  final VoidCallback? onTap, backIconTap, backIconTap2, backImageTap;
  final String? Function(String?)? validator;
  final FontWeight fontWeight, hintFontWeight;
  final int maxLines;
  final TextEditingController? textEditingController;
  final Widget? settingsIconWidget;
  final TextInputType keyboardType;
  final List<Color> borderGradientColors;
  final double cheight;
  final double cwidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final inputController = Get.put(
      CustomInputController(
        textController: textEditingController ?? TextEditingController(),
        obscureText: obscureText,
        isInternalController: textEditingController == null,
      ),
      tag: key?.toString() ?? UniqueKey().toString(),
    );

    return Container(
      width: cwidth.w,
      height: cheight.h,
      decoration: BoxDecoration(
        color: AppColor.inputColor,

        border: Border.all(color: AppColor.border1Color, width: 0.5.sp),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading)
              Padding(
                padding: EdgeInsets.only(
                  right: leadingRight.w,
                  top: leadingTop.h,
                  left: leadingLeft.w,
                ),
                child:
                    leadingIconWidget ??
                    SvgPicture.asset(
                      leadingIcon,
                      width: leadingWidth.w,
                      height: leadingHeight.h,
                      colorFilter: ColorFilter.mode(
                        glassEffect ? Colors.grey : AppColor.whiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
              ),
            Expanded(
              child: Obx(
                () => TextField(
                  controller: inputController.textController,
                  onChanged: onChanged,
                  onTap: onTap,
                  readOnly: readOnly,
                  maxLines: maxLines,
                  textAlign: textAlign ? TextAlign.right : TextAlign.left,
                  obscureText: inputController.isObscured.value,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: GoogleFonts.inter(
                      color: glassEffect ? Colors.white70 : hintTextColor,
                      fontSize: hintFontSize.sp,
                      fontWeight: hintFontWeight,
                    ),
                    border: InputBorder.none,
                    contentPadding: contentPadding
                        ? EdgeInsets.symmetric(
                            horizontal: horizontal.w,
                            vertical: vertical.h,
                          )
                        : null,
                  ),
                  keyboardType: keyboardType,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: fontSize.sp,
                    fontWeight: fontWeight,
                    fontFamily: fontFamily,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (obscureText)
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: GestureDetector(
                    onTap: inputController.toggleObscure,
                    child: Icon(
                      inputController.isObscured.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      size: 16.sp, // 👈 decreased height
                      color: AppColor.blueLiteColor.withOpacity(
                        0.8,
                      ), // 👈 changed color
                    ),
                  ),
                ),
              ),

            if (backIcon)
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: settingsIconWidget ?? SvgPicture.asset(imageIcon),
              ),
            if (backIcon2)
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: GestureDetector(
                  onTap: backIconTap2,
                  child: SvgPicture.asset(imageIcon),
                ),
              ),
            if (backImageAdd)
              GestureDetector(
                onTap: backImageTap,
                child: Image.asset(
                  backImage,
                  height: backImageHeight.h,
                  width: backImageWidth.w,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
