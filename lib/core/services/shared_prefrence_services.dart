import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late final SharedPreferences prefs;
  final String _seenKey = "seen_key";
  final String _isLoggedInKey = "logged_in";
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setIsOnboardingSeen(bool value) async =>
      await prefs.setBool(_seenKey, value);
  bool? getIsOnboardingSeen() => prefs.getBool(_seenKey);
  Future<void> setIsLoggedIn(bool value) async =>
      await prefs.setBool(_isLoggedInKey, value);
  bool? getIsLoggedIn() => prefs.getBool(_isLoggedInKey);
}
