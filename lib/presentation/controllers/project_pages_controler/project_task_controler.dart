import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:dzandzi/presentation/data/models/project_task_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
 

class ProjectTaskController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<Task> taskList = <Task>[].obs;

  final String baseUrl = ProjectPageApi.baseUrl;
  final String refreshToken = ProjectPageApi.refreshToken;


  Future<void> fetchTasks(ProjectId) async {

    final header={ 
      "Content-type":"application/json",
      "Authorization": "Bearer $refreshToken"
    };
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse("$baseUrl/task/$ProjectId"), headers:header);

      debugPrint("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = TaskListResponse.fromRawJson(response.body);
        taskList.assignAll(data.tasks);
      } else {
        Get.snackbar('Error', 'Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching tasks: $e');
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
