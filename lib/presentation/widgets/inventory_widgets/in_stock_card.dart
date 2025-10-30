import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InStockCard extends StatelessWidget {
  // final String heading;
  // final String value;

  const InStockCard({
    super.key,
    // required this.heading,
    // required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
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
                text: 'heading',
                textColor: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.greenTextcolor,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: TextProperty(
                  text: 'heading',
                  textColor: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             TextProperty(
                text: '€50 Materials',
                textColor: AppColors.textcolor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '500 ',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'Box',
                      style: TextStyle(
                        color: AppColors.textcolor,
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
