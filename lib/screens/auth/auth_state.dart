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

enum AuthStatus {
  signUp,
  signIn;

  String get stringValue {
    switch (this) {
      case AuthStatus.signUp:
        return "Sign Up";
      case AuthStatus.signIn:
        return "Sign In";
    }
  }

  String get stringValueForAuthButton {
    switch (this) {
      case AuthStatus.signUp:
        return "Create account";
      case AuthStatus.signIn:
        return "Sign in to your account";
    }
  }

  String get stringValueForChangeButton {
    switch (this) {
      case AuthStatus.signUp:
        return "Do you already have an account? Sign In";
      case AuthStatus.signIn:
        return "Don't have an account? Sign Up";
    }
  }
}