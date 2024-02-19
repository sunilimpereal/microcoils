import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microcoils/utils/constants/color_constants.dart';

ThemeData theme1 = ThemeData(
    primaryColor: ColorConstants.primary,
    // useMaterial3: true,
    // colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primary, secondary: ColorConstants.secondary),
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorConstants.primary, secondary: ColorConstants.secondary),
    // colorSchemeSeed: ColorConstants.primary,
    fontFamily: "Montserrat",
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
    // useMaterial3: true,
    // platform: TargetPlatform.iOS,
    // scaffoldBackgroundColor: ColorConstants.secondary.shade100,
    textTheme: GoogleFonts.montserratTextTheme(TextTheme(
      displayLarge: TextStyle(color: ColorConstants.secondary),
      displayMedium: TextStyle(color: ColorConstants.secondary),
      displaySmall: TextStyle(color: ColorConstants.secondary),
      headlineLarge: TextStyle(color: ColorConstants.secondary),
      headlineMedium: TextStyle(color: ColorConstants.secondary),
      headlineSmall: TextStyle(color: ColorConstants.secondary),
      titleLarge: TextStyle(color: ColorConstants.secondary),
      titleMedium: TextStyle(color: ColorConstants.secondary),
      titleSmall: TextStyle(color: ColorConstants.secondary),
      bodyLarge: TextStyle(color: ColorConstants.secondary),
      bodyMedium: TextStyle(color: ColorConstants.secondary),
      bodySmall: TextStyle(color: ColorConstants.secondary),
      labelLarge: TextStyle(color: ColorConstants.secondary),
      labelMedium: TextStyle(color: ColorConstants.secondary),
      labelSmall: TextStyle(color: ColorConstants.secondary),
    )).copyWith(),
    // scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      shape: StadiumBorder(),
    )),
    iconTheme: IconThemeData(color: ColorConstants.secondary.shade400),
    listTileTheme: ListTileThemeData(iconColor: ColorConstants.secondary.shade400),
    primaryTextTheme: TextTheme(),
    appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: ColorScheme.fromSeed(
                seedColor: ColorConstants.primary, secondary: ColorConstants.secondary)
            .primary,
        foregroundColor: Colors.white));
