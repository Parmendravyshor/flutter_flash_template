// File: shared_preferences_service.dart
// Purpose: Manages data stored in Shared Preferences, such as user settings or flags.
// Content: Contains methods to store and retrieve primitive data types like String, int, bool, etc.

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
