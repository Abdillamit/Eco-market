import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    this.buttonColor = const Color(0xFF75DB1B),
    this.textColor = const Color(0xFFFFFFFF),
    this.buttonText,
  }) : super(key: key);

  static const EdgeInsetsGeometry buttonPadding = EdgeInsets.all(10.0);

  final VoidCallback onPressed;
  final String? buttonText;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      child: Text(
        buttonText!,
        style: TextStyle(
          color: textColor,
          fontFamily: 'TTNormsPro',
          fontSize: 16.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          height: 1.0,
        ),
      ),
    );
  }
}
