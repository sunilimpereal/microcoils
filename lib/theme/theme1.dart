import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme1 = ThemeData(
    useMaterial3: true,
    platform: TargetPlatform.iOS,
    textTheme: GoogleFonts.montserratTextTheme().copyWith(),
    scaffoldBackgroundColor: Colors.white);
