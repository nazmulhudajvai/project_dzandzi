import 'package:dzandzi/data/services/project_Page_api.dart';
import 'package:dzandzi/presentation/data/models/home_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var homeData = Rxn<HomeDataModel>();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }

  void loadHomeData() async {
    try {
      isLoading.value = true;
      final data = await ProjectPageApi.fetchHomedata();
      if (data != null) {
        homeData.value = data;
      }
    } catch (e) {
      debugPrint('Error loading home data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
