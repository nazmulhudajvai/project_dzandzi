import 'package:dzandzi/presentation/pages/inventory_request/request_material.dart';
import 'package:dzandzi/presentation/widgets/Navigation/custom_bottom_nav2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InventoryRequest extends StatelessWidget {
  const InventoryRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.pageBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Back to Company View functionality
          },
        ),
        title: Text(
          'Back to Company View',
          style: TextStyle(
            color: AppColors.liniarIndicatorColor,
            fontSize: 16.sp,
            fontStyle: GoogleFonts.roboto().fontStyle,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🏷️ Title
            Text(
              'Inventory',
              style: TextStyle(
                color: AppColors.textclrblack,
                fontSize: 24.sp,
                fontStyle: GoogleFonts.roboto().fontStyle,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),

            // 🔍 Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: AppColors.textcolor,
                    decoration: InputDecoration(
                      hintText: '   Search here.....',
                      hintStyle: TextStyle(color: AppColors.textcolor),
                      suffixIcon: Icon(
                        Icons.search,
                        color: AppColors.textcolor,
                      ),
                      filled: true,
                      fillColor: AppColors.textFieldColor2,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 16.w,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48.r),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48.r),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(48.r),
                        borderSide: BorderSide(color: AppColors.borderColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // ➕ Material Request
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  Get.to(RequestMaterial());
                },
                icon: Image.asset(
                  "assets/icon/add.png",
                  height: 15.h,
                  width: 15.w,
                ),
                label: Text(
                  'Material Request',
                  style: TextStyle(
                    color: AppColors.deepBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // 📊 Table Section
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 38.0,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Material',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Quantity',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Used',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Last Update',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Category',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(Text('Cement')),
                        DataCell(Text('50 Bags')),
                        DataCell(Text('70%')),
                        DataCell(Text('Jul, 20, 2023')),
                        DataCell(Text('Construction')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Steel Rods')),
                        DataCell(Text('200 Units')),
                        DataCell(Text('66%')),
                        DataCell(Text('Jul, 20, 2023')),
                        DataCell(Text('Construction')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Paint')),
                        DataCell(Text('20 Gallons')),
                        DataCell(Text('25%')),
                        DataCell(Text('Jul, 20, 2023')),
                        DataCell(Text('Finishing')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('Wires')),
                        DataCell(Text('500 Miters')),
                        DataCell(Text('40%')),
                        DataCell(Text('Jul, 20, 2023')),
                        DataCell(Text('Electrical')),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(Text('PVC Pipes')),
                        DataCell(Text('200 Units')),
                        DataCell(Text('30%')),
                        DataCell(Text('Jul, 20, 2023')),
                        DataCell(Text('Plumbing')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNav2(),
    );
  }
}
