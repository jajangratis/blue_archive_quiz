class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.images);

  final String text;
  final List<String> answers;
  final String images;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}