class QuizQuestion {
  final String question;
  final List<String> answers;
  const QuizQuestion(this.question, this.answers);

  List<String> getShuffleList() {
    final copyList = List.of(answers);
    copyList.shuffle();
    return copyList;
  }
}
