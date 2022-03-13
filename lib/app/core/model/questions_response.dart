class QuestionsResponse {
  final int? id;
  final String? question;
  final List<String>? possibleAnswers;
  final String? correctAnswer;

  QuestionsResponse({
    this.id,
    this.question,
    this.possibleAnswers,
    this.correctAnswer,
  });

  QuestionsResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        question = json['question'] as String?,
        possibleAnswers = (json['possibleAnswers'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        correctAnswer = json['correctAnswer'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        'possibleAnswers': possibleAnswers,
        'correctAnswer': correctAnswer
      };
}
