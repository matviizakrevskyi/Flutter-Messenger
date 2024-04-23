import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger/di/injection.dart';
import 'package:flutter_messenger/screens/home/home_cubit.dart';
import 'package:flutter_messenger/screens/home/home_screen.dart';
import 'package:flutter_messenger/screens/home_cover/home_cover_cubit.dart';
import 'package:flutter_messenger/screens/home_cover/home_cover_state.dart';
import 'package:flutter_messenger/screens/my_info/my_info_cubit.dart';
import 'package:flutter_messenger/screens/my_info/my_info_screen.dart';
import 'package:flutter_messenger/styling/styling.dart';

class HomeCoverScreen extends StatelessWidget {
  const HomeCoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCoverCubit>();
    return BlocBuilder<HomeCoverCubit, HomeCoverState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: _BottomNavigationBar(onHome: () {
            cubit.onHome();
          }, onInfo: () {
            cubit.onInfo();
          }),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: state.stage == HomeStage.home
                ? BlocProvider<HomeCubit>(
                    create: (BuildContext context) => getIt.get(),
                    child: const HomeScreen(),
                  )
                : BlocProvider<MyInfoCubit>(
                    create: (BuildContext context) => getIt.get(),
                    child: const MyInfoScreen(),
                  ),
          ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onInfo;

  const _BottomNavigationBar({required this.onHome, required this.onInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(
          height: 1,
          thickness: 1.5,
          color: Colors.grey.withOpacity(0.3),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomBarItem(onTap: onHome, name: "Chats", icon: Icons.chat),
            _BottomBarItem(onTap: onInfo, name: "My Info", icon: Icons.person)
          ],
        ),
      ],
    );
  }
}

class _BottomBarItem extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;

  const _BottomBarItem({required this.onTap, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: onTap,
        child: SizedBox(
          width: 50,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: CustomColors.textPrimaryColor,
              ),
              Text(
                name,
                style: CustomTextStyles.textSecondary3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
