import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://example.com/api/'));

  Future<Response> get(String path) async => _dio.get(path);
  Future<Response> post(String path, dynamic data) async => _dio.post(path, data: data);
}
