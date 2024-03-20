import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/usecases/sign_up.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  HomeCubit() : super(HomeState(false));

  onSignUp() async {
    SignUpUseCase signUpUseCase = SignUpUseCase();
    await signUpUseCase.execute(emailController.text, passwordController.text);
  }

  checkStatues() {
    final user = FirebaseAuth.instance.currentUser;
    print(user);
  }
}
