import 'package:basics/question_summary/question_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});
  final Map<String, Object> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIndicator(
              questionIndex: (data["Question_Index"].toString()),
              isCorrectAnswer: data["correct_Answer"] == data["user_Answer"]),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            // we add expanded here because it restricts the width of the column widget to take as much space as it can to the size of the screen (which is also the size of the parent widget(Row widget). The same is done if it is used with a Row widget )
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (data["Question"]).toString(),
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  (data["correct_Answer"]).toString(),
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(215, 148, 233, 109),
                  ),
                ),
                Text(
                  (data["user_Answer"]).toString(),
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 200, 175, 236),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
