import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // it the root widget for flutter
      // it is constructor fuction of a class , also it is widget
      home: Scaffold(
        // Named Parameters
        // backgroundColor: Colors.purple[300],// here colors is a object provided by the colors class and Purple is a property(better to say it is list here because [300],we can also use fromARGB()  ), it returns a object of COLOR OBJECT , It is also called Configurational Object
        body: Container(
          // using Const helps in memory Optimization
          decoration: const BoxDecoration(
            // Here this returns BoxDecoration Object which is also of type DECORATION OBJECT
            gradient: LinearGradient(
              colors: [
                // List a (generic type) is created by using [] with comma seperated values
                Color.fromARGB(255, 108, 9, 126),
                Color.fromARGB(223, 99, 16, 116),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Center(
            child: Text(
              "Hello world",// here string is the first Positional argument as it is required argument others are optional and hence they should be named arguments 
              style: TextStyle( // configruational Object 
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
