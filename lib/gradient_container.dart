// Making Custom Widgets

// import 'package:basics/styled_text.dart';
import 'package:flutter/material.dart';

// var startAlignment = Alignment.topLeft; // variable (global) this simply will throw an error because the value of the variable can be changed after wards ( which can even be null)
// var endAlignment = Alignment.bottomRight;

// another way could be to use final or const because this values are not changing Note that final is used an a runtime const while const is a compile time const eg: final startAlingmnet = getAlignment(); this means that the vlaue in startAlingnment will become const only after it receives the value from the funciton getAlignment ,which can only send the value at the runtime;  here we use const

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// class GradientContainer extends StatelessWidget {
//   // GradientContainer({}){// adding some named parameters or list or Postiional parameters which are passed by the calling function eg: Text("hello") would have Text(String ,{TextStyle style, double fontSize}){
//   // initialization work on the parameters received
//   // }
//   // Initialization work
//   // }

//   // GradientContainer({key}):super(key: key) // this is done to forward a key argrument to the super class which this class extends
//   // another way to do it ( more preferable method)
//   const GradientContainer({super.key, required this.colors}); // here we used required to show that namedparameters can also be made required by using the required keyword

//   final List<Color> colors;

//   // here since this function returns a widged hence we added widget in front of it ( a Widget return type )
//   @override
//   Widget build(BuildContext context) {
//     // flutter calls this buid method once it finds this widget( here GradientContainer) and sends some meta data to the widget which is received by the contex paramets of type BuildContext
//     return Container(
//       // using Const helps in memory Optimization
//       decoration:  BoxDecoration(
//         // Here this returns BoxDecoration Object which is also of type DECORATION OBJECT
//         gradient: LinearGradient(
//           // colors: [
//           //   // List a (generic type) is created by using [] with comma seperated values
//           //   Color.fromARGB(255, 108, 9, 126),
//           //   Color.fromARGB(223, 99, 16, 116),
//           // ],
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyledText("Hello World"),
//       ),
//     );
//   }
// }

// APPROACH 2

class GradientContainer extends StatelessWidget {
  // GradientContainer({}){// adding some named parameters or list or Postiional parameters which are passed by the calling function eg: Text("hello") would have Text(String ,{TextStyle style, double fontSize}){
  // initialization work on the parameters received
  // }
  // Initialization work
  // }

  // GradientContainer({key}):super(key: key) // this is done to forward a key argrument to the super class which this class extends
  // another way to do it ( more preferable method)
  GradientContainer(this.color1, this.color2,
      {super.key}); // this the default constructor function

  GradientContainer.purple({super.key})
      : color1 = Colors.purple,
        color2 = const Color.fromARGB(
            255, 111, 20, 127); // this this the multiple constructor function

  final Color color1;
  final Color color2;
  var activeDiceImage =
      'assets/images/dice1.png'; // since we are using an var here this means that we cannot use const for the constructor as the the properties of the class can change internaly
  void rollDice() {
    activeDiceImage = 'assets/images/dice2.png';
    print("Roll dice has been pressed");
  }

  // here since this function returns a widged hence we added widget in front of it ( a Widget return type )
  @override
  Widget build(BuildContext context) {
    // flutter calls this buid method once it finds this widget( here GradientContainer) and sends some meta data to the widget which is received by the contex paramets of type BuildContext
    return Container(
      // using Const helps in memory Optimization
      decoration: BoxDecoration(
        // Here this returns BoxDecoration Object which is also of type DECORATION OBJECT
        gradient: LinearGradient(
          // colors: [
          //   // List a (generic type) is created by using [] with comma seperated values
          //   Color.fromARGB(255, 108, 9, 126),
          //   Color.fromARGB(223, 99, 16, 116),
          // ],
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: rollDice,
                style: TextButton.styleFrom(
                    // for adding padding we can use padding or by using sized box
                    // padding: const EdgeInsets.only(top: 20),
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(fontSize: 28)),
                child: const Text("Roll Dice"))
          ],
        ), // here we are using the multiple constructor function of the image class
      ),
    );
  }
}
