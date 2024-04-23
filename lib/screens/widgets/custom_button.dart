import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class CustomBigButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const CustomBigButton({super.key, required this.onTap, required this.child});

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
          child: child),
    );
  }
}
