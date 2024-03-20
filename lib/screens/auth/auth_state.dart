part of "auth_cubit.dart";

class AuthState {
  final bool isLoading;

  AuthState(this.isLoading);

  AuthState copyWith({bool? isLoading}) => AuthState(isLoading ?? this.isLoading);
}