import 'package:flutter/material.dart';

class TextProperty extends StatelessWidget {
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool ellipsis;

  const TextProperty({
    this.softWrap,
    super.key,
    this.maxLines,
    this.overflow,
    this.textAlign,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    this.ellipsis = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextOverflow? effectiveOverflow = ellipsis ? TextOverflow.ellipsis : overflow;
    final int? effectiveMaxLines = ellipsis ? 1 : maxLines;

    return Text(
      softWrap: softWrap ?? true,
      text,
      textAlign: textAlign,
      maxLines: effectiveMaxLines,
      overflow: effectiveOverflow,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
        letterSpacing: 0.70,
      ),
    );
  }
}