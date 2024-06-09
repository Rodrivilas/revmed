import 'package:flutter/material.dart';

const Color correct = Color.fromARGB(255, 148, 222, 171);
const Color incorrect = Color.fromARGB(255, 207, 125, 125);
const Color neutral = Color(0xFFE7E7E7);
const Color primary = Color.fromARGB(255, 253, 152, 8);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 253, 152, 8),
  onPrimary: Color.fromARGB(255, 198, 8, 8),
  secondary: Color(0xFFf37b67),
  onSecondary: Color(0xFFFFFFFF),
  error: Color.fromARGB(255, 221, 114, 114),
  onError: Color(0xFFFFFFFF),
  surface: Color(0xFFFEFFFF),
  onSurface: Color(0xFF3b3b3b),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromARGB(255, 253, 152, 8),
  onPrimary: Color.fromARGB(255, 57, 57, 57),
  secondary: Color(0xFFBBC6E4),
  onSecondary: Color(0xFF253048),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  surface: Color.fromARGB(255, 16, 16, 17),
  onSurface: Color(0xFFE3E2E6),
);
