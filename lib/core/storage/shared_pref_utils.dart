import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  //Todo!: call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static bool getIsUserLoggedIn() {
    return _prefsInstance?.getBool("IsUserLoggedIn") ?? false;
  }

  static Future<bool> setIsUserLoggedIn(bool value) async {
    var prefs = await _instance;
    return prefs.setBool("IsUserLoggedIn", value);
  }
}
