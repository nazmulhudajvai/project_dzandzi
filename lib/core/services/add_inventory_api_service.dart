import 'dart:convert';
import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:http/http.dart' as http;

class AddInventoryApiService {
  static const String baseUrl = 'http://10.10.13.83:3000';
  static const String endpoint = '/inventory/';

  Future<bool> addItem(AddItemModel item) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode(item.toJson());

      final response = await http.post(url, headers: headers, body: body);

      return response.statusCode == 201;
    } catch (e) {
      print('Error adding item: $e');
      return false;
    }
  }

  Future<List<AddItemModel>> getItems() async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(url);

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
}
