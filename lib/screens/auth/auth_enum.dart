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
