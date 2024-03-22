import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/screens/home/home_cubit.dart';
import 'package:flutter_messenger/styling/styling.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.main,
        title: _AppBar(
          onLogOut: () => cubit.logOut(),
          onSearch: () {},
          title: 'Chats',
        ),
      ),
      body: Column(
        children: [
          Divider(
            thickness: 1.5,
            color: Colors.grey.withOpacity(0.3),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Home Screen",
            style: CustomTextStyles.h1,
          )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final String title;
  final VoidCallback onSearch;
  final VoidCallback onLogOut;

  _AppBar({required this.title, required this.onSearch, required this.onLogOut});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: onLogOut,
              child: const Text(
                "Log Out",
                style: CustomTextStyles.errorButton,
              )),
          Row(
            children: [
              Text(
                title,
                style: CustomTextStyles.h4,
              ),
              const SizedBox(
                width: 40,
              )
            ],
          ),
          Ink(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: CustomColors.textPrimaryColor, width: 2)),
            child: InkWell(
              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onTap: onSearch,
              child: const Center(child: Icon(Icons.search)),
            ),
          ),
        ],
      ),
    );
  }
}
