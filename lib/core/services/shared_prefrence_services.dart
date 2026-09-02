import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Object? get(String key) {
    return prefs.get(key);
  }

  Future<void> set(String key, dynamic value) async {
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else {
      throw Exception('Unsupported type: ${value.runtimeType}');
    }
  }

  Future<void> delete(String key) async {
    await prefs.remove(key);
  }
}
