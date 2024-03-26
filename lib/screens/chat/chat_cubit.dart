import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/get_current_chat_data.dart';
import 'package:flutter_messenger/usecases/get_user_data.dart';
import 'package:flutter_messenger/usecases/send_message.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final GetCurrentChatDataUseCase _getCurrentChatDataUseCase;
  final GetUserDataUseCase _getUserDataUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  final TextEditingController textController = TextEditingController();

  User? user;

  ChatCubit(this._getCurrentChatDataUseCase, this._getUserDataUseCase, this._sendMessageUseCase)
      : super(ChatState(false, [])) {
    _init();
  }

  _init() async {
    user = _getUserDataUseCase.execute();
    final chatData = await _getCurrentChatDataUseCase.execute();
    emit(state.copyWith(items: chatData));
  }

  onSendMessege() async {
    await _sendMessageUseCase.execute(textController.text);
    textController.text = "";
  }

  onBackButton() {
    navigatorKey.currentState?.pop();
  }
}
