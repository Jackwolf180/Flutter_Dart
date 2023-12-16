import 'package:basics/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59,
        181)); // for creating scheme related variables for creating the scheme

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
      colorScheme:
          kColorScheme, // here we are creating the colorScheme of the entire app
      appBarTheme: const AppBarTheme().copyWith(
          // here copy with overRides some selected properties of the intiial theme
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            // titleLarge: ThemeData().textTheme.titleLarge.copyWith() //one of the approach is this
            titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 14),
          ),
    ), // using the themeing system to theme the etire app
    home: const Expenses(),
  ));
}
