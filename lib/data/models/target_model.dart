// lib/app/models/target_model.dart
class Target {
  final String title;
  final String subtitle;
  final int progress;
  final int remainingDays;
  final String image; // 👈 Add this

  Target({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.remainingDays,
    required this.image, // 👈 Add this
  });
}
