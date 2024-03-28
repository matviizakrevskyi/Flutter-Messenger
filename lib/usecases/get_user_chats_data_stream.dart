import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/chat.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserChatsDataStreamUseCase {
  final SharedPreferencesDatasource _prefs;

  GetUserChatsDataStreamUseCase(this._prefs);

  Stream<List<Chat>> execute() {
    final userId = _prefs.userId;

    if (userId != null) {
      final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
      return dbDatasource.getUserChatsDataStream(userId).map((data) {
        data.sort((a, b) => b.lastMessage.time.millisecondsSinceEpoch
            .compareTo(a.lastMessage.time.millisecondsSinceEpoch));

        return data;
      });
    } else {
      return const Stream.empty();
    }
  }
}
