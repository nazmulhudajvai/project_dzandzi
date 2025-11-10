class InventoryInfoModel {
  final double totalValue;
  final int totalItems;
  final int remainingItems;
  final int remaingigInvetoryItems;

  InventoryInfoModel({
    required this.totalValue,
    required this.totalItems,
    required this.remainingItems,
    required this.remaingigInvetoryItems,
  });

  factory InventoryInfoModel.fromJson(Map<String, dynamic> json) {
    return InventoryInfoModel(
      totalValue: (json['totalValue'] ?? 0).toDouble(),
      totalItems: json['totalItems'] ?? 0,
      remainingItems: json['remainingItems'] ?? 0,
      remaingigInvetoryItems: json['remaingigInvetoryItems'] ?? 0,
    );
  }
}
