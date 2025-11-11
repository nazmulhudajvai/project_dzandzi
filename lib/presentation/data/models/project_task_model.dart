import 'dart:convert';

class TaskListResponse {
  final String message;
  final List<Task> tasks;
  final int totalTasks;

  TaskListResponse({
    required this.message,
    required this.tasks,
    required this.totalTasks,
  });

  factory TaskListResponse.fromJson(Map<String, dynamic> json) {
    return TaskListResponse(
      message: json['message'] ?? '',
      tasks: (json['tasks'] as List)
          .map((task) => Task.fromJson(task))
          .toList(),
      totalTasks: json['totalTasks'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'tasks': tasks.map((t) => t.toJson()).toList(),
      'totalTasks': totalTasks,
    };
  }

  static TaskListResponse fromRawJson(String str) =>
      TaskListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}

class Task {
  final String id;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final int progress;
  final String status;
  final AssignedTo assignedTo;

  Task({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.progress,
    required this.status,
    required this.assignedTo,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      progress: json['progress'] ?? 0,
      status: json['status'] ?? '',
      assignedTo: AssignedTo.fromJson(json['assignedTo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'progress': progress,
      'status': status,
      'assignedTo': assignedTo.toJson(),
    };
  }
}

class AssignedTo {
  final String firstName;
  final String lastName;
  final String email;

  AssignedTo({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory AssignedTo.fromJson(Map<String, dynamic> json) {
    return AssignedTo(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
