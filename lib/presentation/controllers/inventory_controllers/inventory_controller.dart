import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/core/model/inventory_models/inventory_info_model.dart';
import 'package:dzandzi/core/services/add_inventory_api_service.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  final AddInventoryApiService _service = AddInventoryApiService();
  var isLoading = false.obs;
  var items = <AddItemModel>[].obs;
  var searchQuery = ''.obs;

  // observables for inventory cards
  var totalValue = 0.0.obs;
  var totalItems = 0.obs;
  var inStock = 0.obs;
  var needAttention = 0.obs;

  // Computed filtered items based on search query
  List<AddItemModel> get filteredItems {
    if (searchQuery.value.isEmpty) {
      return items;
    }
    return items.where((item) {
      return item.title.toLowerCase().contains(searchQuery.value.toLowerCase());
    }).toList();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void clearSearch() {
    searchQuery.value = '';
  }

  Future<bool> addItem(AddItemModel item) async {
    try {
      isLoading.value = true;

      final success = await _service.addItem(item.toJson());

      if (success) {
        print('✅ Item added, refreshing list...');

        // Refresh items from server to show the new item
        await fetchItems();
        await fetchInventoryInfo();

        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      print('❌ addItem exception: $e');
      isLoading.value = false;
      return false;
    }
  }

  Future<void> fetchItems() async {
    try {
      isLoading.value = true;
      final fetchedItems = await _service.getItems();
      items.value = fetchedItems;
      print('✅ Loaded ${fetchedItems.length} items');
    } catch (e) {
      print('❌ Error fetching items: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchInventoryInfo() async {
    try {
      final info = await _service.getInventoryInfo();
      if (info != null) {
        totalValue.value = info.totalValue;
        totalItems.value = info.totalItems;
        inStock.value = info.remainingItems;
        needAttention.value = info.remaingigInvetoryItems;
        print('✅ Updated inventory info');
      }
    } catch (e) {
      print('❌ Error fetching inventory info: $e');
    }
  }

  Future<bool> updateItem(String itemId, AddItemModel item) async {
    try {
      isLoading.value = true;

      final success = await _service.updateItem(itemId, item.toJson());

      if (success) {
        print('✅ Item updated, refreshing list...');

        await fetchItems();
        await fetchInventoryInfo();

        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      print('❌ updateItem exception: $e');
      isLoading.value = false;
      return false;
    }
  }

  Future<bool> deleteItem(String itemId) async {
    try {
      isLoading.value = true;

      final success = await _service.deleteItem(itemId);

      if (success) {
        print('✅ Item deleted, refreshing list...');

        await fetchItems();
        await fetchInventoryInfo();

        isLoading.value = false;
        return true;
      } else {
        isLoading.value = false;
        return false;
      }
    } catch (e) {
      print('❌ deleteItem exception: $e');
      isLoading.value = false;
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchInventoryInfo();
  }
}
