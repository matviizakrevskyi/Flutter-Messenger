import 'package:flutter_messenger/datasources/auth_datasource.dart';
import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  final SharedPreferencesDatasource _prefs;

  SignUpUseCase(this._prefs);

  Future<void> execute(String email, String password, String name) async {
    final AuthDatasource authDatasource = AuthDatasource();
    final id = await authDatasource.signUp(email, password, name);
    if (id != null) {
      _prefs.saveUser(User(id, email, name));
    }
  }
}
