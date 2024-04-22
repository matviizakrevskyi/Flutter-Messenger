import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class UserIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String name;

  UserIcon({required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          border: Border.all(color: CustomColors.placeholder),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            name,
            style: CustomTextStyles.h4,
          ),
        ),
      ),
    );
  }
}
