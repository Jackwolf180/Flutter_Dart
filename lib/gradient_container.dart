// Making Custom Widgets

import 'package:basics/styled_text.dart';
import 'package:flutter/material.dart';

var startAlignment = Alignment.topLeft; // variable (global) this simply will throw an error because the value of the variable can be changed after wards ( which can even be null) 
var endAlignment = Alignment.bottomRight;

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
      decoration:  BoxDecoration(
        // Here this returns BoxDecoration Object which is also of type DECORATION OBJECT
        gradient: LinearGradient(
          colors: const[
            // List a (generic type) is created by using [] with comma seperated values
            Color.fromARGB(255, 108, 9, 126),
            Color.fromARGB(223, 99, 16, 116),
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
