import 'package:flutter/material.dart';
import 'package:s5s5/features/game/presentation/views/widgets/custom_app_bar.dart';
import 'package:s5s5/features/question/presentation/manager/team_notifiers.dart';
import 'package:s5s5/features/question/presentation/views/widgets/question_widget.dart';
import 'package:s5s5/features/question/presentation/views/widgets/team_section.dart';

class QuestionViewBody extends StatelessWidget {
  final int questionPoints;
  final String categoryName;
  final void Function({required bool isTeam1Win, required bool isTeam2Win}) onQuestionClosed;
  const QuestionViewBody({
    super.key,
    required this.questionPoints,

    required this.categoryName,
    required this.onQuestionClosed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 16),
            child: Row(
              spacing: 44,
              children: [
                Expanded(
                  flex: 3,
                  child: QuestionBody(
                    questionPoints: questionPoints,
                    categoryName: categoryName,
                    onQuestionClosed: onQuestionClosed,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TeamSection(
                        teamNotifier: team1Notifier,
                        selectedAssistancesNotifier: team1SelectedAssistances,
                      ),
                      TeamSection(
                        teamNotifier: team2Notifier,
                        selectedAssistancesNotifier: team2SelectedAssistances,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
