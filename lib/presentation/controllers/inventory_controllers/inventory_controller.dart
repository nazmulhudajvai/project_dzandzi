import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/core/model/inventory_models/inventory_info_model.dart';
import 'package:dzandzi/core/services/add_inventory_api_service.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  final AddInventoryApiService _service = AddInventoryApiService();
  var isLoading = false.obs;
  var items = <AddItemModel>[].obs;

  // observables for inventory cards
  var totalValue = 0.0.obs;
  var totalItems = 0.obs;
  var inStock = 0.obs;
  var needAttention = 0.obs;

  Future<void> addItem(AddItemModel item) async {
    isLoading.value = true;

    final success = await _service.addItem(item.toJson());

    isLoading.value = false;

    if (success) {
      // ✅ Update UI instantly
      items.add(item);

      Get.snackbar('Success', 'Item added successfully');

      // Optional: fetchItems() if you want to sync with server
      // await fetchItems();
    } else {
      Get.snackbar('Error', 'Failed to add item');
    }
  }

  Future<void> fetchItems() async {
    isLoading.value = true;
    final fetchedItems = await _service.getItems();
    items.value = fetchedItems;
    isLoading.value = false;
  }

  Future<void> fetchInventoryInfo() async {
    final info = await _service.getInventoryInfo();
    if (info != null) {
      totalValue.value = info.totalValue;
      totalItems.value = info.totalItems;
      inStock.value = info.inStock;
      needAttention.value = info.needAttention;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchItems(); // load items on start
    fetchInventoryInfo(); // load card values on start
  }
}
