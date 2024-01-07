import 'package:flutter/material.dart';

class LoadingPlaceholder extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const LoadingPlaceholder({
    required this.width,
    required this.height,
    this.borderRadius = BorderRadius.zero,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.grey[300],
      ),
    );
  }
}
