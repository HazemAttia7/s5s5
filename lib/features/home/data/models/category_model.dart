import 'package:s5s5/features/home/data/models/question_model.dart';

class Category {
  final String name, image, info;
  final List<Question> questions;

  Category({
    required this.name,
    required this.image,
    required this.questions,
    required this.info,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      image: json['image'],
      questions: List<Question>.from(
        json['questions'].map((x) => Question.fromJson(x)),
      ),
      info: json['info'],
    );
  }
}
