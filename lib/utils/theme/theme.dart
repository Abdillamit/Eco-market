import 'package:eco_market/utils/theme/custom_theme/text_theme.dart';
import "package:flutter/material.dart";

import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/text_field_theme.dart';

class AAppTheme {
  AAppTheme._();

  //Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: ATextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: ABottomSheetTheme.lightBootomSheetTheme,
    elevatedButtonTheme: AElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: ATextFormFieldTheme.lightInputDecorationTheme,
  );

  //Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: ATextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: ABottomSheetTheme.darkBootomSheetTheme,
    elevatedButtonTheme: AElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: ATextFormFieldTheme.darkInputDecorationTheme,
  );
}
