import 'package:flutter/material.dart';
import 'package:s5s5/features/question/presentation/manager/team_notifiers.dart';
import 'package:s5s5/features/question/presentation/views/widgets/team_button.dart';

class TeamSelectionWidget extends StatelessWidget {
  final Function(String) onTeamSelected;
  final void Function({required bool isTeam1Win, required bool isTeam2Win})
  onQuestionClosed;

  const TeamSelectionWidget({
    super.key,
    required this.onTeamSelected,
    required this.onQuestionClosed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "مين جاوب",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TeamButton(
                        teamName: team1Notifier.value.name,
                        color: Colors.blue,
                        onTap: () => onTeamSelected(team1Notifier.value.name),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: TeamButton(
                        teamName: team2Notifier.value.name,
                        color: Colors.red,
                        onTap: () => onTeamSelected(team2Notifier.value.name),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 150,
            child: TeamButton(
              teamName: "ولا أحد",
              color: Colors.black,
              onTap: () {
                onQuestionClosed.call(isTeam1Win: false, isTeam2Win: false);
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
