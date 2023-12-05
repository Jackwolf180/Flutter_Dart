import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});
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
            const Text("Results"),
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
