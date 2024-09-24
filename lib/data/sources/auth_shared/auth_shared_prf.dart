import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrf{
 static _getAuthSharedPrf(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     return prefs.getString('saved_text') ?? 'No data saved';
  }

  // Save text to shared preferences
  static _setAuthSharedPrf(String key,String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('saved_text', value);
  }
}