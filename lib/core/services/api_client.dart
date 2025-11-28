import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://simple-stingray-daring.ngrok-free.app',
    headers: {'ngrok-skip-browser-warning': 'true'},
  ));

  Future<Response> get(String path) async => _dio.get(path);
  Future<Response> post(String path, dynamic data) async => _dio.post(path, data: data);
}
