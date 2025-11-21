import 'package:flutter/material.dart';
import 'package:s5s5/core/utils/app_colors.dart';
import 'package:s5s5/features/game/presentation/views/widgets/team_section.dart';
import 'package:s5s5/features/question/presentation/manager/team_notifiers.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 130,
        padding: const EdgeInsets.all(16),
        color: AppColors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TeamSection(
              teamNotifier: team1Notifier,
              selectedAssistancesNotifier: team1SelectedAssistances,
            ),
            TeamSection(
              isRightArm: true,
              teamNotifier: team2Notifier,
              selectedAssistancesNotifier: team2SelectedAssistances,
            ),
          ],
        ),
      ),
    );
  }
}
