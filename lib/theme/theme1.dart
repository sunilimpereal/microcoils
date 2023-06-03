import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microcoils/utils/constants/color_constants.dart';

ThemeData theme1 = ThemeData(
    primaryColor: ColorConstants.lightCoral,
    colorSchemeSeed: ColorConstants.lightCoral,
    // colorScheme: ColorScheme(
    //   brightness: brightness,
    //   primary: primary,
    //   onPrimary: onPrimary,
    //   secondary: secondary,
    //   onSecondary: onSecondary,
    //   error: error,
    //   onError: onError,
    //   background: background,
    //   onBackground: onBackground,
    //   surface: surface,
    //   onSurface: onSurface,
    // ),
    useMaterial3: true,
    platform: TargetPlatform.iOS,
    textTheme: GoogleFonts.montserratTextTheme().copyWith(),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(),
    ),
    primaryTextTheme: TextTheme(
      displayLarge: TextStyle(color: ColorConstants.black),
      displayMedium: TextStyle(color: ColorConstants.black),
      displaySmall: TextStyle(color: ColorConstants.black),
      headlineLarge: TextStyle(color: ColorConstants.black),
      headlineMedium: TextStyle(color: ColorConstants.black),
      headlineSmall: TextStyle(color: ColorConstants.black),
      titleLarge: TextStyle(color: ColorConstants.black),
      titleMedium: TextStyle(color: ColorConstants.black),
      titleSmall: TextStyle(color: ColorConstants.black),
      bodyLarge: TextStyle(color: ColorConstants.black),
      bodyMedium: TextStyle(color: ColorConstants.black),
      bodySmall: TextStyle(color: ColorConstants.black),
      labelLarge: TextStyle(color: ColorConstants.black),
      labelMedium: TextStyle(color: ColorConstants.black),
      labelSmall: TextStyle(color: ColorConstants.black),
    ));
