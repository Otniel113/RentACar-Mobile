import 'package:shared_preferences/shared_preferences.dart';

class SecureProfile {
  final SharedPreferences storage;

  bool isLoggedIn;
  int? userId;
  String? apiKey;

  SecureProfile(
      {required this.storage,
      required this.isLoggedIn,
      this.userId,
      this.apiKey});

  static Future<SecureProfile> getStorage() async {
    var storage = await SharedPreferences.getInstance();
    var userId = storage.getInt("user_id");
    var apiKey = storage.getString("api_key");

    bool loggedIn = false;

    if ((userId == null || userId == -1) || (apiKey == null || apiKey == "")) {
      await storage.setInt("user_id", -1);
      await storage.setString("api_key", "");
    } else {
      loggedIn = true;
    }

    return SecureProfile(
        storage: storage, isLoggedIn: loggedIn, apiKey: apiKey, userId: userId);
  }

  bool getLoggedInStatus() {
    return isLoggedIn;
  }

  String? getApiKey() {
    return apiKey;
  }

  int? getUserId() {
    return userId;
  }

  Future<void> setLoggedIn(int userId, String apiKey) async {
    await storage.setInt("user_id", userId);
    await storage.setString("api_key", apiKey);
    isLoggedIn = true;
  }

  Future<void> setLoggedOut() async {
    await storage.remove("api_key");
    await storage.remove("user_id");
    isLoggedIn = false;
  }
}
