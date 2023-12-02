import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            color: const Color.fromARGB(93, 255, 255, 255), // another and more preferable way to add opacity to the widget 
            width: 300,
          ),

          // Opacity(// we can wrap with  opacity widget but int is too process intensive hance it must be avoided as and when needed
          //   opacity: 0.5,
          //   child: Image.asset(
          //     "assets/images/quiz-logo.png",
          //     width: 300,
          //   ),
          // ),

          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the Fun way!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
              // changing it to an icon supported button to add icons to the button
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              icon: const Icon(Icons
                  .arrow_right_alt), // icon parameter must be added to add the icon
              label: const Text(
                  "Start Quiz")) // here we have to change the child name to label if we change the elevatedButton to elevatedButton.icon
        ],
      ),
    );
  }
}
