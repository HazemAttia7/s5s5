import 'package:flutter/material.dart';
import 'package:s5s5/features/game/presentation/views/widgets/bottom_bar.dart';
import 'package:s5s5/features/game/presentation/views/widgets/custom_app_bar.dart';
import 'package:s5s5/features/game/presentation/views/widgets/game_section.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';

class GameViewBody extends StatelessWidget {
  final List<Category> selectedCategories;
  const GameViewBody({super.key, required this.selectedCategories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GameSection(
                          selectedCategories: selectedCategories,
                        ),
                      ),
                    ),
                    const BottomBar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
