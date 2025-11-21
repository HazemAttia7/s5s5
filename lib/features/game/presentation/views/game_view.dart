import 'package:flutter/material.dart';
import 'package:s5s5/features/game/presentation/views/widgets/game_view_body.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';

class GameView extends StatelessWidget {
  final List<Category> selectedCategories;
  const GameView({
    super.key,
    required this.selectedCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameViewBody(
        selectedCategories: selectedCategories,
      ),
    );
  }
}
