class QuizQuestion {
  const QuizQuestion(this.question, this.answers, this.helper);

  final String question;
  final String helper;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
