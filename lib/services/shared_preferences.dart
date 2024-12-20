import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  final String tokenKey = "token";
  final String refreshTokenKey = "refreshToken";

  final String profileKey = "profile";
  final String firstLoginKey = "first_login";
  final String isDark = "isDark";
  final String user = "user";
  final String screen = "screen";



  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  SharedPreferenceManager._();

  static final SharedPreferenceManager _singleton = SharedPreferenceManager._();

  static SharedPreferenceManager get sharedInstance => _singleton;

  // helper method to store token
  storeToken(String token) => instance.setString(tokenKey, token);
  storeRefreshToken(String token) => instance.setString(refreshTokenKey, token);


  storeScreenName(String screen1) => instance.setString(screen, screen1);


  storeDarkTheme(bool isDarkValue) => instance.setBool(isDark, isDarkValue);

  storeUser(String userData) => instance.setString(user, userData);


  //helper method to get token
  String? getToken() => instance.getString(tokenKey);
  String? getRefreshToken() => instance.getString(refreshTokenKey);


  String? getUserData() => instance.getString(user);

  String? getScreen() => instance.getString(screen);


  bool hasToken() => instance.getString(tokenKey) != null;

  bool isDarkTheme()=> instance.getBool(isDark) ?? false;

  //helper method to store any string
  storeString(String key, String value) => instance.setString(key, value);

  //helper method to get any string
  getString(String key) => instance.getString(key);

  //helper method to store any integer
  storeInt(String key, int value) => instance.setInt(key, value);

  //helper method to get any integer
  getInteger(String key) => instance.getInt(key);

  //helper method to store any bool
  storeBool(String key, bool value) => instance.setBool(key, value);

  



  //helper method to get any bool
  getBool(String key) => instance.getBool(key);

  bool hasUser() => instance.getString(profileKey) != null;

  firstLogin() => instance.setBool(firstLoginKey, false);

  isFirstLogin() => instance.getBool(firstLoginKey) ?? true;

  clearKey(String key) => instance.remove(key);

  clearPref() => instance.clear();

  clearUser() => instance.remove(user);

  clearToken() => instance.remove(tokenKey);

  clearScreenName() => instance.remove(screen);
}
