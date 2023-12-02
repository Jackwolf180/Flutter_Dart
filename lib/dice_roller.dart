import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage =
      'assets/images/dice1.png'; // since we are using an var here this means that we cannot use const for the constructor as the the properties of the class can change internaly
  void rollDice() {
    setState(() {
      activeDiceImage = 'assets/images/dice2.png';
    });
    print("Roll dice has been pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    ); // here we are using the multiple constructor function of the image class;
  }
}
