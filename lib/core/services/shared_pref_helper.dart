import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // Private constructor to prevent instantiation.
  SharedPrefHelper._();

  static late SharedPreferences _sharedPreferences;

  //! Initialize SharedPreferences instance.
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Save data in local storage using a key.
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await _sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await _sharedPreferences.setDouble(key, value);
    }
    return false; // Return false if the type is not supported.
  }

  //! Retrieve data from local storage using a key.
  dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }

  //! Remove data associated with a specific key.
  Future<bool> removeData({required String key}) async {
    return await _sharedPreferences.remove(key);
  }

  //! Check if local storage contains a specific key.
  Future<bool> containsKey({required String key}) async {
    return _sharedPreferences.containsKey(key);
  }

  //! Clear all data in local storage.
  Future<bool> clearData() async {
    return await _sharedPreferences.clear();
  }

  //! Save data in local storage using a key (alternative method).
  Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    return await saveData(key: key, value: value);
  }

  /// Gets a bool value from SharedPreferences with the given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper: getBool with key: $key');
    return _sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with the given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: getDouble with key: $key');
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with the given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: getInt with key: $key');
    return _sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with the given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: getString with key: $key');
    return _sharedPreferences.getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage: setSecuredString with key: $key and value: $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with the given [key].
  static Future<String> getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage: getSecuredString with key: $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
