import 'package:basics/data/questions.dart';
import 'package:basics/question_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});
  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "Question_Index": i + 1,
        "Question": questions[i].text,
        "correct_Answer": questions[i].answers[0],
        "user_Answer": chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numOfTotalQuestions = questions.length;
    final summartData = getSummaryData();
    final numOfCorrectQuestions = summartData
        .where((data) => data["correct_Answer"] == data["user_Answer"])
        .length;
    return SizedBox(
      width: double
          .infinity, // this is another method insted of using center inside a container
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You Answerd $numOfCorrectQuestions out $numOfTotalQuestions questions correct",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                onPressed: restartQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
