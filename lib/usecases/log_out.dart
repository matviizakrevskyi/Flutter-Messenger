import 'package:flutter_messenger/datasources/auth_datasource.dart';
import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogOutUseCase {
  final SharedPreferencesDatasource _prefs;

  LogOutUseCase(this._prefs);

  Future<void> execute() async {
    final AuthDatasource authDatasource = AuthDatasource();
    await authDatasource.logOut();
    _prefs.clear();
  }
}
