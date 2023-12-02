import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // it the root widget for flutter
      // it is constructor fuction of a class , also it is widget
      home:Scaffold(// Named Parameters 
      backgroundColor: Colors.purple[300],// here colors is a object provided by the colors class and Purple is a property(better to say it is list here because [300],we can also use fromARGB()  ), it returns a object of COLOR OBJECT , It is also called Configurational Object 
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 149, 61, 165),
              Color.fromARGB(223, 251, 110, 110),
            ]),
          ),
          child: const Center(
            child: Text("hello world"),
          ),
        ),
      ),
    ),
  );
}
