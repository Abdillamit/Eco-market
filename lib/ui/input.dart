import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({Key? key, required this.labelText, this.prefixIcon})
      : super(key: key);

  final String labelText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.grey,
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
