import 'dart:async';

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
  final GetUserDataUseCase _getUserDataUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetCurrentChatDataStreamUseCase _getCurrentChatDataStreamUseCase;

  late StreamSubscription _subscription;
  final TextEditingController textController = TextEditingController();

  User? user;

  ChatCubit(
      this._getUserDataUseCase, this._sendMessageUseCase, this._getCurrentChatDataStreamUseCase)
      : super(ChatState(false, [])) {
    user = _getUserDataUseCase.execute();
    _subscription = _getCurrentChatDataStreamUseCase.execute().listen((data) {
      emit(state.copyWith(items: data));
    });
  }

  onSendMessege() async {
    await _sendMessageUseCase.execute(textController.text);
    textController.text = "";
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
