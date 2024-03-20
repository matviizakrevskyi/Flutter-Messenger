import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/auth/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          TextField(
            controller: cubit.emailController,
          ),
          TextField(
            controller: cubit.passwordController,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  cubit.onSignUp();
                },
                child: const Text("SignUp"),
              ),
              TextButton(
                onPressed: () {
                  cubit.checkStatues();
                },
                child: const Text("Check"),
              )
            ],
          )
        ],
      )),
    );
  }
}
