import 'package:flutter/material.dart';
import 'package:flutter_messenger/styling/styling.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final double? customBorderRadius;
  final double? customHeight;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.customBorderRadius,
    this.customHeight,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
        child: Container(
          height: widget.customHeight,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(widget.customBorderRadius ?? 10.0),
            border: _isFocused
                ? Border.all(color: CustomColors.textPrimaryColor, width: 2.0)
                : Border.all(color: Colors.transparent),
          ),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: CustomTextStyles.placeholder,
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
