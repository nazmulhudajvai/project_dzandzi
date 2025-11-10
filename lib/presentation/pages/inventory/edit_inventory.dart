import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/presentation/controllers/inventory_controllers/custom_dropdown_field_controller.dart';
import 'package:dzandzi/presentation/controllers/inventory_controllers/inventory_controller.dart';
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

class EditInventory extends StatefulWidget {
  final AddItemModel item;

  const EditInventory({super.key, required this.item});

  @override
  State<EditInventory> createState() => _EditInventoryState();
}

class _EditInventoryState extends State<EditInventory> {
  final CustomDropdownFieldController controller = Get.put(
    CustomDropdownFieldController(),
    tag: 'edit',
  );
  final InventoryController inventoryController = Get.find<InventoryController>();

  late TextEditingController _nameCtrl;
  late TextEditingController _quantityCtrl;
  late TextEditingController _valueCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.item.title);
    _quantityCtrl = TextEditingController(text: widget.item.quantity.toString());
    _valueCtrl = TextEditingController(text: widget.item.valuePerUnit.toString());
    
    controller.selectedUnit.value = widget.item.unit;
    controller.selectedAddCategory.value = widget.item.category;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _quantityCtrl.dispose();
    _valueCtrl.dispose();
    super.dispose();
  }

  Future<void> _onUpdateItem() async {
    if (inventoryController.isLoading.value) return;

    final String name = _nameCtrl.text.trim();
    final String qtyText = _quantityCtrl.text.trim();
    final String valueText = _valueCtrl.text.trim();

    if (name.isEmpty || qtyText.isEmpty) {
      Get.snackbar(
        'Validation',
        'Please provide item name and quantity',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final int? quantity = int.tryParse(qtyText);
    final double? valuePerUnit = double.tryParse(valueText);

    if (quantity == null || valuePerUnit == null) {
      Get.snackbar(
        'Validation',
        'Quantity and Value must be valid numbers',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final updatedItem = AddItemModel(
      id: widget.item.id,
      title: name,
      quantity: quantity,
      lowStockThreshold: widget.item.lowStockThreshold,
      unit: controller.selectedUnit.value,
      category: controller.selectedAddCategory.value,
      valuePerUnit: valuePerUnit,
    );

    final success = await inventoryController.updateItem(widget.item.id!, updatedItem);

    if (success) {
      Get.back();
      Get.back();
      Get.snackbar(
        'Success',
        'Item "$name" updated successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        'Error',
        'Failed to update item',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
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
              onTap: () => Get.back(),
              child: Image.asset(ImageAssets.back, width: 19.sp, height: 16.sp),
            ),
            SizedBox(height: 30.h),
            Text(
              'Edit Item',
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
                        selectedValue: controller.selectedUnit,
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
              hintText: 'Select a category',
              items: [
                'Materials',
                'Tools',
                'Hardware',
                'Electrical',
                'Plumbing',
              ],
              selectedValue: controller.selectedAddCategory,
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
            SizedBox(height: 24.h),
            CustomButtonAk(text: 'Update Item', onTap: _onUpdateItem),
          ],
        ),
      ),
    );
  }
}
