import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/core/services/add_inventory_api_service.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  final AddInventoryApiService _service = AddInventoryApiService();
  var isLoading = false.obs;
  var items = <AddItemModel>[].obs;

  Future<void> addItem(AddItemModel item) async {
    isLoading.value = true;
    final success = await _service.addItem(item);
    isLoading.value = false;

    if (success) {
      Get.snackbar('Success', 'Item added successfully');
      fetchItems(); // refresh list after adding
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

  @override
  void onInit() {
    super.onInit();
    fetchItems(); // load on start
  }
}
