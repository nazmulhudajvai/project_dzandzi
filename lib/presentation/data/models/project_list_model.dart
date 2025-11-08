class Project {
  final String id;
  final String name;
  final String location;
  final String status;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final ProjectManager projectManager;
  final TaskProgress taskProgress;

  Project({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
    this.description,
    this.startDate,
    this.endDate,
    required this.projectManager,
    required this.taskProgress,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      status: json['status'] ?? '',
      description: json['description'],
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : null,
      projectManager: ProjectManager.fromJson(json['projectManager'] ?? {}),
      taskProgress: TaskProgress.fromJson(json['taskProgress'] ?? {}),
    );
  }
}

class ProjectManager {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  ProjectManager({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory ProjectManager.fromJson(Map<String, dynamic> json) {
    return ProjectManager(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

class TaskProgress {
  final int totalTasks;
  final int completedTasks;
  final int averageProgress;

  TaskProgress({
    required this.totalTasks,
    required this.completedTasks,
    required this.averageProgress,
  });

  factory TaskProgress.fromJson(Map<String, dynamic> json) {
    return TaskProgress(
      totalTasks: json['totalTasks'] ?? 0,
      completedTasks: json['completedTasks'] ?? 0,
      averageProgress: json['averageProgress'] ?? 0,
    );
  }
}
