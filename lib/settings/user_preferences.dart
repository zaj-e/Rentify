import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _singleton = UserPreferences._internal();
  factory UserPreferences() {
    return _singleton;
  }

  UserPreferences._internal();

  Future<bool> isAuthenticated() async {
    return (await SharedPreferences.getInstance())
            .getBool(UserPreferenceKey.isAuthenticated.toString()) ??
        false;
  }
}

enum UserPreferenceKey {
  isAuthenticated,
}
