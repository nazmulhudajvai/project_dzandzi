class InventoryInfoModel {
  final double totalValue;
  final int totalItems;
  final int inStock;
  final int needAttention;

  InventoryInfoModel({
    required this.totalValue,
    required this.totalItems,
    required this.inStock,
    required this.needAttention,
  });

  factory InventoryInfoModel.fromJson(Map<String, dynamic> json) {
    return InventoryInfoModel(
      totalValue: (json['totalValue'] ?? 0).toDouble(),
      totalItems: json['totalItems'] ?? 0,
      inStock: json['inStock'] ?? 0,
      needAttention: json['needAttention'] ?? 0,
    );
  }
}
