part of "home_cubit.dart";

class HomeState {
  final bool isLoading;

  HomeState(this.isLoading);

  HomeState copyWith({bool? isLoading}) => HomeState(isLoading ?? this.isLoading);
}
