import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CreateProjectController extends GetxController {
  // Text controllers
  final nameController = TextEditingController();
  final locationController = TextEditingController();

  // Status dropdown
  RxString status = "ACTIVE".obs;

  // Dates
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  // Selected manager ID
  RxString managerId = "".obs;

  void setManager(String id) {
    managerId.value = id;
  }
}
