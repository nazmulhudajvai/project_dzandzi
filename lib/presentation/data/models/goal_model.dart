class GoalModel {
  final int totalTasks;
  final int completedTasks;
  final int missedTasks;
  final int daysLeft;

  GoalModel({
    required this.totalTasks,
    required this.completedTasks,
    required this.missedTasks,
    required this.daysLeft,
  });

  double get progress => totalTasks == 0 ? 0 : (completedTasks / totalTasks);

  bool get isCompleted => progress == 1.0;

  bool get isOnTrack => progress >= 0.6 && !isCompleted;

  bool get isBehind => progress < 0.6 && !isCompleted;

  GoalModel copyWith({
    int? totalTasks,
    int? completedTasks,
    int? missedTasks,
    int? daysLeft,
  }) {
    return GoalModel(
      totalTasks: totalTasks ?? this.totalTasks,
      completedTasks: completedTasks ?? this.completedTasks,
      missedTasks: missedTasks ?? this.missedTasks,
      daysLeft: daysLeft ?? this.daysLeft,
    );
  }
}
