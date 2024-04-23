import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataStreamUseCase {
  final SharedPreferencesDatasource _prefs;

  GetUserDataStreamUseCase(this._prefs);

  Stream<User?> execute() {
    final userId = _prefs.userId;

    if (userId != null) {
      final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
      final user = dbDatasource.getUserDataStream(userId);
      return user;
    } else {
      return const Stream.empty();
    }
  }
}