part of "auth_cubit.dart";

class AuthState {
  final bool isLoading;
  final AuthStatus authStatus;
  final String errorMessege;

  AuthState(
    this.isLoading,
    this.authStatus,
    this.errorMessege,
  );

  AuthState copyWith({bool? isLoading, AuthStatus? authStatus, String? errorMessege}) => AuthState(
      isLoading ?? this.isLoading,
      authStatus ?? this.authStatus,
      errorMessege ?? this.errorMessege);
}
