import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/project_models/project_usage_model.dart';

class ProjectUsageApiService {
  static const String baseUrl = 'https://simple-stingray-daring.ngrok-free.app';
  final refreshToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJkNmMxMmI2My1iZTI5LTQ3MjAtOWQyNS1kNWIyMjgxMjRiOTkiLCJyb2xlIjoiT1dORVIiLCJpc1ZlcmlmaWVkIjp0cnVlLCJjb21wYW55SWQiOiJkMTYxOTllNC0wMjVlLTQwMDAtOGQ2NS1kZDM3OTQ5M2MzNjYiLCJpYXQiOjE3NjQzNjczMjUsImV4cCI6MTc2NDk3MjEyNX0.N923yDW64168l8XukC-upqf0qHDdA16bL7FIfpMlM-U';

  Map<String, String> get _auth => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $refreshToken',
        'ngrok-skip-browser-warning': 'true',
      };

  Future<ProjectUsageResponse?> getProjectUsageData() async {
    try {
      final url = Uri.parse('$baseUrl/inventory/projects');
      
      print('==========================================');
      print('📤 GET: $url');
      print('==========================================');
      
      final response = await http.get(url, headers: _auth).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout'),
      );

      print('📥 Status: ${response.statusCode}');
      print('📥 Response Body: ${response.body}');
      print('==========================================');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final projectResponse = ProjectUsageResponse.fromJson(data);
        
        print('✅ Projects loaded: ${projectResponse.projects.length}');
        for (var project in projectResponse.projects) {
          print('   📋 ${project.projectName}: €${project.totalValue} (${project.totalItems} items)');
        }
        
        print('✅ Most used items: ${projectResponse.mostUsedItems.length}');
        for (var item in projectResponse.mostUsedItems) {
          print('   📦 ${item.title}: ${item.totalRequested} ${item.unit}');
        }
        
        return projectResponse;
      } else {
        print('❌ Failed: ${response.statusCode}');
        print('❌ Body: ${response.body}');
        return null;
      }
    } catch (e, stackTrace) {
      print('❌ Error: $e');
      print('❌ Stack: $stackTrace');
      return null;
    }
  }
}
