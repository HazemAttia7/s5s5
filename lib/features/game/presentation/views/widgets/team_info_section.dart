import 'package:flutter/material.dart';
import 'package:s5s5/core/models/team_model.dart';
import 'package:s5s5/core/utils/app_colors.dart';
import 'package:s5s5/core/utils/app_styles.dart';
import 'package:s5s5/features/home/presentation/views/widgets/counter_widget.dart';

class TeaminfoSection extends StatefulWidget {
  final ValueNotifier<Team> teamNotifier;
  const TeaminfoSection({super.key, required this.teamNotifier});

  @override
  State<TeaminfoSection> createState() => _TeaminfoSectionState();
}

class _TeaminfoSectionState extends State<TeaminfoSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Center(
              child: Text(
                widget.teamNotifier.value.name,
                style: AppStyles.textStyle20.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: widget.teamNotifier,
          builder: (context, value, child) {
            return Expanded(
              child: CounterWidget(
                themeColor: AppColors.secondaryColor,
                outlinedIcons: false,
                onIncrement: () {
                  setState(() {
                    value.points += 100;
                  });
                },
                onDecrement: () {
                  setState(() {
                    if (value.points - 100 >= 0) {
                      value.points -= 100;
                    }
                  });
                },
                count: value.points,
              ),
            );
          },
        ),
      ],
    );
  }
}
