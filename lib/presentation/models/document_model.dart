class DocumentModel {
  final String id;
  final String title;
  final String fileUrl;
  final String uploadDate;
  final String projectName;

  DocumentModel({
    required this.id,
    required this.title,
    required this.fileUrl,
    required this.uploadDate,
    required this.projectName,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      fileUrl: json['file'] ?? '',
      uploadDate: json['createdAt'] ?? '',
      projectName: json['projectName'] ?? '',
    );
  }
}
