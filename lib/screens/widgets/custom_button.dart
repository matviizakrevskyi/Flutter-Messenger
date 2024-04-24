import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class CustomBigButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool isActive;

  const CustomBigButton(
      {super.key, required this.onTap, required this.child, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isActive ? onTap : null,
      child: Container(
          width: MediaQuery.of(context).size.width - 32,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
                color: isActive ? CustomColors.textPrimaryColor : CustomColors.placeholder,
                width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: child),
    );
  }
}
