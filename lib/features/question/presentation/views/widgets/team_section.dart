import 'package:flutter/material.dart';
import 'package:s5s5/core/models/selected_assistances.dart';
import 'package:s5s5/core/models/team_model.dart';
import 'package:s5s5/core/utils/app_colors.dart';
import 'package:s5s5/core/utils/app_styles.dart';
import 'package:s5s5/features/game/presentation/views/widgets/assistance_tools.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({
    super.key,
    required this.teamNotifier,
    required this.selectedAssistancesNotifier,
  });

  final ValueNotifier<Team> teamNotifier;
  final ValueNotifier<SelectedAssistances> selectedAssistancesNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Center(
            child: Text(
              teamNotifier.value.name,
              style: AppStyles.textStyle20.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Text(
          teamNotifier.value.points.toString(),
          style: AppStyles.textStyle36.copyWith(
            color: AppColors.secondaryColor,
          ),
        ),
        AssistanceTools(
          teamNotifier: teamNotifier,
          showCallFriend: true,
          showTwoAnswers: true,
          selectedAssistancesNotifier: selectedAssistancesNotifier,
        ),
      ],
    );
  }
}
