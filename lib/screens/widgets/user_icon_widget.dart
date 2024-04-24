import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class UserIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final String name;
  final Color avatarColor;
  final Size size;

  const UserIcon(
      {super.key,
      required this.onTap,
      required this.name,
      required this.avatarColor,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(size.width / 2)),
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: avatarColor,
          border: Border.all(color: CustomColors.placeholder),
          borderRadius: BorderRadius.all(Radius.circular(size.width / 2)),
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
