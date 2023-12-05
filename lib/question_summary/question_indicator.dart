import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIndicator extends StatelessWidget {
  const QuestionIndicator(
      {super.key, required this.questionIndex, required this.isCorrectAnswer});
  final bool isCorrectAnswer;
  final String questionIndex;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
      color: isCorrectAnswer?const Color.fromARGB(207, 181, 238, 183):const Color.fromARGB(202, 216, 103, 95)),
      child: Text(
        questionIndex,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
