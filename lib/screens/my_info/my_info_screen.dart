import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/my_info/my_info_cubit.dart';
import 'package:flutter_messenger/screens/my_info/my_info_state.dart';
import 'package:flutter_messenger/styling/styling.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyInfoCubit>();
    return BlocBuilder<MyInfoCubit, MyInfoState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.5),
                      border: Border.all(color: CustomColors.placeholder),
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Center(
                        child: Text(
                      state.user?.name[0] ?? "",
                      style: CustomTextStyles.h1.copyWith(fontSize: 42),
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                state.user?.name ?? '',
                style: CustomTextStyles.h1,
              ),
              Text(
                state.user?.email ?? "",
                style: CustomTextStyles.main
                    .copyWith(color: CustomColors.textPrimaryColor.withOpacity(0.8)),
              ),
              const SizedBox(
                height: 48,
              ),
              CustomBigButton(
                onTap: () {cubit.changeProfileData();},
                name: "Change profile data",
              ),
              const SizedBox(
                height: 24,
              ),
              CustomBigButton(
                onTap: () {},
                name: "Delete account",
                customTextStyle: CustomTextStyles.main.copyWith(color: Colors.red),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomBigButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final TextStyle? customTextStyle;

  const CustomBigButton({super.key, required this.name, required this.onTap, this.customTextStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.textPrimaryColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Text(
              name,
              style: customTextStyle ?? CustomTextStyles.main,
            )
          ],
        ),
      ),
    );
  }
}
