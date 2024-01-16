import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.labelText,
    this.prefixIcon,
    this.labelColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.borderRadius = 4.0,
    required this.backgroundColor,
  }) : super(key: key);

  final String labelText;
  final IconData? prefixIcon;
  final Color labelColor;
  final Color iconColor;
  final double borderRadius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      child: TextField(
        onChanged: (value) {
          context.read<ProductsBloc>().add(SearchCardEvent(query: value));
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFFD2D1D5),
            fontFamily: 'TTNormsPro',
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: iconColor,
                )
              : null,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
