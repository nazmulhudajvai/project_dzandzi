import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dzandzi/presentation/controllers/project_pages_controler/create_project_controler.dart';
import 'package:dzandzi/presentation/data/models/create_project_model.dart';
import 'package:dzandzi/presentation/data/models/home_data_model.dart';
import 'package:dzandzi/presentation/data/models/project_list_model.dart';
import 'package:dzandzi/presentation/data/models/project_overview_model.dart' hide Project;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class ProjectPageApi {

    static const String baseUrl='https://a944e6c56434.ngrok-free.app';
    static const String endpoint='project/list';
    static const String createProjectEndpoint ='project/create';
    static const String getProjects='$baseUrl/$endpoint';

    static const String refreshToken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJkNmMxMmI2My1iZTI5LTQ3MjAtOWQyNS1kNWIyMjgxMjRiOTkiLCJyb2xlIjoiT1dORVIiLCJpc1ZlcmlmaWVkIjp0cnVlLCJjb21wYW55SWQiOiJkMTYxOTllNC0wMjVlLTQwMDAtOGQ2NS1kZDM3OTQ5M2MzNjYiLCJpYXQiOjE3NjM0ODkwNjQsImV4cCI6MTc2NDA5Mzg2NH0.fLG2-7ky8OdADw2OAsFHZMTgRUiNBMiD7gU9WveU4nI';
   
    static const String projectDetailsEndPoint = '$baseUrl/project/9703c363-5b94-4902-afd6-b2d88f35a3ab';
    static const String projectDetails='$baseUrl/$projectDetailsEndPoint';
    static const String inventoryEndpoint='inventory/project';
    
    final controller = Get.put(CreateProjectController());
      
// project list from api 
    static Future<List<Project>>fetchProjectList()async{
      
        final url=Uri.parse("$getProjects");
// String? refreshToken= await TokenStorage.getRefreshToken();


  debugPrint('this is refresh : $refreshToken');

     final header={
      'Content-Type':'application/json',
      'Authorization':'Bearer $refreshToken'
    };
        final response = await http.get(url,headers:header);
        debugPrint('Status code : ${response.statusCode}');
        if(response.statusCode==200){
            final alldata= jsonDecode(response.body);
            if(alldata['projects']!= null){
                final List projectsJson=alldata['projects'];
                return projectsJson.map((e) => Project.fromJson(e)).toList();
            }else{
                throw Exception('No Projects found');
            }
            }else{
                throw Exception('failed to load projects');
            }
        }


 

  static Future<ProjectOverviewModel> fetchProjectDetails(dynamic projectID) async {

     String projectDetailsapi = '$baseUrl/project/details/$projectID';
     final header={
      'Content-Type':'application/json',
      'Authorization':'Bearer $refreshToken'
    };
    final response = await http.get(Uri.parse(projectDetailsapi),headers: header);
    debugPrint(" This is status code : ${response.statusCode}");

   try{
     if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return ProjectOverviewModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load project overview');
    }
    
   }catch(e){
    debugPrint(' The Project is not load . cause :$e');
    throw Exception('Failed to load project overview');
   }
  }



 
 
   Future<bool> createProject() async {
  final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $refreshToken",
  };

  final data = create_post_model(
    name: controller.nameController.text,
    location: controller.locationController.text,
    startDate: controller.startDate.value!.toIso8601String(),
    endDate: controller.endDate.value!.toIso8601String(),
    status: controller.status.value!,
    projectManagerId: controller.managerId.value!,
  );

  final response = await http.post(
    Uri.parse('$baseUrl/$createProjectEndpoint'),
    headers: headers,
    body: jsonEncode(data.toJson()),
  );

  print("Status Code: ${response.statusCode}");
  print("Response Body: ${response.body}");

  return response.statusCode == 200 || response.statusCode == 201;
} 
static final header={
    'Content-Type':'application/json',
    'Authorization':'Bearer $refreshToken'
};
 
// home api integration.. 
static Future<HomeDataModel> fetchHomedata() async {
  try {
    final url = Uri.parse('$baseUrl/project/stats');
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final alldata = jsonDecode(response.body);
      return HomeDataModel.fromJson(alldata);
    } else {
      throw Exception(
          'Failed to load home data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Error fetching home data: $e');
    throw Exception('Failed to load home data');
  }
}

}
