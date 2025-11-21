import 'package:flutter/material.dart';
import 'package:s5s5/features/question/presentation/views/widgets/question_view_body.dart';

class QuestionView extends StatelessWidget {
  final int questionPoints;
  final String categoryName;
  final void Function({required bool isTeam1Win, required bool isTeam2Win}) onQuestionClosed;
  const QuestionView({
    super.key,
    required this.questionPoints,
    required this.categoryName, required this.onQuestionClosed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuestionViewBody(
        questionPoints: questionPoints,
        categoryName: categoryName,
        onQuestionClosed: onQuestionClosed,
      ),
    );
  }
}
