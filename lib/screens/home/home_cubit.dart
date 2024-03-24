import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/log_out.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final LogOutUseCase _logOutUseCase;

  HomeCubit(this._logOutUseCase) : super(HomeState(false));

  logOut() async {
    await _logOutUseCase.execute();

    navigatorKey.currentState?.pushReplacementNamed("/");
  }

  onSearchButton() {
    navigatorKey.currentState?.pushNamed('/search');
  }
}
