class Post {
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Post({this.question, this.correctAnswer, this.incorrectAnswers});

  Post.fromMap(Map<String, dynamic> data)
      : question = data["question"],
        correctAnswer = data["correct_answer"],
        incorrectAnswers = data["incorrect_answers"];
}