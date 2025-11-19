class ProjectOverviewModel {
  Project? project;
  TaskAnalytics? taskAnalytics;
  int? inventoryBudget;

  ProjectOverviewModel({this.project, this.taskAnalytics, this.inventoryBudget});

  ProjectOverviewModel.fromJson(Map<String, dynamic> json) {
    project = json['project'] != null ? Project.fromJson(json['project']) : null;
    taskAnalytics = json['taskAnalytics'] != null
        ? TaskAnalytics.fromJson(json['taskAnalytics'])
        : null;
    inventoryBudget = json['inventoryBudget'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (project != null) {
      data['project'] = project!.toJson();
    }
    if (taskAnalytics != null) {
      data['taskAnalytics'] = taskAnalytics!.toJson();
    }
    data['inventoryBudget'] = inventoryBudget;
    return data;
  }
}

class Project {
  String? id;
  String? name;
  String? location;
  String? startDate;
  String? endDate;
  String? status;
  String? description;
  String? createdAt;
  String? companyId;
  ProjectManager? projectManager;
  ProjectManager? createdBy;

  Project(
      {this.id,
      this.name,
      this.location,
      this.startDate,
      this.endDate,
      this.status,
      this.description,
      this.createdAt,
      this.companyId,
      this.projectManager,
      this.createdBy});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    description = json['description'];
    createdAt = json['createdAt'];
    companyId = json['companyId'];
    projectManager = json['projectManager'] != null
        ? ProjectManager.fromJson(json['projectManager'])
        : null;
    createdBy =
        json['createdBy'] != null ? ProjectManager.fromJson(json['createdBy']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['location'] = location;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['status'] = status;
    data['description'] = description;
    data['createdAt'] = createdAt;
    data['companyId'] = companyId;
    if (projectManager != null) {
      data['projectManager'] = projectManager!.toJson();
    }
    if (createdBy != null) {
      data['createdBy'] = createdBy!.toJson();
    }
    return data;
  }
}

class ProjectManager {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  ProjectManager({this.id, this.firstName, this.lastName, this.email});

  ProjectManager.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }
}

class TaskAnalytics {
  int? averageProgress;
  int? totalTaskCount;
  int? completedTaskCount;
  int? ongoingTaskCount;
  List<Task>? maximumProgress5Tasks;
  List<Task>? lastThreeActiveTasks;
  List<RecentActivity>? recentActivities;

  TaskAnalytics(
      {this.averageProgress,
      this.totalTaskCount,
      this.completedTaskCount,
      this.ongoingTaskCount,
      this.maximumProgress5Tasks,
      this.lastThreeActiveTasks,
      this.recentActivities});

  TaskAnalytics.fromJson(Map<String, dynamic> json) {
    averageProgress = json['averageProgress'];
    totalTaskCount = json['totalTaskCount'];
    completedTaskCount = json['completedTaskCount'];
    ongoingTaskCount = json['ongoingTaskCount'];

    if (json['maximumProgress5Tasks'] != null) {
      maximumProgress5Tasks = <Task>[];
      json['maximumProgress5Tasks'].forEach((v) {
        maximumProgress5Tasks!.add(Task.fromJson(v));
      });
    }

    if (json['lastThreeActiveTasks'] != null) {
      lastThreeActiveTasks = <Task>[];
      json['lastThreeActiveTasks'].forEach((v) {
        lastThreeActiveTasks!.add(Task.fromJson(v));
      });
    }

    if (json['recentActivities'] != null) {
      recentActivities = <RecentActivity>[];
      json['recentActivities'].forEach((v) {
        recentActivities!.add(RecentActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['averageProgress'] = averageProgress;
    data['totalTaskCount'] = totalTaskCount;
    data['completedTaskCount'] = completedTaskCount;
    data['ongoingTaskCount'] = ongoingTaskCount;
    if (maximumProgress5Tasks != null) {
      data['maximumProgress5Tasks'] = maximumProgress5Tasks!.map((v) => v.toJson()).toList();
    }
    if (lastThreeActiveTasks != null) {
      data['lastThreeActiveTasks'] = lastThreeActiveTasks!.map((v) => v.toJson()).toList();
    }
    if (recentActivities != null) {
      data['recentActivities'] = recentActivities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Task {
  String? id;
  String? title;
  String? startDate;
  String? endDate;
  String? status;
  int? progress;
  AssignedEmployee? assignedEmployee;

  Task({this.id, this.title, this.startDate, this.endDate, this.status, this.progress, this.assignedEmployee});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    progress = json['progress'];
    assignedEmployee =
        json['assignedEmployee'] != null ? AssignedEmployee.fromJson(json['assignedEmployee']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['status'] = status;
    data['progress'] = progress;
    if (assignedEmployee != null) {
      data['assignedEmployee'] = assignedEmployee!.toJson();
    }
    return data;
  }
}

class AssignedEmployee {
  String? id;
  CompanyUser? companyUser;

  AssignedEmployee({this.id, this.companyUser});

  AssignedEmployee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyUser =
        json['CompanyUser'] != null ? CompanyUser.fromJson(json['CompanyUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (companyUser != null) {
      data['CompanyUser'] = companyUser!.toJson();
    }
    return data;
  }
}

class CompanyUser {
  String? id;
  String? userId;
  User? user;

  CompanyUser({this.id, this.userId, this.user});

  CompanyUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;

  User({this.firstName, this.lastName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    return data;
  }
}

class RecentActivity {
  String? timestamp;
  String? message;
  String? firstName;
  String? lastName;

  RecentActivity({this.timestamp, this.message, this.firstName, this.lastName});

  RecentActivity.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}
