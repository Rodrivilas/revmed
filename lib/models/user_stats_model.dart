class QuizStats {
  QuizStats(this.acertedQuestions, this.wrongQuestions, this.minutesOnQuiz);

  int acertedQuestions;
  int wrongQuestions;
  int minutesOnQuiz;

  int get totalQuestions {
    return acertedQuestions + wrongQuestions;
  }

  void set acerted(int newAcertedQuestions) {
    acertedQuestions += newAcertedQuestions;
  }

  void set wrong(int newWrongQuestions) {
    wrongQuestions += newWrongQuestions;
  }
}
