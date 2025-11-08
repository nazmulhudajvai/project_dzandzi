import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiService extends GetxService {
  final String baseUrl = "https://cc6d42d2c029.ngrok-free.app";

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
