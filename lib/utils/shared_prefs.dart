import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePrefs {
  static late SharedPreferences _prefs;
  static const String _level = "level";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int? getLevel() => _prefs.getInt(_level) ?? 1;

  static Future setLevel() async {
    await _prefs.setInt(_level, getLevel()! + 1);
  }

  static Future resetLevel() async {
    await _prefs.setInt(_level, 1);
  }
}
