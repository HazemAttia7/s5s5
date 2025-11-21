import 'package:flutter/material.dart';
import 'package:s5s5/features/game/presentation/views/widgets/categories_and_questions_section.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';

class GameCategoriesRow extends StatelessWidget {
  final List<Category> selectedCategories;
  final bool isTopRow;
  const GameCategoriesRow({
    super.key,
    required this.selectedCategories,
    this.isTopRow = true,
  });

  @override

  Widget build(BuildContext context) {
    final categories = isTopRow
        ? selectedCategories.take(3).toList()
        : selectedCategories.skip(selectedCategories.length - 3).toList();

    return Row(
      children: [
        for (var i = 0; i < categories.length; i++) ...[
          if (i > 0) const SizedBox(width: 44),
          Expanded(child: CategoryAndQuestionsSection(category: categories[i])),
        ],
      ],
    );
  }
}
