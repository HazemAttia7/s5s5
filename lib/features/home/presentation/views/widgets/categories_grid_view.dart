import 'package:flutter/material.dart';
import 'package:s5s5/features/home/data/models/category_model.dart';
import 'package:s5s5/features/home/data/repos/home_repo_impl.dart';
import 'package:s5s5/features/home/presentation/views/widgets/category_card.dart';

class CategoriesGridView extends StatefulWidget {
  final List<Category> selectedCategories;
  final Function(Category category) onSelectCategory;
  const CategoriesGridView({super.key, required this.selectedCategories, required this.onSelectCategory});

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {

  late Future<List<Category>> _initGetCategories;

  @override
  void initState() {
    super.initState();
    _initGetCategories = HomeRepoImpl().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initGetCategories,
      builder: (context, asyncSnapshot) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 22,
              mainAxisSpacing: 44,
              childAspectRatio: 155 / 190,
            ),
            itemCount: asyncSnapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final category = asyncSnapshot.data![index];
              return CategoryCard(
                isSelected: widget.selectedCategories.contains(category),
                isDisabled: widget.selectedCategories.length >= 6,
                onTap: () => setState(() {
                 widget.onSelectCategory(category);
                }),
                category: category,
              );
            },
          ),
        );
      },
    );
  }
}
