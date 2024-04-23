import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/datasources/realtime_db_datasource.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@injectable
class SendMessageUseCase {
  final SharedPreferencesDatasource _prefs;

  SendMessageUseCase(this._prefs);

  Future<void> execute(String text) async {
    String chatId = _prefs.currentChatId ?? "";
    const uuid = Uuid();
    final message = Message(uuid.v4(), text, _prefs.userData?.id ?? '', DateTime.now());
    final RealtimeDatabaseDatasource dbDatasource = RealtimeDatabaseDatasource();
    if (chatId.isEmpty) {
      chatId = "${_prefs.userData?.id}-${_prefs.anotherUserId}";
    }
    await dbDatasource.sendMessage(chatId, message);
    final anotherUser = _prefs.anotherUserData;
    final user = _prefs.userData;
    if (user != null && anotherUser != null) {
      await dbDatasource.updateUserChatsData(chatId, message, [user, anotherUser]);
    }
  }
}
