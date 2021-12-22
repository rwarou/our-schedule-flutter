import 'dart:convert';

import 'package:our_schedule/repository/local_storage.dart';

class AuthRepository extends LocalStorage {
  final String KEY = 'AUTH_KEY';

  Future<bool> getAuth() async {
    String jsonStr = await getStoredValue(KEY);
    bool value = jsonStr.isEmpty ? false : true;
    print('getAuth : $value');
    return value;
  }

  Future<bool> setAuth(String value) async {
    Map<String, dynamic> data = jsonDecode(value);
    bool jsonBool = false;
    if (data['id'] == 'qwer' && data['pw'] == 'asdf') {
      jsonBool = await setStoredValue(KEY, jsonEncode(value));
    }

    print('setAuth : $jsonBool');
    return jsonBool;
  }

  Future<bool> deleteAuth() async {
    bool jsonBool = await deleteStoredValue(KEY);
    print('deleteAuth : $jsonBool');
    return jsonBool;
  }
}
