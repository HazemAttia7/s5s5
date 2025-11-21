import 'package:flutter/material.dart';
import 'package:s5s5/core/models/selected_assistances.dart';
import 'package:s5s5/core/models/team_model.dart';
import 'package:s5s5/features/game/presentation/views/widgets/assistance_tools.dart';
import 'package:s5s5/features/game/presentation/views/widgets/team_info_section.dart';

class TeamSection extends StatelessWidget {
  final bool isRightArm;
  final ValueNotifier<Team> teamNotifier;
  final ValueNotifier<SelectedAssistances> selectedAssistancesNotifier;
  const TeamSection({
    super.key,
    this.isRightArm = false,
    required this.teamNotifier,
    required this.selectedAssistancesNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 410,
      child: Directionality(
        textDirection: isRightArm ? TextDirection.rtl : TextDirection.ltr,
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: teamNotifier,
                builder: (context, team, _) {
                  return ValueListenableBuilder(
                    valueListenable: selectedAssistancesNotifier,
                    builder: (context, selected, _) {
                      return AssistanceTools(
                        teamNotifier: teamNotifier,
                        showHole: true,
                        selectedAssistancesNotifier:
                            selectedAssistancesNotifier,
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(child: TeaminfoSection(teamNotifier: teamNotifier)),
          ],
        ),
      ),
    );
  }
}
