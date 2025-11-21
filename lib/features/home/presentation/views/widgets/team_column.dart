import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:s5s5/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:s5s5/features/home/presentation/views/widgets/teams_textfield.dart';

class TeamColumn extends StatefulWidget {
  final String title;
  final TextEditingController textController;
  const TeamColumn({
    super.key,
    required this.title,
    required this.textController,
  });

  @override
  State<TeamColumn> createState() => _TeamColumnState();
}

class _TeamColumnState extends State<TeamColumn> {
  int teamCount = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(32),
        TeamsTextField(controller: widget.textController),
        const Gap(22),
        CounterWidget(
          onIncrement: () {
            setState(() {
              teamCount++;
            });
          },
          onDecrement: () {
            setState(() {
              if (teamCount - 1 > 0) teamCount--;
            });
          },
          count: teamCount,
        ),
      ],
    );
  }
}
