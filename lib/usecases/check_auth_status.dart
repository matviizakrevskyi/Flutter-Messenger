import 'package:flutter_messenger/datasources/prefs_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckAuthStatusUseCase {
  final SharedPreferencesDatasource _prefsDataSource;

  CheckAuthStatusUseCase(this._prefsDataSource);

  bool execute() {
    final user = _prefsDataSource.userData;
    return user != null;
  }
}
