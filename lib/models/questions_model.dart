class QuizQuestion {
  const QuizQuestion(this.question, this.answers, this.help, this.category);

  final String question;
  final String category;
  final String help;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
