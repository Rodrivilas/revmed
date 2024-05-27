class QuizQuestion {
  const QuizQuestion(this.question, this.answers, this.help);

  final String question;
  final String help;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
