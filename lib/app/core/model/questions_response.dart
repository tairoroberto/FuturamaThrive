class QuestionsResponse {
  List<Question>? items;

  QuestionsResponse({this.items});

  QuestionsResponse.fromJson(dynamic json) {
    if (json != null) {
      items = [];
      json.forEach((v) {
        items?.add(Question.fromJson(v));
      });
    }
  }
}

class Question {
  final int? id;
  final String? question;
  final List<String>? possibleAnswers;
  final String? correctAnswer;

  Question({
    this.id,
    this.question,
    this.possibleAnswers,
    this.correctAnswer,
  });

  Question.fromJson(Map<String, dynamic> json)
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
