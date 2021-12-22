import 'dart:convert';

import 'package:our_schedule/repository/local_storage.dart';

class AuthRepository extends LocalStorage {
  final String KEY = 'AUTH_KEY';

  Future<bool> getAuth() async {
    String jsonStr = await getStoredValue(KEY);
    bool value = jsonStr.isEmpty ? false : true;
    return value;
  }

  Future<bool> setAuth(dynamic value) async {
    bool jsonBool = await setStoredValue(KEY, jsonEncode(value));
    return jsonBool;
  }

  Future<bool> deleteAuth() async {
    bool jsonBool = await deleteStoredValue(KEY);
    return jsonBool;
  }
}
