import 'dart:convert';
import 'package:dzandzi/data/services/api_service.dart';
import 'package:dzandzi/presentation/pages/common/company_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final ApiService apiService = Get.put(ApiService()); // Initialize the ApiService

  // Observables
  var isLoading = false.obs;
  var isRemembered = false.obs;

  // Form fields
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Registration method
  Future<void> register() async {
    // Check if passwords match
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    // Prepare the body
    final body = {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "email": emailController.text.trim(), // Ensure this is a valid email
      "phone": phoneController.text.trim(), // Ensure the phone number is valid
      "password": passwordController.text.trim(),
    };

    // Log the request body
    print("Request Body: $body");

    try {
      // Call the API to register the user
      final http.Response response =
      await apiService.post("/auth/register", body);

      // Log the response for debugging
      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Handle the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        Get.snackbar("Success", "Registration successful!",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.to(() => CompanyDetailsView());
      } else {
        // Log and show detailed error response
        final error = jsonDecode(response.body);
        print("Error response: $error");
        Get.snackbar("Error", error["message"] ?? "Registration failed",
            backgroundColor: Colors.redAccent, colorText: Colors.white);
      }
    } catch (e) {
      // Catch any errors during the API call
      print("Error during API call: $e");
      Get.snackbar("Error", "Something went wrong: $e",
          backgroundColor: Colors.redAccent, colorText: Colors.white);
    } finally {
      // Set loading state to false once the API call is done
      isLoading.value = false;
    }
  }

}
