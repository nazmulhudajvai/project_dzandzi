import 'dart:convert';
import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:dzandzi/presentation/data/models/project_document_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
 
class ProjectDocumentController extends GetxController {
  RxList<ProjectDocumentModel> documents = <ProjectDocumentModel>[].obs;
  RxBool isLoading = false.obs;
    final baseurl=ProjectPageApi.baseUrl;
    final endpoint='project/documents';
    final refreshToken=ProjectPageApi.refreshToken;
  Future<void> fetchDocuments(String projectId) async {
    try {
      isLoading.value = true;

 
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $refreshToken', 
      };

      final response = await http.get(Uri.parse('$baseurl/$endpoint/$projectId'), headers: headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        documents.value = data.map((e) => ProjectDocumentModel.fromJson(e)).toList();
      } else {
        documents.clear();
        print('Error fetching documents: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      documents.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
