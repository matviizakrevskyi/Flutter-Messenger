import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUsersByEmailUseCase {
  final SharedPreferencesDatasource _prefs;

  SearchUsersByEmailUseCase(this._prefs);

  Future<List<User>> execute(String searchText) async {
    final userId = _prefs.userId;
    if (userId != null) {
      final RealtimeDatabaseDatasource authDatasource = RealtimeDatabaseDatasource();
      final users = await authDatasource.searchUsersByEmail(searchText, userId);
      return users;
    } else {
      return [];
    }
  }
}
