import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/usecases/sign_up.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthCubit(this._signUpUseCase) : super(AuthState(false));

  onSignUp() async {
    await _signUpUseCase.execute(emailController.text, passwordController.text);
  }

  checkStatues() {
    final user = FirebaseAuth.instance.currentUser;
    print(user);
  }
}
