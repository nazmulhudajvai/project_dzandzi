import 'package:dzandzi/presentation/controllers/inventory_controllers/custom_dropdown_field_controller.dart';
import 'package:dzandzi/presentation/controllers/inventory_controllers/filter_controller.dart';
import 'package:dzandzi/presentation/widgets/custom_button_ak.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/custom_dropdown_field.dart';
import 'package:dzandzi/presentation/widgets/inventory_widgets/custom_textfield.dart';
import 'package:dzandzi/presentation/widgets/text_property.dart';
import 'package:dzandzi/res/assets/image_assets.dart';
import 'package:dzandzi/theams/app_color2.dart';
import 'package:dzandzi/theams/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddInventory extends StatefulWidget {
  final CustomDropdownFieldController controller = Get.put(
    CustomDropdownFieldController(),
  );

  AddInventory({super.key});

  @override
  State<AddInventory> createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  // use existing FilterController instance if present, otherwise create it
  final FilterController filterController = Get.isRegistered<FilterController>()
      ? Get.find<FilterController>()
      : Get.put(FilterController());
  
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();
  final TextEditingController _quantityCtrl = TextEditingController();
  final TextEditingController _valueCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _descCtrl.dispose();
    _quantityCtrl.dispose();
    _valueCtrl.dispose();
    super.dispose();
  }

  void _onAddItem() {
    final String name = _nameCtrl.text.trim();
    final String desc = _descCtrl.text.trim();
    final String qtyText = _quantityCtrl.text.trim();
    final String valueText = _valueCtrl.text.trim();

    if (name.isEmpty || qtyText.isEmpty) {
      Get.snackbar('Validation', 'Please provide item name and quantity');
      return;
    }

    final int? quantity = int.tryParse(qtyText);
    if (quantity == null) {
      Get.snackbar('Validation', 'Quantity must be a number');
      return;
    }

    final String unit = widget.controller.selectedUnit.value;
    final String category = widget.controller.selectedAddCategory.value;
    final String costText = valueText.isEmpty ? '€0 Materials' : '€$valueText Materials';

    final newItem = InventoryItem(
      heading: name,
      costText: costText,
      quantity: quantity,
      unit: unit.isEmpty ? 'pcs' : unit,
      category: category.isEmpty ? 'General' : category,
    );

    filterController.addItem(newItem);

    Get.snackbar('Success', 'Item added');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(ImageAssets.back, width: 19.sp, height: 16.sp),
            ),

            SizedBox(height: 30.h),
            Text(
              'Add New Items',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            TextProperty(
              text: 'Item Name*',
              textColor: AppColor.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 4.h),
            CustomTextfield(
              controller: _nameCtrl,
              fillColor: AppColors.textFieldColor,
              fieldText: 'Enter here...',
            ),
            SizedBox(height: 16.h),
            TextProperty(
              text: 'Descriptions',
              textColor: AppColor.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 4.h),
            CustomTextfield(
              controller: _descCtrl,
              maxLines: 4,
              borderRadius: 20.r,
              fillColor: AppColors.textFieldColor,
              fieldText: 'Enter here...',
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextProperty(
                        text: 'Quantity*',
                        textColor: AppColor.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: 4.h),
                      CustomTextfield(
                        controller: _quantityCtrl,
                        fillColor: AppColors.textFieldColor,
                        fieldText: 'Enter here...',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextProperty(
                        text: 'Unit*',
                        textColor: AppColor.textColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomDropdownField(
                        hintText: 'Pieces',
                        items: [
                          'Pieces',
                          'Boxes',
                          'Kilograms',
                          'Liters',
                          'Meters',
                          'Gallons',
                        ],
                        selectedValue: widget.controller.selectedUnit,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            TextProperty(
              text: 'Categories*',
              textColor: AppColor.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 6.h),
            CustomDropdownField(
              fillColor: AppColors.textFieldColor,
              borderRadius: 50.r,
              borderColor: AppColors.borderColor,
              hintText: 'Select a catagory',
              items: [
                'All',
                'Materials',
                'Tools',
                'Hardware',
                'Electrcal',
                'Plumbing',
              ],
              selectedValue: widget.controller.selectedAddCategory,
            ),
            SizedBox(height: 16.h),
            TextProperty(
              text: 'Value Per Unit*',
              textColor: AppColor.textColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 6.h),
            CustomTextfield(
              controller: _valueCtrl,
              fillColor: AppColors.textFieldColor,
              fieldText: 'Enter here...',
            ),
            SizedBox(height: 24.h,),
            CustomButtonAk(text: 'Add Items', onTap: _onAddItem)
          ],
        ),
      ),
    );
  }
}
