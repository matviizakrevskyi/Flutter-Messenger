import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";
import "package:shared_preferences/shared_preferences.dart";

import "injection.config.dart";

final getIt = GetIt.instance;

@InjectableInit()
Future configureDependencies() async {
  await _initSharedPrefs();

  getIt.init();
}

Future _initSharedPrefs() async {
  if (!getIt.isRegistered<SharedPreferences>()) {
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton(prefs);
  }
}
