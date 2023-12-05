import 'package:basics/data/questions.dart';
import 'package:basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});
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
    return SizedBox(
      width: double
          .infinity, // this is another method insted of using center inside a container
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You Answerd X out Y questions correct"),
            const SizedBox(
              height: 40,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.redo_rounded),
                label: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
