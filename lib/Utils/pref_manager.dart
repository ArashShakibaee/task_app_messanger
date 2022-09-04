import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static const String username = 'username';
  static const String emailAddress = 'emailAddress';

  static Future<bool> setUsername(String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(username, value);
  }

  static Future<String> getUsername() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(username) ?? "nothing";
  }

  static Future<bool> setEmailAddress(String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(emailAddress, value);
  }

  static Future<String> getEmailAddress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailAddress) ?? "";
  }
}
