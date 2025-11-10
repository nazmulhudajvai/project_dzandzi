// controllers/create_project_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateProjectController extends GetxController {
  // Form fields
  var projectName = ''.obs;
  var projectLocation = ''.obs;
  var status = 'Active'.obs; // dropdown value
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();

  // Format for display
  String get startDateText => startDate.value == null
      ? 'Start Date'
      : DateFormat('d MMM, yyyy').format(startDate.value!);

  String get endDateText => endDate.value == null
      ? 'End Date'
      : DateFormat('d MMM, yyyy').format(endDate.value!);

  // Dropdown items
  final List<String> statusItems = ['Active', 'Inactive'];

  // Date picker
  Future<void> pickDate({
    required BuildContext context,
    required bool isStart,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      if (isStart) {
        startDate.value = picked;
        // optional: auto-clear end date if it's before start
        if (endDate.value != null && endDate.value!.isBefore(picked)) {
          endDate.value = null;
        }
      } else {
        endDate.value = picked;
      }
    }
  }
}