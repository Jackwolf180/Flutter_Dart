import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((data) {
              return Row(
                children: [
                  Text((data["Question_Index"] as int).toString()),
                  Expanded(
                    // we add expanded here because it restricts the width of the column widget to take as much space as it can to the size of the screen (which is also the size of the parent widget(Row widget). The same is done if it is used with a Row widget )
                    child: Column(
                      children: [
                        Text((data["Question"]).toString()),
                        Text((data["correct_Answer"]).toString()),
                        Text((data["user_Answer"]).toString()),
                      ],
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
