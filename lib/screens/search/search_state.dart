part of "search_cubit.dart";

class SearchState {
  final bool isLoading;
  final List<User> users;

  SearchState(this.isLoading, this.users);

  SearchState copyWith({bool? isLoading, List<User>? users}) =>
      SearchState(isLoading ?? this.isLoading, users ?? this.users);
}
