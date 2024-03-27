import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentChatDataStreamUseCase {
  final SharedPreferencesDatasource _prefs;

  GetCurrentChatDataStreamUseCase(this._prefs);

  Stream<List<Message>> execute() {
    String? chatId = _prefs.currentChatId;

    if (chatId != null) {
      if (chatId.isEmpty) {
        chatId = "${_prefs.userData?.id ?? ''}-${_prefs.anotherUserId ?? ''}";
      }
      final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
      return dbDatasource.getChatDataStream(chatId).map((data) {
        data.sort((a, b) => b.time.millisecondsSinceEpoch.compareTo(a.time.millisecondsSinceEpoch));
        return data;
      });
    } else {
      return const Stream.empty();
    }
  }
}

@injectable
class GetCurrentChatIdUseCase {
  final SharedPreferencesDatasource _prefs;

  GetCurrentChatIdUseCase(this._prefs);

  Future<String> execute(String anotherUserId) async {
    final userData = _prefs.userData;

    if (userData != null) {
      final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
      final chatId = await dbDatasource.getChatId(userData.id, anotherUserId);
      return chatId ?? '';
    }

    return '';
  }
}
