import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/chat.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/userdata/get_user_chats_data_stream.dart';
import 'package:flutter_messenger/usecases/userdata/save_another_user_data.dart';
import 'package:flutter_messenger/usecases/chats/save_current_chat_id.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final SaveCurrentChatIdUseCase _saveCurrentChatIdUseCase;
  final GetUserChatsDataStreamUseCase _getUserChatsDataStreamUseCase;
  final SaveAnotherUserUseCase _saveAnotherUserUseCase;

  late StreamSubscription _subscription;

  HomeCubit(this._saveCurrentChatIdUseCase,
      this._getUserChatsDataStreamUseCase, this._saveAnotherUserUseCase)
      : super(HomeState(true, [], 0)) {
    _subscription = _getUserChatsDataStreamUseCase.execute().listen((data) {
      emit(state.copyWith(chats: [...data], isLoading: false));
    });
  }

  onSearchButton() {
    navigatorKey.currentState?.pushNamed('/search');
  }

  onChat(String id, User user) {
    _saveAnotherUserUseCase.execute(user);
    _saveCurrentChatIdUseCase.execute(id);
    navigatorKey.currentState?.pushNamed('/chat');
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
