class ProjectOverviewModel {
  final Project project;
  final TaskAnalytics taskAnalytics;
  final double inventoryBudget;

  ProjectOverviewModel({
    required this.project,
    required this.taskAnalytics,
    required this.inventoryBudget,
  });

  factory ProjectOverviewModel.fromJson(Map<String, dynamic> json) {
    return ProjectOverviewModel(
      project: Project.fromJson(json['project']),
      taskAnalytics: TaskAnalytics.fromJson(json['taskAnalytics']),
      inventoryBudget: (json['inventoryBudget'] ?? 0).toDouble(),
    );
  }
}

class Project {
  final String id;
  final String name;
  final String location;
  final String status;

  Project({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      status: json['status'],
    );
  }
}

class TaskAnalytics {
  // final double avarageProgress;
  final int totalTaskCount;
  final int completedTaskCount;
  final int ongoingTaskCount;
  final List recentActivities;

  TaskAnalytics({
    // required this.avarageProgress,
    required this.totalTaskCount,
    required this.completedTaskCount,
    required this.ongoingTaskCount,
    required this.recentActivities,
  });

  factory TaskAnalytics.fromJson(Map<String, dynamic> json) {
    return TaskAnalytics(
      // avarageProgress: json['averageProgress'] ?? 0,
      totalTaskCount: json['totalTaskCount'] ?? 0,
      completedTaskCount: json['completedTaskCount'] ?? 0,
      ongoingTaskCount: json['ongoingTaskCount'] ?? 0,
      recentActivities: json['recentActivities'] ?? [],
    );
  }
}
