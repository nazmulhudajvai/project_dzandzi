import 'package:get/get.dart';

class InventoryItem {
  final String heading;
  final String costText;
  final int quantity;
  final String unit;
  final String category;

  InventoryItem({
    required this.heading,
    required this.costText,
    required this.quantity,
    this.unit = 'pcs',
    this.category = 'General',
  });
}

class FilterController extends GetxController {
  // full list
  final RxList<InventoryItem> allItems = <InventoryItem>[
    InventoryItem(heading: 'Wood Planks', costText: '€50', quantity: 500, unit: 'Pieces', category: 'Wood'),
    InventoryItem(heading: 'Screws', costText: '€20', quantity: 30, unit: 'Pieces', category: 'Hardware'),
    InventoryItem(heading: 'Paint- White', costText: '€0', quantity: 0, unit: 'Box', category: 'Paint'),
    InventoryItem(heading: 'Nails', costText: '€10', quantity: 10, unit: 'Pack', category: 'Hardware'),
    // ... add more items or replace with your real data source ...
  ].obs;

  // filtered list exposed to UI
  final RxList<InventoryItem> filteredItems = <InventoryItem>[].obs;

  // current filter selections
  final RxString selectedStatus = 'All'.obs;
  final RxString selectedCategory = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    // initialize filteredItems with all items
    filteredItems.assignAll(allItems);
  }

  void applyFilter({String? status, String? category}) {
    if (status != null) selectedStatus.value = status;
    if (category != null) selectedCategory.value = category;

    final String statusFilter = selectedStatus.value;
    final String categoryFilter = selectedCategory.value;

    final List<InventoryItem> result = allItems.where((item) {
      // status filter
      bool statusMatch = true;
      if (statusFilter == 'In Stock') {
        statusMatch = item.quantity >= 50;
      } else if (statusFilter == 'Low Stock') {
        statusMatch = item.quantity > 0 && item.quantity < 50;
      } else if (statusFilter == 'Out of Stock') {
        statusMatch = item.quantity == 0;
      }

      // category filter (if not 'All')
      bool categoryMatch = true;
      if (categoryFilter != 'All') {
        categoryMatch = item.category == categoryFilter;
      }

      return statusMatch && categoryMatch;
    }).toList();

    filteredItems.assignAll(result);
  }

  void resetFilters() {
    selectedStatus.value = 'All';
    selectedCategory.value = 'All';
    filteredItems.assignAll(allItems);
  }

  // Add new item to inventory and reapply current filters so UI updates
  void addItem(InventoryItem item) {
    allItems.add(item);
    // reapply the currently selected filters so the filteredItems list updates
    applyFilter();
  }
}
