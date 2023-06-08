import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const keyAccessToken = 'accessToken';
  static const keyUserEmail = 'email';
  static Future setToken(dynamic accessToken) async {
    await _storage.write(key: keyAccessToken, value: accessToken);
  }

  static Future setEmail(dynamic email) async {
    await _storage.write(key: keyUserEmail, value: email);
  }

  static Future<dynamic?> getToken() async {
    await _storage.read(key: keyAccessToken);
  }

  static Future<dynamic?> getEmail() async {
    await _storage.read(key: keyUserEmail);
  }
}
