import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/chat.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/log_out.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final LogOutUseCase _logOutUseCase;

  HomeCubit(this._logOutUseCase)
      : super(HomeState(false, [
          Chat("", User("", "asdad@asda.com", "User"), Message("Hello!", "", DateTime.now()))
        ])) {
    //Todo
    //get User chats
    //emit chats
  }

  logOut() async {
    await _logOutUseCase.execute();

    navigatorKey.currentState?.pushReplacementNamed("/");
  }

  onSearchButton() {
    navigatorKey.currentState?.pushNamed('/search');
  }

  onChat(String id) {
    navigatorKey.currentState?.pushNamed('/chat'); //Todo add argument(id of chat)
  }
}
