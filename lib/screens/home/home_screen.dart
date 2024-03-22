import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.main,
        title: _AppBar(
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
          SizedBox(
            height: 100,
          ),
          Text(
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

  _AppBar({required this.title, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 44,
          ),
          Text(
            title,
            style: CustomTextStyles.main,
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
              child: Center(child: Icon(Icons.search)),
            ),
          ),
        ],
      ),
    );
  }
}
