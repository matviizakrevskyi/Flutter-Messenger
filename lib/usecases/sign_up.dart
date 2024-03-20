import 'package:flutter_messenger/datasources/auth_datasource.dart';

class SignUpUseCase {
  SignUpUseCase();

  execute(String email, String password) async {
    AuthDatasource authDatasource = AuthDatasource();
    await authDatasource.signUp(email, password);
  }
}
