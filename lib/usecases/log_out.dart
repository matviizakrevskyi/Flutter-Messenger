import 'package:flutter_messenger/datasources/auth_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogOutUseCase {
  LogOutUseCase();

  Future<void> execute() async {
    AuthDatasource authDatasource = AuthDatasource();
    await authDatasource.logOut();
  }
}