import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentChatDataUseCase {
  final GetCurrentChatIdUseCase _getCurrentChatId;
  final SharedPreferencesDatasource _prefs;

  GetCurrentChatDataUseCase(this._prefs, this._getCurrentChatId);

  Future<List<Message>> execute() async {
    String? chatId = _prefs.currentChatId;
    chatId ??= await _getCurrentChatId.execute();

    if (chatId != null) {
      final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
      final chatData = await dbDatasource.getChatData(chatId);

      chatData
          .sort((a, b) => b.time.millisecondsSinceEpoch.compareTo(a.time.millisecondsSinceEpoch));

      return chatData;
    } else {
      return [];
    }
  }
}

@injectable
class GetCurrentChatIdUseCase {
  final SharedPreferencesDatasource _prefs;

  GetCurrentChatIdUseCase(this._prefs);

  Future<String?> execute() async {
    final userData = _prefs.userData;
    final anotherUserId = _prefs.anotherUserId;

    if (userData != null && anotherUserId != null) {
      final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
      final chatId = await dbDatasource.getChatId(userData.id, anotherUserId);
      if (chatId != null) {
        _prefs.saveCurrentChatId(chatId);
      }
      return chatId;
    }

    return null;
  }
}
