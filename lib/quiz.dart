import 'package:basics/data/questions.dart';
import 'package:basics/questions_screen.dart';
import 'package:basics/question_summary/results_screen.dart';
import 'package:basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

// METHOD 1 OF LIFTING STATE

// class _QuizState extends State<Quiz> {
//   // we here add _ to donate the this is a private class hence this class is only accessible to Quiz class

//   Widget?
//       activeScreen; // here we use Widged insted of var bacause var is too specific as activeScreen will have type of widget but also of type StartScreen and will throw an error on using it in setState for changing the screen. Thus we use Widged which is less specific hence more preferrable
//   @override
//   void initState() {
//     // using the inti state method . this method initializes the the switch screen method and then sets the active screen widgedt to startscreen(swithchScreen) and then runs the (flow is like _QuizState(constructor)-> initializing switchScreen -> initState()-> build of )
//     activeScreen = StartScreen(switchScreen);
//     super.initState();
//   }

//   void switchScreen() {
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           // here we kept the container here because we wanted to keep the same style in all the pages
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Colors.purple, Color.fromARGB(255, 106, 11, 123)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight),
//           ),
//           child: activeScreen,
//         ),
//       ),
//     );
//   }
// }

// METHOD 2 OF LIFTING STATE

// class _QuizState extends State<Quiz> {
//   // we here add _ to donate the this is a private class hence this class is only accessible to Quiz class
//   var activeScreen = "start-screen";

//   void switchScreen() {
//     setState(() {
//       activeScreen = "quiz-screen";
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           // here we kept the container here because we wanted to keep the same style in all the pages
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Colors.purple, Color.fromARGB(255, 106, 11, 123)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight),
//           ),
//           child: activeScreen=="start-screen"?StartScreen(switchScreen):const QuestionsScreen()
//         ),
//       ),
//     );
//   }
// }

// METHOD 3 OF LIFTING STATE

class _QuizState extends State<Quiz> {
  // we here add _ to donate the this is a private class hence this class is only accessible to Quiz class

  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "quiz-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void restartQuiz(){
    selectedAnswers=[];
    setState(() {
      activeScreen='start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            // here we kept the container here because we wanted to keep the same style in all the pages
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Color.fromARGB(255, 106, 11, 123)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}
