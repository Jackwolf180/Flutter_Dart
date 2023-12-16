import 'package:basics/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(scaffoldBackgroundColor: Color.fromARGB(223, 173, 105, 209)),// using the themeing system to theme the etire app 
    home: const Expenses(),
  ));
}
