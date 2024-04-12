import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/screens/categories_screen.dart';
import 'package:meals/theme.dart';

final ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: MaterialTheme.lightScheme().toColorScheme(),
  textTheme: GoogleFonts.latoTextTheme(),
);

final ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: MaterialTheme.darkScheme().toColorScheme(),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: const CategoriesScreen(),
    );
  }
}
