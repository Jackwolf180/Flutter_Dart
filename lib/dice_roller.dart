import 'package:flutter/material.dart';
import 'dart:math';

final  random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll=2;

  void rollDice() {
    setState(() {
      currentDiceRoll= random.nextInt(6)+1; // this is redundet and not the optimized code because every time the rollDice function executes a new object is created and this leads to memory usage hence we can use the single object created and then use that object a we want 
    });
    // print("Roll dice has been pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice$currentDiceRoll.png',
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
