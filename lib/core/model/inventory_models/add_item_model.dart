class AddItemModel {
  final String? id;
  final String title;
  final int quantity;
  final int lowStockThreshold;
  final String unit;
  final String category;
  final double valuePerUnit;

  AddItemModel({
    this.id,
    required this.title,
    required this.quantity,
    required this.lowStockThreshold,
    required this.unit,
    required this.category,
    required this.valuePerUnit,
  });

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'quantity': quantity,
      'lowStockThreshold': lowStockThreshold,
      'unit': unit,
      'category': category,
      'valuePerUnit': valuePerUnit,
    };
  }

  factory AddItemModel.fromJson(Map<String, dynamic> json) {
    return AddItemModel(
      id: json['id']?.toString(),
      title: json['title'] ?? '',
      quantity: json['quantity'] ?? 0,
      lowStockThreshold: json['lowStockThreshold'] ?? 0,
      unit: json['unit'] ?? '',
      category: json['category'] ?? '',
      valuePerUnit: (json['valuePerUnit'] ?? 0).toDouble(),
    );
  }
}
