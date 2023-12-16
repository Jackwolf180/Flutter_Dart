import 'package:basics/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59,
        181)); // for creating scheme related variables for creating the scheme

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,// here we are creating the colorScheme of the entire app 
      appBarTheme: const AppBarTheme().copyWith( // here copy with overRides some selected properties of the intiial theme
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer

      )

    ), // using the themeing system to theme the etire app
    home: const Expenses(),
  ));
}
