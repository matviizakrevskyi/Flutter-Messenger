import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/chat.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/get_user_chats_data.dart';
import 'package:flutter_messenger/usecases/log_out.dart';
import 'package:flutter_messenger/usecases/save_current_chat_id.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final LogOutUseCase _logOutUseCase;
  final GetUserChatsDataUseCase _getUserChatsDataUseCase;
  final SaveCurrentChatIdUseCase _saveCurrentChatIdUseCase;

  HomeCubit(this._logOutUseCase, this._getUserChatsDataUseCase, this._saveCurrentChatIdUseCase)
      : super(HomeState(
            true,
            [
              //Chat("", User("", "asdad@asda.com", "User"), Message("", "Hello!", "", DateTime.now()))
            ],
            0)) {
    //Todo
    //get User chats
    //emit chats
    _init();
  }

  _init() async {
    final chatsData = await _getUserChatsDataUseCase.execute();
    emit(state.copyWith(chats: chatsData, isLoading: false));
  }

  logOut() async {
    await _logOutUseCase.execute();

    navigatorKey.currentState?.pushReplacementNamed("/");
  }

  onSearchButton() {
    navigatorKey.currentState?.pushNamed('/search');
  }

  onChat(String id) {
    _saveCurrentChatIdUseCase.execute(id);
    navigatorKey.currentState?.pushNamed('/chat');
  }
}
