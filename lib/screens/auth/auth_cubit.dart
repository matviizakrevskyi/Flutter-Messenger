import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/domain/str_email_ext.dart';
import 'package:flutter_messenger/main.dart';
import 'package:flutter_messenger/screens/auth/auth_enum.dart';
import 'package:flutter_messenger/usecases/sign_in.dart';
import 'package:flutter_messenger/usecases/sign_up.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatedPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  AuthCubit(this._signUpUseCase, this._signInUseCase)
      : super(AuthState(false, AuthStatus.signIn, "", 0)) {
    emit(state.copyWith(animationOpacity: 1));
  }

  onNextButton() async {
    if (emailController.text.isEmpty || !emailController.text.isEmail) {
      emit(state.copyWith(errorMessege: "The email or password is not correct"));
      return;
    }

    try {
      switch (state.authStatus) {
        case AuthStatus.signUp:
          if (nameController.text.isEmpty) {
            emit(state.copyWith(errorMessege: "Enter your name"));
            return;
          }
          if (passwordController.text != repeatedPasswordController.text) {
            emit(state.copyWith(errorMessege: "Passwords do not match"));
            return;
          }
          await _signUpUseCase.execute(
              emailController.text, passwordController.text, nameController.text);
          navigatorKey.currentState?.pushReplacementNamed("/home");
        case AuthStatus.signIn:
          await _signInUseCase.execute(emailController.text, passwordController.text);
          navigatorKey.currentState?.pushReplacementNamed("/home");
      }
    } catch (e) {
      emit(state.copyWith(errorMessege: "The email or password is not correct"));
    }
  }

  changeAuthStatus() async {
    emit(state.copyWith(animationOpacity: 0));

    Timer(const Duration(milliseconds: 10), () {
      emit(state.copyWith(
          authStatus: state.authStatus == AuthStatus.signIn ? AuthStatus.signUp : AuthStatus.signIn,
          errorMessege: "",
          animationOpacity: 1));
    });
  }

  //Todo remove later
  checkStatues() {
    final user = FirebaseAuth.instance.currentUser;
    print(user);
  }
}
