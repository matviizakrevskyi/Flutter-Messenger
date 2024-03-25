part of "chat_cubit.dart";

class ChatState {
  final bool isLoading;
  final List<Message> items;

  ChatState(this.isLoading, this.items);

  ChatState copyWith({bool? isLoading, List<Message>? items}) =>
      ChatState(isLoading ?? this.isLoading, items ?? this.items);
}
