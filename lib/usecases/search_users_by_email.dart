import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUsersByEmailUseCase {
  SearchUsersByEmailUseCase();

  Future<List<User>> execute(String searchText) async {
    final RealtimeDatabaseDatasource authDatasource = RealtimeDatabaseDatasource();
    final users = await authDatasource.searchUsersByEmail(searchText);
    return users;
  }
}
