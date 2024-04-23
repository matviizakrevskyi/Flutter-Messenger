import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/userdata/get_another_user_data.dart';
import 'package:flutter_messenger/usecases/chats/get_current_chat_data.dart';
import 'package:flutter_messenger/usecases/userdata/get_user_data.dart';
import 'package:flutter_messenger/usecases/chats/send_message.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetCurrentChatDataStreamUseCase _getCurrentChatDataStreamUseCase;
  final GetAnotherUserDataUseCase _getAnotherUserDataUseCase;

  late StreamSubscription _subscription;
  final TextEditingController textController = TextEditingController();

  User? user;
  User? anotherUser;

  ChatCubit(this._getUserDataUseCase, this._sendMessageUseCase,
      this._getCurrentChatDataStreamUseCase, this._getAnotherUserDataUseCase)
      : super(ChatState(false, [])) {
    user = _getUserDataUseCase.execute();
    anotherUser = _getAnotherUserDataUseCase.execute();
    _subscription = _getCurrentChatDataStreamUseCase.execute().listen((data) {
      emit(state.copyWith(items: data));
    });
  }

  onSendMessege() async {
    if (textController.text.isNotEmpty) {
      await _sendMessageUseCase.execute(textController.text);
      textController.text = "";
    }
  }

  onBackButton() {
    navigatorKey.currentState?.pop();
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
