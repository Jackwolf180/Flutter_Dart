import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.onClicked, required this.answer});
  final void Function() onClicked;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 86, 4, 101),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(answer,textAlign: TextAlign.center,));
  }
}
