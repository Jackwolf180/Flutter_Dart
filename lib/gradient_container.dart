// Making Custom Widgets

import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  // GradientContainer({}){// adding some named parameters or list or Postiional parameters which are passed by the calling function eg: Text("hello") would have Text(String ,{TextStyle style, double fontSize}){
  // initialization work on the parameters received
  // }
  // Initialization work
  // }

  // GradientContainer({key}):super(key: key) // this is done to forward a key argrument to the super class which this class extends
  // another way to do it ( more preferable method)
  const GradientContainer({super.key});

  // here since this function returns a widged hence we added widget in front of it ( a Widget return type )
  @override
  Widget build(BuildContext context) {
    // flutter calls this buid method once it finds this widget( here GradientContainer) and sends some meta data to the widget which is received by the contex paramets of type BuildContext
    return Container(
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
          "Hello world", // here string is the first Positional argument as it is required argument others are optional and hence they should be named arguments
          style: TextStyle(
            // configruational Object
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}