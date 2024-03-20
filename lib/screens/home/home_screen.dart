import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/home/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
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
