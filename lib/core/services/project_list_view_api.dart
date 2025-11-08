import 'dart:convert';

import 'package:dzandzi/presentation/data/models/project_list_model.dart';
import 'package:http/http.dart' as http;

class ProjectListViewApi {

    static const String baseUrl='https://cc6d42d2c029.ngrok-free.app';

    static const String projectListViewEndpoint='$baseUrl/project/list';

    static const String refreshToken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NzdkN2IwMC02NDk0LTQ3YzAtYTk2MS02NGI0YmQ5Y2JiMGYiLCJyb2xlIjoiT1dORVIiLCJpc1ZlcmlmaWVkIjp0cnVlLCJjb21wYW55SWQiOiIzOGE5NjgxOS1lOWQzLTQ0ZGItYjhjZi1iY2U3MGUzYWE4YTYiLCJpYXQiOjE3NjI1NDE3MjYsImV4cCI6MTc2MzE0NjUyNn0.bKy2xyhkkWHAwZK2udvaXdCBvPR2aDhCBIT_-N6BPEg';
    
    static const   header={
      'Content-Type':'application/json',
      'Authorization':'Bearer $refreshToken'
    };
      

    static Future<List<Project>>fetchProjectList()async{
        final url=Uri.parse("$projectListViewEndpoint");

        final response = await http.get(url,headers:header,);
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
    }
