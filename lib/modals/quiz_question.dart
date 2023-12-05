class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers { // creating a getter in a class 
    final shuffeledAnswers = List.of(answers);
    shuffeledAnswers.shuffle();
    return shuffeledAnswers;
  }
}
