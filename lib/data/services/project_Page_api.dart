import 'dart:convert';
import 'package:dzandzi/presentation/data/models/project_list_model.dart';
import 'package:dzandzi/presentation/data/models/project_overview_model.dart' hide Project;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ProjectPageApi {

    static const String baseUrl='https://0eb38cd6013b.ngrok-free.app';
    static const String endpoint='project/list';

    static const String getProjects='$baseUrl/$endpoint';

    static const String refreshToken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJkNmMxMmI2My1iZTI5LTQ3MjAtOWQyNS1kNWIyMjgxMjRiOTkiLCJyb2xlIjoiT1dORVIiLCJpc1ZlcmlmaWVkIjp0cnVlLCJjb21wYW55SWQiOiJkMTYxOTllNC0wMjVlLTQwMDAtOGQ2NS1kZDM3OTQ5M2MzNjYiLCJpYXQiOjE3NjI3MzQ2MzAsImV4cCI6MTc2MzMzOTQzMH0.CRoZ1yZWpykMxYHSkVXB36UQD50uZR8vOS4a1zrXUNY';
   
    static const String projectDetailsEndPoint = '$baseUrl/project/9703c363-5b94-4902-afd6-b2d88f35a3ab';
    static const String projectDetails='$baseUrl/$projectDetailsEndPoint';
    
      
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

     String projectDetailsapi = '$baseUrl/project/$projectID';
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
    }
