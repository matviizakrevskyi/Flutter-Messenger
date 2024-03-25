import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/message.dart';
import 'package:flutter_messenger/main.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final TextEditingController textController = TextEditingController();

  ChatCubit() : super(ChatState(false, [])) {
    //Todo
    //Get data of this chat
  }

  onBackButton() {
    navigatorKey.currentState?.pop();
  }
}
