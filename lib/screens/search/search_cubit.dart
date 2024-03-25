import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/user.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/usecases/search_users_by_email.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchUsersByEmailUseCase _searchUsersByEmailUseCase;

  final TextEditingController searchController = TextEditingController();

  SearchCubit(this._searchUsersByEmailUseCase) : super(SearchState(false, []));

  onSearchButton() async {
    if (searchController.text.length > 1) {
      emit(state.copyWith(isLoading: true));
      final users = await _searchUsersByEmailUseCase.execute(searchController.text);
      emit(state.copyWith(users: users, isLoading: false));
    }
  }

  onItem(String id) {
    navigatorKey.currentState?.pushReplacementNamed('/chat'); //Todo add argument(id of chat)
  }

  onBackButton() {
    navigatorKey.currentState?.pop();
  }
}
