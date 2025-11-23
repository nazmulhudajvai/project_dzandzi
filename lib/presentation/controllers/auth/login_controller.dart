import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/local/token_storage.dart';
import '../../bottom_navigation_bar/view/bottom_navigation_view.dart';
// <- import your TokenStorage

class LoginController extends GetxController {
  var isLoading = false.obs;

  // Text editing controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Login API call
  Future<void> login() async {
    // Validate the fields
    if (emailController.text.isEmpty ||
        // phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar("Error", "All fields are required",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    final body = {
      "email": emailController.text.trim(),
      // "phone": phoneController.text.trim(),
      "password": passwordController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse('https://08cdd6970275.ngrok-free.app/auth/login'),
        headers: {'Content-Type':'application/json'},
        body: json.encode(body),
      );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        // Save tokens securely
        await TokenStorage.saveAccessToken(responseData['accessToken']);
        await TokenStorage.saveRefreshToken(responseData['refreshToken']);

        Get.snackbar("Success", "Login successful!",
            backgroundColor: Colors.green, colorText: Colors.white);

        // Navigate to BottomNavigationScreen
        Get.to(() => BottomNavigationScreen());
      } else {
        // Show backend error
        var error = json.decode(response.body);
        Get.snackbar(
            "Error", error["message"] ?? "Invalid credentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Login error: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  // Dispose controllers when done
  @override
  void onClose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
