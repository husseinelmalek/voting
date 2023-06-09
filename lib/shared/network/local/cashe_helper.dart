import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;

  static int() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }
    return await sharedPreferences.setInt(key, value);
  }

  static Future<bool> removeUser({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }
}
