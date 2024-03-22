import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Home Screen",
            style: CustomTextStyles.h1,
          )
        ],
      )),
    );
  }
}
