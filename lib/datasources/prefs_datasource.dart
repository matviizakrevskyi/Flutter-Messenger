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

  User? get userData {
    final id = _prefs.getString(userIdKey);
    final email = _prefs.getString(userEmailKey);
    final name = _prefs.getString(userNameKey);

    if (id != null && email != null && name != null) {
      return User(id, email, name);
    } else {
      return null;
    }
  }

  saveAnotherUser(User user) {
    _prefs.setString(anotherUserIdKey, user.id);
    _prefs.setString(anotherUserEmailKey, user.email);
    _prefs.setString(anotherUserNameKey, user.name);
  }

  User? get anotherUserData {
    final id = _prefs.getString(anotherUserIdKey);
    final email = _prefs.getString(anotherUserEmailKey);
    final name = _prefs.getString(anotherUserNameKey);

    if (id != null && email != null && name != null) {
      return User(id, email, name);
    } else {
      return null;
    }
  }

  saveAnotherUserId(String id) {
    _prefs.setString(anotherUserIdKey, id);
  }

  String? get anotherUserId {
    return _prefs.getString(anotherUserIdKey);
  }

  saveCurrentChatId(String id) {
    _prefs.setString(currentChatIdKey, id);
  }

  String? get currentChatId {
    return _prefs.getString(currentChatIdKey);
  }

  clear() {
    _prefs.clear();
  }
}
