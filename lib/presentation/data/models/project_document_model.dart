class ProjectDocumentModel {
  final String id;
  final String title;
  final String url;
  final DateTime uploadedAt;
  final String type;

  ProjectDocumentModel({
    required this.id,
    required this.title,
    required this.url,
    required this.uploadedAt,
    required this.type,
  });

  factory ProjectDocumentModel.fromJson(Map<String, dynamic> json) {
    return ProjectDocumentModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      uploadedAt: DateTime.parse(json['uploadedAt']),
      type: json['type'],
    );
  }
}
