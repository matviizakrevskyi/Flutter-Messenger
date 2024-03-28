import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/chat.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserChatsDataUseCase {
  final SharedPreferencesDatasource _prefs;

  GetUserChatsDataUseCase(this._prefs);

  Future<List<Chat>> execute() async {
    final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
    return await dbDatasource.getUserChatsData(_prefs.userData?.id ?? '');
  }
}
