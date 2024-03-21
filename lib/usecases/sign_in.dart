import 'package:flutter_messenger/datasources/auth_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  SignInUseCase();

  Future<void> execute(String email, String password) async {
    AuthDatasource authDatasource = AuthDatasource();
    await authDatasource.signIn(email, password);
  }
}