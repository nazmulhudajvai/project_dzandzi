import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  // Create storage
  static final _storage = FlutterSecureStorage();

  // Save access token
  static Future<void> saveAccessToken(String token) async {
    await _storage.write(key: 'accessToken', value: token);
  }

  // Save refresh token
  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: 'refreshToken', value: token);
  }

  // Read access token
  static Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  // Read refresh token
  static Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  // Delete tokens
  static Future<void> deleteTokens() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
  }
}
