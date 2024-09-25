import 'package:shared_preferences/shared_preferences.dart';

class HandleSharedPrf {
  // Get SharedPreferences instance
  static Future<SharedPreferences> getObj() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  // Get the value associated with the key
  static Future<dynamic> getSharedPrf(String key) async {
    SharedPreferences prefs = await getObj();
    return prefs.getString(key) ?? false;
  }

  // Save text to shared preferences
  static Future<bool> setSharedPrf(String key, String value) async {
    SharedPreferences prefs = await getObj();
    return prefs.setString(key, value);
  }

  // Check if the key exists in shared preferences
  static Future<bool> checkSharedPrf(String key) async {
    SharedPreferences prefs = await getObj();
    return prefs.containsKey(key);
  }

  // Remove the shared preference for a given key
  static Future<bool> removeSharedPrf(String key) async {
    SharedPreferences prefs = await getObj();
    if (await checkSharedPrf(key)) {
      await prefs.remove(key);
      return true;
    } else {
      return false;
    }
  }
}