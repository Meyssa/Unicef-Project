class Quiz {
  final String question;
  final List<String> answers;
  final int correctIndex;
  final String justification;
  final String knowMoreLink;
  Quiz(this.question, this.answers, this.correctIndex,
      {this.justification, this.knowMoreLink});
}
