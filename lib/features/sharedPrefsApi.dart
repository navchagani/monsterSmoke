import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsApi {
  static final SharedPrefsApi instance = SharedPrefsApi._internal();

  factory SharedPrefsApi() {
    return instance;
  }

  SharedPrefsApi._internal();

  Future<void> saveToShared({required String value, String? key}) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(key ?? 'key', value);
  }

  Future<String?> getFromShared({String? key}) async {
    final instance = await SharedPreferences.getInstance();
    final data = instance.getString(key ?? 'key');
    return data;
  }
}
