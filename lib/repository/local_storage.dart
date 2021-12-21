import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  Future<String> getStoredValue(String key) async {
    try {
      return await storage.read(key: key) as String;
    } catch (error) {
      return '';
    }
  }

  Future<bool> setStoredValue(String key, String value) async {
    try {
      await storage.write(key: key, value: value);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> deleteStoredValue(String key) async {
    try {
      await storage.delete(key: key);
      return true;
    } catch (error) {
      return false;
    }
  }
}
