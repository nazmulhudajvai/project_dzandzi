import 'dart:convert';
import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiService extends GetxService {

 
  final String baseUrl = "https://08cdd6970275.ngrok-free.app";
  final refreshToken =ProjectPageApi.refreshToken;

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    print('PRINTING BODY');
    print(body);
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}