import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/auth/auth_cubit.dart';
import 'package:flutter_messenger/screens/auth/auth_enum.dart';
import 'package:flutter_messenger/screens/widgets/custom_text_field.dart';
import 'package:flutter_messenger/styling/styling.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: CustomColors.main,
            title: const Center(
              child: Text(
                "Messenger",
                style: CustomTextStyles.h2,
              ),
            ),
          ),
          body: AnimatedOpacity(
            opacity: state.animationOpacity,
            duration: Duration(milliseconds: state.animationOpacity == 0 ? 0 : 800),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(
                    thickness: 1.5,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        (state.authStatus == AuthStatus.signIn ? 0.15 : 0.07),
                  ),
                  Text(
                    state.authStatus.stringValue,
                    style: CustomTextStyles.h1,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  if (state.authStatus == AuthStatus.signUp)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CustomTextField(
                        hintText: "Name",
                        controller: cubit.nameController,
                      ),
                    ),
                  CustomTextField(
                    hintText: "Email",
                    controller: cubit.emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    hintText: "Password",
                    controller: cubit.passwordController,
                  ),
                  if (state.authStatus == AuthStatus.signUp)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: CustomTextField(
                        hintText: "Repeat password",
                        controller: cubit.repeatedPasswordController,
                      ),
                    ),
                  if (state.errorMessege.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        state.errorMessege,
                        style: CustomTextStyles.errorMessege,
                      ),
                    ),
                  const SizedBox(
                    height: 32,
                  ),
                  Ink(
                    width: 260,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: CustomColors.textPrimaryColor,
                        borderRadius: const BorderRadius.all(Radius.circular(20))),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onTap: () {
                        cubit.onNextButton();
                      },
                      child: Center(
                          child: Text(
                        state.authStatus.stringValueForAuthButton,
                        style: CustomTextStyles.mainWhite,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextButton(
                      onPressed: () => cubit.changeAuthStatus(),
                      child: Text(
                        state.authStatus.stringValueForChangeButton,
                        style: CustomTextStyles.main,
                      )),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
