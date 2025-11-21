import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:s5s5/core/utils/app_colors.dart';
import 'package:s5s5/core/utils/app_styles.dart';
import 'package:s5s5/features/game/presentation/views/widgets/icon_text_row.dart';
import 'package:s5s5/features/question/presentation/manager/team_notifiers.dart';

// ignore: camel_case_types
enum enTeamTurn { team1, team2 }

ValueNotifier<enTeamTurn> teamTurnNotifier = ValueNotifier(enTeamTurn.team1);

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.gradient),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClickableIconTextRow(
            text: "الخروج",
            icon: Icons.logout,
            onTap: () {
              Navigator.pop(context);
              team1Notifier.value.points = 0;
              team2Notifier.value.points = 0;
            },
          ),

          const Spacer(),
          ValueListenableBuilder<enTeamTurn>(
            valueListenable: teamTurnNotifier,
            builder: (context, turn, _) {
              final String teamName = turn == enTeamTurn.team1
                  ? team1Notifier.value.name
                  : team2Notifier.value.name;
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 48,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: RichText(
                  text: TextSpan(
                    style: AppStyles.textStyle20.copyWith(color: Colors.white),
                    children: [
                      const TextSpan(text: "دور فريق : "),
                      TextSpan(
                        text: teamName,
                        style: AppStyles.textStyle20.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textDirection: TextDirection.rtl,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
