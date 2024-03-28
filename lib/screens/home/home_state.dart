part of "home_cubit.dart";

class HomeState {
  final bool isLoading;
  final List<Chat> chats;
  final int itemsCount;

  HomeState(this.isLoading, this.chats, this.itemsCount);

  HomeState copyWith({bool? isLoading, List<Chat>? chats, int? itemsCount}) =>
      HomeState(isLoading ?? this.isLoading, chats ?? this.chats, itemsCount ?? this.itemsCount);
}
