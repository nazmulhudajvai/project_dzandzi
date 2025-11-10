import 'dart:convert';
import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/core/model/inventory_models/inventory_info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddInventoryApiService {
  static const String baseUrl = 'https://0eb38cd6013b.ngrok-free.app';
  static const String endpoint = '/inventory/list';
  static const String endpoint1 = '/inventory';
final headers = {'Content-Type': 'application/json'};
final refreshToken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJkMTY3MWNjNi0wY2FlLTQzNjAtYTUzMi05OWJiZjZmMGVlZGMiLCJyb2xlIjoiT1dORVIiLCJpc1ZlcmlmaWVkIjp0cnVlLCJjb21wYW55SWQiOiJhN2NkMTBhNS1jMGVmLTRhMzQtOTFlNi0zNTE2ZTU5ODU3N2IiLCJpYXQiOjE3NjI2MzY3MjQsImV4cCI6MTc2MzI0MTUyNH0.8qWEdUyhGp7nXeEZhb4wjldfd15mE5Cys0xs-pkh6Zs';


Map<String,String> get _auth => {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $refreshToken',
    };

  Future<bool> addItem(Map<String, dynamic> itemData) async {
  final url = Uri.parse('$baseUrl/inventory'); // maybe /inventory instead of /inventory/list
  print('Posting to $url with body: $itemData');

  try {
    final response = await http.post(url, headers: _auth, body: jsonEncode(itemData));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('Exception: $e');
    return false;
  }
}



  Future<List<AddItemModel>> getItems() async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(url,headers: _auth);
      debugPrint('${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
       
        return data.map((e) => AddItemModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      print('Error fetching items: $e');
      return [];
    }
  }

  Future<InventoryInfoModel?> getInventoryInfo() async {
    try {
      final url = Uri.parse('$baseUrl/inventory/info');
      final response = await http.get(url, headers: _auth);
      debugPrint('getInventoryInfo status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return InventoryInfoModel.fromJson(data);
      } else {
        throw Exception('Failed to load inventory info');
      }
    } catch (e) {
      print('Error fetching inventory info: $e');
      return null;
    }
  }
}
