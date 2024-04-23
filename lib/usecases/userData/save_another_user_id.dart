import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveAnotherUserIdUseCase {
  final SharedPreferencesDatasource _prefs;

  SaveAnotherUserIdUseCase(this._prefs);

  execute(String id) async {
    _prefs.saveAnotherUserId(id);
  }
}
