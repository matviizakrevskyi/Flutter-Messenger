part of "home_cubit.dart";

class HomeState {
  final bool isLoading;
  final List<Chat> chats;

  HomeState(this.isLoading, this.chats);

  HomeState copyWith({bool? isLoading, List<Chat>? chats}) =>
      HomeState(isLoading ?? this.isLoading, chats ?? this.chats);
}
