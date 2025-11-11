import 'dart:convert';

class InventoryResponse {
  final String projectId;
  final List<InventoryItem> inventoryItems;
  final int totalItems;
  final int totalValue;

  InventoryResponse({
    required this.projectId,
    required this.inventoryItems,
    required this.totalItems,
    required this.totalValue,
  });

  factory InventoryResponse.fromJson(Map<String, dynamic> json) {
    return InventoryResponse(
      projectId: json['projectId'] ?? '',
      inventoryItems: (json['inventoryItems'] as List)
          .map((item) => InventoryItem.fromJson(item))
          .toList(),
      totalItems: json['totalItems'] ?? 0,
      totalValue: json['totalValue'] ?? 0,
    );
  }

  static InventoryResponse fromRawJson(String str) =>
      InventoryResponse.fromJson(json.decode(str));
}

class InventoryItem {
  final String id;
  final String title;
  final int valuePerUnit;
  final int quantity;
  final String unit;
  final String category;
  final bool isLowOnStock;
  final int availableQuantity;

  InventoryItem({
    required this.id,
    required this.title,
    required this.valuePerUnit,
    required this.quantity,
    required this.unit,
    required this.category,
    required this.isLowOnStock,
    required this.availableQuantity,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      valuePerUnit: json['valuePerUnit'] ?? 0,
      quantity: json['quantity'] ?? 0,
      unit: json['unit'] ?? '',
      category: json['category'] ?? '',
      isLowOnStock: json['isLowOnStock'] ?? false,
      availableQuantity: json['availableQuantity'] ?? 0,
    );
  }
}
