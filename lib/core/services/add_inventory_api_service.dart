import 'dart:convert';
import 'package:dzandzi/core/model/inventory_models/add_item_model.dart';
import 'package:dzandzi/core/model/inventory_models/inventory_info_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddInventoryApiService {
  static const String baseUrl = 'https://simple-stingray-daring.ngrok-free.app';
  static const String endpoint = '/inventory/list';
  final headers = {'Content-Type': 'application/json'};
  final refreshToken='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJkNmMxMmI2My1iZTI5LTQ3MjAtOWQyNS1kNWIyMjgxMjRiOTkiLCJyb2xlIjoiT1dORVIiLCJpc1ZlcmlmaWVkIjp0cnVlLCJjb21wYW55SWQiOiJkMTYxOTllNC0wMjVlLTQwMDAtOGQ2NS1kZDM3OTQ5M2MzNjYiLCJpYXQiOjE3NjQzNjczMjUsImV4cCI6MTc2NDk3MjEyNX0.N923yDW64168l8XukC-upqf0qHDdA16bL7FIfpMlM-U';

  Map<String,String> get _auth => {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $refreshToken',
        'ngrok-skip-browser-warning': 'true',
      };
        // Map UI values to backend expected values
  String _mapUnitToBackend(String unit) {
    final mapping = {
      'Pieces': 'PIECE',
      'Boxes': 'BOX',
      'Kilograms': 'KILOGRAM',
      'Liters': 'LITER',
      'Meters': 'METER',
      'Gallons': 'GALLON',
    };
    return mapping[unit] ?? 'PIECE';
  }

  String _mapCategoryToBackend(String category) {
    final mapping = {
      'Materials': 'MATERIAL',
      'Tools': 'TOOL',
      'Hardware': 'HARDWARE',
      'Electrcal': 'ELECTRICAL',
      'Electrical': 'ELECTRICAL',
      'Plumbing': 'PLUMBING',
      'All': 'MATERIAL',
    };
    return mapping[category] ?? 'MATERIAL';
  }

  // Map backend values to UI-friendly values
  String _mapUnitFromBackend(String unit) {
    final mapping = {
      'PIECE': 'Pieces',
      'BOX': 'Boxes',
      'KILOGRAM': 'Kilograms',
      'LITER': 'Liters',
      'METER': 'Meters',
      'GALLON': 'Gallons',
    };
    return mapping[unit] ?? 'Pieces';
  }

  String _mapCategoryFromBackend(String category) {
    final mapping = {
      'MATERIAL': 'Materials',
      'TOOL': 'Tools',
      'HARDWARE': 'Hardware',
      'ELECTRICAL': 'Electrical',
      'PLUMBING': 'Plumbing',
    };
    return mapping[category] ?? 'Materials';
  }

  Future<bool> addItem(Map<String, dynamic> itemData) async {
     final url = Uri.parse('$baseUrl/inventory/create');

    // Transform payload to match backend expectations
    final transformedPayload = {
      'title': itemData['title'],
      'quantity': itemData['quantity'],
      'lowStockThreshold': itemData['lowStockThreshold'],
      'unit': _mapUnitToBackend(itemData['unit']),
      'category': _mapCategoryToBackend(itemData['category']),
      'valuePerUnit': itemData['valuePerUnit'],
    };

    print('==========================================');
    print('📤 POST TO: $url');
    print('📋 ORIGINAL: ${jsonEncode(itemData)}');
    print('🔄 TRANSFORMED: ${jsonEncode(transformedPayload)}');
    print('==========================================');

     try {
      final response = await http.post(
        url, 
        headers: _auth, 
        body: jsonEncode(transformedPayload)
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout'),
      );

       print('📥 STATUS: ${response.statusCode}');
      print('📥 BODY: ${response.body}');
      print('==========================================');

       if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204) {
        print('✅ Item added successfully');
        return true;
      } else {
        print('❌ Failed: ${response.statusCode}');
        try {
          final errorBody = jsonDecode(response.body);
          print('❌ Error: $errorBody');
        } catch (_) {}
        return false;
      }
    } catch (e) {
      print('❌ EXCEPTION: $e');
      return false;
    }
  }

  Future<bool> updateItem(String itemId, Map<String, dynamic> itemData) async {
    final url = Uri.parse('$baseUrl/inventory/update/$itemId');

    final transformedPayload = {
      'title': itemData['title'],
      'quantity': itemData['quantity'],
      'lowStockThreshold': itemData['lowStockThreshold'],
      'unit': _mapUnitToBackend(itemData['unit']),
      'category': _mapCategoryToBackend(itemData['category']),
      'valuePerUnit': itemData['valuePerUnit'],
    };

    print('==========================================');
    print('📤 PUT TO: $url');
    print('🔄 PAYLOAD: ${jsonEncode(transformedPayload)}');
    print('==========================================');

    try {
      final response = await http.put(
        url, 
        headers: _auth, 
        body: jsonEncode(transformedPayload)
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout'),
      );

      print('📥 STATUS: ${response.statusCode}');
      print('📥 BODY: ${response.body}');
      print('==========================================');

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('✅ Item updated successfully');
        return true;
      } else {
        print('❌ Failed: ${response.statusCode}');
        try {
          final errorBody = jsonDecode(response.body);
          print('❌ Error: $errorBody');
        } catch (_) {}
        return false;
      }
    } catch (e) {
      print('❌ EXCEPTION: $e');
      return false;
    }
     }

      Future<bool> deleteItem(String itemId) async {
    final url = Uri.parse('$baseUrl/inventory/delete/$itemId');

    print('==========================================');
    print('🗑️ DELETE: $url');
    print('==========================================');

    try {
      final response = await http.delete(url, headers: _auth).timeout(
        const Duration(seconds: 30),
        onTimeout: () => throw Exception('Request timeout'),
      );

      print('📥 STATUS: ${response.statusCode}');
      print('📥 BODY: ${response.body}');
      print('==========================================');

      if (response.statusCode == 200 || response.statusCode == 204) {
        print('✅ Item deleted successfully');
        return true;
      } else {
        print('❌ Failed: ${response.statusCode}');
        try {
          final errorBody = jsonDecode(response.body);
          print('❌ Error: $errorBody');
        } catch (_) {}
        return false;
      }
    } catch (e) {
      print('❌ EXCEPTION: $e');
      return false;
    }
  }

  Future<List<AddItemModel>> getItems() async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(url, headers: _auth);
      debugPrint('getItems status: ${response.statusCode}');

      if (response.statusCode == 200) {
          final responseBody = response.body;
        print('==========================================');
        print('📥 RAW API RESPONSE:');
        print(responseBody);
        print('==========================================');

        final List<dynamic> data = jsonDecode(responseBody);

        // Debug: print ALL items to see structure
        if (data.isNotEmpty) {
          print('==========================================');
          print('📋 TOTAL ITEMS RECEIVED: ${data.length}');
          print('📋 FIRST ITEM STRUCTURE:');
          print(jsonEncode(data.first));

          // Print all keys in first item
          if (data.first is Map) {
            final Map<String, dynamic> firstItem = data.first;
            print('📋 AVAILABLE KEYS: ${firstItem.keys.toList()}');
          }
          print('==========================================');
        }

        return data.map((json) {
          // Try ALL possible ID field names
          final id = json['id']?.toString() ?? 
                     json['_id']?.toString() ?? 
                     json['inventoryId']?.toString() ??
                     json['itemId']?.toString() ??
                     json['ID']?.toString() ??
                     json['uuid']?.toString();

          print('🔍 Processing item: ${json['title']} | ID: $id');

          if (id == null || id.isEmpty) {
            print('⚠️⚠️⚠️ WARNING: Item without ID!');
            print('   Full JSON: ${jsonEncode(json)}');
          }

          return AddItemModel(
            id: id,
            title: json['title'] ?? '',
            quantity: json['quantity'] ?? 0,
            lowStockThreshold: json['lowStockThreshold'] ?? 0,
            unit: _mapUnitFromBackend(json['unit'] ?? 'PIECE'),
            category: _mapCategoryFromBackend(json['category'] ?? 'MATERIAL'),
            valuePerUnit: (json['valuePerUnit'] ?? 0).toDouble(),
          );
        }).toList();
      } else {
        print('❌ Failed to fetch items: ${response.statusCode}');
        print('❌ Response: ${response.body}');
        throw Exception('Failed to load items');
      }
    } catch (e) {
        print('❌ Error fetching items: $e');
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