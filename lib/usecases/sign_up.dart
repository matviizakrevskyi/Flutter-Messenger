import 'package:flutter_messenger/datasources/auth_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  SignUpUseCase();

  Future<void> execute(String email, String password, String name) async {
    AuthDatasource authDatasource = AuthDatasource();
    await authDatasource.signUp(email, password, name);
  }
}