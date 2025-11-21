import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:s5s5/core/utils/app_styles.dart';
import 'package:s5s5/features/game/presentation/views/game_view.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/presentation/views/widgets/gradient_button.dart';
import 'package:s5s5/features/home/presentation/views/widgets/team_column.dart';
import 'package:s5s5/features/question/presentation/manager/team_notifiers.dart';

class TeamsSection extends StatefulWidget {
  final List<Category> selectedCategories;
  const TeamsSection({super.key, required this.selectedCategories});

  @override
  State<TeamsSection> createState() => _TeamsSectionState();
}

class _TeamsSectionState extends State<TeamsSection> {
  TextEditingController team1Controller = TextEditingController(text: "Team 1");
  TextEditingController team2Controller = TextEditingController(text: "Team 2");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "حدد معلومات الفرق",
          style: AppStyles.textStyle36.copyWith(color: Colors.black),
        ),
        const Gap(64),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 204),
          child: Row(
            spacing: 44,
            children: [
              Expanded(
                child: TeamColumn(
                  title: "الفريق الثاني",
                  textController: team2Controller,
                ),
              ),
              Expanded(
                child: TeamColumn(
                  title: "الفريق الاول",
                  textController: team1Controller,
                ),
              ),
            ],
          ),
        ),
        const Gap(60),
        GradientButton(
          onTap: () {
            if (widget.selectedCategories.length == 6) {
              team1Notifier.value.name = team1Controller.text;
              team2Notifier.value.name = team2Controller.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GameView(
                    selectedCategories: widget.selectedCategories,
                  ),
                ),
              );
            }
          },
          text: 'ابدأ اللعب',
        ),
        const Gap(60),
      ],
    );
  }
}
