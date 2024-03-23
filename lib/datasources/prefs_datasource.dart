import 'package:flutter_messenger/constants.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesDatasource {
  final SharedPreferences _prefs;

  SharedPreferencesDatasource(this._prefs);

  saveUser(User user) {
    _prefs.setString(userIdKey, user.id);
    _prefs.setString(userEmailKey, user.email);
    _prefs.setString(userNameKey, user.name);
  }

  User? getUserData() {
    final id = _prefs.getString(userIdKey);
    final email = _prefs.getString(userEmailKey);
    final name = _prefs.getString(userNameKey);

    if (id != null && email != null && name != null) {
      return User(id, email, name);
    } else {
      return null;
    }
  }

  clear() {
    _prefs.clear();
  }
}
