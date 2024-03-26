import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase {
  final SharedPreferencesDatasource _prefs;

  GetUserDataUseCase(this._prefs);

  User? execute() {
    final user = _prefs.userData;
    return user;
  }
}
