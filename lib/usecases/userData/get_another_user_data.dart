import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAnotherUserDataUseCase {
  final SharedPreferencesDatasource _prefs;

  GetAnotherUserDataUseCase(this._prefs);

  User? execute() {
    final user = _prefs.anotherUserData;
    return user;
  }
}
