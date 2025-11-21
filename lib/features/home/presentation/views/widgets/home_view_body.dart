import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:s5s5/core/utils/app_styles.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/presentation/views/widgets/choose_category_card.dart';
import 'package:s5s5/features/home/presentation/views/widgets/teams_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final List<Category> _selectedCategories = [];

  void _onSelectCategory(Category category) {
    if (_selectedCategories.contains(category)) {
      _selectedCategories.remove(category);
    } else {
      if (_selectedCategories.length < 6) {
        _selectedCategories.add(category);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(30),
            const Text("اختر الفئات", style: AppStyles.textStyle36),
            const Gap(32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 200),
              child: Text(
                textAlign: TextAlign.center,
                "٣ فئات لفريقك، و ٣ فئات للفريق المنافس، بمجموع ٦ فئات بـ ٣٦ سؤال مختلف، اختاروا الفئات بعناية عشان تضمنون الفرصة الأكبر للفوز",
                style: AppStyles.textStyle20,
              ),
            ),
            const Gap(44),
            ChooseCategoryCard(
              selectedCategories: _selectedCategories,
              onSelectCategory: _onSelectCategory,
            ),
            const Gap(44),
            TeamsSection(selectedCategories: _selectedCategories),
          ],
        ),
      ),
    );
  }
}
