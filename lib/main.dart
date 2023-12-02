import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home:
          Scaffold(body: Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [ Color.fromARGB(255, 149, 61, 165),Color.fromARGB(223, 251, 110, 110),])),child: const Center(child: Text("hello world")))),
    ),
  );
}
