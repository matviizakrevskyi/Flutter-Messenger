import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/get_current_chat_data.dart';
import 'package:flutter_messenger/usecases/save_another_user_data.dart';
import 'package:flutter_messenger/usecases/save_current_chat_id.dart';
import 'package:flutter_messenger/usecases/search_users_by_email.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchUsersByEmailUseCase _searchUsersByEmailUseCase;
  final SaveCurrentChatIdUseCase _saveCurrentChatIdUseCase;
  final SaveAnotherUserUseCase _saveAnotherUserUseCase;
  final GetCurrentChatIdUseCase _getCurrentChatIdUseCase;

  final TextEditingController searchController = TextEditingController();

  SearchCubit(this._searchUsersByEmailUseCase, this._getCurrentChatIdUseCase,
      this._saveCurrentChatIdUseCase, this._saveAnotherUserUseCase)
      : super(SearchState(false, []));

  onSearchButton() async {
    if (searchController.text.length > 1) {
      emit(state.copyWith(isLoading: true));
      final users = await _searchUsersByEmailUseCase.execute(searchController.text);
      emit(state.copyWith(users: users, isLoading: false));
    }
  }

  onItem(User item) async {
    _saveAnotherUserUseCase.execute(item);
    final chatId = await _getCurrentChatIdUseCase.execute(item.id);
    _saveCurrentChatIdUseCase.execute(chatId);
    navigatorKey.currentState?.pushReplacementNamed('/chat');
  }

  onBackButton() {
    navigatorKey.currentState?.pop();
  }
}
