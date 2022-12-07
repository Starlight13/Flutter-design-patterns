import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double? width;
  final double? fontSize;
  final bool? isDisabled;

  const MyTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width,
    this.fontSize,
    this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTap: (isDisabled ?? false) ? () {} : onTap,
      child: Container(
        padding: const EdgeInsets.all(
          8.0,
        ),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity((isDisabled ?? false) ? 0.5 : 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );
    return width != null
        ? SizedBox(
            width: width,
            child: button,
          )
        : button;
  }
}
