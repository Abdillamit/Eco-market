import 'package:flutter/material.dart';

class AColors {
  AColors._();

  // App Basic Colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFF4b68ff);
  static const Color accent = Color(0xFF4b68ff);

  //Greadient Colors
  static const Gradient linerGreadient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xffff9a9e),
      Color(0xffff9a9e),
    ],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF4b68ff);
  static const Color textSecondary = Color(0xFF4b68ff);
  static const Color textWhite = Color(0xFF4b68ff);

  // Background Colors
  static const Color light = Color.fromARGB(255, 255, 255, 255);
  static const Color dark = Color.fromARGB(255, 145, 142, 142);
  static const Color primaryBackground = Color(0xFF4b68ff);

  // Background Container Colorss
  static const Color lightContainer = Color(0xFF4b68ff);
  static const Color darkContaineer = Color(0xFF4b68ff);

  // Button Colors
  static const Color buttonPrimary = Color(0xFFACF709);
  static const Color buttonSecondary = Color(0xFFACF709);
  static const Color buttonDisabled = Color(0xFFACF709);

  // Border Colors
  static const Color borderPrimary = Color(0xFF4b68ff);
  static const Color borderSecondary = Color(0xFF4b68ff);

  // Error and Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF4b68ff);

  // Neutral Shades
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color darkerGrey = Color(0xFF4b68ff);
  static const Color darkGrey = Color(0xFF4b68ff);
  static const Color grey = Color(0xFF4b68ff);
  static const Color softGrey = Color(0xFF4b68ff);
  static const Color lightGrey = Color(0xFF4b68ff);
  static const Color white = Color(0xFF4b68ff);

  // OnBouarding Colors
}
