import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  border: Border.all(color: CustomColors.placeholder),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: const Center(
                    child: Text(
                  "M",
                  style: CustomTextStyles.h2,
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
