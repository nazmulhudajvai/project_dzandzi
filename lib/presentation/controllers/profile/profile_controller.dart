import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dzandzi/presentation/pages/auth/login/login_screen.dart';

class ProfileController extends GetxController {
  final String baseUrl = 'https://0eb38cd6013b.ngrok-free.app'; // change if needed

  var isLoading = false.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var avatarUrl = ''.obs;
  var avatarFile = Rx<File?>(null); // local picked image

  late SharedPreferences _prefs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _initPrefsAndLoad();
  }

  Future<void> _initPrefsAndLoad() async {
    _prefs = await SharedPreferences.getInstance();
    firstName.value = _prefs.getString('firstName') ?? '';
    lastName.value = _prefs.getString('lastName') ?? '';
    email.value = _prefs.getString('email') ?? '';
    phone.value = _prefs.getString('phone') ?? '';
    avatarUrl.value = _prefs.getString('avatarUrl') ?? '';
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
      if (picked != null) {
        avatarFile.value = File(picked.path);
        await uploadAvatar(); // upload immediately
      }
    } catch (e) {
      debugPrint('pickImageFromGallery err: $e');
      Get.snackbar(
        'Error',
        'Failed to pick image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  Future<void> uploadAvatar() async {
    if (avatarFile.value == null) return;

    try {
      isLoading.value = true;
      final token = _prefs.getString('accessToken');

      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/auth/upload-avatar'),
      );

      // Headers (many servers require Accept header)
      request.headers.addAll({
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      });

      // The field name here must match your backend (avatar/file/image)
      request.files.add(await http.MultipartFile.fromPath(
        'avatar',
        avatarFile.value!.path,
      ));

      final streamedResp = await request.send();
      final respStr = await streamedResp.stream.bytesToString();

      debugPrint('📤 uploadAvatar resp (${streamedResp.statusCode}): $respStr');

      if (streamedResp.statusCode == 200 || streamedResp.statusCode == 201) {
        final body = json.decode(respStr);

        // Try multiple possible field names from backend
        final newUrl = body['avatarUrl'] ??
            body['avatar'] ??
            body['data']?['avatarUrl'] ??
            body['data']?['avatar'] ??
            '';

        if (newUrl.isNotEmpty) {
          avatarUrl.value = newUrl;
          await _prefs.setString('avatarUrl', newUrl);
          avatarFile.value = null; // clear local file after success
        }

        Get.snackbar(
          'Success',
          'Avatar updated successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        debugPrint('❌ Upload failed: ${streamedResp.statusCode} -> $respStr');
        Get.snackbar(
          'Error',
          'Upload failed (${streamedResp.statusCode})',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint('uploadAvatar err: $e');
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile({bool callServer = false}) async {
    isLoading.value = true;
    try {
      // Save locally
      await _prefs.setString('firstName', firstName.value);
      await _prefs.setString('lastName', lastName.value);
      await _prefs.setString('email', email.value);
      await _prefs.setString('phone', phone.value);

      if (callServer) {
        final token = _prefs.getString('accessToken');
        final resp = await http.put(
          Uri.parse('$baseUrl/auth/update-profile'),
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
          body: json.encode({
            'firstName': firstName.value,
            'lastName': lastName.value,
            'email': email.value,
            'phone': phone.value,
          }),
        );

        if (resp.statusCode == 200 || resp.statusCode == 201) {
          Get.snackbar(
            'Success',
            'Profile updated successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          debugPrint('updateProfile server err: ${resp.statusCode} -> ${resp.body}');
          Get.snackbar(
            'Error',
            'Update failed (${resp.statusCode})',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Success',
          'Profile saved locally',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint('updateProfile err: $e');
      Get.snackbar(
        'Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await _prefs.clear();
      Get.offAll(() => LoginView());
    } catch (e) {
      debugPrint('logout err: $e');
      Get.snackbar(
        'Error',
        'Logout failed: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
