  import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:dzandzi/presentation/data/models/project_inventory_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class InventoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<InventoryItem> inventoryItems = <InventoryItem>[].obs;

 
  final String BaseUrl =ProjectPageApi.baseUrl;
  final String refreshToken =ProjectPageApi.refreshToken;
  final String inventoryEndpoint =ProjectPageApi.inventoryEndpoint;

  Future<void> fetchInventoryData(String ProjectId) async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse("$BaseUrl/$inventoryEndpoint/$ProjectId"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $refreshToken',
        },
      );

      debugPrint("Inventory status: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = InventoryResponse.fromRawJson(response.body);
        inventoryItems.assignAll(data.inventoryItems);
      } else {
        Get.snackbar('Error', 'Failed to load inventory');
      }
    } catch (e) {
      debugPrint('Error fetching inventory: $e');
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
