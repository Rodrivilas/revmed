import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revmed/theme/color_scheme.dart';

final ThemeData lightThemeDataCustom = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: lightColorScheme,
    primaryColor: lightColorScheme.primary,
    scaffoldBackgroundColor: lightColorScheme.surface,
    cardColor: const Color.fromARGB(173, 255, 255, 255),
    
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
  );
}

final ThemeData darkThemeDataCustom = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: darkColorScheme,
    primaryColor: darkColorScheme.primary,
    scaffoldBackgroundColor: darkColorScheme.surface,
    cardColor: const Color.fromARGB(172, 23, 23, 23),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
  );
}
