class Question {
  final int id;
  final String question, answer;
  final int points;
  final String? image;

  Question({
    required this.id,
    required this.question,
    required this.answer,
    required this.points,
    this.image,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      points: json['points'],
      image: json['image'],
    );
  }
}
