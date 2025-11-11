import 'dart:convert';
import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:dzandzi/presentation/data/models/project_employes_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class EmployeeController extends GetxController {
  var isLoading = false.obs;
  var employees = <Employee>[].obs;

  static const String baseUrl = ProjectPageApi.baseUrl;  
  static const String emplyUrl = "$baseUrl/project/employees";   
  static const String refreshToken = ProjectPageApi.refreshToken;   

  Future<void> fetchEmployees(projectId) async {
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse("$emplyUrl/$projectId"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $refreshToken', 
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<dynamic> list = jsonResponse['employees'];
        employees.value = list.map((e) => Employee.fromJson(e)).toList();
      } else {
        employees.clear();
      }
    } catch (e) {
      employees.clear();
      print("Error fetching employees: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
