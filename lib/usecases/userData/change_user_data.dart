import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangeUserDataUseCase {
  final SharedPreferencesDatasource _prefs;

  ChangeUserDataUseCase(this._prefs);

  Future<void> execute(User user) async {
    final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
    await dbDatasource.changeUserData(user);
    _prefs.saveUser(user);
  }
}
