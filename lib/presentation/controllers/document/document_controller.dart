import 'package:get/get.dart';

class DocumentController extends GetxController {
  // Search text
  var searchText = ''.obs;

  // Documents (temporary static data for now)
  var documents = [
    {'projectName': 'Housezeo', 'uploadDate': '1/10/2023', 'fileSize': '3.2MB'},
    {
      'projectName': 'DreamVilla',
      'uploadDate': '2/11/2023',
      'fileSize': '2.5MB',
    },
    {'projectName': 'SkyLine', 'uploadDate': '5/11/2023', 'fileSize': '1.8MB'},
    {
      'projectName': 'CityScape',
      'uploadDate': '7/11/2023',
      'fileSize': '4.0MB',
    },
  ].obs;

  // Filtered documents (computed)
  List<Map<String, dynamic>> get filteredDocuments {
    if (searchText.value.isEmpty) return documents;
    return documents
        .where(
          (doc) => doc['projectName'].toString().toLowerCase().contains(
            searchText.value.toLowerCase(),
          ),
        )
        .toList();
  }

  // Update search text
  void updateSearch(String value) {
    searchText.value = value;
  }
}
