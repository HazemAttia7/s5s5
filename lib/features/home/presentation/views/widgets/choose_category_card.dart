import 'package:flutter/material.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/presentation/views/widgets/categories_grid_view.dart';
import 'package:s5s5/features/home/presentation/views/widgets/main_card_header_text.dart';

class ChooseCategoryCard extends StatelessWidget {
  final List<Category> selectedCategories;
  final Function(Category category) onSelectCategory;

  const ChooseCategoryCard({
    super.key,
    required this.selectedCategories,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              top: 58,
              bottom: 32,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(24),
            ),
            child: CategoriesGridView(selectedCategories: selectedCategories, onSelectCategory: onSelectCategory,),
          ),
          const Positioned(
            top: -22.5,
            left: 0,
            right: 0,
            child: Center(child: MainCardHeaderText(text: "اختر")),
          ),
        ],
      ),
    );
  }
}
