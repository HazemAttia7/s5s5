import 'package:flutter/material.dart';
import 'package:s5s5/core/models/selected_assistances.dart';
import 'package:s5s5/features/game/presentation/views/widgets/clickable_points_widget.dart';
import 'package:s5s5/features/game/presentation/views/widgets/custom_app_bar.dart';
import 'package:s5s5/features/question/presentation/manager/team_notifiers.dart';
import 'package:s5s5/features/question/presentation/views/question_view.dart';

class PointsColumn extends StatefulWidget {
  final bool isRightArm;
  final String categoryName;
  const PointsColumn({
    super.key,
    this.isRightArm = false,
    required this.categoryName,
  });

  @override
  State<PointsColumn> createState() => _PointsColumnState();
}

class _PointsColumnState extends State<PointsColumn> {
  bool _is200Disabled = false, _is400Disabled = false, _is600Disabled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Expanded(
          child: ClickablePointsWidget(
            points: '200',
            isRightArm: widget.isRightArm,
            isDisabled: _is200Disabled,
            onTap: () => _handleTap(() => _is200Disabled = true, 200),
          ),
        ),
        Expanded(
          child: ClickablePointsWidget(
            points: '400',
            isRightArm: widget.isRightArm,
            isDisabled: _is400Disabled,
            onTap: () => _handleTap(() => _is400Disabled = true, 400),
          ),
        ),
        Expanded(
          child: ClickablePointsWidget(
            points: '600',
            isRightArm: widget.isRightArm,
            isDisabled: _is600Disabled,
            onTap: () => _handleTap(() => _is600Disabled = true, 600),
          ),
        ),
      ],
    );
  }

  void _handleTap(Function disableCallback, int questionPoints) async {
    final SelectedAssistances selectedAssistances1 =
        team1SelectedAssistances.value;
    final SelectedAssistances selectedAssistances2 =
        team2SelectedAssistances.value;

    if (selectedAssistances1.isHoleSelected) {
      team1Notifier.value.assistances.remove('الحفرة');
      team1Notifier.notifyListeners();
    } else if (selectedAssistances2.isHoleSelected) {
      team2Notifier.value.assistances.remove('الحفرة');
      team2Notifier.notifyListeners();
    }

    setState(() {
      disableCallback();
    });
    final bool team1UsedHole = selectedAssistances1.isHoleSelected;
    final bool team2UsedHole = selectedAssistances2.isHoleSelected;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionView(
          questionPoints: questionPoints,
          categoryName: widget.categoryName,
          onQuestionClosed:
              ({required bool isTeam1Win, required bool isTeam2Win}) {
                if (selectedAssistances1.isCallFriendSelected) {
                  team1Notifier.value.assistances.remove("اتصال بصديق");
                }
                if (selectedAssistances1.isTwoAnswersSelected) {
                  team1Notifier.value.assistances.remove("جاوب إجابتين");
                }
                team1Notifier.notifyListeners();
                if (selectedAssistances2.isCallFriendSelected) {
                  team2Notifier.value.assistances.remove("اتصال بصديق");
                }
                if (selectedAssistances2.isTwoAnswersSelected) {
                  team2Notifier.value.assistances.remove("جاوب إجابتين");
                }
                team2Notifier.notifyListeners();
                if (isTeam1Win || isTeam2Win) {
                  if (team1UsedHole && isTeam1Win) {
                    team2Notifier.value.points -= questionPoints;
                  }

                  if (team2UsedHole && isTeam2Win) {
                    team1Notifier.value.points -= questionPoints;
                  }

                  team1Notifier.notifyListeners();
                  team2Notifier.notifyListeners();
                }
              },
        ),
      ),
    );
    team1SelectedAssistances.value = SelectedAssistances();
    team2SelectedAssistances.value = SelectedAssistances();
    team1SelectedAssistances.notifyListeners();
    team2SelectedAssistances.notifyListeners();
    teamTurnNotifier.value = teamTurnNotifier.value == enTeamTurn.team1
        ? enTeamTurn.team2
        : enTeamTurn.team1;
  }
}
