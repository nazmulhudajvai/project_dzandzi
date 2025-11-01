import 'package:get/get.dart';

class CustomDropdownFieldController extends GetxController {
  
//project selection
  var selectedProject = ''.obs;

  void updateSelectedProject(String newValue) {
    selectedProject.value = newValue;
  }

  // stock status
  var selectedStatus = ''.obs;

  void updateSelectedStatus(String newValue) {
    selectedStatus.value = newValue;
  }

// material categories
  var selectedCategory = ''.obs;

  void updateSelectedCategory(String newValue) {
    selectedCategory.value = newValue;
  }

// material categories to add new item
  var selectedAddCategory = ''.obs;

  void updateSelectedAddCategory(String newValue) {
    selectedAddCategory.value = newValue;
  }

  //unit selection to add item
    var selectedUnit = ''.obs;

  void updateSelectedUnit(String newValue) {
    selectedUnit.value = newValue;
  }
}