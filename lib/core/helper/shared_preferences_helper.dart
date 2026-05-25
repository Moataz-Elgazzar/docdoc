import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();

  static setData(String key, dynamic value) async {
    final pref = getIt<SharedPreferences>();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    if (value is String) {
      await pref.setString(key, value);
    } else if (value is int) {
      await pref.setInt(key, value);
    } else if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    } else if (value is List<String>) {
      await pref.setStringList(key, value);
    }
  }

  static T? getData<T>(String key) {
    final pref = getIt<SharedPreferences>();
    debugPrint("SharedPrefHelper : getData with key : $key");
    return pref.get(key) as T?;
  }

  static Future<bool> removeData(String key) async {
    final pref = getIt<SharedPreferences>();
    debugPrint("SharedPrefHelper : removeData with key : $key");
    return await pref.remove(key);
  }

  static Future<bool> clearData() async {
    final pref = getIt<SharedPreferences>();
    debugPrint("SharedPrefHelper : clearData");
    return await pref.clear();
  }

   /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static  getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}

class SharedPrefKeys {
  static const String kUserToken = 'userToken';
}
