import 'package:flutter_messenger/datasources/auth_datasource.dart';
import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  final SharedPreferencesDatasource _prefs;

  SignInUseCase(this._prefs);

  Future<void> execute(String email, String password) async {
    final AuthDatasource authDatasource = AuthDatasource();
    final id = await authDatasource.signIn(email, password);
    if (id != null) {
      final userData = await authDatasource.getUserData(id);
      if (userData != null) {
        _prefs.saveUser(userData);
      }
    }
  }
}
