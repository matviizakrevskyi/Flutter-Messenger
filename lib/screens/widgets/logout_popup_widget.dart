import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class LogOutPopupWidget extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const LogOutPopupWidget({super.key, required this.onCancel, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      content: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Are you sure you want to log out of your account?",
          textAlign: TextAlign.center,
          style: CustomTextStyles.h2,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        InkWell(
          onTap: onCancel,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              "Cancel",
              style: CustomTextStyles.main,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: onConfirm,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              "Log Out",
              style: CustomTextStyles.main.copyWith(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
