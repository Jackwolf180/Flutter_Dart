import 'package:basics/answer_button.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double
          .infinity, // this is another method insted of using center inside a container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "The Question",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(onClicked: () {}, answer: "answer1"),
          AnswerButton(onClicked: () {}, answer: "answer2"),
          AnswerButton(onClicked: () {}, answer: "answer3"),
          AnswerButton(onClicked: () {}, answer: "answer4"),
        ],
      ),
    );
  }
}
