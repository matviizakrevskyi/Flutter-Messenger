import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveAnotherUserUseCase {
  final SharedPreferencesDatasource _prefs;

  SaveAnotherUserUseCase(this._prefs);

  execute(User user) async {
    _prefs.saveAnotherUser(user);
  }
}
