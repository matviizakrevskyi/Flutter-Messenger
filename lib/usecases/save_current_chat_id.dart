import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveCurrentChatIdUseCase {
  final SharedPreferencesDatasource _prefs;

  SaveCurrentChatIdUseCase(this._prefs);

  execute(String id) async {
    _prefs.saveCurrentChatId(id);
  }
}
