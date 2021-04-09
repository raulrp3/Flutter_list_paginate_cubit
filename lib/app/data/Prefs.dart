import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<String> getToken() async =>
      (await _prefs).getString(_TAG_TOKEN) ?? '';
  static setToken(String value) async =>
      (await _prefs).setString(_TAG_TOKEN, value);
}

const _TAG_TOKEN = 'TOKEN';

Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();
