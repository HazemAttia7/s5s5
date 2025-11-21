import 'package:flutter/material.dart';
import 'package:s5s5/features/game/presentation/views/widgets/points_column.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/presentation/views/widgets/custom_title_container.dart';

class CategoryAndQuestionsSection extends StatelessWidget {
  final Category category;
  const CategoryAndQuestionsSection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: PointsColumn(categoryName: category.name)),
        SizedBox(
          width: 200,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(category.image, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomTitleContainer(title: category.name),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: PointsColumn(isRightArm: true, categoryName: category.name),
        ),
      ],
    );
  }
}
