part of "auth_cubit.dart";

class AuthState {
  final bool isLoading;
  final AuthStatus authStatus;
  final String errorMessege;
  final double animationOpacity;

  AuthState(
    this.isLoading,
    this.authStatus,
    this.errorMessege,
    this.animationOpacity,
  );

  AuthState copyWith(
          {bool? isLoading,
          AuthStatus? authStatus,
          String? errorMessege,
          double? animationOpacity}) =>
      AuthState(isLoading ?? this.isLoading, authStatus ?? this.authStatus,
          errorMessege ?? this.errorMessege, animationOpacity ?? this.animationOpacity);
}
