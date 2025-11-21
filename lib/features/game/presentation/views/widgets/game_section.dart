import 'package:flutter/material.dart';
import 'package:s5s5/features/game/presentation/views/widgets/game_categories_row.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';

class GameSection extends StatelessWidget {
  final List<Category> selectedCategories;
  const GameSection({super.key, required this.selectedCategories});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Expanded(
          child: GameCategoriesRow(selectedCategories: selectedCategories),
        ),
        Expanded(
          child: GameCategoriesRow(
            selectedCategories: selectedCategories,
            isTopRow: false,
          ),
        ),
      ],
    );
  }
}
