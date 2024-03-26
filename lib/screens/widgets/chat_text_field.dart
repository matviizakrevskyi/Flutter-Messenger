import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class ChatTextField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatTextField({
    Key? key,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Focus(
        onFocusChange: (value) {
          setState(() {
            _isFocused = value;
          });
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                  border: _isFocused
                      ? Border.all(color: CustomColors.textPrimaryColor, width: 2)
                      : Border.all(
                          color: CustomColors.textPrimaryColor.withOpacity(0.4), width: 2.0),
                ),
                child: TextField(
                  controller: widget.controller,
                  style: CustomTextStyles.main,
                  decoration: const InputDecoration(
                    hintStyle: CustomTextStyles.placeholder,
                    hintText: "",
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Ink(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  color: CustomColors.textPrimaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: CustomColors.textPrimaryColor, width: 2)),
              child: InkWell(
                customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onTap: widget.onSend,
                child: const Center(
                    child: Icon(
                  Icons.send,
                  color: CustomColors.textWhiteColor,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
