class ProjectUsageModel {
  final String projectId;
  final String projectName;
  final int totalItems;
  final int totalItemsQuantity;
  final double totalValue;
  final String lastUpdatedDate;

  ProjectUsageModel({
    required this.projectId,
    required this.projectName,
    required this.totalItems,
    required this.totalItemsQuantity,
    required this.totalValue,
    required this.lastUpdatedDate,
  });

  factory ProjectUsageModel.fromJson(Map<String, dynamic> json) {
    return ProjectUsageModel(
      projectId: json['projectId'] ?? '',
      projectName: json['projectName'] ?? '',
      totalItems: json['totalItems'] ?? 0,
      totalItemsQuantity: json['totalItemsQuantity'] ?? 0,
      totalValue: (json['totalValue'] ?? 0).toDouble(),
      lastUpdatedDate: json['lastUpdatedDate'] ?? '',
    );
  }

  String get formattedDate {
    try {
      final date = DateTime.parse(lastUpdatedDate);
      if (date.year == 1970) return 'Not updated yet';
      final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      return '${months[date.month - 1]} ${date.day}, ${date.year}';
    } catch (e) {
      return 'N/A';
    }
  }
  
  String get status {
    return totalItems > 0 ? 'Active' : 'Inactive';
  }
}

class MostUsedItemModel {
  final String inventoryId;
  final String title;
  final String category;
  final int totalRequested;
  final String unit;

  MostUsedItemModel({
    required this.inventoryId,
    required this.title,
    required this.category,
    required this.totalRequested,
    required this.unit,
  });

  factory MostUsedItemModel.fromJson(Map<String, dynamic> json) {
    return MostUsedItemModel(
      inventoryId: json['inventoryId'] ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      totalRequested: json['totalRequested'] ?? 0,
      unit: json['unit'] ?? '',
    );
  }
}

class ProjectUsageResponse {
  final List<ProjectUsageModel> projects;
  final List<MostUsedItemModel> mostUsedItems;
  final int totalProjects;

  ProjectUsageResponse({
    required this.projects,
    required this.mostUsedItems,
    required this.totalProjects,
  });

  factory ProjectUsageResponse.fromJson(Map<String, dynamic> json) {
    return ProjectUsageResponse(
      projects: (json['projects'] as List?)
          ?.map((item) => ProjectUsageModel.fromJson(item))
          .toList() ?? [],
      mostUsedItems: (json['mostUsedItems'] as List?)
          ?.map((item) => MostUsedItemModel.fromJson(item))
          .toList() ?? [],
      totalProjects: json['totalProjects'] ?? 0,
    );
  }
  
  int get totalItemsRequested {
    return mostUsedItems.fold(0, (sum, item) => sum + item.totalRequested);
  }
}
