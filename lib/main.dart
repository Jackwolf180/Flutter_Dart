import 'package:basics/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        // here we kept the container here because we wanted to keep the same style in all the pages
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Color.fromARGB(255, 106, 11, 123)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: const StartScreen(),
      ),
    ),
  ));
}
